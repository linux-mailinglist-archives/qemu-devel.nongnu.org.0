Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E05189021
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 22:11:44 +0100 (CET)
Received: from localhost ([::1]:41491 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEJV1-0007kY-4R
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 17:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEJLF-0002vn-EW
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEJLA-0002sJ-1C
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:37 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41537)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEJL9-0002jJ-J2
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584478886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VeA62sT9/Tm+9oBFxNgW4GqhbW2XiNC+BT9fA9FAqcM=;
 b=hI9ByW/ur3ym6TStAMQzwZ2hauYeCHLBFJamcul45/r7A/K1qxc1a5WgC9rqXKy7rRywbK
 Ph6uRNYbxx32h5i5R9pHotMovDHOlamiMnOAUCgiUNkrUNekK8XpHf2nK3Dr1csx+TViiP
 zvMARO5qyLefG2Ar9H1OJbOU3hOtJiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-bCUmcDKIMx6MvhJHaxONUA-1; Tue, 17 Mar 2020 17:01:24 -0400
X-MC-Unique: bCUmcDKIMx6MvhJHaxONUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33C9013E2;
 Tue, 17 Mar 2020 21:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C55449080A;
 Tue, 17 Mar 2020 21:01:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AAA711135246; Tue, 17 Mar 2020 22:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/30] net: Complete qapi-fication of netdev_add
Date: Tue, 17 Mar 2020 22:01:14 +0100
Message-Id: <20200317210115.8864-30-armbru@redhat.com>
In-Reply-To: <20200317210115.8864-1-armbru@redhat.com>
References: <20200317210115.8864-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Alex Kirillov <lekiravi@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

We've had all the required pieces for doing a type-safe representation
of netdev_add as a flat union for quite some time now (since
0e55c381f6 in v2.7.0, released in 2016), but did not make the final
switch to using it because of concern about whether a command-line
regression in accepting "1" in place of 1 for integer arguments would
be problematic.  Back then, we did not have the deprecation cycle to
allow us to make progress.  But now that we have waited so long, other
problems have crept in: for example, our desire to add
qemu-storage-daemon is hampered by the inability to express net
objects, and we are unable to introspect what we actually accept.
Additionally, our round-trip through QemuOpts silently eats any
argument that expands to an array, rendering dnssearch, hostfwd, and
guestfwd useless through QMP:

{"execute": "netdev_add", "arguments": { "id": "netdev0",
  "type": "user", "dnssearch": [
    { "str": "8.8.8.8" }, { "str": "8.8.4.4" }
  ]}}

So without further ado, let's turn on proper QAPI.  netdev_add() was a
trivial wrapper around net_client_init(), which did a few steps prior
to calling net_client_init1(); with this patch, we now skip directly
to net_client_init1().  In addition to fixing array parameters, the
following additional differences occur:

-  {"execute": "netdev_add", "arguments": {"type": "help"}}
no longer attempts to print help to stdout and exit.  Bug fix, broken
in 547203ead4 'net: List available netdevs with "-netdev help"',
v2.12.0.

