Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168EB6341B0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 17:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWJg-0002Gm-Iu; Tue, 22 Nov 2022 11:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxWJV-0002GB-U3
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:40:02 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxWJT-0003nW-15
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 11:40:00 -0500
Received: by mail-wr1-x430.google.com with SMTP id i12so21717018wrb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 08:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FTvCkzoU4dh1lLaA8KtPpm96t/AlaV/FPI3PFeRW8FM=;
 b=waNGPfzRlwoZ1w8OJN7cb2f8TMWPlMEvpXSkAdufvulPCp4/wP8rXi9zq1SkOB9BfG
 3iT7ZOIeXhS1e3LpfD9plhF9Ss002Ace+X2QTWOBQPl+Li3TjZQ3pvpRxFfhs4eDVz82
 MSETo9mDHrxqZrHUtzrMTYVaXmAIANuUWX1M/SNxuG015P1kg+FfRC/TG942TK2GGKyC
 8rfsCtkaCeZRom8uMqPewbDGOrAJUUAipKQ0v8aPDyYzzF6SjG5BXemf3FBs1f04mueF
 MSw4CwCukk/ro12hMf1YqYn+/xQDNX6iot8Oropa0l5471lBhfwb/SvJm/affFIIc7xQ
 So2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTvCkzoU4dh1lLaA8KtPpm96t/AlaV/FPI3PFeRW8FM=;
 b=1J300B8BSJ8yN3N4VRsA79i4NsaYQf6cYbo4V+MeYhE8c0rEpn6/e9ykhbky4oui0W
 19fAL1GN2T8pFOs+0OInIE5TdFXasSON6LMShXeVYtKp+3tzbNIr7E1Mal0xbYfe5Q90
 fYstWssQ2M810RV9vGVHOPFBQoyBRbx1xSbR+54o62zbymGhlKGzLa+aplQwDJfd6G6y
 Buph0CKPbJVR5K9sJwSlMpit4N0bc2dAPe8gdVCy0N7SwiBI/D2WFjeMKDIu0+JNFK80
 dGvC0tbiqKw9Up1YQoq5DStIASCTUk87rE/lO9I5CgwkkR5Sl9wg+i9iN/WrxgoBZaOS
 GYCg==
X-Gm-Message-State: ANoB5plo5/FXye9yrx6qpdPmE2RzQtwX5E5oj5vsxpetwfcwmkF6WTER
 yGIk7dIDkA8qsQgULOPUnHhvaOCt4z13Jw==
X-Google-Smtp-Source: AA0mqf5NwfSDdq52K4FWh6AWD8sLFt02ngpMiuIo3PmJtp9+hJ6zS6ocK/mg3X+F6cmexADAsyHlfQ==
X-Received: by 2002:adf:d4cb:0:b0:241:e680:b5be with SMTP id
 w11-20020adfd4cb000000b00241e680b5bemr1765996wrk.717.1669135197083; 
 Tue, 22 Nov 2022 08:39:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adff48a000000b002366ded5864sm14353585wro.116.2022.11.22.08.39.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 08:39:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] target/arm: Don't do two-stage lookup if stage 2 is
 disabled
Date: Tue, 22 Nov 2022 16:39:53 +0000
Message-Id: <20221122163954.1900093-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122163954.1900093-1-peter.maydell@linaro.org>
References: <20221122163954.1900093-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In get_phys_addr_with_struct(), we call get_phys_addr_twostage() if
the CPU supports EL2.  However, we don't check here that stage 2 is
actually enabled.  Instead we only check that inside
get_phys_addr_twostage() to skip stage 2 translation.  This means
that even if stage 2 is disabled we still tell the stage 1 lookup to
do its page table walks via stage 2.

This works by luck for normal CPU accesses, but it breaks for debug
accesses, which are used by the disassembler and also by semihosting
file reads and writes, because the debug case takes a different code
path inside S1_ptw_translate().

This means that setups that use semihosting for file loads are broken
(a regression since 7.1, introduced in recent ptw refactoring), and
that sometimes disassembly in debug logs reports "unable to read
memory" rather than showing the guest insns.

Fix the bug by hoisting the "is stage 2 enabled?" check up to
get_phys_addr_with_struct(), so that we handle S2 disabled the same
way we do the "no EL2" case, with a simple single stage lookup.

Reported-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20221121212404.1450382-1-peter.maydell@linaro.org
---
 target/arm/ptw.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9a6277d862f..8ca468d65bc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2612,8 +2612,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
 
-    /* If S1 fails or S2 is disabled, return early.  */
-    if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+    /* If S1 fails, return early.  */
+    if (ret) {
         return ret;
     }
 
@@ -2739,7 +2739,8 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
          * Otherwise, a stage1+stage2 translation is just stage 1.
          */
         ptw->in_mmu_idx = mmu_idx = s1_mmu_idx;
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
+        if (arm_feature(env, ARM_FEATURE_EL2) &&
+            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
             return get_phys_addr_twostage(env, ptw, address, access_type,
                                           result, fi);
         }
-- 
2.25.1


