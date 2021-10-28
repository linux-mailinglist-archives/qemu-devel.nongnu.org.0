Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81B43DDB3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 11:25:42 +0200 (CEST)
Received: from localhost ([::1]:40380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg1fJ-0006jZ-Pj
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 05:25:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mg1be-0001FR-9U
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:21:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:39012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mg1bc-0005oz-HM
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:21:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227819651"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="227819651"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:15:19 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="498301919"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:15:17 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V5 3/3] net/colo-compare.c: Optimize transfer protocol for
 colo-compare
Date: Thu, 28 Oct 2021 17:05:56 +0800
Message-Id: <20211028090556.3168043-4-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028090556.3168043-1-chen.zhang@intel.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
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
 net/colo-compare.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b100e7b51f..fb61b0eea9 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -119,7 +119,9 @@ struct CompareState {
     SocketReadState notify_rs;
     SendCo out_sendco;
     SendCo notify_sendco;
+    /* Keep compatibility for the management layer */
     bool vnet_hdr;
+    int local_vnet_hdr_len;
     uint64_t compare_timeout;
     uint32_t expired_scan_cycle;
 
@@ -725,7 +727,6 @@ static void colo_compare_connection(void *opaque, void *user_data)
 static void coroutine_fn _compare_chr_send(void *opaque)
 {
     SendCo *sendco = opaque;
-    CompareState *s = sendco->s;
     int ret = 0;
 
     while (!g_queue_is_empty(&sendco->send_list)) {
@@ -740,7 +741,7 @@ static void coroutine_fn _compare_chr_send(void *opaque)
             goto err;
         }
 
-        if (!sendco->notify_remote_frame && s->vnet_hdr) {
+        if (!sendco->notify_remote_frame) {
             /*
              * We send vnet header len make other module(like filter-redirector)
              * know how to parse net packet correctly.
@@ -1157,6 +1158,9 @@ static void compare_pri_rs_finalize(SocketReadState *pri_rs)
     CompareState *s = container_of(pri_rs, CompareState, pri_rs);
     Connection *conn = NULL;
 
+    /* Update colo-compare local vnet_hdr_len */
+    s->local_vnet_hdr_len = pri_rs->vnet_hdr_len;
+
     if (packet_enqueue(s, PRIMARY_IN, &conn)) {
         trace_colo_compare_main("primary: unsupported packet in");
         compare_chr_send(s,
@@ -1176,6 +1180,12 @@ static void compare_sec_rs_finalize(SocketReadState *sec_rs)
     CompareState *s = container_of(sec_rs, CompareState, sec_rs);
     Connection *conn = NULL;
 
+    /* Check the secondary vnet_hdr_len to ensure parse packet correctly */
+    if (s->local_vnet_hdr_len != sec_rs->vnet_hdr_len) {
+        error_report("colo-compare got a different packet vnet_hdr_len"
+        " from local, please check the nodes -device configuration");
+    }
+
     if (packet_enqueue(s, SECONDARY_IN, &conn)) {
         trace_colo_compare_main("secondary: unsupported packet in");
     } else {
@@ -1289,8 +1299,8 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
-    net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, s->vnet_hdr);
-    net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, s->vnet_hdr);
+    net_socket_rs_init(&s->pri_rs, compare_pri_rs_finalize, true);
+    net_socket_rs_init(&s->sec_rs, compare_sec_rs_finalize, true);
 
     /* Try to enable remote notify chardev, currently just for Xen COLO */
     if (s->notify_dev) {
@@ -1299,8 +1309,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
             return;
         }
 
-        net_socket_rs_init(&s->notify_rs, compare_notify_rs_finalize,
-                           s->vnet_hdr);
+        net_socket_rs_init(&s->notify_rs, compare_notify_rs_finalize, false);
     }
 
     s->out_sendco.s = s;
@@ -1397,7 +1406,8 @@ static void colo_compare_init(Object *obj)
                         get_max_queue_size,
                         set_max_queue_size, NULL, NULL);
 
-    s->vnet_hdr = false;
+    s->vnet_hdr = true;
+    s->local_vnet_hdr_len = 0;
     object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
                              compare_set_vnet_hdr);
 }
-- 
2.25.1


