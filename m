Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7B5292619
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 12:54:51 +0200 (CEST)
Received: from localhost ([::1]:57246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUSoU-0001yG-R2
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 06:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kUSep-0008OB-Nt
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:44:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kUSek-0000tj-J8
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 06:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603104282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EFiOg7D2B5V0bDgw9aEi/A66o6VokQxnytKxKGWgl8=;
 b=J3vcUUnWglipEpIZ+x1oxAqlCuK1Wj6cILFIlyxdZT6EeDAKHydtESatt6tTxOx+GCLv79
 y2DK4uLL/5Bl9bb+MauXpwtLOGF6xELO5WqY2Mhx5l6Uto+0dVsu+YGyfGm8b9Eb4zmDca
 25V3n2IYWHBdHhtK01pFf2lHPhjj9s8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-FQWYFocRNi--DyEG6KxriQ-1; Mon, 19 Oct 2020 06:44:40 -0400
X-MC-Unique: FQWYFocRNi--DyEG6KxriQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B628186DD22;
 Mon, 19 Oct 2020 10:44:38 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-59.ams2.redhat.com [10.36.113.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90D1810013C4;
 Mon, 19 Oct 2020 10:44:16 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 4/5] intel_iommu: Skip page walking on device iotlb
 invalidations
Date: Mon, 19 Oct 2020 12:43:31 +0200
Message-Id: <20201019104332.22033-5-eperezma@redhat.com>
In-Reply-To: <20201019104332.22033-1-eperezma@redhat.com>
References: <20201019104332.22033-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although they didn't reach the notifier because of the filtering in
memory_region_notify_iommu_one, the vt-d was still splitting huge
memory invalidations in chunks. Skipping it.

This improves performance in case of netperf with vhost-net:
* TCP_STREAM: From 1923.6Mbit/s to 2175.13Mbit/s (13%)
* TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
* UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
* UDP_STREAM: No change observed (insignificant 0.1% improvement)

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/i386/intel_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6cc217742a..8f1ac137a6 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -1478,6 +1478,10 @@ static int vtd_sync_shadow_page_table(VTDAddressSpace *vtd_as)
     VTDContextEntry ce;
     IOMMUNotifier *n;
 
+    if (!(vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_IOTLB_EVENTS)) {
+        return 0;
+    }
+
     ret = vtd_dev_to_context_entry(vtd_as->iommu_state,
                                    pci_bus_num(vtd_as->bus),
                                    vtd_as->devfn, &ce);
-- 
2.18.1


