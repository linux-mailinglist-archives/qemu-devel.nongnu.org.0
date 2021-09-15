Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8940CA34
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:33:49 +0200 (CEST)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXr2-0006Es-1F
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoF-0003JK-6y
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:30:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoD-0004et-H3
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+dODXwNlKPWgaARRULbyeHWIYtNuTcb7CS1ebXs5Soc=;
 b=WdXkcLXcuCzMnkvvt47GEiVPFo7uTUfztgrn01HRx9+t67y4qxEveDMP82l62yrkDNWLap
 7U4VprZmkR+JE55v5Y0iaga1DGklBBefJeYJNOI20OK1MVVs84YIuwcQcJNN0I0sAH3XAN
 Exiag8rkzmbMCTmqUHeWGaGxOhVhOiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-HAYmGxwKPOCM_cGw6Avumw-1; Wed, 15 Sep 2021 12:30:49 -0400
X-MC-Unique: HAYmGxwKPOCM_cGw6Avumw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49F5010168C6;
 Wed, 15 Sep 2021 16:30:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719E1781ED;
 Wed, 15 Sep 2021 16:30:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/27] python/aqmp: add error classes
Date: Wed, 15 Sep 2021 12:29:30 -0400
Message-Id: <20210915162955.333025-3-jsnow@redhat.com>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.39, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 python/qemu/aqmp/__init__.py |  4 +++
 python/qemu/aqmp/error.py    | 50 ++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 python/qemu/aqmp/error.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 391141c948..c97be950bf 100644
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
index 0000000000..781f49b008
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


