Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4748DED
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 21:17:53 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcx8b-00058q-29
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 15:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40444)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hcwh2-0001e1-Nd
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:49:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hcwh1-0007tL-K0
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:49:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36896)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hcwh1-0007iQ-EJ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:49:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D83EB81133
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 18:49:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-177.ams2.redhat.com
 [10.36.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3701A617B6;
 Mon, 17 Jun 2019 18:49:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 650CF1133070; Mon, 17 Jun 2019 20:49:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 20:48:53 +0200
Message-Id: <20190617184903.19436-7-armbru@redhat.com>
In-Reply-To: <20190617184903.19436-1-armbru@redhat.com>
References: <20190617184903.19436-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 17 Jun 2019 18:49:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/16] monitor: Remove Monitor.cmd_table
 indirection
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

Monitor.cmd_table is initialised to point to mon_cmds and never changed
afterwards. We can remove the indirection and just reference mon_cmds
directly instead.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20190613153405.24769-6-kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/monitor.c b/monitor.c
index 7c57308e2a..6fb9fa285c 100644
--- a/monitor.c
+++ b/monitor.c
@@ -193,7 +193,6 @@ struct Monitor {
     bool use_io_thread;
=20
     gchar *mon_cpu_path;
-    mon_cmd_t *cmd_table;
     QTAILQ_ENTRY(Monitor) entry;
=20
     /*
@@ -722,8 +721,6 @@ static void monitor_data_init(Monitor *mon, int flags=
, bool skip_flush,
     }
     qemu_mutex_init(&mon->mon_lock);
     mon->outbuf =3D qstring_new();
-    /* Use *mon_cmds by default. */
-    mon->cmd_table =3D mon_cmds;
     mon->skip_flush =3D skip_flush;
     mon->use_io_thread =3D use_io_thread;
     mon->flags =3D flags;
@@ -1024,7 +1021,7 @@ static void help_cmd(Monitor *mon, const char *name=
)
     }
=20
     /* 2. dump the contents according to parsed args */
-    help_cmd_dump(mon, mon->cmd_table, args, nb_args, 0);
+    help_cmd_dump(mon, mon_cmds, args, nb_args, 0);
=20
     free_cmdline_args(args, nb_args);
 }
@@ -3485,7 +3482,7 @@ static void handle_hmp_command(MonitorHMP *mon, con=
st char *cmdline)
=20
     trace_handle_hmp_command(mon, cmdline);
=20
-    cmd =3D monitor_parse_command(mon, cmdline, &cmdline, mon->common.cm=
d_table);
+    cmd =3D monitor_parse_command(mon, cmdline, &cmdline, mon_cmds);
     if (!cmd) {
         return;
     }
@@ -4132,7 +4129,7 @@ static void monitor_find_completion(void *opaque,
     }
=20
     /* 2. auto complete according to args */
-    monitor_find_completion_by_table(mon, mon->common.cmd_table, args, n=
b_args);
+    monitor_find_completion_by_table(mon, mon_cmds, args, nb_args);
=20
 cleanup:
     free_cmdline_args(args, nb_args);
--=20
2.21.0


