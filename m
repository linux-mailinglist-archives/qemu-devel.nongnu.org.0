Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E2667865
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:59:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBO-0002Jc-GZ; Thu, 12 Jan 2023 09:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-000276-OL
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005tc-EG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dcGsRMmDLHLMvXZoMK4rumw8aWt8WQSlzF+bbXq4spI=;
 b=V8HfK658Dhx5cocR6dzdJnICpxAjEA44mHPqUdqP+FmM7Gi7KuK3gsyaFKGmKuI7A2oBdC
 DyXcTqbTAUBxnBZzkDdhFIiJQlQGowGDkQZnmxB6X2Vr8Tf2Gohu3FKbbGhMNgQjO5nOFx
 DT0f2v56dRDjPkdfyI5etKf4fHELojo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-FEMSx41KP86s-sWcSBWcaQ-1; Thu, 12 Jan 2023 09:03:28 -0500
X-MC-Unique: FEMSx41KP86s-sWcSBWcaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B8711039626;
 Thu, 12 Jan 2023 14:03:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89D114085720;
 Thu, 12 Jan 2023 14:03:23 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 12/40] x86: pcihp: fix invalid AML PCNT calls to hotplugged
 bridges
Date: Thu, 12 Jan 2023 15:02:44 +0100
Message-Id: <20230112140312.3096331-13-imammedo@redhat.com>
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

When QEMU is started with hotplugged bridges (think migration):

  QEMU  -S -monitor stdio \
        -device pci-bridge,chassis_nr=1 \
        -device pci-bridge,bus=pci.1,addr=1.0,chassis_nr=2

  (qemu) device_add pci-bridge,id=hpbr,bus=pci.1,addr=2.0,chassis_nr=3
  (qemu) cont

it will generate AML calls to hpbr's PCNT, which doesn't exists
since it's hotplugged bridge. As result DSDT becomes malformed,
with consequences that hotplug might stop working at best or
crash guest OS at worst, when it attempts to call non existing
PCNT method or during OS guest reboot when parsing DSDT again.

IASL de-compiles malformed AML of above config DSDT as:

   +    External (_SB_.PCI0.S18_.S10_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
   +    External (_SB_.PCI0.S18_.S19_.PCNT, MethodObj)    // Warning: Unknown method, guessing 2 arguments
   ...
                        BNUM = One
                        DVNT (PCIU, One)
                        DVNT (PCID, 0x03)
   -                    ^S08.PCNT ()
   +                    ^S19.PCNT (^S10.PCNT (^S08.PCNT ()))
                    }
                }

With BSEL assignment limited only to coldplugged bridges [1],
it should be possible to add PCNT call to a child bridge only
if the child has BSEL property, otherwise ignore it since it's
hotplugged. Which should fix the issue.

1) ("pci: acpihp: assign BSEL only to coldplugged bridges")

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8a35c3cad0..71899de37a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -517,7 +517,8 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         /* Notify about child bus events in any case */
         if (pcihp_bridge_en) {
             QLIST_FOREACH(sec, &bus->child, sibling) {
-                if (pci_bus_is_root(sec)) {
+                if (pci_bus_is_root(sec) ||
+                    !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
                     continue;
                 }
 
-- 
2.31.1


