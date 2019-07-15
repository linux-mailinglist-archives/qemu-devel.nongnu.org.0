Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419169B3F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 21:13:30 +0200 (CEST)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn6Pg-0006Mf-TB
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 15:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40209)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6PB-0004ii-Om
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6P9-0003nz-N4
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hn6P9-0003n7-H0
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D49E8308A958;
 Mon, 15 Jul 2019 19:12:52 +0000 (UTC)
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49129600C4;
 Mon, 15 Jul 2019 19:12:46 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:09:56 +0400
Message-Id: <20190715191001.1188-16-marcandre.lureau@redhat.com>
In-Reply-To: <20190715191001.1188-1-marcandre.lureau@redhat.com>
References: <20190715191001.1188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 15 Jul 2019 19:12:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 15/20] monitor: add qmp_return_get_monitor()
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If necessary, add an helper that can be used to retrieve the
associated monitor. This is useful for asynchronous commands that may
have to update cur_mon for various reasons.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/monitor/monitor.h |  3 +++
 monitor/qmp.c             | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index a81eeff5f8..6a2907a366 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -4,6 +4,7 @@
 #include "block/block.h"
 #include "qapi/qapi-types-misc.h"
 #include "qemu/readline.h"
+#include "qapi/qmp/dispatch.h"
=20
 extern __thread Monitor *cur_mon;
 typedef struct MonitorHMP MonitorHMP;
@@ -43,4 +44,6 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_=
fd);
 void monitor_fdset_dup_fd_remove(int dup_fd);
 int64_t monitor_fdset_dup_fd_find(int dup_fd);
=20
+Monitor *qmp_return_get_monitor(QmpReturn *qret);
+
 #endif /* MONITOR_H */
diff --git a/monitor/qmp.c b/monitor/qmp.c
index 056ad7b68b..df8b9d8d4f 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -390,3 +390,14 @@ void monitor_init_qmp(Chardev *chr, bool pretty)
         monitor_list_append(&mon->common);
     }
 }
+
+Monitor *qmp_return_get_monitor(QmpReturn *qret)
+{
+    MonitorQMP *mon;
+
+    if (!qret->session) {
+        return NULL;
+    }
+    mon =3D container_of(qret->session, MonitorQMP, session);
+    return &mon->common;
+}
--=20
2.22.0.428.g6d5b264208


