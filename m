Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF536A1ED4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:45:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9o-00046i-Lp; Fri, 24 Feb 2023 10:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9l-00042l-72
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9i-0007Z9-47
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFHVsb6t0r9OaBPGNd+BUh9+7sofLgE7Fo1oCSXXGIM=;
 b=U5MqFcna/y2qdyYuicUHQS4KDAV3A7qrjKThowYA5H8sJg1jEAb0uSKVP2J83C0TP/4EZ9
 2l72skxB5/RmaRB0nDxw2jkijUVYruOo9Rk/eYPSEGk5Q05DQEmJgPUwEQiL5Dyp2bk253
 DmTxxK1U0KOD3UPRRlmL3cd4tzccpRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178--1qrRM3WN_2pRmIUM40nvg-1; Fri, 24 Feb 2023 10:38:39 -0500
X-MC-Unique: -1qrRM3WN_2pRmIUM40nvg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AF2F18E0A60;
 Fri, 24 Feb 2023 15:38:39 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF8D8492B12;
 Fri, 24 Feb 2023 15:38:38 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 29/33] acpi: pci: drop BSEL usage when deciding that device
 isn't hotpluggable
Date: Fri, 24 Feb 2023 16:38:08 +0100
Message-Id: <20230224153812.4176226-30-imammedo@redhat.com>
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

previous commit ("pci: fix 'hotplugglable' property behavior") fixed
pcie root port's 'hotpluggable' property to behave consistently.

So we don't need a BSEL crutch anymore to see of device is not
hotpluggable, drop it from 'generic' PCI slots description handling.

BSEL is still used to decide if hotplug part should be called
but that will be moved out of generic code to hotplug one by
followup patches.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7b982b6072..6b51b7401d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -590,7 +590,7 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 
         call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
         /* add _DSM if device has acpi-index set */
-        if (pdev->acpi_index && !bsel &&
+        if (pdev->acpi_index &&
             !object_property_get_bool(OBJECT(pdev), "hotpluggable",
                                       &error_abort)) {
             aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
-- 
2.39.1


