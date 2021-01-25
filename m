Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4A3024CC
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:25:09 +0100 (CET)
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40vd-0004bH-0U
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40tt-0002uF-L8
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l40tr-0007rL-Og
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611577398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=e8mSm93PDo22g/Om/8RnrmZIy773rIqY04U8fKyMke0=;
 b=Rbs2nVro/rgIitYNGg1Jc134yW/fIt+JQ/sfFMaoK5TV/DB9Y93I1erzb/y6Yxy+3dDJRN
 QrgPjSXIscpH1WEXRxMWNDSIfbYgtwoUE7ou8JxelamKve3bZnSYZ8crMqf0GInIx6yaZi
 Y4L+coEh7yZz77sB6vzdwsJ+uAflzqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-vIbo_zdiNPi67M63ehX4KA-1; Mon, 25 Jan 2021 07:23:14 -0500
X-MC-Unique: vIbo_zdiNPi67M63ehX4KA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A840100558A;
 Mon, 25 Jan 2021 12:23:13 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66BFD19C44;
 Mon, 25 Jan 2021 12:23:11 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [RESEND PULL 1/4] net: Fix handling of id in netdev_add and netdev_del
Date: Mon, 25 Jan 2021 20:23:04 +0800
Message-Id: <1611577387-4296-2-git-send-email-jasowang@redhat.com>
In-Reply-To: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
References: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

CLI -netdev accumulates in option group "netdev".

Before commit 08712fcb85 "net: Track netdevs in NetClientState rather
than QemuOpt", netdev_add added to the option group, and netdev_del
removed from it, both HMP and QMP.  Thus, every netdev had a
corresponding QemuOpts in this option group.

Commit 08712fcb85 dropped this for QMP netdev_add and both netdev_del.
Now a netdev has a corresponding QemuOpts only when it was created
with CLI or HMP.  Two issues:

* QMP and HMP netdev_del can leave QemuOpts behind, breaking HMP
  netdev_add.  Reproducer:

    $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
    QEMU 5.1.92 monitor - type 'help' for more information
    (qemu) netdev_add user,id=net0
    (qemu) info network
    net0: index=0,type=user,net=10.0.2.0,restrict=off
    (qemu) netdev_del net0
    (qemu) info network
    (qemu) netdev_add user,id=net0
    upstream-qemu: Duplicate ID 'net0' for netdev
    Try "help netdev_add" for more information

  Fix by restoring the QemuOpts deletion in qmp_netdev_del(), but with
  a guard, because the QemuOpts need not exist.

* QMP netdev_add loses its "no duplicate ID" check.  Reproducer:

    $ qemu-system-x86_64 -S -display none -qmp stdio
    {"QMP": {"version": {"qemu": {"micro": 92, "minor": 1, "major": 5}, "package": "v5.2.0-rc2-1-g02c1f0142c"}, "capabilities": ["oob"]}}
    {"execute": "qmp_capabilities"}
    {"return": {}}
    {"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
    {"return": {}}
    {"execute": "netdev_add", "arguments": {"type": "user", "id":"net0"}}
    {"return": {}}

  Fix by adding a duplicate ID check to net_client_init1() to replace
  the lost one.  The check is redundant for callers where QemuOpts
  still checks, i.e. for CLI and HMP.

Reported-by: Andrew Melnichenko <andrew@daynix.com>
Fixes: 08712fcb851034228b61f75bd922863a984a4f60
Cc: qemu-stable@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/net/net.c b/net/net.c
index e1035f2..c1cd9c7 100644
--- a/net/net.c
+++ b/net/net.c
@@ -983,6 +983,7 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
 {
     NetClientState *peer = NULL;
+    NetClientState *nc;
 
     if (is_netdev) {
         if (netdev->type == NET_CLIENT_DRIVER_NIC ||
@@ -1010,6 +1011,12 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
         }
     }
 
+    nc = qemu_find_netdev(netdev->id);
+    if (nc) {
+        error_setg(errp, "Duplicate ID '%s'", netdev->id);
+        return -1;
+    }
+
     if (net_client_init_fun[netdev->type](netdev, netdev->id, peer, errp) < 0) {
         /* FIXME drop when all init functions store an Error */
         if (errp && !*errp) {
@@ -1020,8 +1027,6 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
     }
 
     if (is_netdev) {
-        NetClientState *nc;
-
         nc = qemu_find_netdev(netdev->id);
         assert(nc);
         nc->is_netdev = true;
@@ -1135,6 +1140,7 @@ void qmp_netdev_add(Netdev *netdev, Error **errp)
 void qmp_netdev_del(const char *id, Error **errp)
 {
     NetClientState *nc;
+    QemuOpts *opts;
 
     nc = qemu_find_netdev(id);
     if (!nc) {
@@ -1149,6 +1155,16 @@ void qmp_netdev_del(const char *id, Error **errp)
     }
 
     qemu_del_net_client(nc);
+
+    /*
+     * Wart: we need to delete the QemuOpts associated with netdevs
+     * created via CLI or HMP, to avoid bogus "Duplicate ID" errors in
+     * HMP netdev_add.
+     */
+    opts = qemu_opts_find(qemu_find_opts("netdev"), id);
+    if (opts) {
+        qemu_opts_del(opts);
+    }
 }
 
 static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
-- 
2.7.4


