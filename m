Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23F448014
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 14:11:38 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk4Qz-00086o-3V
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 08:11:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mk4P7-0006f9-AX
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:09:41 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:11355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mk4P3-0006kv-W2
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 08:09:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 77131748F54;
 Mon,  8 Nov 2021 14:09:34 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 59B48748F52; Mon,  8 Nov 2021 14:09:34 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] hw/acpi: Set memory regions to native endian as a work around
Date: Mon, 08 Nov 2021 14:05:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Message-Id: <20211108130934.59B48748F52@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using ACPI on big endian machine (such as ppc/pegasos2 which has
a VT8231 south bridge with ACPI) writes to ACPI registers come out
byte swapped. This may be caused by a bug in memory subsystem but
until that is fixed setting the ACPI memory regions to native endian
makes it usable for big endian machines. This fixes ACPI shutdown with
pegasos2 when using the board firmware for now.
This could be reverted when the memory layer is fixed.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/acpi/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 1e004d0078..543e4a7875 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -461,7 +461,7 @@ static const MemoryRegionOps acpi_pm_evt_ops = {
     .impl.min_access_size = 2,
     .valid.min_access_size = 1,
     .valid.max_access_size = 2,
-    .endianness = DEVICE_LITTLE_ENDIAN,
+    .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
 void acpi_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
@@ -531,7 +531,7 @@ static const MemoryRegionOps acpi_pm_tmr_ops = {
     .impl.min_access_size = 4,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
-    .endianness = DEVICE_LITTLE_ENDIAN,
+    .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
 void acpi_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
@@ -608,7 +608,7 @@ static const MemoryRegionOps acpi_pm_cnt_ops = {
     .impl.min_access_size = 2,
     .valid.min_access_size = 1,
     .valid.max_access_size = 2,
-    .endianness = DEVICE_LITTLE_ENDIAN,
+    .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
 void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
-- 
2.30.2


