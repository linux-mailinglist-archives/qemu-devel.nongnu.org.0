Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB831D251F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 04:27:16 +0200 (CEST)
Received: from localhost ([::1]:54410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZ3ad-0001Vo-Gf
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 22:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ3ZE-0008Dn-NW
 for qemu-devel@nongnu.org; Wed, 13 May 2020 22:25:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26825
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jZ3ZD-00030A-4K
 for qemu-devel@nongnu.org; Wed, 13 May 2020 22:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589423142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o/oQ44lobvqiuBhXiYhIXYCZQOaFhRvOrcaEPFqbvBk=;
 b=d7LgBGFxAkO0YKBNBdeTeP44AInbnPK1CpR057mU4s8j/qneNc8hm3MOoH2sdkybHYbymI
 rxDbSD+op9JAxvT/cdijDqTmAbbYy8ecPPIt9jI4lfNGwj6CPXfCIXk1yz9TqsJLzxUC9g
 TLem+/Yz/Ik21TNHDxh+itX/rxg9d0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-3Yly26KbOoqicRK756-Kpw-1; Wed, 13 May 2020 22:25:40 -0400
X-MC-Unique: 3Yly26KbOoqicRK756-Kpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE7BC461;
 Thu, 14 May 2020 02:25:39 +0000 (UTC)
Received: from probe.redhat.com (ovpn-113-9.rdu2.redhat.com [10.10.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAE34579AD;
 Thu, 14 May 2020 02:25:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] qmp.py: change event_wait to use a dict
Date: Wed, 13 May 2020 22:25:34 -0400
Message-Id: <20200514022536.2568-2-jsnow@redhat.com>
In-Reply-To: <20200514022536.2568-1-jsnow@redhat.com>
References: <20200514022536.2568-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jsnow@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 22:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's easier to work with than a list of tuples, because we can check the
keys for membership.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py        | 10 +++++-----
 tests/qemu-iotests/040        | 12 ++++++------
 tests/qemu-iotests/260        |  5 +++--
 tests/qemu-iotests/iotests.py | 16 ++++++++--------
 4 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index b9a98e2c86..eaedc25172 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -478,21 +478,21 @@ def event_wait(self, name, timeout=60.0, match=None):
         timeout: QEMUMonitorProtocol.pull_event timeout parameter.
         match: Optional match criteria. See event_match for details.
         """
-        return self.events_wait([(name, match)], timeout)
+        return self.events_wait({name: match}, timeout)
 
     def events_wait(self, events, timeout=60.0):
         """
         events_wait waits for and returns a named event from QMP with a timeout.
 
-        events: a sequence of (name, match_criteria) tuples.
+        events: a mapping containing {name: match_criteria}.
                 The match criteria are optional and may be None.
                 See event_match for details.
         timeout: QEMUMonitorProtocol.pull_event timeout parameter.
         """
         def _match(event):
-            for name, match in events:
-                if event['event'] == name and self.event_match(event, match):
-                    return True
+            name = event['event']
+            if name in events:
+                return self.event_match(event, events[name])
             return False
 
         # Search cached events
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 32c82b4ec6..90b59081ff 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -485,12 +485,12 @@ class TestErrorHandling(iotests.QMPTestCase):
 
     def run_job(self, expected_events, error_pauses_job=False):
         match_device = {'data': {'device': 'job0'}}
-        events = [
-            ('BLOCK_JOB_COMPLETED', match_device),
-            ('BLOCK_JOB_CANCELLED', match_device),
-            ('BLOCK_JOB_ERROR', match_device),
-            ('BLOCK_JOB_READY', match_device),
-        ]
+        events = {
+            'BLOCK_JOB_COMPLETED': match_device,
+            'BLOCK_JOB_CANCELLED': match_device,
+            'BLOCK_JOB_ERROR': match_device,
+            'BLOCK_JOB_READY': match_device,
+        }
 
         completed = False
         log = []
diff --git a/tests/qemu-iotests/260 b/tests/qemu-iotests/260
index 804a7addb9..729f031122 100755
--- a/tests/qemu-iotests/260
+++ b/tests/qemu-iotests/260
@@ -67,8 +67,9 @@ def test(persistent, restart):
 
     vm.qmp_log('block-commit', device='drive0', top=top,
                filters=[iotests.filter_qmp_testfiles])
-    ev = vm.events_wait((('BLOCK_JOB_READY', None),
-                         ('BLOCK_JOB_COMPLETED', None)))
+    ev = vm.events_wait({
+        'BLOCK_JOB_READY': None,
+        'BLOCK_JOB_COMPLETED': None })
     log(filter_qmp_event(ev))
     if (ev['event'] == 'BLOCK_JOB_COMPLETED'):
         vm.shutdown()
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 6c0e781af7..aada94f4f9 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -635,14 +635,14 @@ def run_job(self, job, auto_finalize=True, auto_dismiss=False,
         """
         match_device = {'data': {'device': job}}
         match_id = {'data': {'id': job}}
-        events = [
-            ('BLOCK_JOB_COMPLETED', match_device),
-            ('BLOCK_JOB_CANCELLED', match_device),
-            ('BLOCK_JOB_ERROR', match_device),
-            ('BLOCK_JOB_READY', match_device),
-            ('BLOCK_JOB_PENDING', match_id),
-            ('JOB_STATUS_CHANGE', match_id)
-        ]
+        events = {
+            'BLOCK_JOB_COMPLETED': match_device,
+            'BLOCK_JOB_CANCELLED': match_device,
+            'BLOCK_JOB_ERROR': match_device,
+            'BLOCK_JOB_READY': match_device,
+            'BLOCK_JOB_PENDING': match_id,
+            'JOB_STATUS_CHANGE': match_id,
+        }
         error = None
         while True:
             ev = filter_qmp_event(self.events_wait(events, timeout=wait))
-- 
2.21.1


