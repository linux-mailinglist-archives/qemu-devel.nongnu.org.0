Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63A440AD0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:58:00 +0200 (CEST)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgscB-00025t-Fq
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryk-0002L5-E2
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:14 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:54095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryh-0000Dy-SO
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:17:14 -0400
Received: by mail-pj1-x1030.google.com with SMTP id iq11so2450892pjb.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66Bl8EQR5t0ae9YRNU1Dduo8SF5bSu1MJ1ucFe28OE8=;
 b=xS57va7fGiTuXFu4BeMARbyZh6HksRJa2h9Ne1dcTEjSSm15h5xKBg3uLOnhi2CQdO
 eUG3WyWqxsIZEG49aD+J4/iJ+tFADlYfvsRLJDUWWszJbbpqsrzJ9GauhJm43ThKO2um
 K8DGD24K8dJAQoczsA5l4cz6F3mB53P9WECeh6jtE/KI8m5CIVp/6SWALtXFDgQI0yqO
 yLt8NfPq10gehbrcPvYPS39PwXRSi5Vdr8wT6zwBpojxvfWEYlMmcPpP6vBqG+ufvNhv
 s4nUFDnG+uCl6lqiMTN8A98/S9BmW99043xrAmDK3gh1UM2oNQB9c/ZI7qZ9A6tJ3i4Y
 mY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=66Bl8EQR5t0ae9YRNU1Dduo8SF5bSu1MJ1ucFe28OE8=;
 b=1nihLm1Gv4dy9DwzgZoO3ndYdoGjxGJcIA4qiZmnGE9z/EBpbmuv8RHqS3kXkSfJ3g
 iTSz02W41SnveYTtFfIa+z0mrP0DVizcanpHoDFTtLGNTmxfd3p1HEEDGlZrWcXaCYas
 DyVShL2h7Ps4yEqGv5c1qiqQMaVhIJBAWghz75rQciqZniseOZYJPVfyhueI7O4yVRH5
 muAHVhsYTNVEwn0h4Siq+Xhb2OF/DtlrSaZg1sg7amNCd+mmiYPawuxlEaRCJR3lg4J9
 IGZxydDs7OzEtmgWhmWJLStgIFhsI/DEeqQb0w5ZxJ+lUoLaJ7t1B5pLaJ6n09kP0/CP
 NdZw==
X-Gm-Message-State: AOAM533xgVlLEnIJqtBm29UFDeY6KpCC1mvOCCD0aG+NDC/eBWUmGKc/
 h7DNohHZ7zosZXaDS7n9v1usa/llaZXGtw==
X-Google-Smtp-Source: ABdhPJx2JywIiZrZ04tE8b9fbnPFltWrqMTG8ezb2Lkftq2OEsWKRVGbV4qu4NnofsRjhJftt1EmqQ==
X-Received: by 2002:a17:903:10a:b0:141:6975:1cec with SMTP id
 y10-20020a170903010a00b0014169751cecmr16211863plc.51.1635614229730; 
 Sat, 30 Oct 2021 10:17:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:17:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 36/66] target/s390x: Use probe_access_flags in
 s390_probe_access
Date: Sat, 30 Oct 2021 10:16:05 -0700
Message-Id: <20211030171635.1689530-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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
index 17e3f83641..362a30d99e 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -141,20 +141,12 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
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
@@ -173,8 +165,8 @@ static int s390_probe_access(CPUArchState *env, target_ulong addr, int size,
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


