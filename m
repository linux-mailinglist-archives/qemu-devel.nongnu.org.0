Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B587964965B
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:48:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TDK-0005Gx-Gi; Sun, 11 Dec 2022 15:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDH-0005Go-QP
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:20 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TDG-0003TE-9N
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:19 -0500
Received: by mail-ej1-x634.google.com with SMTP id tz12so644880ejc.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOKkbdF2wzJddWGZH9AQVNLA5ppkIMO9XidfsUUqFe0=;
 b=W0QUG/+RIA47c9sJHUpKHf1fH9Y8SfZg9zCe7wQvwc7DCiKbwaFznJlYlxcWjL2Cd5
 ZF8YM0Yv8ZVtZBN8g/BMigHMuLb/vMCVxG6JXlo5VpfQ2wMbAMNQJXAxTtOLhqh4koze
 yqrClRol7w0/Fbe3SF/vCUjWt5dHGPUpheQjWwSBWfiCbyr3ORT4/OPRYAM1iAuQU8dY
 AK4H2yjYNxpiChJMajXkXA/vWWe/BWBNSLuFDPkwHIw37Ve4LdJLrUaGTvfA9PD5+4p9
 XxtNXNVa38Tjqi/hooa5I4orJDR2OzkY0cngRlazLeQRoSb7U7nY+xhOLcRZRQMgjINw
 N1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOKkbdF2wzJddWGZH9AQVNLA5ppkIMO9XidfsUUqFe0=;
 b=BDFKKK3Sl5CUusbJe+p37Bi7mHO47HaxTI+pc6KWi2kheakCFspL4Yfvib4VXIlwo1
 CciEXNR6X5VU5cQrPmVCYwz9MMEgqXiV8vekw0xl67+RkBahhccevkYwKfAbg9uf4hKn
 wpG3ZzsUzm2IWRGyGyRxsGKeomo/Cg83pK5+H9z1YwyDeEoNrHhR0zCOY6FOrAdP3BIi
 m5TixHUrhptvyGEa1RSFK++WV+nNgcM+C/EBk639NARo/0lJXS8ShAaR8Nf3b61MfDcR
 mcC0SShNRukREJOex/Vvr73PRb+AW1eGJ4KYkk+Gk3aZ00UW59fvgXyTeYnPAbk02qmu
 kAYw==
X-Gm-Message-State: ANoB5pk27m15DM4HxZcBqz1ZKy6n9a1/89PGwL0KOIoifkPfscsmEMAI
 M51OBOq5A+snjyx47Ub8AeQZoywjYsoaSKOVuXk=
X-Google-Smtp-Source: AA0mqf72Kmsd480274CADTRUx3Me7TMJnUNdbC8WlEoGYoX/AT0D+t0d0jtING3QqluZ7JYevXS0Tw==
X-Received: by 2002:a17:906:3781:b0:7ac:8e6a:a674 with SMTP id
 n1-20020a170906378100b007ac8e6aa674mr11686082ejc.2.1670791576802; 
 Sun, 11 Dec 2022 12:46:16 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a170906769400b0077a11b79b9bsm2412231ejm.133.2022.12.11.12.46.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:46:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 07/11] hw/mips/malta: Use bootloader generator API
 for nanoMIPS CPUs (2/5)
Date: Sun, 11 Dec 2022 21:45:29 +0100
Message-Id: <20221211204533.85359-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

Part 2/5: Convert PCI0 MEM0 BAR setup

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 30ca4e0000..3e80a12221 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -687,7 +687,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
      * Load BAR registers as done by YAMON:
      *
      *  - set up PCI0 I/O BARs from 0x18000000 to 0x181fffff
-     *  - set up PCI0 MEM0 at 0x10000000, size 0x8000000
      *
      */
     stw_p(p++, 0xe040); stw_p(p++, 0x0681);
@@ -723,20 +722,6 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0xe020); stw_p(p++, 0x0001);
                                 /* lui t0, %hi(0x80000000)      */
 
-    /* 0x58 corresponds to GT_PCI0M0LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
-                                /* sw t0, 0x58(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x07e0);
-                                /* lui t0, %hi(0x3f000000)      */
-
-    /* 0x60 corresponds to GT_PCI0M0HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
-                                /* sw t0, 0x60(t1)              */
-
-    stw_p(p++, 0xe020); stw_p(p++, 0x0821);
-                                /* lui t0, %hi(0xc1000000)      */
-
 #else
 #define cpu_to_gt32 cpu_to_be32
 
@@ -767,24 +752,16 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
 
     stw_p(p++, 0x0020); stw_p(p++, 0x0080);
                                 /* addiu[32] t0, $0, 0x80       */
-
-    /* 0x58 corresponds to GT_PCI0M0LD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9058);
-                                /* sw t0, 0x58(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x003f);
-                                /* addiu[32] t0, $0, 0x3f       */
-
-    /* 0x60 corresponds to GT_PCI0M0HD                          */
-    stw_p(p++, 0x8422); stw_p(p++, 0x9060);
-                                /* sw t0, 0x60(t1)              */
-
-    stw_p(p++, 0x0020); stw_p(p++, 0x00c1);
-                                /* addiu[32] t0, $0, 0xc1       */
 #endif
     v = p;
 
     /* setup PCI0 mem windows */
+    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
+                     cpu_to_gt32(0x10000000 << 3));
+    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
+                     cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
+                     cpu_to_gt32(0x07e00000 << 3));
     bl_gen_write_u32(&v, /* GT_PCI0M1LD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
                      cpu_to_gt32(0x18200000 << 3));
-- 
2.38.1


