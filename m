Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4CF667889
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:05:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBX-0002WG-4O; Thu, 12 Jan 2023 09:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBK-0002HN-3K
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBF-00060v-QS
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z13F7ZxPepmju0UlhSUBoJZaNYceLXa2mu0PfuDyxYI=;
 b=W2Ojg89WZr/cP540qFsrmUCu78lQyqk7C8W1/nNduMPPPHl1kO88dOT7uawlJ/0P29Iqtd
 mTuSZK0jxV6Y29LcyOXeMJXyMs93oLgZwXiNpkKZq+5q27mnjdayqhyR/IH9u0rchP9ZpJ
 D5wcHzNGaXxeklJdXBZ1bEuwynTjHpk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351--Yx9fLy1PyOk5Ge_T9sCNQ-1; Thu, 12 Jan 2023 09:03:43 -0500
X-MC-Unique: -Yx9fLy1PyOk5Ge_T9sCNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 718E02807D7B;
 Thu, 12 Jan 2023 14:03:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E06294085720;
 Thu, 12 Jan 2023 14:03:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 36/40] pcihp: acpi: ignore coldplugged bridges when composing
 hotpluggable slots
Date: Thu, 12 Jan 2023 15:03:08 +0100
Message-Id: <20230112140312.3096331-37-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

coldplugged bridges are not unpluggable, so there is no need
to describe slots where they are plugged as hotpluggable. To
that effect we have a condition that marks slot as non-hotpluggable
if it's populated by coldplugged bridge and prevents generation
_SUN/_EJ0 objects for it. That leaves dynamic _DSM method on
such slot (which also depends on BSEL and pcihp hardware).
This _DSM method provides only dynamic acpi-index support so far,
which is not actually used/supported by linux kernel for bridges
and it's doubtful there will be need for it at all.

So it's rather pointless to generate acpi-index related AML
for bridges and we can simplify hotplug slots generator a bit
more by completely ignoring coldplugged bridges on hotplug path.

Another point in favor of dropping dynamic _DSM support, is
that we can replace it with static _DSM if necessary since
a slot with bridge can't change during VM runtime and without
any dependency on ACPI PCI hotplug at that.
Later I plan to implement bridge specific static _DSM
   PCI Firmware Specification 3.2
   4.6.5.  _DSM for Ignoring PCI Boot Configurations
part of spec, to fix longstanding issue with fixed IO/MEM
resource assignment that often leads to hotplugged device
being in-operational within the guest due limited IO/MEM
windows programmed on bridge at boot time.

Expected change when coldplugged bridge is ignored by hotplug
code, should look like:
-            Scope (S18)
-            {
-                Name (ASUN, 0x03)
-                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
-                {
-                    Local0 = Package (0x02)
-                        {
-                            BSEL,
-                            ASUN
-                        }
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
-                }
-            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a4f882dc72..50504578b9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -411,8 +411,11 @@ static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
 
 static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
 {
-    if (bus->devices[devfn]) {
-        return is_devfn_ignored_generic(devfn, bus);
+    PCIDevice *pdev = bus->devices[devfn];
+    if (pdev) {
+        return is_devfn_ignored_generic(devfn, bus) ||
+               /* Cold plugged bridges aren't themselves hot-pluggable */
+               (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
     } else { /* non populated slots */
          /*
          * hotplug is supported only for non-multifunction device
@@ -447,14 +450,7 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
         }
 
         if (pdev) {
-            /*
-             * Cold plugged bridges aren't themselves hot-pluggable.
-             * Hotplugged bridges *are* hot-pluggable.
-             */
-            bool cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
-                                  !DEVICE(pdev)->hotplugged;
-            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable &&
-                                !cold_plugged_bridge;
+            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable;
             dev = aml_scope("S%.02X", devfn);
         } else {
             dev = aml_device("S%.02X", devfn);
-- 
2.31.1


