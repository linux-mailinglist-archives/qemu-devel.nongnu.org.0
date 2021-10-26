Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3573843B9BC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:39:48 +0200 (CEST)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRMR-0001lS-Aa
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRAI-0007t7-Bd
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:17186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRAF-0007AP-Ss
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="227438575"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="227438575"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="497480965"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:54 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V4 3/3] net/colo-compare.c: Remove vnet_hdr and check in
 payload from colo-compare
Date: Wed, 27 Oct 2021 02:17:30 +0800
Message-Id: <20211026181730.3102184-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026181730.3102184-1-chen.zhang@intel.com>
References: <20211026181730.3102184-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
 helo=mga11.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable vnet_hdr in payload by default. Make it easier to find module
communication configuration errors.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c | 41 ++++++++++++++---------------------------
 qemu-options.hx    |  5 ++---
 2 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b100e7b51f..ecb21917c6 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -119,7 +119,7 @@ struct CompareState {
     SocketReadState notify_rs;
     SendCo out_sendco;
     SendCo notify_sendco;
-    bool vnet_hdr;
+    int local_vnet_hdr_len;
     uint64_t compare_timeout;
     uint32_t expired_scan_cycle;
 
@@ -725,7 +725,6 @@ static void colo_compare_connection(void *opaque, void *user_data)
 static void coroutine_fn _compare_chr_send(void *opaque)
 {
     SendCo *sendco = opaque;
-    CompareState *s = sendco->s;
     int ret = 0;
 
     while (!g_queue_is_empty(&sendco->send_list)) {
@@ -740,7 +739,7 @@ static void coroutine_fn _compare_chr_send(void *opaque)
             goto err;
         }
 
-        if (!sendco->notify_remote_frame && s->vnet_hdr) {
+        if (!sendco->notify_remote_frame) {
             /*
              * We send vnet header len make other module(like filter-redirector)
              * know how to parse net packet correctly.
@@ -1034,22 +1033,6 @@ static void compare_set_outdev(Object *obj, const char *value, Error **errp)
     s->outdev = g_strdup(value);
 }
 
-static bool compare_get_vnet_hdr(Object *obj, Error **errp)
-{
-    CompareState *s = COLO_COMPARE(obj);
-
-    return s->vnet_hdr;
-}
-
-static void compare_set_vnet_hdr(Object *obj,
-                                 bool value,
-                                 Error **errp)
-{
-    CompareState *s = COLO_COMPARE(obj);
-
-    s->vnet_hdr = value;
-}
-
 static char *compare_get_notify_dev(Object *obj, Error **errp)
 {
     CompareState *s = COLO_COMPARE(obj);
@@ -1157,6 +1140,9 @@ static void compare_pri_rs_finalize(SocketReadState *pri_rs)
     CompareState *s = container_of(pri_rs, CompareState, pri_rs);
     Connection *conn = NULL;
 
+    /* Update colo-compare local vnet_hdr_len */
+    s->local_vnet_hdr_len = pri_rs->vnet_hdr_len;
+
     if (packet_enqueue(s, PRIMARY_IN, &conn)) {
         trace_colo_compare_main("primary: unsupported packet in");
         compare_chr_send(s,
@@ -1176,6 +1162,12 @@ static void compare_sec_rs_finalize(SocketReadState *sec_rs)
     CompareState *s = container_of(sec_rs, CompareState, sec_rs);
     Connection *conn = NULL;
 
+    /* Check the secondary vnet_hdr_len */
+    if (s->local_vnet_hdr_len != sec_rs->vnet_hdr_len) {
+        error_report("colo-compare got a different packet vnet_hdr_len"
+        " from local, please check the nodes -device configuration");
+    }
+
     if (packet_enqueue(s, SECONDARY_IN, &conn)) {
         trace_colo_compare_main("secondary: unsupported packet in");
     } else {
@@ -1289,8 +1281,8 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
-    net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
-    net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
+    net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, true);
+    net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, true);
 
     /* Try to enable remote notify chardev, currently just for Xen COLO */
     if (s->notify_dev) {
@@ -1299,8 +1291,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
             return;
         }
 
-        net_socket_rs_init(&s->notify_rs, compare_notify_rs_finalize,
-                           s->vnet_hdr);
+        net_socket_rs_init(&s->notify_rs, compare_notify_rs_finalize, false);
     }
 
     s->out_sendco.s = s;
@@ -1396,10 +1387,6 @@ static void colo_compare_init(Object *obj)
     object_property_add(obj, "max_queue_size", "uint32",
                         get_max_queue_size,
                         set_max_queue_size, NULL, NULL);
-
-    s->vnet_hdr = false;
-    object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
-                             compare_set_vnet_hdr);
 }
 
 void colo_compare_cleanup(void)
diff --git a/qemu-options.hx b/qemu-options.hx
index 6d3b7ab8a0..c966035b4b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4976,15 +4976,14 @@ SRST
         stored. The file format is libpcap, so it can be analyzed with
         tools such as tcpdump or Wireshark.
 
-    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
+    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
         Colo-compare gets packet from primary\_in chardevid and
         secondary\_in, then compare whether the payload of primary packet
         and secondary packet are the same. If same, it will output
         primary packet to out\_dev, else it will notify COLO-framework to do
         checkpoint and send primary packet to out\_dev. In order to
         improve efficiency, we need to put the task of comparison in
-        another iothread. If it has the vnet\_hdr\_support flag,
-        colo compare will send/recv packet with vnet\_hdr\_len.
+        another iothread. colo compare will send/recv packet with vnet\_hdr\_len.
         The compare\_timeout=@var{ms} determines the maximum time of the
         colo-compare hold the packet. The expired\_scan\_cycle=@var{ms}
         is to set the period of scanning expired primary node network packets.
-- 
2.25.1


