Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A052D315F83
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:34:14 +0100 (CET)
Received: from localhost ([::1]:50648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9j4n-00037I-FD
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipW-0002Mq-6u; Wed, 10 Feb 2021 01:18:26 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41221 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ipS-0000Qw-D6; Wed, 10 Feb 2021 01:18:24 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gp4pFjz9sWT; Wed, 10 Feb 2021 17:17:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937862;
 bh=Cr8LHwMdzb7wCN4crSb9SDT6HTZRvDC2lvwVU/PSrTw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JZkSIBDpLBXWEP0HmJrEtzEe7/48lwy4xJoEwx0k7jozC7L3QU9a8Z/FrqnIfHREL
 qB3l7Mu0N4I6dXKkHheuEnQ/zAoPEBDrfz/K06F6OOuXuSgbk9wSuSmOVx7ZYKmJdP
 iXLFDI3FLMinBiNWnm6bTTAA9310w3qr9I+SyCEw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 15/19] ppc/pnv: Set default RAM size to 1 GB
Date: Wed, 10 Feb 2021 17:17:31 +1100
Message-Id: <20210210061735.304384-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

The memory layout of the PowerNV machine is defined as :

  #define KERNEL_LOAD_BASE	((void *)0x20000000)
  #define KERNEL_LOAD_SIZE	0x08000000

  #define INITRAMFS_LOAD_BASE	KERNEL_LOAD_BASE + KERNEL_LOAD_SIZE
  #define INITRAMFS_LOAD_SIZE	0x08000000

  #define SKIBOOT_BASE		0x30000000
  #define SKIBOOT_SIZE		0x01c10000

  #define CPU_STACKS_BASE	(SKIBOOT_BASE + SKIBOOT_SIZE)
  #define STACK_SHIFT		15
  #define STACK_SIZE		(1 << STACK_SHIFT)

The overall size of the CPU stacks is (max PIR + 1) * 32K and the
machine easily reaches 800MB of minimum required RAM.

Any value below will result in a skiboot crash :

    [    0.034949905,3] MEM: Partial overlap detected between regions:
    [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] (new)
    [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x38400000]
    [    0.034980367,3] Out of memory adding skiboot reserved areas
    [    0.035074945,3] ***********************************************
    [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
    [    0.035104247,3]     .
    [    0.035108025,3]      .
    [    0.035111651,3]       .
    [    0.035115231,3]         OO__)
    [    0.035119198,3]        <"__/
    [    0.035122980,3]         ^ ^

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210129111719.790692-1-clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/pnv.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 50810df838..77af846cdf 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -21,6 +21,7 @@
 #include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "sysemu/qtest.h"
 #include "sysemu/sysemu.h"
@@ -725,8 +726,11 @@ static void pnv_init(MachineState *machine)
     DeviceState *dev;
 
     /* allocate RAM */
-    if (machine->ram_size < (1 * GiB)) {
-        warn_report("skiboot may not work with < 1GB of RAM");
+    if (machine->ram_size < mc->default_ram_size) {
+        char *sz = size_to_str(mc->default_ram_size);
+        error_report("Invalid RAM size, should be bigger than %s", sz);
+        g_free(sz);
+        exit(EXIT_FAILURE);
     }
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
@@ -1994,7 +1998,7 @@ static void pnv_machine_class_init(ObjectClass *oc, void *data)
      * RAM defaults to less than 2048 for 32-bit hosts, and large
      * enough to fit the maximum initrd size at it's load address
      */
-    mc->default_ram_size = INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
+    mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "pnv.ram";
     ispc->print_info = pnv_pic_print_info;
     nc->nmi_monitor_handler = pnv_nmi;
-- 
2.29.2


