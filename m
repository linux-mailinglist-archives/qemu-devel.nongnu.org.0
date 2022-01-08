Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A448826D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:39:30 +0100 (CET)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67G5-0001pT-NL
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:39:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ip-0005NS-5j
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:15 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=36583
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Il-0003Sf-Ty
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:14 -0500
Received: by mail-io1-xd2c.google.com with SMTP id p65so10131719iof.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGafu069XHHYypYBdA9I4L4GZtYRvDK9ebq4zTQT5yc=;
 b=3OYuVO4vi5T5ma2n302/zq3+/PyhsjpmA4hYm3zVcawmfhTgCr/nd+mr5BTHU6WxDB
 1G+c1D8EyzupbWcla3ADfxRRMS1a7BjhedsZbnN8HWPCvGyDKPiHsm/FE4UI+sf6nZ5b
 ZUhQ+gnwS5F5mfPuDXZl28IT2GblcL9OwCqj7T5BIyvvwXtLOkQEwZxy/gRY60s8Wjr3
 GeQUtQ/Z4bmFUgC6aArsKxPjV31ymxGHhT0r1j4bihLvIjThrLGUshO6GwHDq2zQNZOS
 SW5tkJCfh+fk2h8ONwJvJoVlJIakst8IQ/7IlMvgA+1yn3FKJj0S7Cnad163/MGJNdDl
 uzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGafu069XHHYypYBdA9I4L4GZtYRvDK9ebq4zTQT5yc=;
 b=uAbDqw9tCsSh8zLsV1RR7AX0iUlbC372LPVFTVSqEDsxNb5ehJIopdHvjsB6tN3vgx
 P0LRqyn2scw/u94vvXNmhS29i0xETb/QBrKSlMKC+SyquQ041B/OEdSZz4oDovDfjWQb
 P1o5MKTOsJtMuWHWHgxnwUlwvJIhuXLAw7QLC76mukvJPtQ/8/lVd+8iEQHU1Q73ekSf
 WspqcF+z7M2m68TmwmhmvK2xHcQKkJz6a27nevNn2lR+RLVbGYXBh8vpfm7GWIhbtvi8
 8RiAvOUg58tEM4IcWXM3TItNe1QwzK1fcbS6M5gcQ+8mOWIzPKSDW8GSRZNebQtt9I8+
 vJmg==
X-Gm-Message-State: AOAM532S3CEGURoRDia6u4zsoxYsdiVRJfpO0kzbSDhRG+GSfaTB/otb
 Jls/Gdwiuzhygjz+Fy/v9YuDT3mBNcKmqhSx
X-Google-Smtp-Source: ABdhPJzzEeX/ANNBDdKf7nSDwYlyni9OGifrHxbQ9XjBP9l/4YcB1RNQTMjLXLEhnqJZUfKFt5CcyQ==
X-Received: by 2002:a05:6602:2e8f:: with SMTP id
 m15mr5544661iow.7.1641627489879; 
 Fri, 07 Jan 2022 23:38:09 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/37] bsd-user/arm/target_arch_elf.h: arm get hwcap
