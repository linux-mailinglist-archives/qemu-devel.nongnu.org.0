Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AD03CC034
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:35:04 +0200 (CEST)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YIJ-000703-DT
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGW-0004NW-6U
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGU-0006AY-Bu
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626481989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTKmvoxlcxTvWFsICtk12I6/nniANcrb9/X8XAdE40k=;
 b=Hqm394GYg4yILTKri62I6WYjf7BbpwFuLJbD43e7XtZ6jH+og76BK3mpojHaUav+MGLqaD
 7Yvv22zfyD6H8Zu+hjhlx17EgpzBZVVvGxS0RLxUvQgmoB2xhmc5OpPRA2pRS/L5ghq2qm
 w70/nH3NUqC8zpH3Bnna3JrHhLQQiqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-ID-t_HzHMGmy2z6CZLHLlQ-1; Fri, 16 Jul 2021 20:33:06 -0400
X-MC-Unique: ID-t_HzHMGmy2z6CZLHLlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E39C1084F55;
 Sat, 17 Jul 2021 00:33:05 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC8F5C1A1;
 Sat, 17 Jul 2021 00:33:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/24] python/aqmp: add error classes
Date: Fri, 16 Jul 2021 20:32:31 -0400
Message-Id: <20210717003253.457418-3-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-1-jsnow@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
index 00000000000..5bdfdbfbda4
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
+    protocol server or as a result of a bug in this this library.
+
+    :param error_message: Human-readable string describing the error.
+    """
+    def __init__(self, error_message: str):
+        super().__init__(error_message)
+        #: Human-readable error message, without any prefix.
+        self.error_message: str = error_message
-- 
2.31.1


