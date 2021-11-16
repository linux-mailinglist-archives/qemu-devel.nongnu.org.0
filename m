Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613E452D89
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:06:32 +0100 (CET)
Received: from localhost ([::1]:33530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuQB-0002r8-1H
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mmuOk-00024B-C2
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:05:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mmuOe-0006Dn-Jt
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:04:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637053494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ajzFDxNz/9pZNyC/Ks46BJ9nq/43EmfCQtn12N4NRH8=;
 b=eBEjkEh6sd0NorP3CDFbLD/j3dgO8YhrrnlzSICebSGZhWonULd6rX5/eKmHUtnMXwi1Hd
 AwK7yPDczmvbCq30piKr4JwB26un6/n7OOgYzQ1UKhoZoIOppPdyDBqr2GfJhFQqRNVRr2
 8Mhnu+AnNaQe0EEHMLssKvSLDsFhSA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-APU0RVAYN0CAUUWIkCHF4Q-1; Tue, 16 Nov 2021 04:04:53 -0500
X-MC-Unique: APU0RVAYN0CAUUWIkCHF4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ABD0CC65E;
 Tue, 16 Nov 2021 09:04:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D94E7B6CA;
 Tue, 16 Nov 2021 09:04:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 47CFC18007A1; Tue, 16 Nov 2021 10:04:45 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] q35: turn off power_controller_present when acpi hotplug is
 enabled
Date: Tue, 16 Nov 2021 10:04:33 +0100
Message-Id: <20211116090433.3212549-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable power control for pcie slots in case acpi hotplug is enabled
(6.2+ only for compatibility reasons).  This makes sure we don't get
unpleasant surprises with pci devices not being functional due to slot
power being turned off.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/pc_q35.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e1e100316d93..869ca4c130f0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -247,9 +247,16 @@ static void pc_q35_init(MachineState *machine)
                                                  "x-keep-pci-slot-hpc",
                                                  NULL);
 
-    if (!keep_pci_slot_hpc && acpi_pcihp) {
-        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
-                                   "false", true);
+    if (acpi_pcihp) {
+        if (keep_pci_slot_hpc) {
+            /* 6.2+ default: acpi-hotplug=on native-hotplug=on power-ctrl=off */
+            object_register_sugar_prop(TYPE_PCIE_SLOT, COMPAT_PROP_PCP,
+                                       "false", true);
+        } else {
+            /* 6.1 default: acpi-hotplug=on native-hotplug=off */
+            object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
+                                       "false", true);
+        }
     }
 
     /* irq lines */
-- 
2.33.1


