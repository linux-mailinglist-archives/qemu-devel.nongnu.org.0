Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B1C60D202
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:54:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMz0-0006ak-7A; Tue, 25 Oct 2022 12:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0006Ct-2L
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyR-0001eh-Tg
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id j15so11554328wrq.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5W0kVIix3U3mXWnUq0kB/Q/Vahrm6fZkJGySoHAD2KY=;
 b=UUZIdy+NtnEd7MIaUHhgXh7UiCNrX5WM21dlowj33+sbzTpEzGyqyXMyNtl6ezXQTl
 6VZ7rX20JcjB335EaNV7LsEgXHp0YvDuKHmpRYfBRk0pHgAmDQreMGQ1HxV6e3UGrZhy
 PIF4zU3aqbgEOq+eZXsoru0yYR8aND1P/kzwWjXfW0MkJQJmyigpW6QlHoESiqRYNzhp
 Lx1Lp8ju8Oh06qiCPaz+JPbIxcQ1WEBCtvaryMQEiuOMlFfdao8iTgmoi0CCERfK8UER
 F6HUkQChnr9Mz06i4IpmXOQLBAH2zQLvFYjGv3JZMxR7VIg2kXlX5RvlBOEqQhulwWQZ
 bGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5W0kVIix3U3mXWnUq0kB/Q/Vahrm6fZkJGySoHAD2KY=;
 b=M1Eo+gSnzOL0lMzjpdAEWmBVBasTFb5jxY9i95SiYTPgLlGbF6gwNn+osLnoawiYBb
 ygWmJjN0q+rBl93runFHqFrz3w0kZ/i/wsBtYTyCKWtR5A/aXKjQ9ccq5lfRCoa5jHa1
 sxNJSNBsCSO3RnZ/Llz51U4ueS4gUHFjrJ1jYfqCp8Juwohwrkmn87+K+YxMnew7XYrH
 sOhaHD/wd+HkYGIcqbzpl4rPYZlDvHhwpRwVyaUyYniqukM4AHWsYXW6dW7TyV0koqUd
 u1l2MHFFSTtetIRAKNNOi2AnNNEnKAkWy6w60F0L/yKRi0wEPcKkO+/zYSguN5TtkjZv
 MV5w==
X-Gm-Message-State: ACrzQf1yOV+opWoG4I4sF3Ekgvgg+GR6POrZA/cB2unMgKYQXfyKg3tA
 BAfbn1qvmAmz2MGHbsGtA1gdMeH1Q/OFPQ==
X-Google-Smtp-Source: AMsMyM6Ih+eBPllpCwyVe58+V/hBZbGc62t8jeDWT994oartzbbkN7i9E+mV4PCR8NYLNemh7CApxw==
X-Received: by 2002:a05:6000:1565:b0:22f:1407:9bfd with SMTP id
 5-20020a056000156500b0022f14079bfdmr25689116wrz.620.1666716017619; 
 Tue, 25 Oct 2022 09:40:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] target/arm: Implement FEAT_HAFDBS, dirty bit portion
Date: Tue, 25 Oct 2022 17:39:41 +0100
Message-Id: <20221025163952.4131046-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Perform the atomic update for hardware management of the dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221024051851.3074715-14-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c |  2 +-
 target/arm/ptw.c   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f2c3e41f5a7..3d74f134f57 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1165,7 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 03776f47a01..6b8f14fb3cd 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1444,6 +1444,22 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                 goto do_fault;
             }
         }
+
+        /*
+         * Dirty Bit.
+         * If HD is enabled, pre-emptively set/clear the appropriate AP/S2AP
+         * bit for writeback. The actual write protection test may still be
+         * overridden by tableattrs, to be merged below.
+         */
+        if (param.hd
+            && extract64(descriptor, 51, 1)  /* DBM */
+            && access_type == MMU_DATA_STORE) {
+            if (regime_is_stage2(mmu_idx)) {
+                new_descriptor |= 1ull << 7;    /* set S2AP[1] */
+            } else {
+                new_descriptor &= ~(1ull << 7); /* clear AP[2] */
+            }
+        }
     }
 
     /*
-- 
2.25.1


