Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9DF410851
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 21:16:38 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfpF-0008Sz-SJ
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 15:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLn-0005Lp-GJ
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:11 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLe-0006xF-Qy
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:46:11 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 17so13099119pgp.4
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDQMWHvEjv12594lnZ03zCrTOpjiJ4+Ocs7aFLjDJuU=;
 b=r/2ntDRmBf5TGJNkoiPoWGAY9oJHnDO2yFUuRzcsxKqv9RDdACsKbbAZf0/vsRkTkC
 85X9A7uzR35wTz2CMUF69pj7skYSM0mhOK8IHl+bHzSUEiOGmoBGJGFw7y30f2GVXK9E
 kBjucLi0ya/Xn8jKiegkleqaXmTKOJtlDXTLnU96SWJprMcwYjTiOxW0j+oZu4VJigma
 wqdNUJlv+Kb5wHbbInnj+oBDtSgPqhG0RErG/RLpmcXz3Srnt2jKeSTancrH6rjqw88p
 gg9If+1RCp2MwViBCxe+C3EN+nZPx6ThPFzrlhL2mcUTU+VLSPEaBTeQVOH7aVCPNbVt
 ouVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDQMWHvEjv12594lnZ03zCrTOpjiJ4+Ocs7aFLjDJuU=;
 b=HQzR0uN5f8nBwoq7IX1fq71JMDExeKWwx8eJ7Avz8zisjAQ1ycQVrAodfULu4963pM
 iMKN4oSebclKwBfFyVHEKDHXKkVOCtaSaCoZG6RgQnMSTC7oLbGTzsjtfPpbMjp+x/9d
 NiW17QBl450Oo+I7f6uFKGQCZ/zry4Fii0LPTYU1SOKAs4kAaUkBSaIA5bFUym8zbxeA
 oJEypVSfVJvGJb600KvAMG+YpbDi3clp5DlXaLpLOJucO3DePzDiYheKbzX1db86Ky/n
 FgI9QHxLuPCy6itts56NdmLlDQqdRquePUaOcQHreezVrrpZE1bUt5SW0k27mCCQ9+Ur
 9B1g==
X-Gm-Message-State: AOAM533A/7WSjIYh1ZFQxIWtmiLQRyodYi6An7bM7NqWWEmdjsw7kcmM
 jsWtB/j1EGyPjfajqkSzvejfBMdSuDJZcA==
X-Google-Smtp-Source: ABdhPJy+kNl/5Ts0AhgjUn08J0Mx9AeABUw621YtYeQRRIkBkwKkK2n/h4z1dtiTanCDJBC7pSpZsQ==
X-Received: by 2002:a63:ea44:: with SMTP id l4mr15721455pgk.210.1631990758546; 
 Sat, 18 Sep 2021 11:45:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/41] target/s390x: Use probe_access_flags in
 s390_probe_access
Date: Sat, 18 Sep 2021 11:45:22 -0700
Message-Id: <20210918184527.408540-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918184527.408540-1-richard.henderson@linaro.org>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure why the user-only code wasn't rewritten to use
probe_access_flags at the same time that the sysemu code
was converted.  For the purpose of user-only, this is an
exact replacement.

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


