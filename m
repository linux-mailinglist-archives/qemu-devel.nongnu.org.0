Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCE3165779
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 07:20:29 +0100 (CET)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4fCG-00057Q-MW
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 01:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1j4f8z-0000Gy-47
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 01:17:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1j4f8y-0005FI-6h
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 01:17:05 -0500
Received: from [107.174.27.60] (port=52622 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1j4f8y-0005FA-1Y; Thu, 20 Feb 2020 01:17:04 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id EDF16AE8056B;
 Thu, 20 Feb 2020 01:14:59 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu v7 2/5] spapr/spapr: Make vty_getchars public
Date: Thu, 20 Feb 2020 17:16:19 +1100
Message-Id: <20200220061622.15064-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220061622.15064-1-aik@ozlabs.ru>
References: <20200220061622.15064-1-aik@ozlabs.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A serial device fetches the data from the chardev backend as soon as
input happens and stores it in its internal device specific buffer, every
char device implements it again. Since there is no unified interface to
read such buffer, we will have to read characters directly from
VIO_SPAPR_VTY_DEVICE. The OF client is going to need this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/hw/ppc/spapr_vio.h | 1 +
 hw/char/spapr_vty.c        | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index bed7df60e35c..77e9b73bdfe0 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -130,6 +130,7 @@ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq);
 
 SpaprVioDevice *vty_lookup(SpaprMachineState *spapr, target_ulong reg);
 void vty_putchars(SpaprVioDevice *sdev, uint8_t *buf, int len);
+int vty_getchars(SpaprVioDevice *sdev, uint8_t *buf, int max);
 void spapr_vty_create(SpaprVioBus *bus, Chardev *chardev);
 void spapr_vlan_create(SpaprVioBus *bus, NICInfo *nd);
 void spapr_vscsi_create(SpaprVioBus *bus);
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index ecb94f5673ca..1c00da75b4f1 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -52,7 +52,7 @@ static void vty_receive(void *opaque, const uint8_t *buf, int size)
     }
 }
 
-static int vty_getchars(SpaprVioDevice *sdev, uint8_t *buf, int max)
+int vty_getchars(SpaprVioDevice *sdev, uint8_t *buf, int max)
 {
     SpaprVioVty *dev = VIO_SPAPR_VTY_DEVICE(sdev);
     int n = 0;
-- 
2.17.1


