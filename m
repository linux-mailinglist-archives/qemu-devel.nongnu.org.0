Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69707156463
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 14:03:38 +0100 (CET)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0Plp-0000sH-DT
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 08:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j0Pgp-0000Un-Va
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j0Pgp-0004ju-0y
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:27 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54370)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j0Pgo-0004ij-Rc
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 07:58:26 -0500
Received: by mail-wm1-x342.google.com with SMTP id g1so5183183wmh.4
 for <qemu-devel@nongnu.org>; Sat, 08 Feb 2020 04:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JxCN9UgAkN2gvbQt24qXPYmKBF/541S9HRLtE/c4bb4=;
 b=YpZry2lsVluWDjdTfDIfq/R+H4jEceTA9Ethab3i3dI/DRF1B4yaRKqV7qwnzDgtfP
 jC0EwEJMe9OoWZdct//0D+2dh/ey9+c37VBidLgsgyjKa6y5DdU8vEV9ll/OSmu8a3sE
 A2GVlymJVgzxFnpmPo7mGQDf7xbU2vQ5uVBY3YwhAe1kOXY0aEhyGalhaeB87gY2xO51
 U9szEfbKzPWfGpYZL1Hx5zagjF5clX2bZwiDB6wuA0g8wmEc/fwBf10ZgoWcvaqB3cF3
 VGPNymuD6Fo+Tb9krI7KqheWQZsn9tDKtgIodZsmyOO7RQPjPnjU+kVAiFqjG2Wpad02
 OdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JxCN9UgAkN2gvbQt24qXPYmKBF/541S9HRLtE/c4bb4=;
 b=NVtClWmOaRmE85O0MlpzYg4uw+WwpPP+obYmSssDFpdtS9doF7+lEK1sdhAH34I+eD
 W8kQk0xUYWKYR003hb4tSQb/pJ2qLjyhPh9D6etzAmhIH7mbIvisszMZHhicdZlihgKQ
 nZ2Pk2LzMu5D97ilB9iG9lScepKhS1vC/ffxmxsmVrRmXRoCqBs0ODeiKB1A3bT023Uy
 +/mCRrcHdu7AAN/vBI16Qkk25fW+A1yVScyAJBsixK0eEkV4zDeunb6n6HCxy+PTtPCE
 Nnv0lbXGCU1Lk1wmSEeh67G3E2CoVt8kXUL38tjub4cHipn7DbuSXNUxAP/9/y6PLDbz
 VZKA==
X-Gm-Message-State: APjAAAUmlJxRfR59vb+9X5WvmP1K1w9GPSjsUaG2kP4DZn1zd8hRq8hh
 pq2/tnB4SSB7cECt4iXUCa22i6XlqTexcA==
X-Google-Smtp-Source: APXvYqxK3TJQbO5q5bam5Tddxi2du1mrPLXikkf6BXX1vatrj39j4KhmlE18kT1Bm2HBcRLRHJnzdA==
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr4292384wmb.38.1581166705609; 
 Sat, 08 Feb 2020 04:58:25 -0800 (PST)
Received: from localhost.localdomain ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id p5sm7490534wrt.79.2020.02.08.04.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 04:58:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/20] target/arm: Use aarch32_cpsr_valid_mask in
 helper_exception_return
Date: Sat,  8 Feb 2020 12:58:04 +0000
Message-Id: <20200208125816.14954-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200208125816.14954-1-richard.henderson@linaro.org>
References: <20200208125816.14954-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using ~0 as the mask on the aarch64->aarch32 exception return
was not even as correct as the CPSR_ERET_MASK that we had used
on the aarch32->aarch32 exception return.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index bf45f8a785..0c9feba392 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -959,7 +959,7 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
 {
     int cur_el = arm_current_el(env);
     unsigned int spsr_idx = aarch64_banked_spsr_index(cur_el);
-    uint32_t spsr = env->banked_spsr[spsr_idx];
+    uint32_t mask, spsr = env->banked_spsr[spsr_idx];
     int new_el;
     bool return_to_aa64 = (spsr & PSTATE_nRW) == 0;
 
@@ -1014,7 +1014,8 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
          * will sort the register banks out for us, and we've already
          * caught all the bad-mode cases in el_from_spsr().
          */
-        cpsr_write(env, spsr, ~0, CPSRWriteRaw);
+        mask = aarch32_cpsr_valid_mask(env->features, &env_archcpu(env)->isar);
+        cpsr_write(env, spsr, mask, CPSRWriteRaw);
         if (!arm_singlestep_active(env)) {
             env->uncached_cpsr &= ~PSTATE_SS;
         }
-- 
2.20.1


