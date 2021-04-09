Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C7D359366
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 05:49:28 +0200 (CEST)
Received: from localhost ([::1]:55438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUi99-00036T-7G
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 23:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2d-0003DA-Lo
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:43 -0400
Received: from mga05.intel.com ([192.55.52.43]:12420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2b-0007T4-Eh
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:43 -0400
IronPort-SDR: pr8pH6sEk04IaP+9r4Ct4Jken3UJ3SgtxCBhwdnZqa0JyC/uQd1GgjEDbkZHaW8nUaYUSTB095
 zeWIniLZ6uqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278957331"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="278957331"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 20:42:40 -0700
IronPort-SDR: mO/f90HndSGxdclSIquutWVxKbgESKrNeluVTW0skAaWISld8orvHQFRpJ4dJswTC9KZLiED9/
 u0wZ53zxQDNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="416081077"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2021 20:42:37 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v6 05/10] Add a function named packet_new_nocopy for COLO.
Date: Thu,  8 Apr 2021 23:20:51 -0400
Message-Id: <1617938456-315058-6-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Use the packet_new_nocopy instead of packet_new in the
filter-rewriter module. There will be one less memory
copy in the processing of each network packet.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 net/colo.c            | 25 +++++++++++++++++--------
 net/colo.h            |  1 +
 net/filter-rewriter.c |  3 +--
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index ef00609..3a3e6e8 100644
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
index 573ab91..d91cd24 100644
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
index 10fe393..cb3a96c 100644
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
1.8.3.1


