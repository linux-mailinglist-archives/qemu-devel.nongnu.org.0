Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B028495
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 19:13:04 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTrH5-0007ZF-Gv
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 13:13:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hTrBK-0003jo-8G
	for qemu-devel@nongnu.org; Thu, 23 May 2019 13:07:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hTrBF-0001fm-4k
	for qemu-devel@nongnu.org; Thu, 23 May 2019 13:07:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hTrB7-0001Zp-Um; Thu, 23 May 2019 13:06:54 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B50187FDFD;
	Thu, 23 May 2019 17:06:51 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6C8B10027C5;
	Thu, 23 May 2019 17:06:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 23 May 2019 13:06:41 -0400
Message-Id: <20190523170643.20794-4-jsnow@redhat.com>
In-Reply-To: <20190523170643.20794-1-jsnow@redhat.com>
References: <20190523170643.20794-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 23 May 2019 17:06:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 3/5] QEMUMachine: add events_wait method
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of event_wait which looks for a single event, add an events_wait
which can look for any number of events simultaneously. However, it
will still only return one at a time, whichever happens first.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/__init__.py | 69 +++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/python/qemu/__init__.py b/python/qemu/__init__.py
index 81d9657ec0..98ed8a2e28 100644
--- a/python/qemu/__init__.py
+++ b/python/qemu/__init__.py
@@ -402,42 +402,71 @@ class QEMUMachine(object):
         self._qmp.clear_events()
         return events
=20
-    def event_wait(self, name, timeout=3D60.0, match=3DNone):
+    @staticmethod
+    def event_match(event, match=3DNone):
         """
-        Wait for specified timeout on named event in QMP; optionally fil=
ter
-        results by match.
+        Check if an event matches optional match criteria.
=20
-        The 'match' is checked to be a recursive subset of the 'event'; =
skips
-        branch processing on match's value None
-           {"foo": {"bar": 1}} matches {"foo": None}
-           {"foo": {"bar": 1}} does not matches {"foo": {"baz": None}}
+        The match criteria takes the form of a matching subdict. The eve=
nt is
+        checked to be a superset of the subdict, recursively, with match=
ing
+        values whenever those values are not None.
+
+        Examples, with the subdict queries on the left:
+         - None matches any object.
+         - {"foo": None} matches {"foo": {"bar": 1}}
+         - {"foo": {"baz": None}} does not match {"foo": {"bar": 1}}
+         - {"foo": {"baz": 2}} matches {"foo": {"bar": 1, "baz": 2}}
         """
-        def event_match(event, match=3DNone):
-            if match is None:
-                return True
+        if match is None:
+            return True
=20
-            for key in match:
-                if key in event:
-                    if isinstance(event[key], dict):
-                        if not event_match(event[key], match[key]):
-                            return False
-                    elif event[key] !=3D match[key]:
+        for key in match:
+            if key in event:
+                if isinstance(event[key], dict):
+                    if not QEMUMachine.event_match(event[key], match[key=
]):
                         return False
-                else:
+                elif event[key] !=3D match[key]:
                     return False
+            else:
+                return False
+        return True
=20
-            return True
+    def event_wait(self, name, timeout=3D60.0, match=3DNone):
+        """
+        event_wait waits for and returns a named event from QMP with a t=
imeout.
+
+        name: The event to wait for.
+        timeout: QEMUMonitorProtocol.pull_event timeout parameter.
+        match: Optional match criteria. See event_match for details.
+        """
+        return self.events_wait([(name, match)], timeout)
+
+    def events_wait(self, events, timeout=3D60.0):
+        """
+        events_wait waits for and returns a named event from QMP with a =
timeout.
+
+        events: a sequence of (name, match_criteria) tuples.
+                The match criteria are optional and may be None.
+                See event_match for details.
+        timeout: QEMUMonitorProtocol.pull_event timeout parameter.
+        """
+        def _match(event):
+            for name, match in events:
+                if (event['event'] =3D=3D name and
+                    self.event_match(event, match)):
+                    return True
+            return False
=20
         # Search cached events
         for event in self._events:
-            if (event['event'] =3D=3D name) and event_match(event, match=
):
+            if _match(event):
                 self._events.remove(event)
                 return event
=20
         # Poll for new events
         while True:
             event =3D self._qmp.pull_event(wait=3Dtimeout)
-            if (event['event'] =3D=3D name) and event_match(event, match=
):
+            if _match(event):
                 return event
             self._events.append(event)
=20
--=20
2.20.1


