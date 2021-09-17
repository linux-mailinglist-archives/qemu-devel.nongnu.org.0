Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8EC40F1C4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:51:30 +0200 (CEST)
Received: from localhost ([::1]:53056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6mX-0002yP-6C
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cr-00058M-NP
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6ci-0003Yf-FV
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zH5F3uen7nd7ziiWf9KhG96id2plwtBUemPAKgK2NTg=;
 b=eLt/8p/k6bUa87AeiO9lXEOpoPywkdRnWL4lVjOUgA4GX/vsV1N8Rcy+Ymb+EPoplbRITv
 LQCIKza5OATJSnYTOwuLpmbavFelKAMAb+QIzk6BmwIDNlCzVyfFuUvkNOdunxqmiQXjC4
 LdpEwrWLCA3H8tYs+U+iRzQy1TNMASA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-0UeBdukINGCIweDYjEFo0Q-1; Fri, 17 Sep 2021 01:41:18 -0400
X-MC-Unique: 0UeBdukINGCIweDYjEFo0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90E18802936;
 Fri, 17 Sep 2021 05:41:17 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2369B7A8CE;
 Fri, 17 Sep 2021 05:41:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] python/machine: Add support for AQMP backend
Date: Fri, 17 Sep 2021 01:40:42 -0400
Message-Id: <20210917054047.2042843-11-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
longer a freebie in the async world.

Because async QMP continues to check for messages asynchronously, it's
almost certainly likely that the loop will have exited due to EOF after
issuing the last 'quit' command. That error will ultimately be bubbled
up when attempting to close the QMP connection. The manager class here
then is free to discard it if it was expected.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Yes, I regret that this class has become quite a dumping ground for
complexity around the exit path. It's in need of a refactor to help
separate out the exception handling and cleanup mechanisms from the
VM-related stuff, but it's not a priority to do that just yet -- but
it's on the list.

---
 python/qemu/machine/machine.py | 51 ++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 5 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 6e58d2f951..8f5a6649e5 100644
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
+            if not self._has_quit:
+                raise
+        finally:
+            self._qmp_connection = None
+
     def _early_cleanup(self) -> None:
         """
         Perform any cleanup that needs to happen before the VM exits.
@@ -461,8 +492,18 @@ def _soft_shutdown(self, timeout: Optional[int]) -> None:
 
         if self._qmp_connection:
             if not self._has_quit:
-                # Might raise ConnectionReset
-                self.qmp('quit')
+                try:
+                    # May raise ExecInterruptedError or StateError if the
+                    # connection dies or has already died.
+                    self.qmp('quit')
+                finally:
+                    # If 'quit' fails, we'll still want to call close(),
+                    # which will raise any final errors that may have
+                    # occurred while trying to send 'quit'.
+                    self._close_qmp_connection()
+            else:
+                # Regardless, we want to tidy up the socket.
+                self._close_qmp_connection()
 
         # May raise subprocess.TimeoutExpired
         self._subp.wait(timeout=timeout)
-- 
2.31.1


