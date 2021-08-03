Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B23DF4DD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:40:21 +0200 (CEST)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzKu-0007jK-7E
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzB0-0004Ng-1J
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAy-00060u-DP
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eidxue5oEp+cN2x+r7HuQyHzFtOYW543LrfqaSjPYsA=;
 b=gImWKTt/jQL80vzAZwk9tqRQvVO5OXKZDklr2v/gCp7eqcDJckceC4cgrjCjNqFS2Mglpr
 l/tv9Pbpa6S4RMR2uqwB9gq+IKx7nR8wQHdXAqaDF2FluZ/SDHSMPINmsqNvn9okDF+bqB
 Q1CJdvC+vKJPh7CDFz7B6AqJeLIYWIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-UUBqjWyFMm6CSjpo6XMLRg-1; Tue, 03 Aug 2021 14:30:01 -0400
X-MC-Unique: UUBqjWyFMm6CSjpo6XMLRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8838B80124F;
 Tue,  3 Aug 2021 18:30:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56BF060854;
 Tue,  3 Aug 2021 18:29:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/25] python/aqmp: Add logging utility helpers
Date: Tue,  3 Aug 2021 14:29:23 -0400
Message-Id: <20210803182941.504537-8-jsnow@redhat.com>
In-Reply-To: <20210803182941.504537-1-jsnow@redhat.com>
References: <20210803182941.504537-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index 5b8f968969d..52a15321889 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -4,10 +4,15 @@
 This module provides asyncio utilities and compatibility wrappers for
 Python 3.6 to provide some features that otherwise become available in
 Python 3.7+.
+
+Various logging and debugging utilities are also provided, such as
+`exception_summary()` and `pretty_traceback()`, used primarily for
+adding information into the logging stream.
 """
 
 import asyncio
 import sys
+import traceback
 from typing import (
     Any,
     Coroutine,
@@ -140,3 +145,54 @@ async def wait_closed(writer: asyncio.StreamWriter) -> None:
 
     while sock.fileno() != -1:
         await asyncio.sleep(0)
+
+
+# ----------------------------
+# Section: Logging & Debugging
+# ----------------------------
+
+
+def exception_summary(exc: BaseException) -> str:
+    """
+    Return a summary string of an arbitrary exception.
+
+    It will be of the form "ExceptionType: Error Message", if the error
+    string is non-empty, and just "ExceptionType" otherwise.
+    """
+    name = type(exc).__qualname__
+    smod = type(exc).__module__
+    if smod not in ("__main__", "builtins"):
+        name = smod + '.' + name
+
+    error = str(exc)
+    if error:
+        return f"{name}: {error}"
+    return name
+
+
+def pretty_traceback(prefix: str = "  | ") -> str:
+    """
+    Formats the current traceback, indented to provide visual distinction.
+
+    This is useful for printing a traceback within a traceback for
+    debugging purposes when encapsulating errors to deliver them up the
+    stack; when those errors are printed, this helps provide a nice
+    visual grouping to quickly identify the parts of the error that
+    belong to the inner exception.
+
+    :param prefix: The prefix to append to each line of the traceback.
+    :return: A string, formatted something like the following::
+
+      | Traceback (most recent call last):
+      |   File "foobar.py", line 42, in arbitrary_example
+      |     foo.baz()
+      | ArbitraryError: [Errno 42] Something bad happened!
+    """
+    output = "".join(traceback.format_exception(*sys.exc_info()))
+
+    exc_lines = []
+    for line in output.split('\n'):
+        exc_lines.append(prefix + line)
+
+    # The last line is always empty, omit it
+    return "\n".join(exc_lines[:-1])
-- 
2.31.1


