Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29539F113
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:38:19 +0200 (CEST)
Received: from localhost ([::1]:44294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXFb-0008M2-0t
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8X-0003wu-GT
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:31:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:24324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lqX8Q-0000K7-8E
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:31:01 -0400
IronPort-SDR: zMGOmJOEiYNSqHbId9Dq9wFF2xNxriVDLh1BClVrgiqI8OWvx0zxL9oDNp5V4iDoKuLqhw0LEE
 PqmE6+hB7Q4g==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204614535"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204614535"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:50 -0700
IronPort-SDR: +dbTlDJPeoyNW5Z9BBvQCcLcSeei2fS0z1cQhvZxybqAcOH7jvb6YG74ZSwDT6fTTMdvaHBkRv
 dqKKGda/AsfA==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="481862942"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:30:48 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-dev <qemu-devel@nongnu.org>
Subject: [PATCH 5/7] Add a function named packet_new_nocopy for COLO.
Date: Tue,  8 Jun 2021 16:23:29 +0800
Message-Id: <20210608082331.1949117-6-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608082331.1949117-1-chen.zhang@intel.com>
References: <20210608082331.1949117-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Zhang Chen <chen.zhang@intel.com>, "Rao, Lei" <lei.rao@intel.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Use the packet_new_nocopy instead of packet_new in the
filter-rewriter module. There will be one less memory
copy in the processing of each network packet.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo.c            | 25 +++++++++++++++++--------
 net/colo.h            |  1 +
 net/filter-rewriter.c |  3 +--
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index ef00609848..3a3e6e89a0 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -157,19 +157,28 @@ void connection_destroy(void *opaque)
 
 Packet *packet_new(const void *data, int size, int vnet_hdr_len)
 {
-    Packet *pkt = g_slice_new(Packet);
+    Packet *pkt = g_slice_new0(Packet);
 
     pkt->data = g_memdup(data, size);
     pkt->size = size;
     pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     pkt->vnet_hdr_len = vnet_hdr_len;
-    pkt->tcp_seq = 0;
-    pkt->tcp_ack = 0;
-    pkt->seq_end = 0;
-    pkt->header_size = 0;
-    pkt->payload_size = 0;
-    pkt->offset = 0;
-    pkt->flags = 0;
+
+    return pkt;
+}
+
+/*
+ * packet_new_nocopy will not copy data, so the caller can't release
+ * the data. And it will be released in packet_destroy.
+ */
+Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len)
+{
+    Packet *pkt = g_slice_new0(Packet);
+
+    pkt->data = data;
+    pkt->size = size;
+    pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    pkt->vnet_hdr_len = vnet_hdr_len;
 
     return pkt;
 }
diff --git a/net/colo.h b/net/colo.h
index 573ab91785..d91cd245c4 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -101,6 +101,7 @@ bool connection_has_tracked(GHashTable *connection_track_table,
                             ConnectionKey *key);
 void connection_hashtable_reset(GHashTable *connection_track_table);
 Packet *packet_new(const void *data, int size, int vnet_hdr_len);
+Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len);
 void packet_destroy(void *opaque, void *user_data);
 void packet_destroy_partial(void *opaque, void *user_data);
 
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index 10fe3939b1..cb3a96cde1 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -270,8 +270,7 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
         vnet_hdr_len = nf->netdev->vnet_hdr_len;
     }
 
-    pkt = packet_new(buf, size, vnet_hdr_len);
-    g_free(buf);
+    pkt = packet_new_nocopy(buf, size, vnet_hdr_len);
 
     /*
      * if we get tcp packet
-- 
2.25.1


