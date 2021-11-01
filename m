Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A944150E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:10:44 +0100 (CET)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSOx-0006Yk-UD
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSK9-0003mb-C4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:3675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSK7-0004O6-LF
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="231231371"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="231231371"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 01:05:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="488541652"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 01 Nov 2021 01:05:39 -0700
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, lukasstraub2@web.de,
 dgilbert@redhat.com
Subject: [PATCH v2 7/7] Optimized the function of fill_connection_key.
Date: Mon,  1 Nov 2021 15:57:05 +0800
Message-Id: <1635753425-11756-8-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei.rao@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
---
 net/colo-compare.c    |  2 +-
 net/colo.c            | 31 ++++++++++++-------------------
 net/colo.h            |  6 +++---
 net/filter-rewriter.c | 10 +---------
 4 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 4a64a5d386..6a1354dcb1 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -264,7 +264,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
         pkt = NULL;
         return -1;
     }
-    fill_connection_key(pkt, &key);
+    fill_connection_key(pkt, &key, 0);
 
     conn = connection_get(s->connection_track_table,
                           &key,
diff --git a/net/colo.c b/net/colo.c
index 3a3e6e89a0..5e7232ce47 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -83,19 +83,26 @@ int parse_packet_early(Packet *pkt)
     return 0;
 }
 
-void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key, Packet *pkt)
+void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key,
+                         Packet *pkt, int reverse)
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
+void fill_connection_key(Packet *pkt, ConnectionKey *key, int reverse)
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
index d91cd245c4..5f4d502df3 100644
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
+                         Packet *pkt, int reverse);
+void fill_connection_key(Packet *pkt, ConnectionKey *key, int reverse);
 Connection *connection_new(ConnectionKey *key);
 void connection_destroy(void *opaque);
 Connection *connection_get(GHashTable *connection_track_table,
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index cb3a96cde1..bf05023dc3 100644
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
2.30.2


