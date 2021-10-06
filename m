Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4354245C0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 20:11:11 +0200 (CEST)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYBNm-0008VH-Pi
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 14:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdp-0007hi-Ho
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdn-0008Ko-Uj
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:41 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso442342pjb.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8GF33hCMyT935/Broto5wFsXUW8gXqRf3uwOuQxI2uQ=;
 b=ztHOWI0Lh3gq/lqXYZhZOLvTAUwPv6PYbDToAOTRKhgWidQCTC9oorpKnxCv3uyt1c
 bYkomvSg00h18rvbnqDJd+pXQ8+qNjvwLQkyKSYI/Om75NNswT/acjrGB0Ngmyq5WoeS
 mAWoR+55hKHua6GY+3DdFpNRCio9ZtrUkzpzGCazzoaYJo1cBybXMxL9NQhaqpWd5qVi
 c7bCA9Cg6743DdUP93WSnhCz7rWp9YVYmBGZaN4DP0lL8DHWqCsNb58UsgMwBSnDG2lJ
 KuIpt6LXk/jZn1OQRMR4vty4ZYHVGtJoHoi4MwmcBZhplF59U+ETQtWgd4H1IlUglo+7
 ZKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8GF33hCMyT935/Broto5wFsXUW8gXqRf3uwOuQxI2uQ=;
 b=l1mTDE7pqFpezw96Wm0AwIpfwJyDTRVuXoYzlITqre12KMG4LeUXhNPyVU5/5CIPTB
 w/GVLVe3GyX5+jaQy4zPNVN78V5h6TR1scH2zBD2p3/eAqRVO3+j1ZKXIOX1M2iSZMkd
 Q6psyxDUODcRxLjDWtnqsyo9qR0NSUDWj9MruqNrmRTWAijLOHanyaBRm88Psihs8Xn2
 JvZ8srxAT3dX2EhaQIf2M7RIR0ZNl/vz5VBeDdGZQciEfCpntb5cT1nyH0ufkeX6l4dZ
 2IqZf2+O4kfOqEv2Coli+Cn12wBpCGJlAR1RfQgKXP056zbBBTj+j46YQCjEk0yyw5BH
 U+Nw==
X-Gm-Message-State: AOAM530xwAUHb7jZd7vVlZNa67hguFLNbX9nV797hhHsP1zJZiwhlNWG
 E1oyiVR8LfakGdauiX3oYPfKeJ/heo20Lg==
X-Google-Smtp-Source: ABdhPJx2XdPzptfcqOBZvYP8k7juG6cHcYtwZAXs6VmPxJnzlcP9pRNdhuMsflkZVT3F7ckec0QNcA==
X-Received: by 2002:a17:90a:19d2:: with SMTP id
 18mr12088298pjj.162.1633541018632; 
 Wed, 06 Oct 2021 10:23:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 36/41] target/s390x: Use probe_access_flags in
 s390_probe_access
Date: Wed,  6 Oct 2021 10:23:02 -0700
Message-Id: <20211006172307.780893-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure why the user-only code wasn't rewritten to use
probe_access_flags at the same time that the sysemu code
was converted.  For the purpose of user-only, this is an
exact replacement.

Cc: qemu-s390x@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 75f6735545..4accffe68f 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -142,20 +142,12 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              MMUAccessType access_type, int mmu_idx,
                              bool nonfault, void **phost, uintptr_t ra)
 {
+#if defined(CONFIG_USER_ONLY)
+    return probe_access_flags(env, addr, access_type, mmu_idx,
+                              nonfault, phost, ra);
+#else
     int flags;
 
-#if defined(CONFIG_USER_ONLY)
-    flags = page_get_flags(addr);
-    if (!(flags & (access_type == MMU_DATA_LOAD ?  PAGE_READ : PAGE_WRITE_ORG))) {
-        env->__excp_addr = addr;
-        flags = (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSING;
-        if (nonfault) {
-            return flags;
-        }
-        tcg_s390_program_interrupt(env, flags, ra);
-    }
-    *phost = g2h(env_cpu(env), addr);
-#else
     /*
      * For !CONFIG_USER_ONLY, we cannot rely on TLB_INVALID_MASK or haddr==NULL
      * to detect if there was an exception during tlb_fill().
@@ -174,8 +166,8 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
                              (access_type == MMU_DATA_STORE
                               ? BP_MEM_WRITE : BP_MEM_READ), ra);
     }
-#endif
     return 0;
+#endif
 }
 
 static int access_prepare_nf(S390Access *access, CPUS390XState *env,
-- 
2.25.1


