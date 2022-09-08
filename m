Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544CD5B272F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:53:54 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNaz-0007db-Ev
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOa-0004pQ-67; Thu, 08 Sep 2022 15:41:04 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOY-0007CS-JP; Thu, 08 Sep 2022 15:41:03 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 t8-20020a9d5908000000b0063b41908168so13024095oth.8; 
 Thu, 08 Sep 2022 12:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=x+yzFneJkuBjx/cE5luVruTYbhLKWulRKwv297h+toI=;
 b=Dgap6oz6dJ+zwVtBwI9BHTp57NelNY6JCto3y9WPYil2dCCRKzomWDeoKHdOO1z+mX
 zQ7HLmGoQs6fDN0VU33kfX4pKdbnq0VuHKcPdbw7g46wDWh1pmxSChIJLbdGMlYNTVFN
 HhxWyt3fBS0WguNDPhpgeW5sxucwPx1SXgGG8LKnkudbWilRsnpdYNGVuCq1DBknWGRh
 s2uKXtKWTwhxwt8a/Xl1NB0KQVkf66HyE+KcleQmZnf+84FY2C8kOmi25mLBL6gHhNnl
 4tDqMuYMFxSAdj3m0Nw8tyMEBajhhp4AlFN+nGp4dST7OeLcL2s7zgxFQb7ytFGOuCPW
 GAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x+yzFneJkuBjx/cE5luVruTYbhLKWulRKwv297h+toI=;
 b=1fR55QAjVtVxqk8yVHkAXuKIiqlDZx+4t52W7xPazUFQxnQ9Av6IvfD9paoWO89lFk
 G6q1UEKDeT/KQJCc8lF0OXfSR2VAaKq6ruAHWVcz/8WDuFWOlNUV23obK29pUxGCL5ub
 IFGJVa2rRNVDn3rSRJ4AyZMnonXt+J7swGWmAbFyoAFvVwu3duDbqT7i+kYbWNbBsrfx
 crOt9H1j2TAGMs6oE7S1WXNCSjNyYkt7+cLM5At2POAgpKN1DajEL8EdWA4YkOQYscKd
 eiL6IilEaK9LSk7ewM/De/6rNdgx2pfO/xjLS/BbSY7K42lPF89vgKJ1CbL3MSUblz6P
 I1hA==
X-Gm-Message-State: ACgBeo0UrfXWCN0jD+JOQCs3J6If2m24cQ6xVupkp681LOh6MwmANV/V
 Q0Qa2kPKecXxjw+poCiYBL0z59G9ZTNeQw==
X-Google-Smtp-Source: AA6agR5N8rUdYG7MV2SaGAwhuE1RRbz7hlNEZbpYbR9WWwktXEMgmCDmb011DBPDH8OHkGMX/rNTWQ==
X-Received: by 2002:a05:6830:d81:b0:616:c424:6f22 with SMTP id
 bv1-20020a0568300d8100b00616c4246f22mr4067323otb.77.1662666060991; 
 Thu, 08 Sep 2022 12:41:00 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:41:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v7 06/14] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Date: Thu,  8 Sep 2022 16:40:32 -0300
Message-Id: <20220908194040.518400-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32a.google.com
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
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
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


