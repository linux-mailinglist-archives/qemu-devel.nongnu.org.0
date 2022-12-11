Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7AB649660
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:51:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TDh-0005cR-J1; Sun, 11 Dec 2022 15:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDa-0005Wp-TQ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:41 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDX-0003W7-6G
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:36 -0500
Received: by mail-ej1-x62e.google.com with SMTP id fc4so23253681ejc.12
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKdeOhw2mGeaIKrFHK/dBwjr+yAuHbogWgOY/t2qS3E=;
 b=PwOphkr8EOgQchdtbBfThUyopui1N6+nAYi4qQAxpAHGMUEpe4TNoH3tJOU7X7zMwS
 1XDS6Q5jmcJweXuHk7vkvHTOUhd/6IcsyIiFRp0WQD1JIgO1lxwDNGMdSO3zkNtuFjol
 Io/7qGRZsN5Y0Z1SfY8iRB2dl/qS5IeQYVgkgtdtiUBVc8zTKIfyQn+fwhBZLNaqRUpH
 PYaqNy9Jvbw3EydKmTAQEapDDulKbwuCy+cdiquwlQdfltkN2oq3cZ7EjC/IgjX6D9hS
 l+HUKoc30xZM2OcQsXyNW2ZZfbfVLC9VvW/L17FBEtMLOWJu07cgn3yp0+ljKerztDt3
 MakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JKdeOhw2mGeaIKrFHK/dBwjr+yAuHbogWgOY/t2qS3E=;
 b=gbZ6lxgpihbPMK+yg8+eFETT7ek1/TxVRouIMeTSWg1I4zLtkwPp7rdXO1bTt65itA
 2S4U5OH6BsflxXRcqckYrg/YP9UusOxHF+J5Yu9eW3zJyQJLSR6vE3bRlMYGq9QPN18m
 kiM6Z+eiJUYQrwx4uwRDVQAPdidxJlvh/w5tOW+IH+c6B3pctt1OwbdbpKIys72xpST4
 9STb3QIhSKVXgyAK3sKH3YW2nQnH390MuMfrxcdwHDnmiw060uVqLQyeaxi8JEVWhx9j
 9s9tiWQv52TWntF3XV9EoEoXbxX5kwZ7s4dSvzPYu7/bNsrYcxekJr9oRrDb2lNwicF9
 c3bA==
X-Gm-Message-State: ANoB5pnNaj326nBaGsHwIXyUylwe3oFRMYxL+AfI2R3MbEW9RJuUm/tk
 +dZlo3VmzP4nYO7XCZfcL2mb9bQTvLxIdFZSOL8=
X-Google-Smtp-Source: AA0mqf5BYbE8+AH2FUBQ206/IgU0uEepFVNAT8/vCWDiJTLsfcMmMGZNjAUu8d4lAV8kNR8i7gFoCQ==
X-Received: by 2002:a17:906:2314:b0:7c0:d522:decb with SMTP id
 l20-20020a170906231400b007c0d522decbmr10301946eja.76.1670791591990; 
 Sun, 11 Dec 2022 12:46:31 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090631c300b007c0aefd9339sm2467513ejf.175.2022.12.11.12.46.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:46:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 09/11] hw/mips/malta: Use bootloader generator API
 for nanoMIPS CPUs (4/5)
Date: Sun, 11 Dec 2022 21:45:31 +0100
Message-Id: <20221211204533.85359-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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

Part 4/5: Convert GT64120 ISD base address setup

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 40 +++++++---------------------------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 16161b1b03..451908b217 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -683,46 +683,20 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0x80e7); stw_p(p++, NM_LO(loaderparams.ram_low_size));
                                 /* ori a3,a3,%lo(loaderparams.ram_low_size) */
 
-    /*
-     * Load BAR registers as done by YAMON:
-     */
-    stw_p(p++, 0xe040); stw_p(p++, 0x0681);
-                                /* lui t1, %hi(0xb4000000)      */
-
 #if TARGET_BIG_ENDIAN
 #define cpu_to_gt32 cpu_to_le32
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0be1);
-                                /* lui t0, %hi(0xdf000000)      */
-
-    /* 0x68 corresponds to GT_ISD (from hw/mips/gt64xxx_pci.c)  */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
-                                /* sw t0, 0x68(t1)              */
-
-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
-                                /* lui t1, %hi(0xbbe00000)      */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0801);
-                                /* lui t0, %hi(0xc0000000)      */
 #else
 #define cpu_to_gt32 cpu_to_be32
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00df);
-                                /* addiu[32] t0, $0, 0xdf       */
-
-    /* 0x68 corresponds to GT_ISD                               */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9068);
-                                /* sw t0, 0x68(t1)              */
-
-    /* Use kseg2 remapped address 0x1be00000                    */
-    stw_p(p++, 0xe040); stw_p(p++, 0x077d);
-                                /* lui t1, %hi(0xbbe00000)      */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00c0);
-                                /* addiu[32] t0, $0, 0xc0       */
 #endif
     v = p;
 
+    /* setup MEM-to-PCI0 mapping as done by YAMON */
+
+    /* move GT64120 registers from 0x14000000 to 0x1be00000 */
+    bl_gen_write_u32(&v, /* GT_ISD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
+                     cpu_to_gt32(0x1be00000 << 3));
+
     /* setup PCI0 io window to 0x18000000-0x181fffff */
     bl_gen_write_u32(&v, /* GT_PCI0IOLD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
-- 
2.38.1


