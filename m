Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D9426BD5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:39:34 +0200 (CEST)
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYq61-0005TK-5a
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq3K-0001ga-81
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq3I-000184-3P
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=An3rlqqtX/BUcmE8YQxipfru8u0V/Sx9fhWF0Iscit4=;
 b=b30SwWD+HixS4B2ztsv1DwNLjcN+ebUagPsr+QrQ2/KzKZ/ZDS6IgEPeThRvpawu//i8FD
 HmqbXkFGc79vWVF+yvnKc9+N2W03TwdF9UVg3I21hV2rH85dBBZMOXQc9KJw4uRIZ4YZA2
 Zj+mPf1c3mZvji1SLLQ6RmHfGq7VZA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-4LTQoXkTOjudDgUQbWgEMg-1; Fri, 08 Oct 2021 09:36:26 -0400
X-MC-Unique: 4LTQoXkTOjudDgUQbWgEMg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0FB13967AC;
 Fri,  8 Oct 2021 13:35:08 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D9BA196E2;
 Fri,  8 Oct 2021 13:35:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/15] net/vhost-user: Fix device compatibility check
Date: Fri,  8 Oct 2021 15:34:29 +0200
Message-Id: <20211008133442.141332-3-kwolf@redhat.com>
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
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


