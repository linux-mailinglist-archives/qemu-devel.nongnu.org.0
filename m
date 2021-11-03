Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7A5443B63
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 03:30:25 +0100 (CET)
Received: from localhost ([::1]:54892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi62i-00062Q-2s
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 22:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mi61n-0005Ny-79
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:29:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:58105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mi61k-0007ns-Mh
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:29:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="294868914"
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; d="scan'208";a="294868914"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 19:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,204,1631602800"; d="scan'208";a="500856844"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga008.jf.intel.com with ESMTP; 02 Nov 2021 19:29:15 -0700
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, lukasstraub2@web.de,
 dgilbert@redhat.com
Subject: [PATCH v3] Optimized the function of fill_connection_key.
Date: Wed,  3 Nov 2021 10:21:12 +0800
Message-Id: <1635906072-10334-1-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Remove some unnecessary code to improve the performance of
the filter-rewriter module.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 net/colo-compare.c    |  2 +-
 net/colo.c            | 31 ++++++++++++-------------------
 net/colo.h            |  6 +++---
 net/filter-rewriter.c | 10 +---------
 4 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 4a64a5d..b8876d7 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -264,7 +264,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
         pkt = NULL;
         return -1;
     }
-    fill_connection_key(pkt, &key);
+    fill_connection_key(pkt, &key, false);
 
     conn = connection_get(s->connection_track_table,
                           &key,
diff --git a/net/colo.c b/net/colo.c
index 3a3e6e8..1f8162f 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -83,19 +83,26 @@ int parse_packet_early(Packet *pkt)
     return 0;
 }
 
-void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key, Packet *pkt)
+void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key,
+                         Packet *pkt, bool reverse)
 {
+    if (reverse) {
+        key->src = pkt->ip->ip_dst;
+        key->dst = pkt->ip->ip_src;
+        key->src_port = ntohs(tmp_ports & 0xffff);
+        key->dst_port = ntohs(tmp_ports >> 16);
+    } else {
         key->src = pkt->ip->ip_src;
         key->dst = pkt->ip->ip_dst;
         key->src_port = ntohs(tmp_ports >> 16);
         key->dst_port = ntohs(tmp_ports & 0xffff);
+    }
 }
 
-void fill_connection_key(Packet *pkt, ConnectionKey *key)
+void fill_connection_key(Packet *pkt, ConnectionKey *key, bool reverse)
 {
-    uint32_t tmp_ports;
+    uint32_t tmp_ports = 0;
 
-    memset(key, 0, sizeof(*key));
     key->ip_proto = pkt->ip->ip_p;
 
     switch (key->ip_proto) {
@@ -106,29 +113,15 @@ void fill_connection_key(Packet *pkt, ConnectionKey *key)
     case IPPROTO_SCTP:
     case IPPROTO_UDPLITE:
         tmp_ports = *(uint32_t *)(pkt->transport_header);
-        extract_ip_and_port(tmp_ports, key, pkt);
         break;
     case IPPROTO_AH:
         tmp_ports = *(uint32_t *)(pkt->transport_header + 4);
-        extract_ip_and_port(tmp_ports, key, pkt);
         break;
     default:
         break;
     }
-}
-
-void reverse_connection_key(ConnectionKey *key)
-{
-    struct in_addr tmp_ip;
-    uint16_t tmp_port;
-
-    tmp_ip = key->src;
-    key->src = key->dst;
-    key->dst = tmp_ip;
 
-    tmp_port = key->src_port;
-    key->src_port = key->dst_port;
-    key->dst_port = tmp_port;
+    extract_ip_and_port(tmp_ports, key, pkt, reverse);
 }
 
 Connection *connection_new(ConnectionKey *key)
diff --git a/net/colo.h b/net/colo.h
index d91cd24..8b3e8d5 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -89,9 +89,9 @@ typedef struct Connection {
 uint32_t connection_key_hash(const void *opaque);
 int connection_key_equal(const void *opaque1, const void *opaque2);
 int parse_packet_early(Packet *pkt);
-void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key, Packet *pkt);
-void fill_connection_key(Packet *pkt, ConnectionKey *key);
-void reverse_connection_key(ConnectionKey *key);
+void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key,
+                         Packet *pkt, bool reverse);
+void fill_connection_key(Packet *pkt, ConnectionKey *key, bool reverse);
 Connection *connection_new(ConnectionKey *key);
 void connection_destroy(void *opaque);
 Connection *connection_get(GHashTable *connection_track_table,
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index cb3a96c..bf05023 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -279,15 +279,7 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
      */
     if (pkt && is_tcp_packet(pkt)) {
 
-        fill_connection_key(pkt, &key);
-
-        if (sender == nf->netdev) {
-            /*
-             * We need make tcp TX and RX packet
-             * into one connection.
-             */
-            reverse_connection_key(&key);
-        }
+        fill_connection_key(pkt, &key, sender == nf->netdev);
 
         /* After failover we needn't change new TCP packet */
         if (s->failover_mode &&
-- 
1.8.3.1


