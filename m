Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE1B320AF2
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:37:38 +0100 (CET)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDprd-0007cb-IW
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpp9-0005xY-2Y
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:03 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpp7-0002SU-D1
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b3so16333207wrj.5
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7DRDKNSGD/us0voOP/ZXhoAB8cYrh0GTxFyBXftfzA=;
 b=gYXRzm9ifE5MCFmSHKQv+YdOWBkUbXId13Qv4h+XFvkCxtnxOFnQC5RLcL1BF8LIr4
 TbfnAbBFAEHWbbyFP3jnFo6oIoyw08W/iuLBr8qZiCesIGJoCcPOKIHrQLqc+mz+6urr
 GyVlwv/MfdiAIobNy6g0lD6HxBjrSeDy7xemDu/gveoGtg2RKTTuW0fjame23bqf8Vfa
 eqIoJlSJfIsL5w7k2XyNR//IEV4OKQCKyH2/UGwJ4t4xnRHo/KJ8AFZPvvdM6j5uP2t6
 AytoqcAbYqWZApjHU7orx/wpPxFLcUVAEf1tOLUHIaoHRYmgsBtjDVD3hnwH0YFvC8Mt
 H++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E7DRDKNSGD/us0voOP/ZXhoAB8cYrh0GTxFyBXftfzA=;
 b=fNPFc93ZWZln9zbY3souUVMNwClcrMNgqgfnPbjCabP1K5g8DOw67BAxImfEAuRRgt
 0XTkyNi+BSAB2iUKONIwJqg1PzYBdlBZdtWZDQGzi0QuwSdvu1WaCBgA334gw0cklvBG
 8Id2hwE5LZgjTXO0QGLzMDcFDCVr/ks0BTw5GhGvkU9OFeXEL3I/i7zNFyNNrGAC151x
 LLG+Dwe1UHmZ7dYtQojlFOfvTvQXmaa0mFas7utd/7zVOz27iXPJckJDqHjbtu9Ex6iN
 kd0W8rSqD8sl3IVReaflWSOmIpCdWVgwzXi8tCdwQjOdzgwemMMAP4UO+M7OmW5OKHF7
 GQMg==
X-Gm-Message-State: AOAM530fhrWaB22RjjFEUTwLv24G+KT/IY51LFpm/MSEzSXXAs84Dsq6
 OkAchHs/hK1U7P/dM9Eq7quxLJvFRIY=
X-Google-Smtp-Source: ABdhPJxSQHyAnnXpLwCMkR/TqXUkC1R7w4cSjBKXySLeOckkCOHYnHEAEkzojdIYGHTn2mhzcmEnOQ==
X-Received: by 2002:adf:fb03:: with SMTP id c3mr17801908wrr.395.1613918099828; 
 Sun, 21 Feb 2021 06:34:59 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q15sm25794695wrr.58.2021.02.21.06.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:34:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/43] hw/mips/boston: Use bootloader helper to set GCRs
Date: Sun, 21 Feb 2021 15:33:54 +0100
Message-Id: <20210221143432.2468220-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Translate embedded assembly into IO writes which is more
readable.

Also hardcode cm_base at boot time instead of reading from CP0.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210127065424.114125-5-jiaxun.yang@flygoat.com>
[PMD: Kept code comments]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/boston.c | 45 +++++++++++----------------------------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index b976c8199a1..ac2e93a05aa 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -274,48 +274,26 @@ static void boston_register_types(void)
 }
 type_init(boston_register_types)
 
-static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr,
-                         bool is_64b)
+static void gen_firmware(uint32_t *p, hwaddr kernel_entry, hwaddr fdt_addr)
 {
     const uint32_t cm_base = 0x16100000;
     const uint32_t gic_base = 0x16120000;
     const uint32_t cpc_base = 0x16200000;
 
     /* Move CM GCRs */
-    if (is_64b) {
-        stl_p(p++, 0x40287803);                 /* dmfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084138);                 /* dsll $8, $8, 4 */
-    } else {
-        stl_p(p++, 0x40087803);                 /* mfc0 $8, CMGCRBase */
-        stl_p(p++, 0x00084100);                 /* sll  $8, $8, 4 */
-    }
-    stl_p(p++, 0x3c09a000);                     /* lui  $9, 0xa000 */
-    stl_p(p++, 0x01094025);                     /* or   $8, $9 */
-    stl_p(p++, 0x3c0a0000 | (cm_base >> 16));   /* lui  $10, cm_base >> 16 */
-    if (is_64b) {
-        stl_p(p++, 0xfd0a0008);                 /* sd   $10, 0x8($8) */
-    } else {
-        stl_p(p++, 0xad0a0008);                 /* sw   $10, 0x8($8) */
-    }
-    stl_p(p++, 0x012a4025);                     /* or   $8, $10 */
+    bl_gen_write_ulong(&p,
+                       cpu_mips_phys_to_kseg1(NULL, GCR_BASE_ADDR + GCR_BASE_OFS),
+                       cm_base);
 
     /* Move & enable GIC GCRs */
-    stl_p(p++, 0x3c090000 | (gic_base >> 16));  /* lui  $9, gic_base >> 16 */
-    stl_p(p++, 0x35290001);                     /* ori  $9, 0x1 */
-    if (is_64b) {
-        stl_p(p++, 0xfd090080);                 /* sd   $9, 0x80($8) */
-    } else {
-        stl_p(p++, 0xad090080);                 /* sw   $9, 0x80($8) */
-    }
+    bl_gen_write_ulong(&p,
+                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_GIC_BASE_OFS),
+                       gic_base | GCR_GIC_BASE_GICEN_MSK);
 
     /* Move & enable CPC GCRs */
-    stl_p(p++, 0x3c090000 | (cpc_base >> 16));  /* lui  $9, cpc_base >> 16 */
-    stl_p(p++, 0x35290001);                     /* ori  $9, 0x1 */
-    if (is_64b) {
-        stl_p(p++, 0xfd090088);                 /* sd   $9, 0x88($8) */
-    } else {
-        stl_p(p++, 0xad090088);                 /* sw   $9, 0x88($8) */
-    }
+    bl_gen_write_ulong(&p,
+                       cpu_mips_phys_to_kseg1(NULL, cm_base + GCR_CPC_BASE_OFS),
+                       cpc_base | GCR_CPC_BASE_CPCEN_MSK);
 
     /*
      * Setup argument registers to follow the UHI boot protocol:
@@ -529,8 +507,7 @@ static void boston_mach_init(MachineState *machine)
         }
 
         gen_firmware(memory_region_get_ram_ptr(flash) + 0x7c00000,
-                     s->kernel_entry, s->fdt_base,
-                     cpu_type_is_64bit(machine->cpu_type));
+                     s->kernel_entry, s->fdt_base);
     } else if (!qtest_enabled()) {
         error_report("Please provide either a -kernel or -bios argument");
         exit(1);
-- 
2.26.2


