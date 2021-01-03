Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C42E8E56
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:15:42 +0100 (CET)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAiz-0005vn-LA
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:15:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMt-0004mo-Md
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMs-0006Qj-1U
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:51 -0500
Received: by mail-wm1-x335.google.com with SMTP id 3so16645247wmg.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWpdd3Sx/wi+ql4s1airvlB9dKRon6b7AVg1n0LZsBA=;
 b=V94SLe2TgTDEnHDWM8BQr9oLweaINyB8a/PCHB6rt9HpyPBty+Q1lqx4NPt610sZmU
 1/QKnrHE6Rr021p5i29XOznzsOTiM0s/SV87DICCvhTmgdZUb4ha2UiTJYimSmNXEUt5
 YBzl99tmYJJlz06fescljQ2zOlxShxh+c3X8EX0Sjlrl6ccaWmsoH4hcqBKLR4Yo2Tha
 AbAKNORB7vK8vMryfmiZD6BhX/YNXxXfM3UgivciHsNqRcvabT//vkhPXCgvKt5GVQeE
 8hArvBRjgmbhJknzMTK0UMGJmsQKJqhaJ1Hvirt5yQp3d25qgA8X6Gz9C1ZxrmSRTdkl
 RmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uWpdd3Sx/wi+ql4s1airvlB9dKRon6b7AVg1n0LZsBA=;
 b=n5aRa/CHHKyJIshwI6NbtOo6QbnyZkRuG4Rr+wCqRgHYDjYzHhTehJl/f4bNRFMgTT
 2RnIYaULoUhEId/818TqEfZcADam0ls4t6jHIHVfkOMKsFoZWvk+tGg0mVjVyLSUpsQt
 4AeDl/XAjHzihnwGDiAz4KP768di2phpKY0KRbSjsA/GtJdkSW3JuIg3ElP6X/oiZwtv
 FL0yJMJo2IFdI/wxTLHNOVzG1AJ9FgZ/UzGk95XPANH+LwLL8e9moYbvy6VvIHxsLI6f
 se7XJAKF1bp5QisWwACnpTc6s515XSMJcWCZ1V2PLMmZ4pXdq+sPiXO12yR9F/ld5kiA
 yhLA==
X-Gm-Message-State: AOAM530KcSPXmWztXchQdNwwRsWQD6dUAiGZbRSEYIfDdbNENKsyLxaS
 FSD9JWR2WeRm2Erld3JmUuvt/oh2CTY=
X-Google-Smtp-Source: ABdhPJy+iu3U7Oxma+ZQY3heHkU3cAmrIoP8Hvo2T1xWAsTNYYRXoahEtAaNLWwz3cDxcgOuJuJ5yw==
X-Received: by 2002:a1c:e902:: with SMTP id q2mr23830505wmc.143.1609707168596; 
 Sun, 03 Jan 2021 12:52:48 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id a14sm85457898wrn.3.2021.01.03.12.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/35] hw/mips: Use address translation helper to handle
 ENVP_ADDR
Date: Sun,  3 Jan 2021 21:50:16 +0100
Message-Id: <20210103205021.2837760-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

It will signed extend vaddr properly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215064200.28751-4-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 24 +++++++++---------
 hw/mips/malta.c     | 62 ++++++++++++++++++++++-----------------------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 804bef94cda..8bc854130ed 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -49,7 +49,8 @@
 
 #define DEBUG_FULOONG2E_INIT
 
-#define ENVP_ADDR               0x80002000l
+#define ENVP_PADDR              0x2000
+#define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
 #define ENVP_NB_ENTRIES         16
 #define ENVP_ENTRY_SIZE         256
 
@@ -100,7 +101,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     }
 
     table_addr = sizeof(int32_t) * ENVP_NB_ENTRIES + index * ENVP_ENTRY_SIZE;
-    prom_buf[index] = tswap32(ENVP_ADDR + table_addr);
+    prom_buf[index] = tswap32(ENVP_VADDR + table_addr);
 
     va_start(ap, string);
     vsnprintf((char *)prom_buf + table_addr, ENVP_ENTRY_SIZE, string, ap);
@@ -172,8 +173,7 @@ static uint64_t load_kernel(CPUMIPSState *env)
     prom_set(prom_buf, index++, "modetty0=38400n8r");
     prom_set(prom_buf, index++, NULL);
 
-    rom_add_blob_fixed("prom", prom_buf, prom_size,
-                       cpu_mips_kseg0_to_phys(NULL, ENVP_ADDR));
+    rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
 
     g_free(prom_buf);
     return kernel_entry;
@@ -199,14 +199,14 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     stl_p(p++, 0x3c040000);
     /* ori a0, a0, 2 */
     stl_p(p++, 0x34840002);
-    /* lui a1, high(ENVP_ADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_ADDR >> 16) & 0xffff));
-    /* ori a1, a0, low(ENVP_ADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_ADDR & 0xffff));
-    /* lui a2, high(ENVP_ADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_ADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_ADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_ADDR + 8) & 0xffff));
+    /* lui a1, high(ENVP_VADDR) */
+    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
+    /* ori a1, a0, low(ENVP_VADDR) */
+    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
+    /* lui a2, high(ENVP_VADDR + 8) */
+    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
+    /* ori a2, a2, low(ENVP_VADDR + 8) */
+    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
     /* lui a3, high(env->ram_size) */
     stl_p(p++, 0x3c070000 | (loaderparams.ram_size >> 16));
     /* ori a3, a3, low(env->ram_size) */
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 1fbb8a32207..9afc0b427bf 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -62,7 +62,8 @@
 #include "hw/mips/cps.h"
 #include "hw/qdev-clock.h"
 
