Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E192C3D26
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 11:04:08 +0100 (CET)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khreg-000350-Vv
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 05:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khrdA-0002Uu-Nm
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:02:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1khrd4-0001JC-L7
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 05:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606298545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bg8EIQjkaLRfmvAELxhz6xXKfk7tHbZhidQXRidhH6g=;
 b=OrKNsejkWnFX6DJ5JkgSCB0BmUrI1gBzgykRiSyyGqR0v8sFJklfzVOH4vkrOiZz8lPqmW
 fwYA+0d2y4NQrDNIEO8O5KpUBUbhxYS1j1MzaEcQBh8lM6CE0GmdBBZj6CTKgycr+ZKHsx
 5+tbVBmbsVyxw9qzehTpWjYKWArxPRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-U0O_tzHPOpickO_zFwGYWg-1; Wed, 25 Nov 2020 05:02:23 -0500
X-MC-Unique: U0O_tzHPOpickO_zFwGYWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D78A2107ACE6;
 Wed, 25 Nov 2020 10:02:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76C405C1CF;
 Wed, 25 Nov 2020 10:02:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 080801138608; Wed, 25 Nov 2020 11:02:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] net: Fix handling of id in netdev_add and netdev_del
Date: Wed, 25 Nov 2020 11:02:20 +0100
Message-Id: <20201125100220.50251-2-armbru@redhat.com>
In-Reply-To: <20201125100220.50251-1-armbru@redhat.com>
References: <20201125100220.50251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, andrew@daynix.com, jasowang@redhat.com,
 qemu-stable@nongnu.org, yuri.benditovich@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 net/net.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/net/net.c b/net/net.c
index 794c652282..c1dc75fc37 100644
--- a/net/net.c
+++ b/net/net.c
@@ -978,6 +978,7 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
 {
     NetClientState *peer = NULL;
+    NetClientState *nc;
 
     if (is_netdev) {
         if (netdev->type == NET_CLIENT_DRIVER_NIC ||
@@ -1005,6 +1006,12 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
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
@@ -1015,8 +1022,6 @@ static int net_client_init1(const Netdev *netdev, bool is_netdev, Error **errp)
     }
 
     if (is_netdev) {
-        NetClientState *nc;
-
         nc = qemu_find_netdev(netdev->id);
         assert(nc);
         nc->is_netdev = true;
@@ -1137,6 +1142,7 @@ void qmp_netdev_add(Netdev *netdev, Error **errp)
 void qmp_netdev_del(const char *id, Error **errp)
 {
     NetClientState *nc;
+    QemuOpts *opts;
 
     nc = qemu_find_netdev(id);
     if (!nc) {
@@ -1151,6 +1157,16 @@ void qmp_netdev_del(const char *id, Error **errp)
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
2.26.2


