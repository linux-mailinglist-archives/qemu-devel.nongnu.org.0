Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EB14C504C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:04:29 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhlM-0005au-DD
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:04:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhK-0002lX-1b
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhF-0004wb-FN
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bKbqBN7XGJXoV7Kpeu80t1zlUuWYnDOHVppKDoKiQU=;
 b=I0T86XpPh3w5lTWoe47coJUjAfCOzuE4LVidpHlGG/72wnQkHgq84eBbUSnC2JCYzJMdaH
 MiNFdle9CpFnQREb696kmAlB5nriYKAYbBv8RRbFk1k1UYMJlrZFxv3B2MVBNuTccDa5dk
 mAdT0vnXNECJekkvJA3kAqQDbVAQcV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-LyHc37dPMCWVYy8NEBhHXA-1; Fri, 25 Feb 2022 16:00:11 -0500
X-MC-Unique: LyHc37dPMCWVYy8NEBhHXA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60C50801DDC;
 Fri, 25 Feb 2022 21:00:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 334251081357;
 Fri, 25 Feb 2022 21:00:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] python/aqmp: add _session_guard()
Date: Fri, 25 Feb 2022 15:59:39 -0500
Message-Id: <20220225205948.3693480-2-jsnow@redhat.com>
In-Reply-To: <20220225205948.3693480-1-jsnow@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In _new_session, there's a fairly complex except clause that's used to
give semantic errors to callers of accept() and connect(). We need to
create a new two-step replacement for accept(), so factoring out this
piece of logic will be useful.

Bolster the comments and docstring here to try and demystify what's
going on in this fairly delicate piece of Python magic.

(If we were using Python 3.7+, this would be an @asynccontextmanager. We
don't have that very nice piece of magic, however, so this must take an
Awaitable to manage the Exception contexts properly. We pay the price
for platform compatibility.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 89 +++++++++++++++++++++++++-----------
 1 file changed, 62 insertions(+), 27 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 33358f5cd7..009883f64d 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -317,6 +317,62 @@ async def disconnect(self) -> None:
     # Section: Session machinery
     # --------------------------
 
+    async def _session_guard(self, coro: Awaitable[None], emsg: str) -> None:
+        """
+        Async guard function used to roll back to `IDLE` on any error.
+
+        On any Exception, the state machine will be reset back to
+        `IDLE`. Most Exceptions will be wrapped with `ConnectError`, but
+        `BaseException` events will be left alone (This includes
+        asyncio.CancelledError, even prior to Python 3.8).
+
+        :param error_message:
+            Human-readable string describing what connection phase failed.
+
+        :raise BaseException:
+            When `BaseException` occurs in the guarded block.
+        :raise ConnectError:
+            When any other error is encountered in the guarded block.
+        """
+        # Note: After Python 3.6 support is removed, this should be an
+        # @asynccontextmanager instead of accepting a callback.
+        try:
+            await coro
+        except BaseException as err:
+            self.logger.error("%s: %s", emsg, exception_summary(err))
+            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
+            try:
+                # Reset the runstate back to IDLE.
+                await self.disconnect()
+            except:
+                # We don't expect any Exceptions from the disconnect function
+                # here, because we failed to connect in the first place.
+                # The disconnect() function is intended to perform
+                # only cannot-fail cleanup here, but you never know.
+                emsg = (
+                    "Unexpected bottom half exception. "
+                    "This is a bug in the QMP library. "
+                    "Please report it to <qemu-devel@nongnu.org> and "
+                    "CC: John Snow <jsnow@redhat.com>."
+                )
+                self.logger.critical("%s:\n%s\n", emsg, pretty_traceback())
+                raise
+
+            # CancelledError is an Exception with special semantic meaning;
+            # We do NOT want to wrap it up under ConnectError.
+            # NB: CancelledError is not a BaseException before Python 3.8
+            if isinstance(err, asyncio.CancelledError):
+                raise
+
+            # Any other kind of error can be treated as some kind of connection
+            # failure broadly. Inspect the 'exc' field to explore the root
+            # cause in greater detail.
+            if isinstance(err, Exception):
+                raise ConnectError(emsg, err) from err
+
+            # Raise BaseExceptions un-wrapped, they're more important.
+            raise
+
     @property
     def _runstate_event(self) -> asyncio.Event:
         # asyncio.Event() objects should not be created prior to entrance into
@@ -371,34 +427,13 @@ async def _new_session(self,
         """
         assert self.runstate == Runstate.IDLE
 
-        try:
-            phase = "connection"
-            await self._establish_connection(address, ssl, accept)
+        await self._session_guard(
+            self._establish_connection(address, ssl, accept),
+            'Failed to establish connection')
 
-            phase = "session"
-            await self._establish_session()
-
-        except BaseException as err:
-            emsg = f"Failed to establish {phase}"
-            self.logger.error("%s: %s", emsg, exception_summary(err))
-            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
-            try:
-                # Reset from CONNECTING back to IDLE.
-                await self.disconnect()
-            except:
-                emsg = "Unexpected bottom half exception"
-                self.logger.critical("%s:\n%s\n", emsg, pretty_traceback())
-                raise
-
-            # NB: CancelledError is not a BaseException before Python 3.8
-            if isinstance(err, asyncio.CancelledError):
-                raise
-
-            if isinstance(err, Exception):
-                raise ConnectError(emsg, err) from err
-
-            # Raise BaseExceptions un-wrapped, they're more important.
-            raise
+        await self._session_guard(
+            self._establish_session(),
+            'Failed to establish session')
 
         assert self.runstate == Runstate.RUNNING
 
-- 
2.34.1


