Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F133ABC9F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 21:22:54 +0200 (CEST)
Received: from localhost ([::1]:57670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltxbJ-0008VJ-Hb
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 15:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1ltxN1-0003fr-Uk
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1ltxMy-0003Us-V3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 15:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623956883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HDPJrgUREb2X0ITZdZXnFVL1WhktThWwuO2NA+41g9s=;
 b=YQ3M38jB97Gs0qbNnaDMPQDrmTrZBiDyMtwT2WChHGMrzgx3S+oNUfjVyUfDmFqpgjBMPL
 GhJniDqoifnjmNITHXskNO0zCHQDlsdOx2XMI6Ffe/dCUPWDFE0atzVosUQiCN6AgDJkfn
 awWk/24AFmELtrD+H+Y7yMXNjpNbCF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-DkxP-VO6P226bz6ga2eC2A-1; Thu, 17 Jun 2021 15:08:01 -0400
X-MC-Unique: DkxP-VO6P226bz6ga2eC2A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81E2291270;
 Thu, 17 Jun 2021 19:08:00 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.43.2.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B19A5D723;
 Thu, 17 Jun 2021 19:07:59 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/7] hw/acpi/pcihp: Enhance acpi_pcihp_disable_root_bus()
 to support Q35
Date: Thu, 17 Jun 2021 21:07:33 +0200
Message-Id: <20210617190739.3673064-2-jusual@redhat.com>
In-Reply-To: <20210617190739.3673064-1-jusual@redhat.com>
References: <20210617190739.3673064-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCI Express does not allow hot-plug on pcie.0. Check for Q35 in
acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the
'acpi-root-pci-hotplug' flag.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/pcihp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 4999277d57..09f531e941 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -122,13 +122,14 @@ static void acpi_set_pci_info(void)
 static void acpi_pcihp_disable_root_bus(void)
 {
     static bool root_hp_disabled;
+    Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
 
     if (root_hp_disabled) {
         return;
     }
 
-    bus = find_i440fx();
+    bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
         qbus_set_hotplug_handler(BUS(bus), NULL);
-- 
2.30.2


