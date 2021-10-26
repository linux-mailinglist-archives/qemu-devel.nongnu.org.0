Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1543BA03
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:54:04 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRaE-00053y-3a
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRAF-0007rq-PX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:11 -0400
Received: from mga11.intel.com ([192.55.52.93]:17211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRAC-0007Ao-Ad
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="227438573"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="227438573"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="497480958"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:53 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V4 2/3] net/filter: Remove vnet_hdr from filter-rewriter
Date: Wed, 27 Oct 2021 02:17:29 +0800
Message-Id: <20211026181730.3102184-3-chen.zhang@intel.com>
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

Make the vnet header a necessary part of filter transfer protocol.
So we need remove the module switch here.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/filter-rewriter.c | 26 +-------------------------
 qemu-options.hx       |  6 +++---
 2 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index cb3a96cde1..acc09f20fa 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -34,7 +34,6 @@ struct RewriterState {
     NetQueue *incoming_queue;
     /* hashtable to save connection */
     GHashTable *connection_track_table;
-    bool vnet_hdr;
     bool failover_mode;
 };
 
@@ -266,9 +265,7 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
 
     iov_to_buf(iov, iovcnt, 0, buf, size);
 
-    if (s->vnet_hdr) {
-        vnet_hdr_len = nf->netdev->vnet_hdr_len;
-    }
+    vnet_hdr_len = nf->netdev->vnet_hdr_len;
 
     pkt = packet_new_nocopy(buf, size, vnet_hdr_len);
 
@@ -395,27 +392,10 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
     s->incoming_queue = qemu_new_net_queue(qemu_netfilter_pass_to_next, nf);
 }
 
-static bool filter_rewriter_get_vnet_hdr(Object *obj, Error **errp)
-{
-    RewriterState *s = FILTER_REWRITER(obj);
-
-    return s->vnet_hdr;
-}
-
-static void filter_rewriter_set_vnet_hdr(Object *obj,
-                                         bool value,
-                                         Error **errp)
-{
-    RewriterState *s = FILTER_REWRITER(obj);
-
-    s->vnet_hdr = value;
-}
-
 static void filter_rewriter_init(Object *obj)
 {
     RewriterState *s = FILTER_REWRITER(obj);
 
-    s->vnet_hdr = false;
     s->failover_mode = FAILOVER_MODE_OFF;
 }
 
@@ -423,10 +403,6 @@ static void colo_rewriter_class_init(ObjectClass *oc, void *data)
 {
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
-    object_class_property_add_bool(oc, "vnet_hdr_support",
-                                   filter_rewriter_get_vnet_hdr,
-                                   filter_rewriter_set_vnet_hdr);
-
     nfc->setup = colo_rewriter_setup;
     nfc->cleanup = colo_rewriter_cleanup;
     nfc->receive_iov = colo_rewriter_receive_iov;
diff --git a/qemu-options.hx b/qemu-options.hx
index 38c03812a7..6d3b7ab8a0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4958,12 +4958,12 @@ SRST
         id can not be the same. we can just use indev or outdev, but at
         least one of indev or outdev need to be specified.
 
-    ``-object filter-rewriter,id=id,netdev=netdevid,queue=all|rx|tx,[vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
+    ``-object filter-rewriter,id=id,netdev=netdevid,queue=all|rx|tx[,position=head|tail|id=<id>][,insert=behind|before]``
         Filter-rewriter is a part of COLO project.It will rewrite tcp
         packet to secondary from primary to keep secondary tcp
         connection,and rewrite tcp packet to primary from secondary make
-        tcp packet can be handled by client.if it has the
-        vnet\_hdr\_support flag, we can parse packet with vnet header.
+        tcp packet can be handled by client. Filter-rewriter support
+        parse packet with vnet header.
 
         usage: colo secondary: -object
         filter-redirector,id=f1,netdev=hn0,queue=tx,indev=red0 -object
-- 
2.25.1


