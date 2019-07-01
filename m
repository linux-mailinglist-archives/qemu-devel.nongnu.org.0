Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBAB4DA37
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 21:34:00 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he2op-0003Vg-CN
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 15:33:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49682)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1he26Y-0003c0-FO
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1he26U-0000dT-TO
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:48:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55282)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1he26U-0008LQ-L5
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 14:48:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7A77308FB9D
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:47:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-203.ams2.redhat.com
 [10.36.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 775CA5D772;
 Thu, 20 Jun 2019 18:47:12 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, jasowang@redhat.com, eblake@redhat.com,
 armbru@redhat.com, laine@redhat.com
Date: Thu, 20 Jun 2019 19:47:02 +0100
Message-Id: <20190620184706.19988-2-dgilbert@redhat.com>
In-Reply-To: <20190620184706.19988-1-dgilbert@redhat.com>
References: <20190620184706.19988-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 20 Jun 2019 18:47:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 1/5] net/announce: Allow optional list of
 interfaces
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Allow the caller to restrict the set of interfaces that announces are
sent on.  The default is still to send on all interfaces.

e.g.

  { "execute": "announce-self", "arguments": { "initial": 50, "max": 550,=
 "rounds": 5, "step": 50, "interfaces": ["vn2", "vn1"] } }

This doesn't affect the behaviour of migraiton announcments.

Note: There's still only one timer for the qmp command, so that
performing an 'announce-self' on one list of interfaces followed
by another 'announce-self' on another list will stop the announces
on the existing set.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/net/announce.h |  2 +-
 net/announce.c         | 39 ++++++++++++++++++++++++++++++++-------
 net/trace-events       |  2 +-
 qapi/net.json          | 11 ++++++++---
 4 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/include/net/announce.h b/include/net/announce.h
index 04a035f679..773470428b 100644
--- a/include/net/announce.h
+++ b/include/net/announce.h
@@ -22,7 +22,7 @@ struct AnnounceTimer {
 /* Returns: update the timer to the next time point */
 int64_t qemu_announce_timer_step(AnnounceTimer *timer);
=20
-/* Delete the underlying timer */
+/* Delete the underlying timer and other data */
 void qemu_announce_timer_del(AnnounceTimer *timer);
=20
 /*
diff --git a/net/announce.c b/net/announce.c
index 91e9a6e267..1ce42b571d 100644
--- a/net/announce.c
+++ b/net/announce.c
@@ -38,6 +38,8 @@ void qemu_announce_timer_del(AnnounceTimer *timer)
         timer_free(timer->tm);
         timer->tm =3D NULL;
     }
+    qapi_free_strList(timer->params.interfaces);
+    timer->params.interfaces =3D NULL;
 }
=20
 /*
@@ -96,24 +98,47 @@ static int announce_self_create(uint8_t *buf,
=20
 static void qemu_announce_self_iter(NICState *nic, void *opaque)
 {
+    AnnounceTimer *timer =3D opaque;
     uint8_t buf[60];
     int len;
+    bool skip;
+
+    if (timer->params.has_interfaces) {
+        strList *entry =3D timer->params.interfaces;
+        /* Skip unless we find our name in the requested list */
+        skip =3D true;
+
+        while (entry) {
+            if (!strcmp(entry->value, nic->ncs->name)) {
+                /* Found us */
+                skip =3D false;
+                break;
+            }
+            entry =3D entry->next;
+        }
+    } else {
+        skip =3D false;
+    }
+
+    trace_qemu_announce_self_iter(nic->ncs->name,
+                                  qemu_ether_ntoa(&nic->conf->macaddr), =
skip);
=20
-    trace_qemu_announce_self_iter(qemu_ether_ntoa(&nic->conf->macaddr));
-    len =3D announce_self_create(buf, nic->conf->macaddr.a);
+    if (!skip) {
+        len =3D announce_self_create(buf, nic->conf->macaddr.a);
=20
-    qemu_send_packet_raw(qemu_get_queue(nic), buf, len);
+        qemu_send_packet_raw(qemu_get_queue(nic), buf, len);
=20
-    /* if the NIC provides it's own announcement support, use it as well=
 */
-    if (nic->ncs->info->announce) {
-        nic->ncs->info->announce(nic->ncs);
+        /* if the NIC provides it's own announcement support, use it as =
well */
+        if (nic->ncs->info->announce) {
+            nic->ncs->info->announce(nic->ncs);
+        }
     }
 }
 static void qemu_announce_self_once(void *opaque)
 {
     AnnounceTimer *timer =3D (AnnounceTimer *)opaque;
=20
-    qemu_foreach_nic(qemu_announce_self_iter, NULL);
+    qemu_foreach_nic(qemu_announce_self_iter, timer);
=20
     if (--timer->round) {
         qemu_announce_timer_step(timer);
diff --git a/net/trace-events b/net/trace-events
index a7937f3f3a..875ef2a0f3 100644
--- a/net/trace-events
+++ b/net/trace-events
@@ -1,7 +1,7 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
 # announce.c
-qemu_announce_self_iter(const char *mac) "%s"
+qemu_announce_self_iter(const char *name, const char *mac, int skip) "%s=
:%s skip: %d"
=20
 # vhost-user.c
 vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
diff --git a/qapi/net.json b/qapi/net.json
index 5f7bff1637..6f2cd4f530 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -699,6 +699,9 @@
 #
 # @step: Delay increase (in ms) after each self-announcement attempt
 #
+# @interfaces: An optional list of interface names, which restricts the
+#        announcement to the listed interfaces. (Since 4.1)
+#
 # Since: 4.0
 ##
=20
@@ -706,7 +709,8 @@
   'data': { 'initial': 'int',
             'max': 'int',
             'rounds': 'int',
-            'step': 'int' } }
+            'step': 'int',
+            '*interfaces': ['str'] } }
=20
 ##
 # @announce-self:
@@ -718,9 +722,10 @@
 #
 # Example:
 #
-# -> { "execute": "announce-self"
+# -> { "execute": "announce-self",
 #      "arguments": {
-#          "initial": 50, "max": 550, "rounds": 10, "step": 50 } }
+#          "initial": 50, "max": 550, "rounds": 10, "step": 50,
+#          "interfaces": ["vn2", "vn3"] } }
 # <- { "return": {} }
 #
 # Since: 4.0
--=20
2.21.0


