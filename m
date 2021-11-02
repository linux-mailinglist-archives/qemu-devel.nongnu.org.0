Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391E6442C81
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:27:31 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrww-0004TX-By
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreI-00041Z-Bn
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:15 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhreE-0000xQ-6D
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:08:14 -0400
Received: by mail-qt1-x831.google.com with SMTP id s1so17058306qta.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ky6yY478j1xSRIHIN9BTjrdKe+bHyugXQSySqll0teU=;
 b=CoR6ArYsP8cXGcnYSe1j3CYMMo2H73WLCf/wQpMdMeLfaQ1jYWBc1KSTVpEV3rn+b3
 wTuvvqbp9Ex3JIfTPzvflGTKsg+Cwr0fNf5z503IsmgqY1nXwg9tooyISVt1TGU6Ib9V
 EDi++kN0Nfz3PE8lIP2bz2rMZakWO/5kGfHDCNr9gnARGu5TWCbqHQoPkc5/nyuWSjXu
 Hc4z9xC39PYods5jFRCBLAa9xqUO0oeoytSFdVVfsNjI6nbKZao/N2OSTNZawBzjXdOl
 d90CB11Sqaa/eZjd7mdyNuqz/7/Hnvev80nZy8Fkcysn+RcLrWziKqojURPCyHx+TVPF
 +PRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ky6yY478j1xSRIHIN9BTjrdKe+bHyugXQSySqll0teU=;
 b=NWk+5/bm1pohWuq5ksOId0xufln1iVCeKyu5KZdJ38gD/OhKD2mzRySmciXY7ipZ5e
 J9UNpq2b880U+nROnR01STA4Y7O/BQkF7a7JdgnKf+aYufhud67Xuz3HE0/qXfuOKuz/
 XRwTG9O2gCFCR5YJTEtFrt3Pq0pBzmmbSgISdYWjPbeEMNcrgt7bG+GtAidDTD1VbXBV
 jTy/nGawyr7Icqq1koNVG3Tficrvgb/tz+9AC0n+oE6+qZg1DWYJNpH8KyfJqz99fq7c
 wy5OqFdxmxCdN2dtUq408xlfz6vRGggI0hBmSECgAiH6x2pm13iVep+3j8gCOwSJad+L
 GhjQ==
X-Gm-Message-State: AOAM5332eSq8fNkDwY1TOpPAaLdGZoEesGvWQrP+i6wdufnH5FiGitg7
 CFDyFkxCI2I6eGpS5QslaHUfKxr7UYIHzw==
X-Google-Smtp-Source: ABdhPJxZju3CNfW8/yNqSysTC966zo3ozGoExvG7lk6dTRZfw4cyYnqS6CifSIHYlnBtm5XhHQ3DWg==
X-Received: by 2002:a05:622a:1883:: with SMTP id
 v3mr625816qtc.21.1635851282808; 
 Tue, 02 Nov 2021 04:08:02 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:08:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/60] target/s390x: Use probe_access_flags in s390_probe_access
Date: Tue,  2 Nov 2021 07:07:16 -0400
Message-Id: <20211102110740.215699-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not sure why the user-only code wasn't rewritten to use
probe_access_flags at the same time that the sysemu code
was converted.  For the purpose of user-only, this is an
exact replacement.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


