Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB2653E13
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 11:15:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8IQT-0004O0-Dq; Thu, 22 Dec 2022 05:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQL-0004Kv-PD
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8IQK-0007YQ-2i
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 05:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671703415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ji3FBUJnvtOj9qfOVH2gdPMmAY4N4BN8KVKYo2MIia0=;
 b=LXlLa3hnTMgPBme8xEvHswUu6zmNoST/kjW7h86VDlf+Q4qUD31v0/OBeLK/AN8toXYiBQ
 sWtke2leyLr0DfDlHBmhzz+lEpCtnFzCbNsJqmaG1cLFMBkQ7/liAkgGabF4ezNjp0Q0iL
 ryW+26CraUotD+TQ+yYC/a2vwxm7aKw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84--fTKXmSXOSWkWsKqadA2fw-1; Thu, 22 Dec 2022 05:03:31 -0500
X-MC-Unique: -fTKXmSXOSWkWsKqadA2fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96E1A1C0CE60;
 Thu, 22 Dec 2022 10:03:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 313F914152F6;
 Thu, 22 Dec 2022 10:03:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1A51321E6935; Thu, 22 Dec 2022 11:03:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, jonathan.cameron@huawei.com,
 philmd@linaro.org
Subject: [PATCH v2 4/7] include/hw/pci: Clean up a few things checkpatch.pl
 would flag
Date: Thu, 22 Dec 2022 11:03:27 +0100
Message-Id: <20221222100330.380143-5-armbru@redhat.com>
In-Reply-To: <20221222100330.380143-1-armbru@redhat.com>
References: <20221222100330.380143-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Fix a few style violations so that checkpatch.pl won't complain when I
move this code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 954f260f84..5ca2a9df58 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -284,8 +284,10 @@ struct PCIDevice {
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
@@ -299,10 +301,11 @@ struct PCIDevice {
 
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
@@ -943,7 +946,7 @@ extern const VMStateDescription vmstate_pci_device;
     .name       = (stringify(_field)),                               \
     .size       = sizeof(PCIDevice),                                 \
     .vmsd       = &vmstate_pci_device,                               \
-    .flags      = VMS_STRUCT|VMS_POINTER,                            \
+    .flags      = VMS_STRUCT | VMS_POINTER,                          \
     .offset     = vmstate_offset_pointer(_state, _field, PCIDevice), \
 }
 
-- 
2.38.1


