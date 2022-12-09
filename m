Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778F96482F0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:50:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dkC-0006kg-C0; Fri, 09 Dec 2022 08:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk8-0006kB-Ec
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk1-0004Ik-E2
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670593689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Jei6rOZ5qRtplOWGeI6rrEOxk1cIjRD1hCXfBFVEC8=;
 b=FaYMhkpnsjZ79EylSHr3XTuu+8OWaGyftaFWg/Z27WmVhu3gRCwGz68ozX+qsy1VrO+lOZ
 q8Fkk0lVcx7cithJuOIzNT/CsyWkNcfLwq2YuI70Eo3mKjLmQ23pYiI12UL0xsVTvDBLrn
 1lJOFGpft7HyndmVW5KRNT8t8FNZNZw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-qV09CwvcN2mPm-txFyB07g-1; Fri, 09 Dec 2022 08:48:06 -0500
X-MC-Unique: qV09CwvcN2mPm-txFyB07g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7123813F35;
 Fri,  9 Dec 2022 13:48:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9873C15BA5;
 Fri,  9 Dec 2022 13:48:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DD1DD21E688F; Fri,  9 Dec 2022 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, philmd@linaro.org
Subject: [PATCH 3/5] include/hw/pci: Clean up a few things checkpatch.pl would
 flag
Date: Fri,  9 Dec 2022 14:48:00 +0100
Message-Id: <20221209134802.3642942-4-armbru@redhat.com>
In-Reply-To: <20221209134802.3642942-1-armbru@redhat.com>
References: <20221209134802.3642942-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix a few style violations so that checkpatch.pl won't complain when I
move this code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/pci/pci.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6ccaaf5154..016e28a2a8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -292,8 +292,10 @@ struct PCIDevice {
     /* PCI config space */
     uint8_t *config;
 
-    /* Used to enable config checks on load. Note that writable bits are
-     * never checked even if set in cmask. */
+    /*
+     * Used to enable config checks on load. Note that writable bits are
+     * never checked even if set in cmask.
+     */
     uint8_t *cmask;
 
     /* Used to implement R/W bytes */
@@ -307,10 +309,11 @@ struct PCIDevice {
 
     /* the following fields are read only */
     int32_t devfn;
-    /* Cached device to fetch requester ID from, to avoid the PCI
-     * tree walking every time we invoke PCI request (e.g.,
-     * MSI). For conventional PCI root complex, this field is
-     * meaningless. */
+    /*
+     * Cached device to fetch requester ID from, to avoid the PCI tree
+     * walking every time we invoke PCI request (e.g., MSI). For
+     * conventional PCI root complex, this field is meaningless.
+     */
     PCIReqIDCache requester_id_cache;
     char name[64];
     PCIIORegion io_regions[PCI_NUM_REGIONS];
@@ -954,7 +957,7 @@ extern const VMStateDescription vmstate_pci_device;
     .name       = (stringify(_field)),                               \
     .size       = sizeof(PCIDevice),                                 \
     .vmsd       = &vmstate_pci_device,                               \
-    .flags      = VMS_STRUCT|VMS_POINTER,                            \
+    .flags      = VMS_STRUCT | VMS_POINTER,                          \
     .offset     = vmstate_offset_pointer(_state, _field, PCIDevice), \
 }
 
-- 
2.37.3


