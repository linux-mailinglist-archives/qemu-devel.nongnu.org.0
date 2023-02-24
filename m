Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6376A1ECF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:44:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9X-0003rZ-7x; Fri, 24 Feb 2023 10:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9R-0003oC-LA
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9Q-00077L-5c
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w7Gn5xfjBfcLqVNvhb23Nz3jjfjUWW5kvv+MKR2ez5w=;
 b=aBN1oCtSibEq59eZw9yxe+xhRWRofyoitzgS3Q3chPxV3fI8eW8mHzDSIZG48Mwzt0tsot
 521EsHHoZ49qh3JtCQs5CkZThUi2Y5b1+/NjsRyJSuA2+7zu88NBHmz5E3y8jUPYWjPIbk
 IRkhXfCYdqtdcCX/CKF1pXLAvZ4bSug=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-MeNdlS4cPmaZa40dZ_8AAA-1; Fri, 24 Feb 2023 10:38:22 -0500
X-MC-Unique: MeNdlS4cPmaZa40dZ_8AAA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAB7F18E0A60;
 Fri, 24 Feb 2023 15:38:21 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B959492B12;
 Fri, 24 Feb 2023 15:38:20 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 08/33] x86: pcihp: fix missing bridge AML when intermediate
 root-port has 'hotplug=off' set
Date: Fri, 24 Feb 2023 16:37:47 +0100
Message-Id: <20230224153812.4176226-9-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

(I practice [1] hasn't broke anything since on hardware side we unset
hotplug_handler on such intermediate port => hotplug behind it has
never worked)

When deciding if bridge should be described, the original
condition was

  cold_plugged_bridge && pcihp_bridge_en

which was replaced [1] by

  bridge has ACPI_PCIHP_PROP_BSEL

the later however is not the same thing as the original
and flips to false if intermediate bridge has hotplug
turned off (root-port with 'hotplug=off' option).

Since we already in build_pci_bridge_aml(), the question
if it's bridge is answered. Use DeviceState::hotplugged
to make decision if bridge should describe its slots.

What's left out is pcihp_bridge_en, which tells us if
ACPI bridge hotplug is enabled.

With hotplug and non hotplug part now being mostly
separated, omitting this check will only lead to
colplugged bridges describe occupied slots in case
when ACPI bridge hotplug is disabled.
Which makes behavior consistent with occupied slots
on hostbridge.

Ex (pc/DSDT.hpbrroot diff):
  ...
               Device (S20)
               {
                   Name (_ADR, 0x00040000)  // _ADR: Address
  +                Device (S08)
  +                {
  +                    Name (_ADR, 0x00010000)  // _ADR: Address
  +                }
  +
  +                Device (S10)
  +                {
  +                    Name (_ADR, 0x00020000)  // _ADR: Address
  +                }
               }
  ...

PS:
testing shows that above doesn't affect adversely guest OS
behavior: i.e. if ACPI bridge hotplug is enabled it's
expected behaviour, and with ACPI bridge hotplug is disabled
(a.k. native hotplug), it doesn't break slot enumeration
nor native hotplug. (tested with RHEL9.0 and WS2022).

1)
Fixes: 6c36ec46b0d ("pcihp: make bridge describe itself using AcpiDevAmlIfClass:build_dev_aml")
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/pci-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
index 5f3ee5157f..4fbf6da6ad 100644
--- a/hw/acpi/pci-bridge.c
+++ b/hw/acpi/pci-bridge.c
@@ -21,7 +21,7 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     PCIBridge *br = PCI_BRIDGE(adev);
 
-    if (object_property_find(OBJECT(&br->sec_bus), ACPI_PCIHP_PROP_BSEL)) {
+    if (!DEVICE(br)->hotplugged) {
         build_append_pci_bus_devices(scope, pci_bridge_get_sec_bus(br));
     }
 }
-- 
2.39.1


