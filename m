Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF44154EE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:02:49 +0200 (CEST)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTD8S-0003V2-6n
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCwB-0001ia-DJ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw9-0006U9-Jv
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MeZyWnc0cR5QiHg2lkrRCQmItqK6lKfPO6oXXUoZ60w=;
 b=bkCmgNKkfT6a/d8ByeNDDisjwrHc2Qt5K9n5XYDYzeH1wzHz2lCPI2m2RUtPFkAh2wLzTz
 diTWJqWvLIVsG6kleHtXVHpdp3HD33HUqQ+6TCgF70VTyH2Tc3PM3VyRfVqnHkl+Y8YDPs
 tq6TJYsV+1f+h3jtCi+4uqNsstSJypg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-89TGEkIlOVizQUxD6CSXQQ-1; Wed, 22 Sep 2021 20:50:04 -0400
X-MC-Unique: 89TGEkIlOVizQUxD6CSXQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CE68145E6;
 Thu, 23 Sep 2021 00:50:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29EB460BF1;
 Thu, 23 Sep 2021 00:50:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/17] python/machine: Handle QMP errors on close more
 meticulously
Date: Wed, 22 Sep 2021 20:49:33 -0400
Message-Id: <20210923004938.3999963-13-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To use the AQMP backend, Machine just needs to be a little more diligent
about what happens when closing a QMP connection. The operation is no
longer a freebie in the async world; it may return errors encountered in
the async bottom half on incoming message receipt, etc.

(AQMP's disconnect, ultimately, serves as the quiescence point where all
async contexts are gathered together, and any final errors reported at
that point.)

Because async QMP continues to check for messages asynchronously, it's
almost certainly likely that the loop will have exited due to EOF after
issuing the last 'quit' command. That error will ultimately be bubbled
up when attempting to close the QMP connection. The manager class here
then is free to discard it -- if it was expected.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Yes, I regret that this class has become quite a dumping ground for
complexity around the exit path. It's in need of a refactor to help
separate out the exception handling and cleanup mechanisms from the
VM-related stuff, but it's not a priority to do that just yet -- but
it's on the list.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 48 +++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 0bd40bc2f76..c33a78a2d9f 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -342,9 +342,15 @@ def _post_shutdown(self) -> None:
         # Comprehensive reset for the failed launch case:
         self._early_cleanup()
 
-        if self._qmp_connection:
-            self._qmp.close()
-            self._qmp_connection = None
+        try:
+            self._close_qmp_connection()
+        except Exception as err:  # pylint: disable=broad-except
+            LOG.warning(
+                "Exception closing QMP connection: %s",
+                str(err) if str(err) else type(err).__name__
+            )
+        finally:
+            assert self._qmp_connection is None
 
         self._close_qemu_log_file()
 
@@ -420,6 +426,31 @@ def _launch(self) -> None:
                                        close_fds=False)
         self._post_launch()
 
+    def _close_qmp_connection(self) -> None:
+        """
+        Close the underlying QMP connection, if any.
+
+        Dutifully report errors that occurred while closing, but assume
+        that any error encountered indicates an abnormal termination
+        process and not a failure to close.
+        """
+        if self._qmp_connection is None:
+            return
+
+        try:
+            self._qmp.close()
+        except EOFError:
+            # EOF can occur as an Exception here when using the Async
+            # QMP backend. It indicates that the server closed the
+            # stream. If we successfully issued 'quit' at any point,
+            # then this was expected. If the remote went away without
+            # our permission, it's worth reporting that as an abnormal
+            # shutdown case.
+            if not self._quit_issued:
+                raise
+        finally:
+            self._qmp_connection = None
+
     def _early_cleanup(self) -> None:
         """
         Perform any cleanup that needs to happen before the VM exits.
@@ -460,9 +491,14 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
         self._early_cleanup()
 
         if self._qmp_connection:
-            if not self._quit_issued:
-                # Might raise ConnectionReset
-                self.qmp('quit')
+            try:
+                if not self._quit_issued:
+                    # May raise ExecInterruptedError or StateError if the
+                    # connection dies or has *already* died.
+                    self.qmp('quit')
+            finally:
+                # Regardless, we want to quiesce the connection.
+                self._close_qmp_connection()
 
         # May raise subprocess.TimeoutExpired
         self._subp.wait(timeout=timeout)
-- 
2.31.1


