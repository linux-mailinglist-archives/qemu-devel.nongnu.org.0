Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565FB3DF4C3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:32:28 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzDF-0007D4-Ca
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAt-0004JC-5C
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAq-0005tS-FL
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxWf8WTKPzHtUS+gX1k11NtQmEfyg9XPu4XqbFDUGm4=;
 b=US9SU7WN9Gt9vUIsoszOOuzzSvgda7ziy+R2X3oi4y3ceKOdLgTBFrCXndfB2G9fJMCoI8
 do5Wfyjx5RM/Eio8wZHh19hXsTiaF9XEcN7OpVGfGl/njVjM3H2Ynu0YmabZvJuu16uvuT
 Mz+Zt75Ote4bnptu3MIw4pBDUh0kSBw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-yV6K1RBpOci4wCiILG_eTg-1; Tue, 03 Aug 2021 14:29:54 -0400
X-MC-Unique: yV6K1RBpOci4wCiILG_eTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CEA2802C94;
 Tue,  3 Aug 2021 18:29:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CAF760854;
 Tue,  3 Aug 2021 18:29:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/25] python/aqmp: add error classes
Date: Tue,  3 Aug 2021 14:29:18 -0400
Message-Id: <20210803182941.504537-3-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


