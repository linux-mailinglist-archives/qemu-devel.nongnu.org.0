Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E7144D875
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:40:43 +0100 (CET)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBFq-00036I-4F
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:40:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCo-0000Ag-92
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCj-0001hD-B6
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636641448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qY4upYWS8hPnrIm8t2+NyXtekIArIbHOy0K07wFea0=;
 b=gXiwIvpFAweMexTZoj8rEt+JrPAhvCeCZCLqObXD4HWlJaw/x5GRm7tPXK0brbXuq1Ksa4
 oe2DGMwKz/VxwVnfdYFlDK5lyz6oIdfTQHBrdla4aWxClvqTgU+FWMsoA8OjgzKO389oca
 6OY+Hb6I7pixPR7MJIEj2i3IVejNZJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-5tdwqEc7N32t04z31ZM4Bw-1; Thu, 11 Nov 2021 09:37:25 -0500
X-MC-Unique: 5tdwqEc7N32t04z31ZM4Bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA898804145
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:37:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8A6F60C17;
 Thu, 11 Nov 2021 14:37:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] python/aqmp: Fix disconnect during capabilities
 negotiation
Date: Thu, 11 Nov 2021 09:37:15 -0500
Message-Id: <20211111143719.2162525-2-jsnow@redhat.com>
In-Reply-To: <20211111143719.2162525-1-jsnow@redhat.com>
References: <20211111143719.2162525-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
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


