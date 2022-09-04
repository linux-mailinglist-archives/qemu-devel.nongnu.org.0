Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1287E5AC832
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:51:33 +0200 (CEST)
Received: from localhost ([::1]:42362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUzOl-0004IV-FO
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz96-0006nW-Ki; Sun, 04 Sep 2022 19:35:20 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz94-00050N-TK; Sun, 04 Sep 2022 19:35:20 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso18115458fac.1; 
 Sun, 04 Sep 2022 16:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DBvC6gMlxv38oDowLsx39beO0QHSfCd560SFv+bV5CA=;
 b=YwnZZXlfKed31oKHY2dYS4jSecE/S74gS7LhLU5p1vTWdMHx+QxLyMco15pXLuoECv
 vWt/khhl09zuUJCUbQX90bTCJ9Z8yXk2Y9dPYiQY7hgDl3fSXCkjBSXuSplCZhQ/BiKg
 GyGIfae+Nb+k3ZjE5HR+x05NgxG75K1t0woNbVZjwqgeQ55FKuxy31PQanBItF5H8cLg
 ui+EXW2eyZ2peSnrGThYSjIg7Rp/G1tt50kn2HHY5vxhlioOt/JsuwanErJ7FyDeu0ki
 wxIC16Qv/Ftp9Rtg6bKWXw3n9pUZr/zFKwqTw9dISjwdaCD1VcaovZzoA5ButwwiJ9wN
 8kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DBvC6gMlxv38oDowLsx39beO0QHSfCd560SFv+bV5CA=;
 b=azj4dBSIn4PpvLswGX2lKVq3B/dClpgFldTfrsRx+9qN2nOdJ663QG4+9yZJfDpsI2
 pOFzypw0mga2ialG/IQ+SDOvwJY0nDfT9+fHk14lK+64ChyiEjnPkIxbysTnYvtGxXKl
 RI50bBx5O43U4RMbZzN8eIbEQOyNuVtPBmBIwQRHVXMqHH73XE+FrMiy+vWIVOM+mL8y
 o0zVxZRAKDpmr2qXn4Rj3FU1o0lf81l9P/sNmL8Mgl19Ml/9wW2h7Uz/F+VsxzuU5rgr
 X4+5qzL/Bo6rdOJ2iEFfqFNe6VOBnQGRIW42GkWxP4Qf22JjR50dfEDmkDZqdz8N7QkF
 xZSA==
X-Gm-Message-State: ACgBeo0CF8nUgEuN6+LTu09XuUescow45s+uc1ReAD8o2kSf+DEEQsB+
 masK5jpE15oJVKxKmkPKennzIsQtexOT9Q==
X-Google-Smtp-Source: AA6agR4oY5ZcXxLMot0/ya7g/ipZINsEbM2orPmbq2R/EJjoHoNIgs1z8tVXm6k58kyJLxrUf+AAwQ==
X-Received: by 2002:a05:6808:18a6:b0:345:557b:aa7c with SMTP id
 bi38-20020a05680818a600b00345557baa7cmr6678150oib.274.1662334516246; 
 Sun, 04 Sep 2022 16:35:16 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 06/14] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Date: Sun,  4 Sep 2022 20:34:48 -0300
Message-Id: <20220904233456.209027-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
machine.

Setting machine->fdt requires a MachineState pointer to be used inside
sam460ex_load_device_tree(). Let's change the function to receive this
pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
directly from the 'machine' pointer.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/sam460ex.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 850bb3b817..5d09d3c6ab 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -131,13 +131,12 @@ static int sam460ex_load_uboot(void)
     return 0;
 }
 
-static int sam460ex_load_device_tree(hwaddr addr,
-                                     uint32_t ramsize,
+static int sam460ex_load_device_tree(MachineState *machine,
+                                     hwaddr addr,
                                      hwaddr initrd_base,
-                                     hwaddr initrd_size,
-                                     const char *kernel_cmdline)
+                                     hwaddr initrd_size)
 {
-    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
+    uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(machine->ram_size) };
     char *filename;
     int fdt_size;
     void *fdt;
@@ -171,7 +170,8 @@ static int sam460ex_load_device_tree(hwaddr addr,
     qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                           (initrd_base + initrd_size));
 
-    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
+    qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
+                            machine->kernel_cmdline);
 
     /* Copy data from the host device tree into the guest. Since the guest can
      * directly access the timebase without host involvement, we must expose
@@ -208,7 +208,9 @@ static int sam460ex_load_device_tree(hwaddr addr,
                               EBC_FREQ);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
 
     return fdt_size;
 }
@@ -496,9 +498,8 @@ static void sam460ex_init(MachineState *machine)
     if (machine->kernel_filename) {
         int dt_size;
 
-        dt_size = sam460ex_load_device_tree(FDT_ADDR, machine->ram_size,
-                                    RAMDISK_ADDR, initrd_size,
-                                    machine->kernel_cmdline);
+        dt_size = sam460ex_load_device_tree(machine, FDT_ADDR,
+                                            RAMDISK_ADDR, initrd_size);
 
         boot_info->dt_base = FDT_ADDR;
         boot_info->dt_size = dt_size;
-- 
2.37.2


