Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC1143DDAB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 11:23:32 +0200 (CEST)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg1dD-0003Mw-GB
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 05:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mg1bf-0001Is-Ks
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:21:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:39002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mg1be-0005oG-04
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 05:21:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227819643"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="227819643"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:15:16 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="498301889"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:15:14 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Date: Thu, 28 Oct 2021 17:05:54 +0800
Message-Id: <20211028090556.3168043-2-chen.zhang@intel.com>
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

Make the vnet header a necessary part of filter transfer protocol.
It make other modules(like another filter-redirector,colo-compare...)
know how to parse net packet correctly. If local device is not the
virtio-net-pci, vnet_hdr_len will be 0.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/filter-mirror.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f20240cc9f..24d3e498e9 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -39,6 +39,7 @@ struct MirrorState {
     CharBackend chr_in;
     CharBackend chr_out;
     SocketReadState rs;
+    /* Keep compatibility for the management layer */
     bool vnet_hdr;
 };
 
@@ -48,7 +49,7 @@ static int filter_send(MirrorState *s,
 {
     NetFilterState *nf = NETFILTER(s);
     int ret = 0;
-    ssize_t size = 0;
+    ssize_t size = 0, vnet_hdr_len = 0;
     uint32_t len = 0;
     char *buf;
 
@@ -63,21 +64,18 @@ static int filter_send(MirrorState *s,
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
@@ -252,7 +250,7 @@ static void filter_redirector_setup(NetFilterState *nf, Error **errp)
         }
     }
 
-    net_socket_rs_init(&s->rs, redirector_rs_finalize, s->vnet_hdr);
+    net_socket_rs_init(&s->rs, redirector_rs_finalize, true);
 
     if (s->indev) {
         chr = qemu_chr_find(s->indev);
@@ -406,14 +404,14 @@ static void filter_mirror_init(Object *obj)
 {
     MirrorState *s = FILTER_MIRROR(obj);
 
-    s->vnet_hdr = false;
+    s->vnet_hdr = true;
 }
 
 static void filter_redirector_init(Object *obj)
 {
     MirrorState *s = FILTER_REDIRECTOR(obj);
 
-    s->vnet_hdr = false;
+    s->vnet_hdr = true;
 }
 
 static void filter_mirror_fini(Object *obj)
-- 
2.25.1


