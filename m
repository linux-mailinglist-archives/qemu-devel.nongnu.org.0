Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F856A1EBC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:41:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9Z-0003sj-IB; Fri, 24 Feb 2023 10:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9X-0003s0-Oa
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9V-0007Cj-SD
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYrtYv/GKOLNco1SKxicnxpSEQkNooVz0PAaBvd0gPU=;
 b=P7xccivqSwG/D8eqVFAaZTHtvTHgxEf8OjTsm+YZcrzmwGFvjkCRh7I1f/YOgF3MaXnT1q
 354NvjAVI4d7KY5ZXmOhYBSyKdKdbjH0dManP5GwX9tTsmdf4jO4MfaLLqjSOK/VyPJWqh
 x4sesKGC27PjZTWBh8vyxpGX5aAk7LM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-5Wy1V8MBMUenjt_-B5y4Xw-1; Fri, 24 Feb 2023 10:38:23 -0500
X-MC-Unique: 5Wy1V8MBMUenjt_-B5y4Xw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60AD4811E6E;
 Fri, 24 Feb 2023 15:38:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6337492B13;
 Fri, 24 Feb 2023 15:38:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 10/33] pcihp: piix4: do not redirect hotplug controller to
 piix4 when ACPI hotplug is disabled
Date: Fri, 24 Feb 2023 16:37:49 +0100
Message-Id: <20230224153812.4176226-11-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

commit [1] added ability to disable ACPI PCI hotplug
on hostbridge but forgot to take into account that it
should disable all ACPI hotplug machinery in case both
hostbridge and bridge hotplug are disabled.

Commit [2] tried to fix that, however it forgot to
remove hotplug_handler override which hands hotplug
control over to piix4 hotplug controller
(uninitialized after [2]).

As result at the time bridge is plugged in, its default
(SHPC) hotplug handler is replaced by piix4 one in
  acpi_pcihp_device_plug_cb()
    ...
    if (!s->legacy_piix &&
       ...
       qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));

which is acting on uninitialized s->legacy_piix value
(0 by default) that was supposed to be initialized by
acpi_pcihp_init(), that is no longer called due to
following condition being false:

  piix4_acpi_system_hot_add_init()
    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {

and the bridge ends up with piix4 as hotplug handler
instead of shpc one.

Followup hotplug on that bridge as result yields
piix4 specific error:

  Error: Unsupported bus. Bus doesn't have property 'acpi-pcihp-bsel' set

1) 3d7e78aa777 (Introduce a new flag for i440fx to disable PCI hotplug on the root bus)
2) df4008c9c59 (piix4: don't reserve hw resources when hotplug is off globally)

Fixes: df4008c9c59 (piix4: don't reserve hw resources when hotplug is off globally)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index eac2125abd..8fc422829a 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -492,7 +492,6 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
 
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
                                    pci_get_bus(dev), s);
-    qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
 
     piix4_pm_add_properties(s);
 }
@@ -564,6 +563,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
     if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
         acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
                         s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
+        qbus_set_hotplug_handler(BUS(pci_get_bus(PCI_DEVICE(s))), OBJECT(s));
     }
 
     s->cpu_hotplug_legacy = true;
-- 
2.39.1