-#define ENVP_ADDR           0x80002000l
+#define ENVP_PADDR          0x2000
+#define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
 #define ENVP_NB_ENTRIES     16
 #define ENVP_ENTRY_SIZE     256
 
@@ -656,29 +657,29 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
                                 /* li a0,2                      */
     }
 
-    stw_p(p++, 0xe3a0 | NM_HI1(ENVP_ADDR - 64));
+    stw_p(p++, 0xe3a0 | NM_HI1(ENVP_VADDR - 64));
 
-    stw_p(p++, NM_HI2(ENVP_ADDR - 64));
-                                /* lui sp,%hi(ENVP_ADDR - 64)   */
+    stw_p(p++, NM_HI2(ENVP_VADDR - 64));
+                                /* lui sp,%hi(ENVP_VADDR - 64)   */
 
-    stw_p(p++, 0x83bd); stw_p(p++, NM_LO(ENVP_ADDR - 64));
-                                /* ori sp,sp,%lo(ENVP_ADDR - 64) */
+    stw_p(p++, 0x83bd); stw_p(p++, NM_LO(ENVP_VADDR - 64));
+                                /* ori sp,sp,%lo(ENVP_VADDR - 64) */
 
-    stw_p(p++, 0xe0a0 | NM_HI1(ENVP_ADDR));
+    stw_p(p++, 0xe0a0 | NM_HI1(ENVP_VADDR));
 
-    stw_p(p++, NM_HI2(ENVP_ADDR));
-                                /* lui a1,%hi(ENVP_ADDR)        */
+    stw_p(p++, NM_HI2(ENVP_VADDR));
+                                /* lui a1,%hi(ENVP_VADDR)        */
 
-    stw_p(p++, 0x80a5); stw_p(p++, NM_LO(ENVP_ADDR));
-                                /* ori a1,a1,%lo(ENVP_ADDR)     */
+    stw_p(p++, 0x80a5); stw_p(p++, NM_LO(ENVP_VADDR));
+                                /* ori a1,a1,%lo(ENVP_VADDR)     */
 
-    stw_p(p++, 0xe0c0 | NM_HI1(ENVP_ADDR + 8));
+    stw_p(p++, 0xe0c0 | NM_HI1(ENVP_VADDR + 8));
 
-    stw_p(p++, NM_HI2(ENVP_ADDR + 8));
-                                /* lui a2,%hi(ENVP_ADDR + 8)    */
+    stw_p(p++, NM_HI2(ENVP_VADDR + 8));
+                                /* lui a2,%hi(ENVP_VADDR + 8)    */
 
-    stw_p(p++, 0x80c6); stw_p(p++, NM_LO(ENVP_ADDR + 8));
-                                /* ori a2,a2,%lo(ENVP_ADDR + 8) */
+    stw_p(p++, 0x80c6); stw_p(p++, NM_LO(ENVP_VADDR + 8));
+                                /* ori a2,a2,%lo(ENVP_VADDR + 8) */
 
     stw_p(p++, 0xe0e0 | NM_HI1(loaderparams.ram_low_size));
 
@@ -878,18 +879,18 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
         stl_p(p++, 0x24040002);              /* addiu a0, zero, 2 */
     }
 
-    /* lui sp, high(ENVP_ADDR) */
-    stl_p(p++, 0x3c1d0000 | (((ENVP_ADDR - 64) >> 16) & 0xffff));
-    /* ori sp, sp, low(ENVP_ADDR) */
-    stl_p(p++, 0x37bd0000 | ((ENVP_ADDR - 64) & 0xffff));
-    /* lui a1, high(ENVP_ADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_ADDR >> 16) & 0xffff));
-    /* ori a1, a1, low(ENVP_ADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_ADDR & 0xffff));
-    /* lui a2, high(ENVP_ADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_ADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_ADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_ADDR + 8) & 0xffff));
+    /* lui sp, high(ENVP_VADDR) */
+    stl_p(p++, 0x3c1d0000 | (((ENVP_VADDR - 64) >> 16) & 0xffff));
+    /* ori sp, sp, low(ENVP_VADDR) */
+    stl_p(p++, 0x37bd0000 | ((ENVP_VADDR - 64) & 0xffff));
+    /* lui a1, high(ENVP_VADDR) */
+    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
+    /* ori a1, a1, low(ENVP_VADDR) */
+    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
+    /* lui a2, high(ENVP_VADDR + 8) */
+    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
+    /* ori a2, a2, low(ENVP_VADDR + 8) */
+    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
     /* lui a3, high(ram_low_size) */
     stl_p(p++, 0x3c070000 | (loaderparams.ram_low_size >> 16));
     /* ori a3, a3, low(ram_low_size) */
@@ -1015,7 +1016,7 @@ static void GCC_FMT_ATTR(3, 4) prom_set(uint32_t *prom_buf, int index,
     }
 
     table_addr = sizeof(uint32_t) * ENVP_NB_ENTRIES + index * ENVP_ENTRY_SIZE;
-    prom_buf[index] = tswap32(ENVP_ADDR + table_addr);
+    prom_buf[index] = tswap32(ENVP_VADDR + table_addr);
 
     va_start(ap, string);
     vsnprintf((char *)prom_buf + table_addr, ENVP_ENTRY_SIZE, string, ap);
@@ -1122,8 +1123,7 @@ static uint64_t load_kernel(void)
     prom_set(prom_buf, prom_index++, "38400n8r");
     prom_set(prom_buf, prom_index++, NULL);
 
-    rom_add_blob_fixed("prom", prom_buf, prom_size,
-                       cpu_mips_kseg0_to_phys(NULL, ENVP_ADDR));
+    rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
 
     g_free(prom_buf);
     return kernel_entry;
-- 
2.26.2


