Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A948D5F1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:43:40 +0100 (CET)
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xZz-0005t8-Oy
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:43:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7xVd-0003Z5-OG
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:39:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7xVO-0001N2-Q8
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642070330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0jgEfkU+2Qxyc6A/ImskrWp6UtpMqY+uw4RY8gJJoc=;
 b=S7mv2BpVxNwn8jWVxv3Wbj+v3Vh4uoKEeKgCJLTiv4sjL/UrFdlvXrpwsmAecvWXYRuVJ5
 IrN3H8PQXvb5SznFivNI6Ckw+NfOnlGq5lZRVGNrFWIZz6HhZyUNIyO+vTWy0QY3/6206k
 CqUDv3YcDLenMzrCpyoVy0ec1nTUs0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-WxbiTBOjPcil0g2DhtMkuA-1; Thu, 13 Jan 2022 05:38:49 -0500
X-MC-Unique: WxbiTBOjPcil0g2DhtMkuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4807E101AFA7;
 Thu, 13 Jan 2022 10:38:48 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA49F7314D;
 Thu, 13 Jan 2022 10:38:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com
Subject: [PATCH 2/2] hw/vfio/common: Silence ram device offset alignment error
 traces
Date: Thu, 13 Jan 2022 11:37:57 +0100
Message-Id: <20220113103757.2801389-3-eric.auger@redhat.com>
In-Reply-To: <20220113103757.2801389-1-eric.auger@redhat.com>
References: <20220113103757.2801389-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Failing to DMA MAP a ram_device should not cause an error message.
This is currently happening with the TPM CRB command region and
this is causing confusion.

We may want to keep the trace for debug purpose though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

I am not totally clear why we do not fail on the non RAM device case
though.
---
 hw/vfio/common.c     | 15 ++++++++++++++-
 hw/vfio/trace-events |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 080046e3f5..9caa560b07 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -884,7 +884,20 @@ static void vfio_listener_region_add(MemoryListener *listener,
     if (unlikely((section->offset_within_address_space &
                   ~qemu_real_host_page_mask) !=
                  (section->offset_within_region & ~qemu_real_host_page_mask))) {
-        error_report("%s received unaligned region", __func__);
+        if (memory_region_is_ram_device(section->mr)) { /* just debug purpose */
+            trace_vfio_listener_region_add_bad_offset_alignment(
+                memory_region_name(section->mr),
+                section->offset_within_address_space,
+                section->offset_within_region, qemu_real_host_page_size);
+        } else { /* error case we don't want to be fatal */
+            error_report("%s received unaligned region %s iova=0x%"PRIx64
+                         " offset_within_region=0x%"PRIx64
+                         " qemu_real_host_page_mask=0x%"PRIx64,
+                         __func__, memory_region_name(section->mr),
+                         section->offset_within_address_space,
+                         section->offset_within_region,
+                         qemu_real_host_page_mask);
+        }
         return;
     }
 
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 0ef1b5f4a6..ccd9d7610d 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
 vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
 vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
+vfio_listener_region_add_bad_offset_alignment(const char *name, uint64_t iova, uint64_t offset_within_region, uint64_t page_size) "Region \"%s\" @0x%"PRIx64", offset_within_region=0x%"PRIx64", qemu_real_host_page_mask=0x%"PRIx64 " cannot be mapped for DMA"
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
-- 
2.26.3


