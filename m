Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA210C4521
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 02:47:31 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFSni-0008UX-NS
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 20:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRsG-0001fh-8l
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:48:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mdroth@linux.vnet.ibm.com>) id 1iFRsB-00027Y-Ke
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 19:48:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20080
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
 id 1iFRsB-0001fC-9F; Tue, 01 Oct 2019 19:48:03 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91NlPOb179355; Tue, 1 Oct 2019 19:47:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vcdgpncwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:47:42 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91NlgWk180245;
 Tue, 1 Oct 2019 19:47:42 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vcdgpncw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 19:47:42 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91NjlU5029385;
 Tue, 1 Oct 2019 23:47:41 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 2v9y59fajb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 23:47:41 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91NleBa41288190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 23:47:40 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6884428058;
 Tue,  1 Oct 2019 23:47:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C54B2805A;
 Tue,  1 Oct 2019 23:47:40 +0000 (GMT)
Received: from localhost (unknown [9.53.179.213])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 23:47:40 +0000 (GMT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 52/97] virtio-balloon: Use temporary PBP only
Date: Tue,  1 Oct 2019 18:45:31 -0500
Message-Id: <20191001234616.7825-53-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191001234616.7825-1-mdroth@linux.vnet.ibm.com>
References: <20191001234616.7825-1-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010203
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We still have multiple issues in the current code
- The PBP is not freed during unrealize()
- The PBP is not reset on device resets: After a reset, the PBP is stale.
- We are not indicating VIRTIO_BALLOON_F_MUST_TELL_HOST, therefore
  guests (esp. legacy guests) will reuse pages without deflating,
  turning the PBP stale. Adding that would require compat handling.

Instead, let's use the PBP only temporarily, when processing one bulk of
inflation requests. This will keep guest_page_size > 4k working (with
Linux guests). There is nothing to do for deflation requests anymore.
The pbp is only used for a limited amount of time.

Fixes: ed48c59875b6 ("virtio-balloon: Safely handle BALLOON_PAGE_SIZE < host page size")
Cc: qemu-stable@nongnu.org #v4.0.0
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20190722134108.22151-7-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
(cherry picked from commit a8cd64d488325f3be5c4ddec4bf07efb3b8c7330)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/virtio/virtio-balloon.c         | 21 +++++++++------------
 include/hw/virtio/virtio-balloon.h |  3 ---
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 49999d0bbe..bd54e302de 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -34,11 +34,11 @@
 
 #define BALLOON_PAGE_SIZE  (1 << VIRTIO_BALLOON_PFN_SHIFT)
 
-struct PartiallyBalloonedPage {
+typedef struct PartiallyBalloonedPage {
     ram_addr_t base_gpa;
     long subpages;
     unsigned long *bitmap;
-};
+} PartiallyBalloonedPage;
 
 static void virtio_balloon_pbp_free(PartiallyBalloonedPage *pbp)
 {
@@ -68,11 +68,11 @@ static bool virtio_balloon_pbp_matches(PartiallyBalloonedPage *pbp,
 }
 
 static void balloon_inflate_page(VirtIOBalloon *balloon,
-                                 MemoryRegion *mr, hwaddr mr_offset)
+                                 MemoryRegion *mr, hwaddr mr_offset,
+                                 PartiallyBalloonedPage **pbp)
 {
     void *addr = memory_region_get_ram_ptr(mr) + mr_offset;
     ram_addr_t rb_offset, rb_aligned_offset, base_gpa;
-    PartiallyBalloonedPage **pbp = &balloon->pbp;
     RAMBlock *rb;
     size_t rb_page_size;
     int subpages;
@@ -149,12 +149,6 @@ static void balloon_deflate_page(VirtIOBalloon *balloon,
     rb = qemu_ram_block_from_host(addr, false, &rb_offset);
     rb_page_size = qemu_ram_pagesize(rb);
 
-    if (balloon->pbp) {
-        /* Let's play safe and always reset the pbp on deflation requests. */
-        virtio_balloon_pbp_free(balloon->pbp);
-        balloon->pbp = NULL;
-    }
-
     host_addr = (void *)((uintptr_t)addr & ~(rb_page_size - 1));
 
     /* When a page is deflated, we hint the whole host page it lives
@@ -336,6 +330,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
 static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOBalloon *s = VIRTIO_BALLOON(vdev);
+    PartiallyBalloonedPage *pbp = NULL;
     VirtQueueElement *elem;
     MemoryRegionSection section;
 
@@ -344,7 +339,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
         uint32_t pfn;
         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
         if (!elem) {
-            return;
+            break;
         }
 
         while (iov_to_buf(elem->out_sg, elem->out_num, offset, &pfn, 4) == 4) {
@@ -373,7 +368,7 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
             if (!qemu_balloon_is_inhibited()) {
                 if (vq == s->ivq) {
                     balloon_inflate_page(s, section.mr,
-                                         section.offset_within_region);
+                                         section.offset_within_region, &pbp);
                 } else if (vq == s->dvq) {
                     balloon_deflate_page(s, section.mr, section.offset_within_region);
                 } else {
@@ -387,6 +382,8 @@ static void virtio_balloon_handle_output(VirtIODevice *vdev, VirtQueue *vq)
         virtio_notify(vdev, vq);
         g_free(elem);
     }
+
+    virtio_balloon_pbp_free(pbp);
 }
 
 static void virtio_balloon_receive_stats(VirtIODevice *vdev, VirtQueue *vq)
diff --git a/include/hw/virtio/virtio-balloon.h b/include/hw/virtio/virtio-balloon.h
index 5a99293a45..d1c968d237 100644
--- a/include/hw/virtio/virtio-balloon.h
+++ b/include/hw/virtio/virtio-balloon.h
@@ -33,8 +33,6 @@ typedef struct virtio_balloon_stat_modern {
        uint64_t val;
 } VirtIOBalloonStatModern;
 
-typedef struct PartiallyBalloonedPage PartiallyBalloonedPage;
-
 enum virtio_balloon_free_page_report_status {
     FREE_PAGE_REPORT_S_STOP = 0,
     FREE_PAGE_REPORT_S_REQUESTED = 1,
@@ -70,7 +68,6 @@ typedef struct VirtIOBalloon {
     int64_t stats_last_update;
     int64_t stats_poll_interval;
     uint32_t host_features;
-    PartiallyBalloonedPage *pbp;
 
     bool qemu_4_0_config_size;
 } VirtIOBalloon;
-- 
2.17.1


