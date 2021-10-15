Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36642F649
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:53:47 +0200 (CEST)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOag-00080w-EH
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVZ-00087z-No
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVU-0001TC-Kw
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bJkOucnfydzao7rkhHyO7nVHevYfi5T4RMolo42LFg=;
 b=MWyClj0j2x7jnSNc3AyWSWt/vOMOhpF/yIIbRGHQ4uiCq2sl2BV8r2znPWyfb7H03XQO6c
 KwX5HmL/4qVPnYnV3O4vo9VAjhvlK1BnbkYn4O4C8TNxExSHlqBeG1/smDU7l2EHg5DxWS
 q8NgwCuFZkrg6ELUzhX/lgc5TWyyIhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-zFA_40rJOpmXoz8ad-celw-1; Fri, 15 Oct 2021 10:48:22 -0400
X-MC-Unique: zFA_40rJOpmXoz8ad-celw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3574DF8A3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:21 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 227A219736;
 Fri, 15 Oct 2021 14:48:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] net/vhost-user: Fix device compatibility check
Date: Fri, 15 Oct 2021 16:46:27 +0200
Message-Id: <20211015144640.198044-3-kwolf@redhat.com>
In-Reply-To: <20211015144640.198044-1-kwolf@redhat.com>
References: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost-user works only with specific devices. At startup, it second
guesses what the command line option handling will do and error out if
it thinks a non-virtio device will attach to them.

This second guessing is not only ugly, it can lead to wrong error
messages ('-device floppy,netdev=foo' should complain about an unknown
property, not about the wrong kind of network device being attached) and
completely ignores hotplugging.

Drop the old checks and implement .check_peer_type() instead to fix
this. As a nice side effect, it also removes one more dependency on the
legacy QemuOpts infrastructure and even reduces the code size.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211008133442.141332-3-kwolf@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 net/vhost-user.c | 41 ++++++++++++++---------------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/net/vhost-user.c b/net/vhost-user.c
index 4a939124d2..b1a0247b59 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -198,6 +198,19 @@ static bool vhost_user_has_ufo(NetClientState *nc)
     return true;
 }
 
+static bool vhost_user_check_peer_type(NetClientState *nc, ObjectClass *oc,
+                                       Error **errp)
+{
+    const char *driver = object_class_get_name(oc);
+
+    if (!g_str_has_prefix(driver, "virtio-net-")) {
+        error_setg(errp, "vhost-user requires frontend driver virtio-net-*");
+        return false;
+    }
+
+    return true;
+}
+
 static NetClientInfo net_vhost_user_info = {
         .type = NET_CLIENT_DRIVER_VHOST_USER,
         .size = sizeof(NetVhostUserState),
@@ -207,6 +220,7 @@ static NetClientInfo net_vhost_user_info = {
         .has_ufo = vhost_user_has_ufo,
         .set_vnet_be = vhost_user_set_vnet_endianness,
         .set_vnet_le = vhost_user_set_vnet_endianness,
+        .check_peer_type = vhost_user_check_peer_type,
 };
 
 static gboolean net_vhost_user_watch(void *do_not_use, GIOCondition cond,
@@ -397,27 +411,6 @@ static Chardev *net_vhost_claim_chardev(
     return chr;
 }
 
-static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
-{
-    const char *name = opaque;
-    const char *driver, *netdev;
-
-    driver = qemu_opt_get(opts, "driver");
-    netdev = qemu_opt_get(opts, "netdev");
-
-    if (!driver || !netdev) {
-        return 0;
-    }
-
-    if (strcmp(netdev, name) == 0 &&
-        !g_str_has_prefix(driver, "virtio-net-")) {
-        error_setg(errp, "vhost-user requires frontend driver virtio-net-*");
-        return -1;
-    }
-
-    return 0;
-}
-
 int net_init_vhost_user(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
@@ -433,12 +426,6 @@ int net_init_vhost_user(const Netdev *netdev, const char *name,
         return -1;
     }
 
-    /* verify net frontend */
-    if (qemu_opts_foreach(qemu_find_opts("device"), net_vhost_check_net,
-                          (char *)name, errp)) {
-        return -1;
-    }
-
     queues = vhost_user_opts->has_queues ? vhost_user_opts->queues : 1;
     if (queues < 1 || queues > MAX_QUEUE_NUM) {
         error_setg(errp,
-- 
2.31.1


