Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B450669D10
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:00:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGw-000246-B1; Fri, 13 Jan 2023 10:47:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGu-00023V-Ms
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:12 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGt-0006DI-3G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id k8so6959074wrc.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMXgF+Gc7juCbht5l+F0PLKgPsDNWhWX1dOXeDIs2ls=;
 b=JfWwF8gNFDGm3Mb63NiaHVyWcD6Gcspt+Cey0dqc5NxNAqLc5nMhq0BQ2kv+X3Ckqe
 gLNknLv0utEzddRdgB6KDJ+x/5qEcq6oeTUpN41JL/b6kEFQPa3/arZ+RvbeH+aFLWje
 je6TyVqq5xd5BvEKYuNNpdh1etOoUL7BPQ6AeLy78yQQkVn1d06aWHAQDJS5nzg0k5+M
 gP+USM52k1V7NPAyuCDerMnSrWcvHO9zhH50ReBwVaCZnPvt0wQHN5+8XqfemMz/U+c2
 J/h1ly0nHXmhQn1X0+daK3TXzXbS672d0anyQI+9QR6b4u0sJHZgnBh5XQiGqbwpIqFA
 Rwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMXgF+Gc7juCbht5l+F0PLKgPsDNWhWX1dOXeDIs2ls=;
 b=zxFB41YXqNgI+Wu2M8OTgZRbFg8epXM3RoMb9qu6Z2UijARzVnAjSZiD/Kr+gblTvE
 UeEbvSV4L5sra8G3hUZPi6b351Val/ONqjTzZCDbRr0X6n6m30W0c6eJwcXuecutXUZx
 hrO4olBlsGOlODcP7pF/S+WxM1JuX3EUTG6aBsWgKNm83e/dzT7Y0+3X/w8slCqr8wNE
 7mVMUk4MbyLc7+ebeSuzQXQD52AZdWX5I/Ju27vhd0YJWJD0lZOW/1B5S+S7eTptkSlf
 wuk+Ja4q+WChAkHEHJ31l/aaLy7RwTLaVMDZfUf0mJh/T7iwrAY/jmO5Jc4+5hSk/cSR
 X0kg==
X-Gm-Message-State: AFqh2kqPTyhEMbmP/SQmonIlIURtXCAQ2FymhZ3iGEfoP7qiisEbvrim
 +mw5ffmWAQILNVaLFoZC7TBuE1rCo78Ccqee
X-Google-Smtp-Source: AMrXdXswnwVHs3qYpriYg7OpSqFL3IlV3mvb/2+cY7V3fJdJselWkckEwRwtaXAeWsdFHGKpgsnE2w==
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id
 bv20-20020a0560001f1400b002425a34fb7bmr52624957wrb.70.1673624830204; 
 Fri, 13 Jan 2023 07:47:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adff784000000b0026e94493858sm18818239wrp.106.2023.01.13.07.47.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 20/46] hw/mips/malta: Use bootloader generator API for nanoMIPS
 CPUs (3/5)
Date: Fri, 13 Jan 2023 16:45:06 +0100
Message-Id: <20230113154532.49979-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Part 3/5: Convert PCI0 I/O BAR setup

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-9-philmd@linaro.org>
---
 hw/mips/malta.c | 40 ++++++++--------------------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 7d0fc5d0c8..f0ed32167f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -691,9 +691,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     /*
      * Load BAR registers as done by YAMON:
-     *
-     *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
-     *
      */
     stw_p(p++, 0xe040); stw_p(p++, 0x0681);
                                 /* lui t1, %hi(0xb4000000)      */
@@ -713,21 +710,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     stw_p(p++, 0xe020); stw_p(p++, 0x0801);
                                 /* lui t0, %hi(0xc0000000)      */
-
-    /* 0x48 corresponds to GT_PCI0IOLD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
-                                /* sw t0, 0x48(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0800);
-                                /* lui t0, %hi(0x40000000)      */
-
-    /* 0x50 corresponds to GT_PCI0IOHD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
-                                /* sw t0, 0x50(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0001);
-                                /* lui t0, %hi(0x80000000)      */
-
 #else
 #define cpu_to_gt32 cpu_to_be32
 
@@ -744,23 +726,17 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     stw_p(p++, 0x0020); stw_p(p++, 0x00c0);
                                 /* addiu[32] t0, $0, 0xc0       */
-
-    /* 0x48 corresponds to GT_PCI0IOLD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9048);
-                                /* sw t0, 0x48(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x0040);
-                                /* addiu[32] t0, $0, 0x40       */
-
-    /* 0x50 corresponds to GT_PCI0IOHD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9050);
-                                /* sw t0, 0x50(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x0080);
-                                /* addiu[32] t0, $0, 0x80       */
 #endif
     v = p;
 
+    /* setup PCI0 io window to 0x18000000-0x181fffff */
+    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
+                     cpu_to_gt32(0x18000000 << 3));
+    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
+                     cpu_to_gt32(0x08000000 << 3));
+
     /* setup PCI0 mem windows */
     bl_gen_write_u32(&v, /* GT_PCI0M0LD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
-- 
2.38.1


