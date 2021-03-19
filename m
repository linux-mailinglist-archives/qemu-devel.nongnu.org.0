Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE40341389
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 04:38:03 +0100 (CET)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN5xa-0000l5-Ka
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 23:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5qq-0000la-Kj
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5qo-00030p-Uf
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:04 -0400
IronPort-SDR: 2u5iYMfEp8xAbxKaG8wwLIVAHPUF5hPTQ/GYUKz9NWGq2du4HXj9u/0FQXQo5DXYpf6GlSS37U
 I2oY4fsq7l5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169117099"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169117099"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 20:31:01 -0700
IronPort-SDR: M/VwxG7+dsIlOI0AhKm9VmXqYlD5hhm01IX2bo+RpAbj+57FhpTTf1TibeYq/GcT+XpQ8hJkfm
 euPNE8cY3YMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606448922"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 20:30:59 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v3 05/10] Add a function named packet_new_nocopy for COLO.
Date: Fri, 19 Mar 2021 11:07:43 +0800
Message-Id: <1616123268-89517-6-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
References: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 net/colo.c            | 23 +++++++++++++++++++++++
 net/colo.h            |  1 +
 net/filter-rewriter.c |  3 +--
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index ef00609..58106a8 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -174,6 +174,29 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len)
     return pkt;
 }
 
+/*
+ * packet_new_nocopy will not copy data, so the caller can't release
+ * the data. And it will be released in packet_destroy.
+ */
+Packet *packet_new_nocopy(void *data, int size, int vnet_hdr_len)
+{
+    Packet *pkt = g_slice_new(Packet);
+
+    pkt->data = data;
+    pkt->size = size;
+    pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    pkt->vnet_hdr_len = vnet_hdr_len;
+    pkt->tcp_seq = 0;
+    pkt->tcp_ack = 0;
+    pkt->seq_end = 0;
+    pkt->header_size = 0;
+    pkt->payload_size = 0;
+    pkt->offset = 0;
+    pkt->flags = 0;
+
+    return pkt;
+}
+
 void packet_destroy(void *opaque, void *user_data)
 {
     Packet *pkt = opaque;
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


