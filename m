Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5E48E41
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 21:23:09 +0200 (CEST)
Received: from localhost ([::1]:51440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcxDh-0000sL-1y
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 15:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hcwhB-0001yI-DZ
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hcwhA-00081C-90
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:49:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60918)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hcwhA-0007lR-3C
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 14:49:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 30B48223890
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 18:49:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-177.ams2.redhat.com
 [10.36.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3629795B1;
 Mon, 17 Jun 2019 18:49:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 89EB41133025; Mon, 17 Jun 2019 20:49:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 20:49:03 +0200
Message-Id: <20190617184903.19436-17-armbru@redhat.com>
In-Reply-To: <20190617184903.19436-1-armbru@redhat.com>
References: <20190617184903.19436-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 17 Jun 2019 18:49:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 16/16] vl: Deprecate -mon pretty=... for HMP
 monitors
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

The -mon pretty=3Don|off switch of the -mon option applies only to QMP
monitors. It's silently ignored for HMP. Deprecate this combination so
that we can make it an error in future versions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20190613153405.24769-16-kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-deprecated.texi |  6 ++++++
 vl.c                 | 10 +++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 50292d820b..df04f2840b 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -72,6 +72,12 @@ backend settings instead of environment variables.  To=
 ease migration to
 the new format, the ``-audiodev-help'' option can be used to convert
 the current values of the environment variables to ``-audiodev'' options=
.
=20
+@subsection -mon ...,control=3Dreadline,pretty=3Don|off (since 4.1)
+
+The @code{pretty=3Don|off} switch has no effect for HMP monitors, but is
+silently ignored. Using the switch with HMP monitors will become an
+error in the future.
+
 @subsection -realtime (since 4.1)
=20
 The @code{-realtime mlock=3Don|off} argument has been replaced by the
diff --git a/vl.c b/vl.c
index 32daa434eb..99a56b5556 100644
--- a/vl.c
+++ b/vl.c
@@ -2317,6 +2317,10 @@ static int mon_init_func(void *opaque, QemuOpts *o=
pts, Error **errp)
         return -1;
     }
=20
+    if (!qmp && qemu_opt_get(opts, "pretty")) {
+        warn_report("'pretty' is deprecated for HMP monitors, it has no =
effect "
+                    "and will be removed in future versions");
+    }
     if (qemu_opt_get_bool(opts, "pretty", 0)) {
         pretty =3D true;
     }
@@ -2362,7 +2366,11 @@ static void monitor_parse(const char *optarg, cons=
t char *mode, bool pretty)
     opts =3D qemu_opts_create(qemu_find_opts("mon"), label, 1, &error_fa=
tal);
     qemu_opt_set(opts, "mode", mode, &error_abort);
     qemu_opt_set(opts, "chardev", label, &error_abort);
-    qemu_opt_set_bool(opts, "pretty", pretty, &error_abort);
+    if (!strcmp(mode, "control")) {
+        qemu_opt_set_bool(opts, "pretty", pretty, &error_abort);
+    } else {
+        assert(pretty =3D=3D false);
+    }
     monitor_device_index++;
 }
=20
--=20
2.21.0


