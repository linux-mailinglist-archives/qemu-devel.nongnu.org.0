Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E226185113
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 22:25:42 +0100 (CET)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCroL-0003AV-2w
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 17:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlw-0007hN-Fh
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jCrlv-0000IL-2v
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 17:23:12 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57651)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jCrlr-0008Ud-Fl; Fri, 13 Mar 2020 17:23:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 03ECA747E1C;
 Fri, 13 Mar 2020 22:23:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 778B0747E14; Fri, 13 Mar 2020 22:23:05 +0100 (CET)
Message-Id: <7679b82b4f26fdb16f00c3b130f8e6a807724f73.1584134074.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1584134074.git.balaton@eik.bme.hu>
References: <cover.1584134074.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/8] hw/ide: Remove now unneded #include "hw/pci/pci.h" from
 hw/ide.h
Date: Fri, 13 Mar 2020 22:14:34 +0100
To: qemu-devel@nongnu.org,
    qemu-block@nongnu.org
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, hpoussin@reactos.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After previous patches we don't need hw/pci/pci.h any more in
hw/ide.h. Some files depended on implicit inclusion by this header
which are also fixed up here.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/ahci_internal.h        | 1 +
 include/hw/ide.h              | 1 -
 include/hw/ide/pci.h          | 1 +
 include/hw/misc/macio/macio.h | 1 +
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 73424516da..bab0459774 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -27,6 +27,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/ide/internal.h"
 #include "hw/sysbus.h"
+#include "hw/pci/pci.h"
 
 #define AHCI_MEM_BAR_SIZE         0x1000
 #define AHCI_MAX_PORTS            32
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 21bd8f23f1..d52c211f32 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -2,7 +2,6 @@
 #define HW_IDE_H
 
 #include "hw/isa/isa.h"
-#include "hw/pci/pci.h"
 #include "exec/memory.h"
 
 #define MAX_IDE_DEVS	2
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index a9f2c33e68..98ffa7dfcd 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -2,6 +2,7 @@
 #define HW_IDE_PCI_H
 
 #include "hw/ide/internal.h"
+#include "hw/pci/pci.h"
 
 #define BM_STATUS_DMAING 0x01
 #define BM_STATUS_ERROR  0x02
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 070a694eb5..87335a991c 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -27,6 +27,7 @@
 #define MACIO_H
 
 #include "hw/char/escc.h"
+#include "hw/pci/pci.h"
 #include "hw/ide/internal.h"
 #include "hw/intc/heathrow_pic.h"
 #include "hw/misc/macio/cuda.h"
-- 
2.21.1


