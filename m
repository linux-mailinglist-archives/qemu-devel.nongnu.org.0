Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C940CAD4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:41:44 +0200 (CEST)
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXyh-0005Hr-8s
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoQ-0003oH-Cu
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoM-0004lK-45
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXHsPYv7yzGmcBGhDoGoM/75mUWySIBR24tP43mCGVI=;
 b=Uh7KynBF/qzHxluSFEw0/pVlV0O9TSJQYL0lcnE1Xvz4Bh7V320pFSblvtxKPCif/Iyc7z
 iEyA4luYfB1zxLq+dJn8Er0jcT3alYX78EDZ69cLvRs7agRvjQq/H65nzPyniAZhEkspPQ
 lXqG0CyLCfOSENFNr9v3t0R7tChz5s4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-lLZvOc7qOy23apAhg30Fog-1; Wed, 15 Sep 2021 12:30:59 -0400
X-MC-Unique: lLZvOc7qOy23apAhg30Fog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AFB0100CCC7;
 Wed, 15 Sep 2021 16:30:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2295F7771A;
 Wed, 15 Sep 2021 16:30:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/27] python/aqmp: Add logging utility helpers
Date: Wed, 15 Sep 2021 12:29:35 -0400
Message-Id: <20210915162955.333025-8-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 python/qemu/aqmp/util.py | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index 5b8f968969..52a1532188 100644
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


