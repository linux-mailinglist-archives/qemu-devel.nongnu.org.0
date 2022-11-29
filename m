Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D463BB4A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:12:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvht-00073h-R5; Tue, 29 Nov 2022 03:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvhf-0006zr-0x
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:10:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ozvhc-0006jj-Hk
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669709451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypWya4vKeITotbnpLSe2AHaNL7GdsePh9BVNbHM3uns=;
 b=h6tAJnJTiH0PMH+RMAxQaSUNJ1bjzIbOr584FcVfNyFnx3crm2itIiLeosQkJP7XobIqN3
 aqg9bVVP92eQYVTXL1NZbiRqdN+KKvxqG7/5KChQW7+ZWTW2B5Ux8mR3aad3vVZB7HTaYA
 ppJ5+5KtYpWXQivrv5iJQB6D+2x3LfM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-eqPtaMNUNLGRaQzEazjusA-1; Tue, 29 Nov 2022 03:10:48 -0500
X-MC-Unique: eqPtaMNUNLGRaQzEazjusA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09728185A792;
 Tue, 29 Nov 2022 08:10:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-181.pek2.redhat.com
 [10.72.13.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39811C15BA4;
 Tue, 29 Nov 2022 08:10:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 1/3] intel-iommu: fail MAP notifier without caching mode
Date: Tue, 29 Nov 2022 16:10:35 +0800
Message-Id: <20221129081037.12099-2-jasowang@redhat.com>
In-Reply-To: <20221129081037.12099-1-jasowang@redhat.com>
References: <20221129081037.12099-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

Without caching mode, MAP notifier won't work correctly since guest
won't send IOTLB update event when it establishes new mappings in the
I/O page tables. Let's fail the IOMMU notifiers early instead of
misbehaving silently.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/i386/intel_iommu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index a08ee85edf..9143376677 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3186,6 +3186,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
                          "Snoop Control with vhost or VFIO is not supported");
         return -ENOTSUP;
     }
+    if (!s->caching_mode && (new & IOMMU_NOTIFIER_MAP)) {
+        error_setg_errno(errp, ENOTSUP,
+                         "device %02x.%02x.%x requires caching mode",
+                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
+                         PCI_FUNC(vtd_as->devfn));
+        return -ENOTSUP;
+    }
 
     /* Update per-address-space notifier flags */
     vtd_as->notifier_flags = new;
-- 
2.25.1