Date: Sat,  8 Jan 2022 00:37:27 -0700
Message-Id: <20220108073737.5959-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement get_elf_hwcap to get the first word of hardware capabilities.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_elf.h | 72 +++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
index 15b5c66511f..02d25b89264 100644
--- a/bsd-user/arm/target_arch_elf.h
+++ b/bsd-user/arm/target_arch_elf.h
@@ -31,6 +31,76 @@
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-#define ELF_HWCAP 0
+#define ELF_HWCAP get_elf_hwcap()
+
+#define GET_FEATURE(feat, hwcap) \
+    do { if (arm_feature(&cpu->env, feat)) { hwcaps |= hwcap; } } while (0)
+
+#define GET_FEATURE_ID(feat, hwcap) \
+    do { if (cpu_isar_feature(feat, cpu)) { hwcaps |= hwcap; } } while (0)
+
+enum {
+    ARM_HWCAP_ARM_SWP       = 1 << 0,
+    ARM_HWCAP_ARM_HALF      = 1 << 1,
+    ARM_HWCAP_ARM_THUMB     = 1 << 2,
+    ARM_HWCAP_ARM_26BIT     = 1 << 3,
+    ARM_HWCAP_ARM_FAST_MULT = 1 << 4,
+    ARM_HWCAP_ARM_FPA       = 1 << 5,
+    ARM_HWCAP_ARM_VFP       = 1 << 6,
+    ARM_HWCAP_ARM_EDSP      = 1 << 7,
+    ARM_HWCAP_ARM_JAVA      = 1 << 8,
+    ARM_HWCAP_ARM_IWMMXT    = 1 << 9,
+    ARM_HWCAP_ARM_CRUNCH    = 1 << 10,
+    ARM_HWCAP_ARM_THUMBEE   = 1 << 11,
+    ARM_HWCAP_ARM_NEON      = 1 << 12,
+    ARM_HWCAP_ARM_VFPv3     = 1 << 13,
+    ARM_HWCAP_ARM_VFPv3D16  = 1 << 14,
+    ARM_HWCAP_ARM_TLS       = 1 << 15,
+    ARM_HWCAP_ARM_VFPv4     = 1 << 16,
+    ARM_HWCAP_ARM_IDIVA     = 1 << 17,
+    ARM_HWCAP_ARM_IDIVT     = 1 << 18,
+    ARM_HWCAP_ARM_VFPD32    = 1 << 19,
+    ARM_HWCAP_ARM_LPAE      = 1 << 20,
+    ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
+};
+
+static uint32_t get_elf_hwcap(void)
+{
+    ARMCPU *cpu = ARM_CPU(thread_cpu);
+    uint32_t hwcaps = 0;
+
+    hwcaps |= ARM_HWCAP_ARM_SWP;
+    hwcaps |= ARM_HWCAP_ARM_HALF;
+    hwcaps |= ARM_HWCAP_ARM_THUMB;
+    hwcaps |= ARM_HWCAP_ARM_FAST_MULT;
+
+    /* probe for the extra features */
+    /* EDSP is in v5TE and above */
+    GET_FEATURE(ARM_FEATURE_V5, ARM_HWCAP_ARM_EDSP);
+    GET_FEATURE(ARM_FEATURE_IWMMXT, ARM_HWCAP_ARM_IWMMXT);
+    GET_FEATURE(ARM_FEATURE_THUMB2EE, ARM_HWCAP_ARM_THUMBEE);
+    GET_FEATURE(ARM_FEATURE_NEON, ARM_HWCAP_ARM_NEON);
+    GET_FEATURE(ARM_FEATURE_V6K, ARM_HWCAP_ARM_TLS);
+    GET_FEATURE(ARM_FEATURE_LPAE, ARM_HWCAP_ARM_LPAE);
+    GET_FEATURE_ID(aa32_arm_div, ARM_HWCAP_ARM_IDIVA);
+    GET_FEATURE_ID(aa32_thumb_div, ARM_HWCAP_ARM_IDIVT);
+    GET_FEATURE_ID(aa32_vfp, ARM_HWCAP_ARM_VFP);
+
+    if (cpu_isar_feature(aa32_fpsp_v3, cpu) ||
+        cpu_isar_feature(aa32_fpdp_v3, cpu)) {
+        hwcaps |= ARM_HWCAP_ARM_VFPv3;
+        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
+            hwcaps |= ARM_HWCAP_ARM_VFPD32;
+        } else {
+            hwcaps |= ARM_HWCAP_ARM_VFPv3D16;
+        }
+    }
+    GET_FEATURE_ID(aa32_simdfmac, ARM_HWCAP_ARM_VFPv4);
+
+    return hwcaps;
+}
+
+#undef GET_FEATURE
+#undef GET_FEATURE_ID
 
 #endif /* _TARGET_ARCH_ELF_H_ */
-- 
2.33.1


