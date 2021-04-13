Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEF335E35D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:01:46 +0200 (CEST)
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLU1-0006Bw-Ih
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOc-0001Sg-0C
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOX-0000BB-F6
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618329364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SfeXp++ZNmfkKdeGgfGhy8Bkbe50OiQTtJtWuExrEss=;
 b=OuDMJE8fP0P/0eB+ZICAwP2KfiMuZefD7eW2JnOQbrZPt/v9bBhuumhhyluivHpyYzAFDg
 grhkqQSJCRy1DbOk4mY0Gi/Ka8nvRo0XWtIAXxCIxmMqFH5qPxlyZoPvDnF0m8BVnzVucc
 P+sGyuXxzEE2DNXnvh1Dux9byxWJgb0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-ifCkLrEGMwmVxv8rBOIjhQ-1; Tue, 13 Apr 2021 11:56:01 -0400
X-MC-Unique: ifCkLrEGMwmVxv8rBOIjhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40CDC189C440
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:56:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E2636A034;
 Tue, 13 Apr 2021 15:55:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 2/7] error: Error classes and so on.
Date: Tue, 13 Apr 2021 11:55:48 -0400
Message-Id: <20210413155553.2660523-3-jsnow@redhat.com>
In-Reply-To: <20210413155553.2660523-1-jsnow@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: crosa@redhat.com, John Snow <jsnow@redhat.com>, ehabkost@redhat.com,
 stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

May be somewhat hard to make sense of until you see how these classes
are used later on. Notably, although I have split QMP's functionality
into a "protocol" class and a "QMP" class, representing a separation of
the loop mechanisms and the QMP protocol itself, this file was written
prior to that split and contains both "generic" and "QMP-specific" error
classes.

It will have to be split out later, but for the purposes of an RFC where
I wanted a quick eyeball on design, I thought it wasn't necessary to
clean that up just yet.

The MultiException class might warrant a closer inspection, it's the
"weirdest" thing here. It's intended to be used internally by the
module, but as with all best laid plans, there is always the ability it
will somehow leak out into the caller's space through some unforseen
mechanism.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 error.py | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 error.py

diff --git a/error.py b/error.py
new file mode 100644
index 0000000..f19f8e0
--- /dev/null
+++ b/error.py
@@ -0,0 +1,163 @@
+"""Generic error classes.
+
+This module seeks to provide semantic error classes that are intended to
+be used directly by clients when they would like to handle particular
+semantic failures (e.g. "failed to connect") without needing to know the
+enumeration of possible reasons for that failure.
+
+AQMPError serves as the ancestor for almost all exceptions raised by
+this package, and is suitable for use in handling semantic errors from
+this library. In most cases, individual methods will attempt to catch
+and re-encapsulate various exceptions to provide a semantic
+error-handling interface, though this is not necessarily true of
+internal interfaces.
+
+Some errors are not defined here in this module, but exist alongside
+more specific error domains in other modules. They are listed here for
+convenience anyway.
+
+The error inheritance tree is as follows::
+
+  MultiException
+  AQMPError
+    ProtocolError
+      RawProtocolError
+        DeserializationError
+        UnexpectedTypeError
+      GreetingError
+      NegotiationError
+      MsgProtocolError   (message.py)
+        ObjectTypeError  (message.py)
+        OrphanedError    (message.py)
+        ServerParseError (message.py)
+    ConnectError
+    DisconnectedError
+    StateError
+
+The only exception that is not an `AQMPError` is `MultiException`. It is
+special, and used to encapsulate one-or-more exceptions of an arbitrary
+kind; this exception MAY be raised on disconnect() when there are two or
+more exceptions from the AQMP event loop to report back to the caller.
+
+(The bottom half is designed in such a way that exceptions are attempted
+to be handled internally, but in cases of catastrophic failure, it may
+still occur.)
+
+See `MultiException` and `AsyncProtocol.disconnect()` for more details.
+
+"""
+
+from typing import Iterable, Iterator
+
+
+class AQMPError(Exception):
+    # Don't use this directly: create a subclass.
+    """Base failure for all errors raised by AQMP."""
+
+
+class ProtocolError(AQMPError):
+    """Abstract error class for protocol failures."""
+    def __init__(self, error_message: str):
+        super().__init__()
+        self.error_message = error_message
+
+    def __str__(self) -> str:
+        return f"QMP protocol error: {self.error_message}"
+
+
+class RawProtocolError(ProtocolError):
+    """
+    Abstract error class for low-level parsing failures.
+    """
+    def __init__(self, error_message: str, raw: bytes):
+        super().__init__(error_message)
+        self.raw = raw
+
+    def __str__(self) -> str:
+        return "\n".join([
+            super().__str__(),
+            f"  raw bytes were: {str(self.raw)}",
+        ])
+
+
+class DeserializationError(RawProtocolError):
+    """Incoming message was not understood as JSON."""
+
+
+class UnexpectedTypeError(RawProtocolError):
+    """Incoming message was JSON, but not a JSON object."""
+
+
+class ConnectError(AQMPError):
+    """
+    Initial connection process failed.
+    Always wraps a "root cause" exception that can be interrogated for info.
+    """
+
+
+class GreetingError(ProtocolError):
+    """An exception occurred during the Greeting phase."""
+    def __init__(self, error_message: str, exc: Exception):
+        super().__init__(error_message)
+        self.exc = exc
+
+    def __str__(self) -> str:
+        return (
+            f"QMP protocol error: {self.error_message}\n"
+            f"  Cause: {self.exc!s}\n"
+        )
+
+
+class NegotiationError(ProtocolError):
+    """An exception occurred during the Negotiation phase."""
+    def __init__(self, error_message: str, exc: Exception):
+        super().__init__(error_message)
+        self.exc = exc
+
+    def __str__(self) -> str:
+        return (
+            f"QMP protocol error: {self.error_message}\n"
+            f"  Cause: {self.exc!s}\n"
+        )
+
+
+class DisconnectedError(AQMPError):
+    """
+    Command was not able to be completed; we have been Disconnected.
+
+    This error is raised in response to a pending execution when the
+    back-end is unable to process responses any more.
+    """
+
+
+class StateError(AQMPError):
+    """
+    An API command (connect, execute, etc) was issued at an inappropriate time.
+
+    (e.g. execute() while disconnected; connect() while connected; etc.)
+    """
+
+
+class MultiException(Exception):
+    """
+    Used for multiplexing exceptions.
+
+    This exception is used in the case that errors were encountered in both the
+    Reader and Writer tasks, and we must raise more than one.
+    """
+    def __init__(self, exceptions: Iterable[BaseException]):
+        super().__init__(exceptions)
+        self.exceptions = list(exceptions)
+
+    def __str__(self) -> str:
+        ret = "------------------------------\n"
+        ret += "Multiple Exceptions occurred:\n"
+        ret += "\n"
+        for i, exc in enumerate(self.exceptions):
+            ret += f"{i}) {str(exc)}\n"
+            ret += "\n"
+        ret += "-----------------------------\n"
+        return ret
+
+    def __iter__(self) -> Iterator[BaseException]:
+        return iter(self.exceptions)
-- 
2.30.2


