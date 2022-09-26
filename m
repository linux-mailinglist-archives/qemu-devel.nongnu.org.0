Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E65EB0A9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 21:00:25 +0200 (CEST)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octL6-0007tb-Bh
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 15:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4j-0008DC-6k
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:30 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4h-00027p-Kp
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:24 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so10247841fac.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yf6ffLPC8i9eGCLE6mj5B79jg8nmXu5Z8K8DzV7zV2I=;
 b=O5puEa5Mcf2Kl8IpuaRjpKdHlUVhVu0YrsA627Eyd8mn1of7+qfJMlxPnAftcHbNli
 e/uaqj9p9cDqPhHWtT0lX/91QjybFrOUb5mxnCcLU0muF3iYImEXhtnnpjCJq1NW1uZj
 KaAm35e8KYY29VDpdANuC1ohvSyWecIwTLns6otn8R1HhfMhZZeFQzDKIqyje4y07rWY
 jrd9bJudnZLi/eoWYxSektITIoZstbsVRGrgi5I433hsxRTMO/28XPZFYomvrN48reQV
 Hhzk5hQklQ06TB5oBOUog1h13aMG5+knat8E9R6orOuffuuPVMAQeUzo9pv9kH+S/elb
 SKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yf6ffLPC8i9eGCLE6mj5B79jg8nmXu5Z8K8DzV7zV2I=;
 b=GTr53IvC7pglP5LaoFLspONgYy2cVZaDqz9YvntbviRtu7cc/9joLsNBVnp6zHCcAI
 jZ2BgCwr31B3uKyd1EQaZDPbsB+mxWpABrQMlfiHpU16z2XemMBV3HSRlnu63ODjx1Vm
 ZfJWKhdB5sNL1bHww3bljDEbjp4EdRFjaj0DigTNCXV88L+9K39qh1z/FncV7uZNJFq+
 Awu76fWaMEE85EeDYj46oj0OpkPltcfjDuuyPGwoNq+a9/3kqg2hyIw+BcUgLLVt+RDF
 MqRmkCt4oy4koqnAYLOa8xonL3p0d8SEqJWYWITJJewAsgHysc/wRgujxsrZDwcvqned
 J4/A==
X-Gm-Message-State: ACrzQf2pYj89vsOXfjvB2V6ZDHaQLJHVbAjvr8iMRHKdyKkAmIeIU/bH
 jW/HGg99UKfDl0U1lPyfs/FDIpXFHgo=
X-Google-Smtp-Source: AMsMyM7TM0CbWAeIcLM2yle8TJx6AL3FiGOTzoK7xt8VhKSXlBjGh921/rZXH0gxc4DNP1i8F1SBSQ==
X-Received: by 2002:a05:6870:2382:b0:12d:4848:fbcc with SMTP id
 e2-20020a056870238200b0012d4848fbccmr12908415oap.111.1664213960449; 
 Mon, 26 Sep 2022 10:39:20 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 09/16] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Date: Mon, 26 Sep 2022 14:38:48 -0300
Message-Id: <20220926173855.1159396-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
machine.

Setting machine->fdt requires a MachineState pointer to be used inside
sam460ex_load_device_tree(). Let's change the function to receive this
pointer from the caller. 'ramsize' and 'kernel_cmdline' can be retrieved
directly from the 'machine' pointer.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.37.3


