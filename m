Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704242D5A09
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:10:11 +0100 (CET)
Received: from localhost ([::1]:55282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKlu-0005pj-BS
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR6-0001bZ-8u
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQv-000788-4l
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:39 -0500
Received: by mail-wr1-x433.google.com with SMTP id i9so5163838wrc.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h44TqlrvTwai1qYfMg+SaBdZv0lFo3JpWlTXA4ARCTg=;
 b=OOW27UOyos5fzXhLpgwj3IreNakslFPMKBlkzN9jFp6+7USmCB6w7kyHkAmXcDcnp6
 Hk9SfMzfbqSyXC+Za/lsC+vyiHNlaq9rrHTZZF7XscLvhEb2FvevSbzJIwcJZQJZmGio
 +rFAYKO92By9qvWjxV+3W4ZuvuTxMb+3q35WmrP+hPlRSnV4lheIsNcaNbKR3t5K6MO0
 l8KoNI6Nyl7R9EmljwTQrSeGkofnAwX3ISbGy7hqIGsRUF2nvuFaRAk1srLRXdTF/22V
 IdO5xGNnBhf3ab+Sq1H4K7cUBX9tKawMYWvx6wMrmQPXH4IGugW4Vh15nXfSrOTSkkA9
 Wj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h44TqlrvTwai1qYfMg+SaBdZv0lFo3JpWlTXA4ARCTg=;
 b=cX3QHDktIIW0dOHPUyO3p6zT+Z6VRzXBT7Ls2JJi2kC3UyQOgohh2pPnp8dayXqMZT
 O4tNOvDqu8/TZh78qVw2pNLJKaxj1IkMYnab9NJpMUrMDClcP6KP2//03PSBcBC3u0v5
 lKfS+T6uUUM8z6SdaGOuD80gbqsdtTXW/r3+5qSjyNs62ztf8gVaj0GVD7ZprYA8dVZe
 S/tfVIGg96sKdzzpZ+b3lwgkIEVjgCNJeLkZ7EP66i6vcTxXhjSHMOLifbYZ6KrU6sx+
 QnB85UN8Zft+I+LIsmPlFuLDSH936SbpbRDyIlIRbFpo5di0I8QGB9us2QLqD0UErUXx
 RE+g==
X-Gm-Message-State: AOAM5329/+JQWuSfpscAYRcamhuuWLOJV99Gz55e7jJaiO0DnDZSrzk8
 tDRBotfhrpk1Yu2Ix10qVZrHJYjRnLOHYw==
X-Google-Smtp-Source: ABdhPJx8+gxkL8Zse31z1zPB5YhGxGV5SC4LMHHDApPocBNoiSrA7lEZ6CuU1Bp1KHGX+KkyRz1n8A==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr7938711wrr.26.1607600907482;
 Thu, 10 Dec 2020 03:48:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/36] hw/intc/armv7m_nvic: Update FPDSCR masking for v8.1M
Date: Thu, 10 Dec 2020 11:47:45 +0000
Message-Id: <20201210114756.16501-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FPDSCR register has a similar layout to the FPSCR.  In v8.1M it
gains new fields FZ16 (if half-precision floating point is supported)
and LTPSIZE (always reads as 4).  Update the reset value and the code
that handles writes to this register accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-16-peter.maydell@linaro.org
---
 target/arm/cpu.h      | 5 +++++
 hw/intc/armv7m_nvic.c | 9 ++++++++-
 target/arm/cpu.c      | 3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 04f6220b2f7..47cb5032ce9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1521,14 +1521,19 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 #define FPCR_IXE    (1 << 12)   /* Inexact exception trap enable */
 #define FPCR_IDE    (1 << 15)   /* Input Denormal exception trap enable */
 #define FPCR_FZ16   (1 << 19)   /* ARMv8.2+, FP16 flush-to-zero */
+#define FPCR_RMODE_MASK (3 << 22) /* Rounding mode */
 #define FPCR_FZ     (1 << 24)   /* Flush-to-zero enable bit */
 #define FPCR_DN     (1 << 25)   /* Default NaN enable bit */
+#define FPCR_AHP    (1 << 26)   /* Alternative half-precision */
 #define FPCR_QC     (1 << 27)   /* Cumulative saturation bit */
 #define FPCR_V      (1 << 28)   /* FP overflow flag */
 #define FPCR_C      (1 << 29)   /* FP carry flag */
 #define FPCR_Z      (1 << 30)   /* FP zero flag */
 #define FPCR_N      (1 << 31)   /* FP negative flag */
 
+#define FPCR_LTPSIZE_SHIFT 16   /* LTPSIZE, M-profile only */
+#define FPCR_LTPSIZE_MASK (7 << FPCR_LTPSIZE_SHIFT)
+
 #define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
 #define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 9628ce876e0..be3bc1f1f45 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2068,7 +2068,14 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         break;
     case 0xf3c: /* FPDSCR */
         if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-            value &= 0x07c00000;
+            uint32_t mask = FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK;
+            if (cpu_isar_feature(any_fp16, cpu)) {
+                mask |= FPCR_FZ16;
+            }
+            value &= mask;
+            if (cpu_isar_feature(aa32_lob, cpu)) {
+                value |= 4 << FPCR_LTPSIZE_SHIFT;
+            }
             cpu->env.v7m.fpdscr[attrs.secure] = value;
         }
         break;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40f3f798b2b..d6188f6566a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -262,6 +262,9 @@ static void arm_cpu_reset(DeviceState *dev)
              * always reset to 4.
              */
             env->v7m.ltpsize = 4;
+            /* The LTPSIZE field in FPDSCR is constant and reads as 4. */
+            env->v7m.fpdscr[M_REG_NS] = 4 << FPCR_LTPSIZE_SHIFT;
+            env->v7m.fpdscr[M_REG_S] = 4 << FPCR_LTPSIZE_SHIFT;
         }
 
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-- 
2.20.1


