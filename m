Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CC1EEC11
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 22:33:42 +0200 (CEST)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgwYX-0004UN-TW
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 16:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgwO6-0004Kf-Kk
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 16:22:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53657
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jgwO3-0005WX-OQ
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 16:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591302171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KLpOdLFRQ8+uXdCSQXpzvYPo1r1s8rRuu7oCr7CpY+0=;
 b=Ewmvnt5ZYjKlmXXpZ5ggr7+ia3bCh7+2a174K7RSl25Q4uLGUEKXI4BKewLX0B4WTPQPfE
 49Oz+jryobsycpw8STRnAsxVwo0SDtvAZ7am+Jyiiy9MNZpRREWSLErpCEm2Ka2csLXjQE
 gpXJLgI/xLjK5gv9bNN/rbh1D7KiWAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-YG4j5GiXPdey1Urh2tqS0g-1; Thu, 04 Jun 2020 16:22:48 -0400
X-MC-Unique: YG4j5GiXPdey1Urh2tqS0g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE1A719200C1;
 Thu,  4 Jun 2020 20:22:47 +0000 (UTC)
Received: from probe.redhat.com (ovpn-117-188.rdu2.redhat.com [10.10.117.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D492B5D9D7;
 Thu,  4 Jun 2020 20:22:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/16] python/machine.py: Handle None events in events_wait
Date: Thu,  4 Jun 2020 16:22:30 -0400
Message-Id: <20200604202236.25039-11-jsnow@redhat.com>
In-Reply-To: <20200604202236.25039-1-jsnow@redhat.com>
References: <20200604202236.25039-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 12:22:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the timeout is 0, we can get None back. Handle this explicitly.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 92528a44097..4afd67a9351 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -33,7 +33,7 @@
 from types import TracebackType
 
 from . import qmp
-from .qmp import SocketAddrT
+from .qmp import SocketAddrT, QMPMessage
 
 LOG = logging.getLogger(__name__)
 
@@ -544,13 +544,20 @@ def event_wait(self, name, timeout=60.0, match=None):
 
     def events_wait(self, events, timeout=60.0):
         """
-        events_wait waits for and returns a named event
-        from QMP with a timeout.
+        events_wait waits for and returns a single named event from QMP.
+        In the case of multiple qualifying events, this function returns the
+        first one.
 
-        events: a sequence of (name, match_criteria) tuples.
-                The match criteria are optional and may be None.
-                See event_match for details.
-        timeout: QEMUMonitorProtocol.pull_event timeout parameter.
+        :param events: A sequence of (name, match_criteria) tuples.
+                       The match criteria are optional and may be None.
+                       See event_match for details.
+        :param timeout: Optional timeout, in seconds.
+                        See QEMUMonitorProtocol.pull_event.
+
+        :raise QMPTimeoutError: If timeout was non-zero and no matching events
+                                were found.
+        :return: A QMP event matching the filter criteria.
+                 If timeout was 0 and no event matched, None.
         """
         def _match(event):
             for name, match in events:
@@ -558,6 +565,8 @@ def _match(event):
                     return True
             return False
 
+        event: Optional[QMPMessage]
+
         # Search cached events
         for event in self._events:
             if _match(event):
@@ -567,6 +576,10 @@ def _match(event):
         # Poll for new events
         while True:
             event = self._qmp.pull_event(wait=timeout)
+            if event is None:
+                # NB: None is only returned when timeout is false-ish.
+                # Timeouts raise QMPTimeoutError instead!
+                break
             if _match(event):
                 return event
             self._events.append(event)
-- 
2.21.3


