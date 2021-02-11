Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406AE318EF9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:44:18 +0100 (CET)
Received: from localhost ([::1]:40942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAE8f-00036Q-81
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1lAE2U-0000Ax-By
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:37:55 -0500
Received: from 13thmonkey.org ([80.100.255.32]:59044
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1lAE2R-0002P6-LV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:37:53 -0500
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id 5E111C1E998; Thu, 11 Feb 2021 16:37:46 +0100 (CET)
Date: Thu, 11 Feb 2021 16:37:46 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: qemu-devel@nongnu.org
Subject: RFC Qemu mipssim patches
Message-ID: <20210211153746.GA25676@dropje.13thmonkey.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
Received-SPF: pass client-ip=80.100.255.32;
 envelope-from=reinoud@13thmonkey.org; helo=dropje.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

i'd like to get the following simple patches to the MIPS/mipssim target adding
virtio-mmio devices to it. This makes the target a lot more usefull as microvm
for kernel developement. It currently lives in our qemu extensions patches and
we have a working kernel that supports all virtio devices for it.

Thoughts?

Reinoud Zandijk, NetBSD developer


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-hw-mips-Kconfig

$NetBSD$

--- hw/mips/Kconfig.orig	2020-08-11 19:17:15.000000000 +0000
+++ hw/mips/Kconfig
@@ -20,6 +20,7 @@ config MIPSSIM
     select ISA_BUS
     select SERIAL_ISA
     select MIPSNET
+    select VIRTIO_MMIO
 
 config JAZZ
     bool

--nFreZHaLTZJo0R7j
Content-Type: text/x-c; charset=us-ascii
Content-Disposition: attachment; filename="patch-hw-mips-mipssim.c"

$NetBSD$

--- hw/mips/mipssim.c.orig	2020-08-11 19:17:15.000000000 +0000
+++ hw/mips/mipssim.c
@@ -45,6 +45,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "hw/virtio/virtio-mmio.h"
 
 static struct _loaderparams {
     int ram_size;
@@ -229,6 +230,16 @@ mips_mipssim_init(MachineState *machine)
     if (nd_table[0].used)
         /* MIPSnet uses the MIPS CPU INT0, which is interrupt 2. */
         mipsnet_init(0x4200, env->irq[2], &nd_table[0]);
+
+    /*
+     * virtio extention; register 32 virtio devices just after the ISA space
+     * at 0x1fd10000 with strave of 512 bytes as per i386s microvm target.
+     */
+    for (int i = 0; i < 32; i++) {
+        sysbus_create_simple("virtio-mmio",
+            0x1fd10000 + i * 512,
+            env->irq[3]);
+    }
 }
 
 static void mips_mipssim_machine_init(MachineClass *mc)

--nFreZHaLTZJo0R7j--

