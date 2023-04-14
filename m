Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F36E2802
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:06:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLv2-0006b7-CE; Fri, 14 Apr 2023 12:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuT-0006Dg-6E
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pnLuN-0007ue-GU
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:04:24 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k36-20020a05600c1ca400b003f0a7c483feso3112669wms.4
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681488257; x=1684080257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMa/jjOI3MD8EqV7FtoT5tBQ7kPLlHERL0vXAgxCR5Y=;
 b=RrqyY3tLwUYPzR1bC3UHzCc/SLAMfeEomSCZrPQWrF8sZzq/33u1xwNjteMq/p46ZF
 S0LnjNBVUDf+x0TPgjS+2YeRPFC/KgYdeHreKpYSS0M4ZjxNdaMQLc5E6mfEWjGdsnpr
 I9wCu1+H0fH8lBLYsVnCmMERFn7hGD4kFVWoWRtxiwkMKp59h41MoA3NO7TAfkUvhMNZ
 QrpOyd8iBxnYZTg34rX4CFxobc2ym5kP6SudUE2pZXmDhVNtn/qG5Feq1+fcVs3oKx4b
 xyAAwl2tTmj5WRyFu8dk+1WRXS/+nB94YttBCwidaw6SSlI36qYeCz2QZGyyQxXAHsyI
 On9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488257; x=1684080257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMa/jjOI3MD8EqV7FtoT5tBQ7kPLlHERL0vXAgxCR5Y=;
 b=Y7QNli9d9CzZfoKgVs6JiW/Qjx94xwj5sGTTcdHZwQQPTnNv4Gy4qd2yXujeMZRcIP
 Uz7V2wS3lrkKEbdy7DNbudjJxLGDjIs3MHAQRvf/AiaBdriRAndPFw3pRow0hOmhQc1I
 6/z5gyluf4eAeGT/IdEyn5cpNGyB9eJ2ug8GsdjMTmdJRDj6PCK7wc4Wep7FygrpjByP
 ppSDXbgevKW5q2vcsPblFgLr5wzxadrWdlF9liJfMxxj+d/JvXNHOr3HVnFq34K76gUw
 N/jRFvkUgHMvz2MH4iHUWOPfVKOkB4QT3RAi3RhbyhbsL+nLX4S+U5bKdZ/go+JTHveD
 siqg==
X-Gm-Message-State: AAQBX9e0Z4wWVbfITQ2cDw9qnkHywkROhr3O3UJ+gnaI0MzDqf2vuSEn
 VmMTE6DVDnGEOPsn09keL7neig==
X-Google-Smtp-Source: AKy350ay4iPAg5bbSmh1LgUiLSeXEpH2u0jZzTqu0CQ7Fz9Iy8H6Jorw7PLMnNjFRK3NRIeGGmlKZA==
X-Received: by 2002:a05:600c:ad6:b0:3f0:bf4d:8c64 with SMTP id
 c22-20020a05600c0ad600b003f0bf4d8c64mr1709819wmr.22.1681488257013; 
 Fri, 14 Apr 2023 09:04:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c22c800b003ef71d541cbsm4673752wmg.1.2023.04.14.09.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:04:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 3/3] target/arm: handle ipa_secure vs s2walk_secure correctly
Date: Fri, 14 Apr 2023 17:04:13 +0100
Message-Id: <20230414160413.549801-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414160413.549801-1-peter.maydell@linaro.org>
References: <20230414160413.549801-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In get_phys_addr_twostage() when we set up the stage 2 translation,
we currently incorrectly set all of in_mmu_idx, in_ptw_idx and
in_secure based on s2walk_secure.

Here s2walk_secure is true if we should be doing this stage 2
walk to physical memory. ipa_secure is true if the intermediate
physical address we got from stage 1 is secure. The VSTCR_EL2.SW
and VTCR_EL2.NSW bits allow the guest to configure secure EL2
so that these two things are different, eg:
 * a stage 2 walk for an NS IPA done to secure physical memory
   (where the translation table base address and other parameters
   for the walk come from the NS control registers VTTBR_EL2
   and VTCR_EL2)
 * a stage 2 walk for an S IPA done to non-secure physical memory
   (where the parameters from the walk come from the S control
   registers VSTTBR_EL2 and VSTCR_EL2)

To tell get_phys_addr_lpae() to do this, we need to pass in an
in_mmu_idx based on ipa_secure, and an in_ptw_idx based on
s2walk_secure.  The in_secure parameter follows in_mmu_idx, as usual.

Note that this change relies on fixes in the previous two commits
("Don't allow stage 2 page table walks to downgrade to NS" and
"Set ptw->out_secure correctly for stage 2 translations").

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1600
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This change also means that v8M, which also uses
get_phys_addr_twostage(), is no longer using a ptw->in_mmu_idx
calculated based on s2walk_secure, which was always a little
strange given that v8M doesn't do any kind of s2 walk, even
though it didn't produce incorrect behaviour.
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c1e124df495..2ee2b0b9241 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2741,9 +2741,9 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     }
 
     is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
-    ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    ptw->in_mmu_idx = ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     ptw->in_ptw_idx = s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-    ptw->in_secure = s2walk_secure;
+    ptw->in_secure = ipa_secure;
 
     /*
      * S1 is done, now do S2 translation.
-- 
2.34.1


