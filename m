Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C483264965A
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:47:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TDS-0005LS-Nk; Sun, 11 Dec 2022 15:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDO-0005HV-LV
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:28 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDM-0003Uw-Vl
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:26 -0500
Received: by mail-ej1-x62f.google.com with SMTP id n20so23397795ejh.0
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q6VB8YjJPS5nIIgRvk1SreqCY7ssu54js3a7soVUWTU=;
 b=BF+/bveWexKWWwv2l1uUIKio1ObVMjSA++xQeZ84eDrKbPyFvEzlQ50aIJIhCpPB9v
 qIg0O2yvJGToQbWBF6YyoWknBW/bhojYdU3EPo3iBb1aOIeWRIgmk4sl6YKhaq8Q+S+g
 N8RDDN2RbeV6BJZ4byD4ZIbp+dypJGo64L5G1PypxInD6NzI6y6sndofawS4kQAGtxba
 3W6hMIgdF5hsWyncxfCMN6M5kXh0EzYOwgrQZVoIBzWEGGFC3OeqS6J46C25ciU9fd9U
 9Ypxl4WrB9F3oEg7ocljZJOE6AjXSmKb/g9FRwjoMnrbxJrXEux38GtBnNGOi7mlrcoI
 UnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q6VB8YjJPS5nIIgRvk1SreqCY7ssu54js3a7soVUWTU=;
 b=mloVl45C/G6+Bx7EFDBUidwNGjVg+6AITFMx9+ZzbxSMUAMPVZgSdNSl6DrPKMspd+
 mbLNOYBUodmY850frWN4XsDiNjdCFqmUMnmjaevkI7l7TLuHe859GwDJnVVypMDztVmb
 bhP1yb2fIYreJ40hF7d5+P/om0ury0yR9/JgxdLzbRlQK9fBht6RVZkRYy4uL9GXk6uP
 mmmuyjZ8xSaPVk8LMIgCfWu8N3gQWkrBrT+mgVCpLeanZjQLMbIMM6gvkYj9W9Cn++eA
 Xeci33BHO9l5sM4QEOCsZcLJUdjeanVAIxMfwIBUkWu1o3f9oELArw8qbcyIF5MxEI1a
 e9iA==
X-Gm-Message-State: ANoB5pmbUDnHu+rX41r3BrRsIVzwaMelSsNh0NnsAuvnQQmkI+ohcwnN
 fnFqlK7DTu/0hR2SzyQCvHLEf3t1RaoSJzknhD0=
X-Google-Smtp-Source: AA0mqf6atMMxilfS8k7edAgsAX9/Zd1BFTwCzaVWKxWG2ALI4Htk7UUwAgnf9ypQzVhhRtcMVq9QdQ==
X-Received: by 2002:a17:906:c24f:b0:7c0:c316:6abf with SMTP id
 bl15-20020a170906c24f00b007c0c3166abfmr11684334ejb.50.1670791583460; 
 Sun, 11 Dec 2022 12:46:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 de39-20020a1709069be700b007c0f45ad6bcsm2426637ejc.109.2022.12.11.12.46.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:46:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 08/11] hw/mips/malta: Use bootloader generator API
 for nanoMIPS CPUs (3/5)
Date: Sun, 11 Dec 2022 21:45:30 +0100
Message-Id: <20221211204533.85359-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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
---
 hw/mips/malta.c | 40 ++++++++--------------------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 3e80a12221..16161b1b03 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -685,9 +685,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     /*
      * Load BAR registers as done by YAMON:
-     *
-     *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
-     *
      */
     stw_p(p++, 0xe040); stw_p(p++, 0x0681);
                                 /* lui t1, %hi(0xb4000000)      */
@@ -707,21 +704,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
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
 
@@ -738,23 +720,17 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
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


