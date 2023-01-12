Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6642166746E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:07:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBQ-0002Ln-24; Thu, 12 Jan 2023 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBF-0002ES-W0
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-0005xS-Ml
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VthWbx4sxaRMwtf9xjcTHrh3ZjzOsvLEK7E+aaxf5p0=;
 b=c7vaajxErXvKkorGQkg8Dg9jRyZha2KtFMm81cOYbyitJQ3hwJB5/+pUIWvMGMHEi6cN8b
 x5M2XaLOHYbJ36OtoZdE4HyiT8eE7Vfoj5E1bbCkiITstsiLhRBEAwfuIFGyqZZ6DcJzYo
 56/mrChUglO++GCYZzbWe/wz80CslcU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-VHxEg5LFMp68liGEJpKIRQ-1; Thu, 12 Jan 2023 09:03:37 -0500
X-MC-Unique: VHxEg5LFMp68liGEJpKIRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FD952807D6F;
 Thu, 12 Jan 2023 14:03:36 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDD2E4085720;
 Thu, 12 Jan 2023 14:03:35 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 28/40] pci: acpi: wire up AcpiDevAmlIf interface to generic
 bridge
Date: Thu, 12 Jan 2023 15:03:00 +0100
Message-Id: <20230112140312.3096331-29-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

... so that the concrete impl. won't has to duplicate it
every time. By default it doesn't do anything unless leaf class
defines and sets AcpiDevAmlIfClass::build_dev_aml handler.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/pci/pci_bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index b2b180edd6..a1a1cc861e 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -36,6 +36,7 @@
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 /* PCI bridge subsystem vendor ID helper functions */
 #define PCI_SSVID_SIZEOF        8
@@ -472,6 +473,10 @@ static const TypeInfo pci_bridge_type_info = {
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIBridge),
     .abstract = true,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_ACPI_DEV_AML_IF },
+        { },
+    },
 };
 
 static void pci_bridge_register_types(void)
-- 
2.31.1


