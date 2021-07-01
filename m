Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4A73B8CD0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:15:04 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyo6R-0002bl-4C
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo4z-0008Gz-61
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo4u-0000co-Ry
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u37O0ssgS4A0aLWMkEpMNTyBmETh8DDdyDuOTHgvjtg=;
 b=ds+KH2PasmcHi4gT/7/PGGo8E6cYR48V4qToUhfveNrm+OfQZCNiDB9Y1cTKrDvdqKQVJh
 y4cmTJbDDL+tzSnQd18rK1YQCgyDQkvDw5ks4cWi0dchbdRURN3z2A4sDx4jjz9JGQKSUi
 28NxP+BD7rSazio6HXL62Hlbf2U4hBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-xtBaVglIOHGtS0_UN-ZfMQ-1; Thu, 01 Jul 2021 00:13:27 -0400
X-MC-Unique: xtBaVglIOHGtS0_UN-ZfMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39EE2801F97;
 Thu,  1 Jul 2021 04:13:26 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E88069CB4;
 Thu,  1 Jul 2021 04:13:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/20] python/aqmp: add error classes
Date: Thu,  1 Jul 2021 00:12:57 -0400
Message-Id: <20210701041313.1696009-5-jsnow@redhat.com>
In-Reply-To: <20210701041313.1696009-1-jsnow@redhat.com>
References: <20210701041313.1696009-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |  7 +++
 python/qemu/aqmp/error.py    | 97 ++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 python/qemu/aqmp/error.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 4c713b3ccf..8e955d784d 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -21,7 +21,14 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
+from .error import AQMPError, MultiException
+
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
+    # Exceptions
+    'AQMPError',
+
+    # Niche topics
+    'MultiException',
 )
diff --git a/python/qemu/aqmp/error.py b/python/qemu/aqmp/error.py
new file mode 100644
index 0000000000..126f77bb5c
--- /dev/null
+++ b/python/qemu/aqmp/error.py
@@ -0,0 +1,97 @@
+"""
+AQMP Error Classes
+
+This package seeks to provide semantic error classes that are intended
+to be used directly by clients when they would like to handle particular
+semantic failures (e.g. "failed to connect") without needing to know the
+enumeration of possible reasons for that failure.
+
+AQMPError serves as the ancestor for *almost* all exceptions raised by
+this package, and is suitable for use in handling semantic errors from
+this library. In most cases, individual public methods will attempt to
+catch and re-encapsulate various exceptions to provide a semantic
+error-handling interface.
+
+.. caution::
+
+    The only exception that is not an `AQMPError` is
+    `MultiException`. It is special, and used to encapsulate one-or-more
+    exceptions of an arbitrary kind; this exception MAY be raised on
+    `disconnect()` when there are two or more exceptions from the AQMP
+    event loop to report back to the caller.
+
+    Every pain has been taken to prevent this circumstance but in
+    certain cases these exceptions may occasionally be (unfortunately)
+    visible. See `MultiException` and `AsyncProtocol.disconnect()` for
+    more details.
+
+
+.. admonition:: AQMP Exception Hierarchy Reference
+
+ |   `Exception`
+ |    +-- `MultiException`
+ |    +-- `AQMPError`
+ |         +-- `ConnectError`
+ |         +-- `StateError`
+ |         +-- `ExecInterruptedError`
+ |         +-- `ExecuteError`
+ |         +-- `ListenerError`
+ |         +-- `ProtocolError`
+ |              +-- `DeserializationError`
+ |              +-- `UnexpectedTypeError`
+ |              +-- `ServerParseError`
+ |              +-- `BadReplyError`
+ |              +-- `GreetingError`
+ |              +-- `NegotiationError`
+"""
+
+from typing import Iterable, Iterator, List
+
+
+class AQMPError(Exception):
+    """Abstract error class for all errors originating from this package."""
+
+
+class ProtocolError(AQMPError):
+    """
+    Abstract error class for protocol failures.
+
+    Semantically, these errors are generally the fault of either the
+    protocol server or as a result of a bug in this this library.
+
+    :param error_message: Human-readable string describing the error.
+    """
+    def __init__(self, error_message: str):
+        super().__init__(error_message)
+        #: Human-readable error message, without any prefix.
+        self.error_message: str = error_message
+
+
+class MultiException(Exception):
+    """
+    Used for multiplexing exceptions.
+
+    This exception is used in the case that errors were encountered in both the
+    Reader and Writer tasks, and we must raise more than one.
+
+    PEP 0654 seeks to remedy this clunky infrastructure, but it will not be
+    available for quite some time -- possibly Python 3.11 or even later.
+
+    :param exceptions: An iterable of `BaseException` objects.
+    """
+    def __init__(self, exceptions: Iterable[BaseException]):
+        super().__init__(exceptions)
+        self._exceptions: List[BaseException] = list(exceptions)
+
+    def __str__(self) -> str:
+        ret = "------------------------------\n"
+        ret += "Multiple Exceptions occurred:\n"
+        ret += "\n"
+        for i, exc in enumerate(self._exceptions):
+            ret += f"{i}) {str(exc)}\n"
+            ret += "\n"
+        ret += "-----------------------------\n"
+        return ret
+
+    def __iter__(self) -> Iterator[BaseException]:
+        return iter(self._exceptions)
-- 
2.31.1


