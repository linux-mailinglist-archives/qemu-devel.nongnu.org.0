Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068982F4223
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 03:57:53 +0100 (CET)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzWM3-00019w-Mg
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 21:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWHw-0005sg-NW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:36 -0500
Received: from mga09.intel.com ([134.134.136.24]:58694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1kzWHu-0003yA-W3
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 21:53:36 -0500
IronPort-SDR: +fQGmdlxA8/vsCYAH9ROfM8JvwwnI3YTaiDw/oIxjKY5lyNP6FIVpWevEpiUVyENI2OLmVpfFA
 CMZdxqOMH05g==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178289684"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="178289684"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:53:34 -0800
IronPort-SDR: NJRPxg3JyzL9tXXJ7XPd45gfBvgd6RMGDcAAxucnQlr+R30BotwYypNHvdnCitlQhUVGRE9dKl
 b2tF4okE4H9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="464750314"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2021 18:53:31 -0800
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH 05/10] Optimize the function of packet_new
Date: Wed, 13 Jan 2021 10:46:30 +0800
Message-Id: <1610505995-144129-6-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.24; envelope-from=lei.rao@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

if we put the data copy outside the packet_new(), then for the
filter-rewrite module, there will be one less memory copy in the
processing of each network packet.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 net/colo-compare.c    | 7 +++++--
 net/colo.c            | 4 ++--
 net/colo.h            | 2 +-
 net/filter-rewriter.c | 1 -
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 9e18baa..8bdf5a8 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -247,14 +247,17 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
     ConnectionKey key;
     Packet *pkt = NULL;
     Connection *conn;
+    char *data = NULL;
     int ret;
 
     if (mode == PRIMARY_IN) {
-        pkt = packet_new(s->pri_rs.buf,
+        data = g_memdup(s->pri_rs.buf, s->pri_rs.packet_len);
+        pkt = packet_new(data,
                          s->pri_rs.packet_len,
                          s->pri_rs.vnet_hdr_len);
     } else {
-        pkt = packet_new(s->sec_rs.buf,
+        data = g_memdup(s->sec_rs.buf, s->sec_rs.packet_len);
+        pkt = packet_new(data,
                          s->sec_rs.packet_len,
                          s->sec_rs.vnet_hdr_len);
     }
diff --git a/net/colo.c b/net/colo.c
index ef00609..08fb37e 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -155,11 +155,11 @@ void connection_destroy(void *opaque)
     g_slice_free(Connection, conn);
 }
 
-Packet *packet_new(const void *data, int size, int vnet_hdr_len)
+Packet *packet_new(void *data, int size, int vnet_hdr_len)
 {
     Packet *pkt = g_slice_new(Packet);
 
-    pkt->data = g_memdup(data, size);
+    pkt->data = data;
     pkt->size = size;
     pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     pkt->vnet_hdr_len = vnet_hdr_len;
diff --git a/net/colo.h b/net/colo.h
index 573ab91..bd2d719 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -100,7 +100,7 @@ Connection *connection_get(GHashTable *connection_track_table,
 bool connection_has_tracked(GHashTable *connection_track_table,
                             ConnectionKey *key);
 void connection_hashtable_reset(GHashTable *connection_track_table);
-Packet *packet_new(const void *data, int size, int vnet_hdr_len);
+Packet *packet_new(void *data, int size, int vnet_hdr_len);
 void packet_destroy(void *opaque, void *user_data);
 void packet_destroy_partial(void *opaque, void *user_data);
 
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index fc0e64c..e24afe5 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -271,7 +271,6 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
     }
 
     pkt = packet_new(buf, size, vnet_hdr_len);
-    g_free(buf);
 
     /*
      * if we get tcp packet
-- 
1.8.3.1


