Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0386453D2F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 01:36:56 +0100 (CET)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn8wZ-0000J9-GC
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 19:36:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8u7-0006Uo-PX
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8u4-0006wV-F0
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637109259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/ZgvaL4TDUdBm3xnH7GNz2g4x7hJ9fXF1LbEFf+KS4=;
 b=dyf0MiKcLsIyqSc+gz1f0h4veV3oxYrStSZJWPrzZHZ429stlvkGNrAT7vtuK5chGD619f
 GOH4L3zTyFMI6XX9c8rs1MgJqLrIEigtPBEew9P2ZQWg40sSNGuDrXR+PGbMxkVHvkXw5o
 9CoZprsIzOAihA1EJbRthmsQ9fMGZYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-lXqQ6PIlPjqr2pDiW0NkYA-1; Tue, 16 Nov 2021 19:34:18 -0500
X-MC-Unique: lXqQ6PIlPjqr2pDiW0NkYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA4DE8799EB;
 Wed, 17 Nov 2021 00:34:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A687567843;
 Wed, 17 Nov 2021 00:34:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] python/aqmp: Fix disconnect during capabilities negotiation
Date: Tue, 16 Nov 2021 19:33:13 -0500
Message-Id: <20211117003317.2844087-2-jsnow@redhat.com>
In-Reply-To: <20211117003317.2844087-1-jsnow@redhat.com>
References: <20211117003317.2844087-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we receive ConnectionResetError (ECONNRESET) while attempting to
perform capabilities negotiation -- prior to the establishment of the
async reader/writer tasks -- the disconnect function is not aware that
we are in an error pathway.

As a result, when attempting to close the StreamWriter, we'll see the
same ConnectionResetError that caused us to initiate a disconnect in the
first place, which will cause the disconnect task itself to fail, which
emits a CRITICAL logging event.

I still don't know if there's a smarter way to check to see if an
exception received at this point is "the same" exception as the one that
caused the initial disconnect, but for now the problem can be avoided by
improving the error pathway detection in the exit path.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-id: 20211111143719.2162525-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index ae1df24026..860b79512d 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -623,13 +623,21 @@ async def _bh_disconnect(self) -> None:
         def _done(task: Optional['asyncio.Future[Any]']) -> bool:
             return task is not None and task.done()
 
-        # NB: We can't rely on _bh_tasks being done() here, it may not
-        #     yet have had a chance to run and gather itself.
+        # Are we already in an error pathway? If either of the tasks are
+        # already done, or if we have no tasks but a reader/writer; we
+        # must be.
+        #
+        # NB: We can't use _bh_tasks to check for premature task
+        # completion, because it may not yet have had a chance to run
+        # and gather itself.
         tasks = tuple(filter(None, (self._writer_task, self._reader_task)))
         error_pathway = _done(self._reader_task) or _done(self._writer_task)
+        if not tasks:
+            error_pathway |= bool(self._reader) or bool(self._writer)
 
         try:
-            # Try to flush the writer, if possible:
+            # Try to flush the writer, if possible.
+            # This *may* cause an error and force us over into the error path.
             if not error_pathway:
                 await self._bh_flush_writer()
         except BaseException as err:
@@ -639,7 +647,7 @@ def _done(task: Optional['asyncio.Future[Any]']) -> bool:
             self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
             raise
         finally:
-            # Cancel any still-running tasks:
+            # Cancel any still-running tasks (Won't raise):
             if self._writer_task is not None and not self._writer_task.done():
                 self.logger.debug("Cancelling writer task.")
                 self._writer_task.cancel()
@@ -652,7 +660,7 @@ def _done(task: Optional['asyncio.Future[Any]']) -> bool:
                 self.logger.debug("Waiting for tasks to complete ...")
                 await asyncio.wait(tasks)
 
-            # Lastly, close the stream itself. (May raise):
+            # Lastly, close the stream itself. (*May raise*!):
             await self._bh_close_stream(error_pathway)
             self.logger.debug("Disconnected.")
 
-- 
2.31.1


