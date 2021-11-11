Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84C44D05A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 04:18:20 +0100 (CET)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml0bT-000166-9Q
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 22:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ml0aE-0000Q7-Ec
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 22:17:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:54684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ml0aB-0007Sa-SW
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 22:17:02 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="213561467"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="213561467"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 19:16:57 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="504251960"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 19:16:55 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V2] net/filter: Enable the vnet_hdr_support by default
Date: Thu, 11 Nov 2021 11:07:32 +0800
Message-Id: <20211111030732.3859472-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch make filters and colo-compare module support vnet_hdr by
default. And also support -device non-virtio-net(like e1000.).
Because when enabled the support will make the vnet_hdr_len field
become must-delivery part of filter transfer protocol(even 0 in use
-device e1000). It fully guarantees the compatibility for management
layer like libvirt. But it still can't avoid user manual
configuration error between different filters connected
when enable/disable vnet_hdr_support.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 net/colo-compare.c    | 2 +-
 net/filter-mirror.c   | 4 ++--
 net/filter-rewriter.c | 2 +-
 qemu-options.hx       | 9 +++++----
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index b8876d7fd9..82d4d81710 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1397,7 +1397,7 @@ static void colo_compare_init(Object *obj)
                         get_max_queue_size,
                         set_max_queue_size, NULL, NULL);
 
-    s->vnet_hdr = false;
+    s->vnet_hdr = true;
     object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
                              compare_set_vnet_hdr);
 }
diff --git a/net/filter-mirror.c b/net/filter-mirror.c
index f20240cc9f..adb0c6d89a 100644
--- a/net/filter-mirror.c
+++ b/net/filter-mirror.c
@@ -406,14 +406,14 @@ static void filter_mirror_init(Object *obj)
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
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index bf05023dc3..5698cd39d1 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -407,7 +407,7 @@ static void filter_rewriter_init(Object *obj)
 {
     RewriterState *s = FILTER_REWRITER(obj);
 
-    s->vnet_hdr = false;
+    s->vnet_hdr = true;
     s->failover_mode = FAILOVER_MODE_OFF;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 7749f59300..c40e385ede 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4967,13 +4967,13 @@ SRST
     ``-object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
         filter-mirror on netdev netdevid,mirror net packet to
         chardevchardevid, if it has the vnet\_hdr\_support flag,
-        filter-mirror will mirror packet with vnet\_hdr\_len.
+        filter-mirror will mirror packet with vnet\_hdr\_len(default: on).
 
     ``-object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
         filter-redirector on netdev netdevid,redirect filter's net
         packet to chardev chardevid,and redirect indev's packet to
         filter.if it has the vnet\_hdr\_support flag, filter-redirector
-        will redirect packet with vnet\_hdr\_len. Create a
+        will redirect packet with vnet\_hdr\_len(default: on). Create a
         filter-redirector we need to differ outdev id from indev id, id
         can not be the same. we can just use indev or outdev, but at
         least one of indev or outdev need to be specified.
@@ -4983,7 +4983,8 @@ SRST
         packet to secondary from primary to keep secondary tcp
         connection,and rewrite tcp packet to primary from secondary make
         tcp packet can be handled by client.if it has the
-        vnet\_hdr\_support flag, we can parse packet with vnet header.
+        vnet\_hdr\_support flag, we can parse packet with vnet
+        header(default: on).
 
         usage: colo secondary: -object
         filter-redirector,id=f1,netdev=hn0,queue=tx,indev=red0 -object
@@ -5004,7 +5005,7 @@ SRST
         checkpoint and send primary packet to out\_dev. In order to
         improve efficiency, we need to put the task of comparison in
         another iothread. If it has the vnet\_hdr\_support flag,
-        colo compare will send/recv packet with vnet\_hdr\_len.
+        colo compare will send/recv packet with vnet\_hdr\_len(default: on).
         The compare\_timeout=@var{ms} determines the maximum time of the
         colo-compare hold the packet. The expired\_scan\_cycle=@var{ms}
         is to set the period of scanning expired primary node network packets.
-- 
2.25.1