-  {"execute": "netdev_add", "arguments': {... "ipv6-net": "..." }}
no longer attempts to desugar the undocumented ipv6-net magic string
into the proper "ipv6-prefix" and "ipv6-prefixlen".  Undocumented
misfeature, introduced in commit 7aac531ef2 "qapi-schema, qemu-options
& slirp: Adding Qemu options for IPv6 addresses", v2.6.0.

-  {'execute':'netdev_add',
     'arguments':{'id':'net2', 'type':'hubport', 'hubid':"2"}}
   {"error": {"class": "GenericError", "desc": "Invalid parameter type for =
'hubid', expected: integer"}}
Used to succeed: since our command line treats everything as strings,
our not-so-round-trip conversion from QAPI -> QemuOpts -> QAPI lost
the original typing and turned everything into a string; now that we
skip the QemuOpts, the JSON input has to match the exact QAPI type.
But this stricter QMP is desirable, and introspection is sufficient
for any affected applications to make sure they use it correctly.

In qmp_netdev_add(), we still have to create a QemuOpts object so that
qmp_netdev_del() will be able to remove a hotplugged network device;
but the opts->head remains empty since we now manage all parsing
through the QAPI object rather than QemuOpts; a separate patch will
address the abuse of QemuOpts as a witness for whether a
NetClientState is a netdev.  In the meantime, our argument that we are
okay requires auditing all uses of option group "netdev":

- qemu_netdev_opts: option group definition, empty .desc[]
- CLI (CLI netdev parsing ends before monitors start, so while
  monitors can mess with CLI netdevs, CLI cannot mess with
  monitor netdevs):
  - main() case QEMU_OPTION_netdev: store CLI definition
  - main() case QEMU_OPTION_readconfig, case QEMU_OPTION_writeconfig:
  similar, dealing only with CLI
  - net_init_clients(): Pass CLI to net_client_init()
- Monitor:
  - hmp_netdev_add(): straightforward parse into net_client_init()
  - qmp_netdev_add(): subject of this patch, used to add full
  object to option group, now just adds bare-bones id
  - qmp_netdev_del(), netdev_del_completion(): check the option group
  solely for id, as a 'is this a netdev' predicate

Reported-by: Alex Kirillov <lekiravi@yandex-team.ru>
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200317201711.322764-2-eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message typo fixed]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/net.json     | 14 +-------------
 include/net/net.h |  1 -
 monitor/misc.c    |  2 --
 net/net.c         |  6 +++---
 4 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/qapi/net.json b/qapi/net.json
index 1cb9a7d782..cebb1b52e3 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -39,18 +39,8 @@
 #
 # Add a network backend.
 #
-# @type: the type of network backend. Possible values are listed in
-#        NetClientDriver (excluding 'none' and 'nic')
-#
-# @id: the name of the new network backend
-#
 # Additional arguments depend on the type.
 #
-# TODO: This command effectively bypasses QAPI completely due to its
-#       "additional arguments" business.  It shouldn't have been added to
-#       the schema in this form.  It should be qapified properly, or
-#       replaced by a properly qapified command.
-#
 # Since: 0.14.0
 #
 # Returns: Nothing on success
@@ -64,9 +54,7 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'netdev_add',
-  'data': {'type': 'str', 'id': 'str'},
-  'gen': false }                # so we can get the additional arguments
+{ 'command': 'netdev_add', 'data': 'Netdev', 'boxed': true }
=20
 ##
 # @netdev_del:
diff --git a/include/net/net.h b/include/net/net.h
index e175ba9677..96e6eae817 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -203,7 +203,6 @@ void net_cleanup(void);
 void hmp_host_net_add(Monitor *mon, const QDict *qdict);
 void hmp_host_net_remove(Monitor *mon, const QDict *qdict);
 void netdev_add(QemuOpts *opts, Error **errp);
-void qmp_netdev_add(QDict *qdict, QObject **ret, Error **errp);
=20
 int net_hub_id_for_client(NetClientState *nc, int *id);
 NetClientState *net_hub_port_find(int hub_id);
diff --git a/monitor/misc.c b/monitor/misc.c
index c3bc34c099..41a86e7012 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -247,8 +247,6 @@ static void monitor_init_qmp_commands(void)
                          qmp_query_qmp_schema, QCO_ALLOW_PRECONFIG);
     qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
                          QCO_NO_OPTIONS);
-    qmp_register_command(&qmp_commands, "netdev_add", qmp_netdev_add,
-                         QCO_NO_OPTIONS);
     qmp_register_command(&qmp_commands, "object-add", qmp_object_add,
                          QCO_NO_OPTIONS);
=20
diff --git a/net/net.c b/net/net.c
index 9e93c3f8a1..a2065aabed 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1170,7 +1170,7 @@ void netdev_add(QemuOpts *opts, Error **errp)
     net_client_init(opts, true, errp);
 }
=20
-void qmp_netdev_add(QDict *qdict, QObject **ret, Error **errp)
+void qmp_netdev_add(Netdev *netdev, Error **errp)
 {
     Error *local_err =3D NULL;
     QemuOptsList *opts_list;
@@ -1181,12 +1181,12 @@ void qmp_netdev_add(QDict *qdict, QObject **ret, Er=
ror **errp)
         goto out;
     }
=20
-    opts =3D qemu_opts_from_qdict(opts_list, qdict, &local_err);
+    opts =3D qemu_opts_create(opts_list, netdev->id, 1, &local_err);
     if (local_err) {
         goto out;
     }
=20
-    netdev_add(opts, &local_err);
+    net_client_init1(netdev, true, &local_err);
     if (local_err) {
         qemu_opts_del(opts);
         goto out;
--=20
2.21.1


