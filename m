Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1534043B9C1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:41:10 +0200 (CEST)
Received: from localhost ([::1]:52146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRNl-0002ts-5s
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRAF-0007rp-It
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:11 -0400
Received: from mga11.intel.com ([192.55.52.93]:17186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRAB-0007AP-KY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="227438571"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="227438571"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="497480953"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:51 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V4 1/3] net/filter: Remove vnet_hdr from filter-mirror and
 filter-redirector
Date: Wed, 27 Oct 2021 02:17:28 +0800
Message-Id: <20211026181730.3102184-2-chen.zhang@intel.com>
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
So remove the module's vnet_hdr_support switch here.
It make other modules(like another filter-redirector,colo-compare...)
know how to parse net packet correctly. If local device is not the
virtio-net-pci, vnet_hdr_len will be 0.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/filter-mirror.c | 88 ++++++++++-----------------------------------
 qemu-options.hx     | 14 ++++----
 2 files changed, 25 insertions(+), 77 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f20240cc9f..4f0e26cc92 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -39,7 +39,6 @@ struct MirrorState {
     CharBackend chr_in;
     CharBackend chr_out;
     SocketReadState rs;
-    bool vnet_hdr;
 };
 
 static int filter_send(MirrorState *s,
@@ -48,7 +47,7 @@ static int filter_send(MirrorState *s,
 {
     NetFilterState *nf = NETFILTER(s);
     int ret = 0;
-    ssize_t size = 0;
+    ssize_t size = 0, vnet_hdr_len = 0;
     uint32_t len = 0;
     char *buf;
 
@@ -63,21 +62,18 @@ static int filter_send(MirrorState *s,
         goto err;
     }
 
-    if (s->vnet_hdr) {
-        /*
-         * If vnet_hdr = on, we send vnet header len to make other
-         * module(like colo-compare) know how to parse net
-         * packet correctly.
-         */
-        ssize_t vnet_hdr_len;
-
-        vnet_hdr_len = nf->netdev->vnet_hdr_len;
+    /*
+     * The vnet header is the necessary part of filter transfer protocol.
+     * It make other module(like colo-compare) know how to parse net
+     * packet correctly. If device is not the virtio-net-pci,
+     * vnet_hdr_len will be 0.
+     */
+    vnet_hdr_len = nf->netdev->vnet_hdr_len;
 
-        len = htonl(vnet_hdr_len);
-        ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(len));
-        if (ret != sizeof(len)) {
-            goto err;
-        }
+    len = htonl(vnet_hdr_len);
+    ret = qemu_chr_fe_write_all(&s->chr_out, (uint8_t *)&len, sizeof(len));
+    if (ret != sizeof(len)) {
+        goto err;
     }
 
     buf = g_malloc(size);
@@ -232,6 +228,12 @@ static void redirector_rs_finalize(SocketReadState *rs)
     MirrorState *s = container_of(rs, MirrorState, rs);
     NetFilterState *nf = NETFILTER(s);
 
+    /* Check remote vnet_hdr */
+    if (rs->vnet_hdr_len != nf->netdev->vnet_hdr_len) {
+        error_report("filter redirector got a different packet vnet_hdr"
+        " from local, please check the -device configuration");
+    }
+
     redirector_to_filter(nf, rs->buf, rs->packet_len);
 }
 
@@ -252,7 +254,7 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
         }
     }
 
-    net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
+    net_socket_rs_init(&s->rs, redirector_rs_finalize, true);
 
     if (s->indev) {
         chr = qemu_chr_find(s->indev);
@@ -323,20 +325,6 @@ static void filter_mirror_set_outdev(Object *obj,
     }
 }
 
-static bool filter_mirror_get_vnet_hdr(Object *obj, Error **errp)
-{
-    MirrorState *s = FILTER_MIRROR(obj);
-
-    return s->vnet_hdr;
-}
-
-static void filter_mirror_set_vnet_hdr(Object *obj, bool value, Error **errp)
-{
-    MirrorState *s = FILTER_MIRROR(obj);
-
-    s->vnet_hdr = value;
-}
-
 static char *filter_redirector_get_outdev(Object *obj, Error **errp)
 {
     MirrorState *s = FILTER_REDIRECTOR(obj);
@@ -354,31 +342,12 @@ static void filter_redirector_set_outdev(Object *obj,
     s->outdev = g_strdup(value);
 }
 
-static bool filter_redirector_get_vnet_hdr(Object *obj, Error **errp)
-{
-    MirrorState *s = FILTER_REDIRECTOR(obj);
-
-    return s->vnet_hdr;
-}
-
-static void filter_redirector_set_vnet_hdr(Object *obj,
-                                           bool value,
-                                           Error **errp)
-{
-    MirrorState *s = FILTER_REDIRECTOR(obj);
-
-    s->vnet_hdr = value;
-}
-
 static void filter_mirror_class_init(ObjectClass *oc, void *data)
 {
     NetFilterClass *nfc = NETFILTER_CLASS(oc);
 
     object_class_property_add_str(oc, "outdev", filter_mirror_get_outdev,
                                   filter_mirror_set_outdev);
-    object_class_property_add_bool(oc, "vnet_hdr_support",
-                                   filter_mirror_get_vnet_hdr,
-                                   filter_mirror_set_vnet_hdr);
 
     nfc->setup = filter_mirror_setup;
     nfc->cleanup = filter_mirror_cleanup;
@@ -393,29 +362,12 @@ static void filter_redirector_class_init(ObjectClass *oc, void *data)
                                   filter_redirector_set_indev);
     object_class_property_add_str(oc, "outdev", filter_redirector_get_outdev,
                                   filter_redirector_set_outdev);
-    object_class_property_add_bool(oc, "vnet_hdr_support",
-                                   filter_redirector_get_vnet_hdr,
-                                   filter_redirector_set_vnet_hdr);
 
     nfc->setup = filter_redirector_setup;
     nfc->cleanup = filter_redirector_cleanup;
     nfc->receive_iov = filter_redirector_receive_iov;
 }
 
-static void filter_mirror_init(Object *obj)
-{
-    MirrorState *s = FILTER_MIRROR(obj);
-
-    s->vnet_hdr = false;
-}
-
-static void filter_redirector_init(Object *obj)
-{
-    MirrorState *s = FILTER_REDIRECTOR(obj);
-
-    s->vnet_hdr = false;
-}
-
 static void filter_mirror_fini(Object *obj)
 {
     MirrorState *s = FILTER_MIRROR(obj);
@@ -435,7 +387,6 @@ static const TypeInfo filter_redirector_info = {
     .name = TYPE_FILTER_REDIRECTOR,
     .parent = TYPE_NETFILTER,
     .class_init = filter_redirector_class_init,
-    .instance_init = filter_redirector_init,
     .instance_finalize = filter_redirector_fini,
     .instance_size = sizeof(MirrorState),
 };
@@ -444,7 +395,6 @@ static const TypeInfo filter_mirror_info = {
     .name = TYPE_FILTER_MIRROR,
     .parent = TYPE_NETFILTER,
     .class_init = filter_mirror_class_init,
-    .instance_init = filter_mirror_init,
     .instance_finalize = filter_mirror_fini,
     .instance_size = sizeof(MirrorState),
 };
diff --git a/qemu-options.hx b/qemu-options.hx
index 5f375bbfa6..38c03812a7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4946,18 +4946,16 @@ SRST
 
         ``behind``: insert behind the specified filter (default).
 
-    ``-object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
+    ``-object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,position=head|tail|id=<id>][,insert=behind|before]``
         filter-mirror on netdev netdevid,mirror net packet to
-        chardevchardevid, if it has the vnet\_hdr\_support flag,
-        filter-mirror will mirror packet with vnet\_hdr\_len.
+        chardev chardevid, filter-mirror will mirror packet with vnet\_hdr\_len.
 
-    ``-object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
+    ``-object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,position=head|tail|id=<id>][,insert=behind|before]``
         filter-redirector on netdev netdevid,redirect filter's net
         packet to chardev chardevid,and redirect indev's packet to
-        filter.if it has the vnet\_hdr\_support flag, filter-redirector
-        will redirect packet with vnet\_hdr\_len. Create a
-        filter-redirector we need to differ outdev id from indev id, id
-        can not be the same. we can just use indev or outdev, but at
+        filter. filter-redirector will redirect packet with vnet\_hdr\_len.
+        Create a filter-redirector we need to differ outdev id from indev id,
+        id can not be the same. we can just use indev or outdev, but at
         least one of indev or outdev need to be specified.
 
     ``-object filter-rewriter,id=id,netdev=netdevid,queue=all|rx|tx,[vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
-- 
2.25.1


