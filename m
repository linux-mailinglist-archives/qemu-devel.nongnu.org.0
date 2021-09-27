Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB0419F39
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:33:20 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwNL-0001zJ-4h
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwGt-0001vQ-0a
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwGr-0006Zj-Ec
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x8QSKZr/hBDwRAmjIKOvyCJ9OqFQmRmhv6KdaRVQLgg=;
 b=P0Rv78JqYdR1z9cw7q1i83bROGwHdKB3g0iZvJNteKnk+Bj1BCtvPbep+hBrkjTlQvUYt3
 c6Ckm36nIW6FArMLcB7i6G5zDORElnK46DuzZdHznCjY+m/GIelDmdM0/13a2ZMhumdJCH
 /dbGqeNy6yx0ZMyKRyWUpxIq+UJdq1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-44rueu2kOFOhHsi75UxDcw-1; Mon, 27 Sep 2021 15:26:35 -0400
X-MC-Unique: 44rueu2kOFOhHsi75UxDcw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CAA219200C4;
 Mon, 27 Sep 2021 19:26:34 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C8A60871;
 Mon, 27 Sep 2021 19:26:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/32] python/aqmp: add error classes
Date: Mon, 27 Sep 2021 15:24:43 -0400
Message-Id: <20210927192513.744199-3-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210915162955.333025-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |  4 +++
 python/qemu/aqmp/error.py    | 50 ++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 python/qemu/aqmp/error.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 391141c9484..c97be950bf4 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -21,7 +21,11 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
+from .error import AQMPError
+
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
+    # Exceptions
+    'AQMPError',
 )
diff --git a/python/qemu/aqmp/error.py b/python/qemu/aqmp/error.py
new file mode 100644
index 00000000000..781f49b0087
--- /dev/null
+++ b/python/qemu/aqmp/error.py
@@ -0,0 +1,50 @@
+"""
+AQMP Error Classes
+
+This package seeks to provide semantic error classes that are intended
+to be used directly by clients when they would like to handle particular
+semantic failures (e.g. "failed to connect") without needing to know the
+enumeration of possible reasons for that failure.
+
+AQMPError serves as the ancestor for all exceptions raised by this
+package, and is suitable for use in handling semantic errors from this
+library. In most cases, individual public methods will attempt to catch
+and re-encapsulate various exceptions to provide a semantic
+error-handling interface.
+
+.. admonition:: AQMP Exception Hierarchy Reference
+
+ |   `Exception`
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
+    protocol server or as a result of a bug in this library.
+
+    :param error_message: Human-readable string describing the error.
+    """
+    def __init__(self, error_message: str):
+        super().__init__(error_message)
+        #: Human-readable error message, without any prefix.
+        self.error_message: str = error_message
-- 
2.31.1


