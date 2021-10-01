Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12CD41F3EE
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:54:05 +0200 (CEST)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMjU-0005oB-MJ
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5D-0005C6-ON
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:29 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5B-0005JN-N1
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:27 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id a9so6024843qvf.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ed7k7oV00Ud53qqbt9Yos8IyOCfVvxLg7PyS2NKYTH0=;
 b=YqPuSya7aCdRIEKhEZod8HGV9ua3R+yxBLeyblsT5laePgT52MagP+1aAx17IaONM9
 vvNdRwRvsL0SdcZAqB337o1VBULjbYB494ZiUxkyKlL60FX3mFClWhTPJFZSiQu1OQ0I
 17iVJL1IVZ/5jdQtYRBulvsYqUu+O+N2svS+z3tGlnfaVaszRdMEAylMMxczYfF69glu
 EtJcQWCC7mK8QW5Vp6JFlMspjKrei4w4myat7peXhO59dZKaTIEQkYcjgE9bGDYV4AL9
 W28IYjK10PdkF6ppl4pfD/dsvfCZ8BfWx0l58hx9sXjl7pYYfvRp7pcx/unid5AcdxK6
 W69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ed7k7oV00Ud53qqbt9Yos8IyOCfVvxLg7PyS2NKYTH0=;
 b=5B7/VNLaESzsj9kN6nosLcTracZqsYxhLB0dI80tTCtZv6oS+Vk4DwvL7bcXp7mEcO
 5IEcrD7pOSKdn0OflGbqIEUu2o3Y3tUfgpwAvIwjDDBnwFiM3RvqNfPEIywUc4IdyUqu
 eMz+fIjsU/1W3b0KztWacBWGQQPexZnVNkR/Pg+0Tr+q5pYC9NmJSlRSVACrKqKybauJ
 lrNNSjyY9T1ss98kTyE0LkBb60hNyIfFS28YIvG5H5YcZA8hoZiyVGB5ig6/M1YbMWTh
 eSjm5/xJm32d26KhHrd3EK9RlasJY8pLeI0mNROoAd/VKobkVq7kqEq+jplhlpyxvnwG
 IUdQ==
X-Gm-Message-State: AOAM530o6GKjshfJbfa3xByADe1d11GnkJ6huUf54EWCAZh8UokOwCfZ
 v6tKHzISJx3VRmsiVlr8SzzjGR6r4GzFuw==
X-Google-Smtp-Source: ABdhPJxjwVr0EjcSMMkLvLGBJz+8OvgSZzyOjRvNf6R8FKMqMj5vJKAPIPk9eNYd6/xQeG/mvHeqWg==
X-Received: by 2002:a0c:df0c:: with SMTP id g12mr11460642qvl.25.1633108344711; 
 Fri, 01 Oct 2021 10:12:24 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 36/41] target/s390x: Use probe_access_flags in
 s390_probe_access
Date: Fri,  1 Oct 2021 13:11:46 -0400
Message-Id: <20211001171151.1739472-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 0bf775a37d..596270e45d 100644
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


