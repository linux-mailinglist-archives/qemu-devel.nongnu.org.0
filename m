Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E64207983
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 18:50:40 +0200 (CEST)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8bf-0005Qk-AV
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 12:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VH-00039Y-30
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21972
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8V8-00054x-Gx
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQxRcl/cXCoq1BwBfQv5WeXuVpoIpPX1/ZveuWuOKTo=;
 b=Aw4ceWxytnnjbsmdRm5l3n2zTwEwmMPi80kZX2MVFqbUS1LoZFzqTHDx9Or+dq/QLVpQ53
 w87+WtCm+/MsPm7Q8lBOT47PRHDqtdHCB4RdhNQhut9dX9X+zxZgHxWCH+1e8nb8/lC5wm
 Prngmm0hxlcqcuMdTIwYs9vHc39lwc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-DWG4i87bPnWoJ56umwrP6w-1; Wed, 24 Jun 2020 12:43:51 -0400
X-MC-Unique: DWG4i87bPnWoJ56umwrP6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 753878015F5;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BCA08927C;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 248E9113847F; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/46] qemu-option: Smooth error checking manually
Date: Wed, 24 Jun 2020 18:43:16 +0200
Message-Id: <20200624164344.3778251-19-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When foo(..., &err) is followed by error_propagate(errp, err), we can
often just as well do foo(..., errp).  The previous commit did that
for simple cases with Coccinelle.  Do it for a few more manually.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block.c             | 2 +-
 block/gluster.c     | 8 ++++----
 block/parallels.c   | 2 +-
 block/quorum.c      | 2 +-
 block/replication.c | 2 +-
 block/vxhs.c        | 4 ++--
 hw/net/virtio-net.c | 4 ++--
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 77e85f13db..93a5fbf60a 100644
--- a/block.c
+++ b/block.c
@@ -6073,7 +6073,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
 
     /* Parse -o options */
     if (options) {
-        if (!qemu_opts_do_parse(opts, options, NULL, &local_err)) {
+        if (!qemu_opts_do_parse(opts, options, NULL, errp)) {
             goto out;
         }
     }
diff --git a/block/gluster.c b/block/gluster.c
index c620880f27..4f1448e2bc 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -523,7 +523,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
 
     /* create opts info from runtime_json_opts list */
     opts = qemu_opts_create(&runtime_json_opts, NULL, 0, &error_abort);
-    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
+    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         goto out;
     }
 
@@ -554,7 +554,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
 
         /* create opts info from runtime_type_opts list */
         opts = qemu_opts_create(&runtime_type_opts, NULL, 0, &error_abort);
-        if (!qemu_opts_absorb_qdict(opts, backing_options, &local_err)) {
+        if (!qemu_opts_absorb_qdict(opts, backing_options, errp)) {
             goto out;
         }
 
@@ -584,7 +584,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
         if (gsconf->type == SOCKET_ADDRESS_TYPE_INET) {
             /* create opts info from runtime_inet_opts list */
             opts = qemu_opts_create(&runtime_inet_opts, NULL, 0, &error_abort);
-            if (!qemu_opts_absorb_qdict(opts, backing_options, &local_err)) {
+            if (!qemu_opts_absorb_qdict(opts, backing_options, errp)) {
                 goto out;
             }
 
@@ -632,7 +632,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
         } else {
             /* create opts info from runtime_unix_opts list */
             opts = qemu_opts_create(&runtime_unix_opts, NULL, 0, &error_abort);
-            if (!qemu_opts_absorb_qdict(opts, backing_options, &local_err)) {
+            if (!qemu_opts_absorb_qdict(opts, backing_options, errp)) {
                 goto out;
             }
 
diff --git a/block/parallels.c b/block/parallels.c
index ef0d92d05c..0397f3894f 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -828,7 +828,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail_options;
     }
 
-    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
+    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         goto fail_options;
     }
 
diff --git a/block/quorum.c b/block/quorum.c
index beb3b6dbcc..9ed20e1998 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -922,7 +922,7 @@ static int quorum_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     opts = qemu_opts_create(&quorum_runtime_opts, NULL, 0, &error_abort);
-    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
+    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         ret = -EINVAL;
         goto exit;
     }
diff --git a/block/replication.c b/block/replication.c
index 00a50b095e..7f4ab357a4 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -99,7 +99,7 @@ static int replication_open(BlockDriverState *bs, QDict *options,
 
     ret = -EINVAL;
     opts = qemu_opts_create(&replication_runtime_opts, NULL, 0, &error_abort);
-    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
+    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         goto fail;
     }
 
diff --git a/block/vxhs.c b/block/vxhs.c
index 237df4f185..20513a43f4 100644
--- a/block/vxhs.c
+++ b/block/vxhs.c
@@ -318,7 +318,7 @@ static int vxhs_open(BlockDriverState *bs, QDict *options,
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     tcp_opts = qemu_opts_create(&runtime_tcp_opts, NULL, 0, &error_abort);
 
-    if (!qemu_opts_absorb_qdict(opts, options, &local_err)) {
+    if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         ret = -EINVAL;
         goto out;
     }
@@ -345,7 +345,7 @@ static int vxhs_open(BlockDriverState *bs, QDict *options,
     /* get the 'server.' arguments */
     qdict_extract_subqdict(options, &backing_options, VXHS_OPT_SERVER".");
 
-    if (!qemu_opts_absorb_qdict(tcp_opts, backing_options, &local_err)) {
+    if (!qemu_opts_absorb_qdict(tcp_opts, backing_options, errp)) {
         ret = -EINVAL;
         goto out;
     }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 04b012e487..7502ff0b1e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3119,8 +3119,8 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
     qdev_set_parent_bus(n->primary_dev, n->primary_bus);
     n->primary_should_be_hidden = false;
     if (!qemu_opt_set_bool(n->primary_device_opts,
-                           "partially_hotplugged", true, &err)) {
-        goto out;
+                           "partially_hotplugged", true, errp)) {
+        return false;
     }
     hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
     if (hotplug_ctrl) {
-- 
2.26.2


