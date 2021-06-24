Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1227D3B381D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 22:46:40 +0200 (CEST)
Received: from localhost ([::1]:51476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwWFD-0006tl-3O
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 16:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwWBa-0004du-E4
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwWBW-0003ii-TS
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 16:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624567370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26HBD3iCCru87G19JRj6aTIMsEPibsJPFy8QajrD7I4=;
 b=Tlib/EKoM75ji8m0AqwPXS/ds+CKm8hxr5+VX6As9DvUwUfRbbqW3EShR30ivt2i/BHSr1
 WFRqo12M4qv/rIK7Kr1Gm2FZcMNRH0nwMQe5tAwEk1m/XLWqcrkvV35xSy1M0EvqiFhN2T
 H9JUFyiQEV/3I0UvvLyoMeBXfQzTuTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-F7KquejTNmyU0RTKprMLVA-1; Thu, 24 Jun 2021 16:42:48 -0400
X-MC-Unique: F7KquejTNmyU0RTKprMLVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A56E6804143;
 Thu, 24 Jun 2021 20:42:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 354BF5D6AB;
 Thu, 24 Jun 2021 20:42:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] acpi: pc: revert back to v5.2 PCI slot enumeration
Date: Thu, 24 Jun 2021 16:42:28 -0400
Message-Id: <20210624204229.998824-3-imammedo@redhat.com>
In-Reply-To: <20210624204229.998824-1-imammedo@redhat.com>
References: <20210624204229.998824-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, john.sucaet@ekinops.com, mst@redhat.com,
 stefanha@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit [1] moved _SUN variable from only hot-pluggable to
all devices. This made linux kernel enumerate extra slots
that weren't present before. If extra slot happens to be
be enumerated first and there is a device in th same slot
but on other bridge, linux kernel will add -N suffix to
slot name of the later, thus changing NIC name compared to
QEMU 5.2. This in some case confuses systemd, if it is
using SLOT NIC naming scheme and interface name becomes
not the same as it was under QEMU-5.2.

Reproducer QEMU CLI:
  -M pc-i440fx-5.2 -nodefaults \
  -device pci-bridge,chassis_nr=1,id=pci.1,bus=pci.0,addr=0x3 \
  -device virtio-net-pci,id=nic1,bus=pci.1,addr=0x1 \
  -device virtio-net-pci,id=nic2,bus=pci.1,addr=0x2 \
  -device virtio-net-pci,id=nic3,bus=pci.1,addr=0x3

with RHEL8 guest produces following results:
  v5.2:
     kernel: virtio_net virtio0 ens1: renamed from eth0
     kernel: virtio_net virtio2 ens3: renamed from eth2
     kernel: virtio_net virtio1 enp1s2: renamed from eth1
      (slot 2 is assigned to empty bus 0 slot and virtio1
       is assigned to 2-2 slot, and renaming falls back,
       for some reason, to path based naming scheme)

  v6.0:
     kernel: virtio_net virtio0 ens1: renamed from eth0
     kernel: virtio_net virtio2 ens3: renamed from eth2
     systemd-udevd[299]: Error changing net interface name 'eth1' to 'ens3': File exists
     systemd-udevd[299]: could not rename interface '3' from 'eth1' to 'ens3': File exists
      (with commit [1] kernel assigns virtio2 to 3-2 slot
       since bridge advertises _SUN=0x3 and kernel assigns
       slot 3 to bridge. Still it manages to rename virtio2
       correctly to ens3, however systemd gets confused with virtio1
       where slot allocation exactly the same (2-2) as in 5.2 case
       and tries to rename it to ens3 which is rightfully taken by
       virtio2)

I'm not sure what breaks in systemd interface renaming (it probably
should be investigated), but on QEMU side we can safely revert
_SUN to 5.2 behavior (i.e. avoid cold-plugged bridges and non
hot-pluggable device classes), without breaking acpi-index, which uses
slot numbers but it doesn't have to use _SUN, it could use an arbitrary
variable name that has the same slot value).
It will help existing VMs to keep networking with non trivial
configs in working order since systemd will do its interface
renaming magic as it used to do.

1)
Fixes: b7f23f62e40 (pci: acpi: add _DSM method to PCI devices)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
shameless plug: one more reason to use new acpi-index for interface
naming, so naming won't depend on enumeration rules kernel or systemd
use (so far it's available only for 'pc' machine, but with Julia's
acpi pci hotplug reviewed, there is a hope for q35 also supporting it
since 6.1).
---
 hw/i386/acpi-build.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 796ffc6f5c..357437ff1d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -435,11 +435,15 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
 
         if (bsel) {
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+            /*
+             * Can't declare _SUN here for every device as it changes 'slot'
+             * enumeration order in linux kernel, so use another variable for it
+             */
+            aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
             method = aml_method("_DSM", 4, AML_SERIALIZED);
             aml_append(method, aml_return(
                 aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
-                          aml_arg(3), aml_name("BSEL"), aml_name("_SUN"))
+                          aml_arg(3), aml_name("BSEL"), aml_name("ASUN"))
             ));
             aml_append(dev, method);
         }
@@ -466,6 +470,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
         } else if (hotplug_enabled_dev) {
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
             /* add _EJ0 to make slot hotpluggable  */
             method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             aml_append(method,
-- 
2.27.0


