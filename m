Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041140F1C2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:49:53 +0200 (CEST)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6ky-0007xQ-Mo
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cj-00052o-W9
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6ch-0003Xc-Op
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nytUlpDt/0b7IeqzHQ7da7PtUsm6ynnJqoV7SyXO5g8=;
 b=WLthcK0tXQQjLJQ3RwN8pZgFXs/r6PtE7o3q32Q5S8hZwLgZ28o/e/UGPoFNNJ3I+7H1vN
 BGCz2+i6r1FEcJN7ONumnrrHrpsdYtohnq2y4rCRHAduOapdeAxHM9HEBVywOwAVuAx5ok
 rLrJ5fqqPywpzXnz2RJiqbAaZ0JyijA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-HuevqPZ3NEib5KRQNLT8zA-1; Fri, 17 Sep 2021 01:41:15 -0400
X-MC-Unique: HuevqPZ3NEib5KRQNLT8zA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70DA71800D41;
 Fri, 17 Sep 2021 05:41:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DBD060843;
 Fri, 17 Sep 2021 05:41:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/15] python/aqmp: Create MessageModel and StandaloneModel
 classes
Date: Fri, 17 Sep 2021 01:40:40 -0400
Message-Id: <20210917054047.2042843-9-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows 'Greeting' to be subclass of 'Message'. We need the adapter
classes to avoid some typing problems that occur if we try to put too
much into the 'Model' class itself; the exact details of why are left as
an exercise to the reader.

Why bother? This makes 'Greeting' ⊆ 'Message', which is taxonomically
true; but the real motivation is to be able to inherit and abuse all of
the Mapping dunders so that we can call dict(greeting) or
bytes(greeting), for example.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/models.py | 67 ++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/python/qemu/aqmp/models.py b/python/qemu/aqmp/models.py
index 24c94123ac..eaeeebc25c 100644
--- a/python/qemu/aqmp/models.py
+++ b/python/qemu/aqmp/models.py
@@ -15,23 +15,22 @@
     Sequence,
 )
 
+from .message import Message
+
 
 class Model:
     """
-    Abstract data model, representing some QMP object of some kind.
-
-    :param raw: The raw object to be validated.
-    :raise KeyError: If any required fields are absent.
-    :raise TypeError: If any required fields have the wrong type.
+    Abstract data model, representing a QMP object of some kind.
     """
-    def __init__(self, raw: Mapping[str, Any]):
-        self._raw = raw
+    @property
+    def _raw(self) -> Mapping[str, Any]:
+        raise NotImplementedError
 
     def _check_key(self, key: str) -> None:
         if key not in self._raw:
             raise KeyError(f"'{self._name}' object requires '{key}' member")
 
-    def _check_value(self, key: str, type_: type, typestr: str) -> None:
+    def _check_type(self, key: str, type_: type, typestr: str) -> None:
         assert key in self._raw
         if not isinstance(self._raw[key], type_):
             raise TypeError(
@@ -40,7 +39,7 @@ def _check_value(self, key: str, type_: type, typestr: str) -> None:
 
     def _check_member(self, key: str, type_: type, typestr: str) -> None:
         self._check_key(key)
-        self._check_value(key, type_, typestr)
+        self._check_type(key, type_, typestr)
 
     @property
     def _name(self) -> str:
@@ -50,7 +49,37 @@ def __repr__(self) -> str:
         return f"{self._name}({self._raw!r})"
 
 
-class Greeting(Model):
+class MessageModel(Message, Model):
+    """
+    Abstract data model, representing a QMP Message of some sort.
+
+    Adapter class that glues together `Model` and `Message`.
+    """
+    def __init__(self, raw: Mapping[str, object]):
+        super().__init__(raw)
+
+    @property
+    def _raw(self) -> Mapping[str, Any]:
+        return self._object
+
+    def __setitem__(self, key: str, value: object) -> None:
+        # This is not good OO, but this turns off mutability here.
+        raise RuntimeError("Cannot mutate MessageModel")
+
+
+class StandaloneModel(Model):
+    """
+    Abstract data model, representing a (non-Message) QMP object of some sort.
+    """
+    def __init__(self, raw: Mapping[str, object]):
+        self._raw_mapping = raw
+
+    @property
+    def _raw(self) -> Mapping[str, Any]:
+        return self._raw_mapping
+
+
+class Greeting(MessageModel):
     """
     Defined in qmp-spec.txt, section 2.2, "Server Greeting".
 
@@ -58,8 +87,9 @@ class Greeting(Model):
     :raise KeyError: If any required fields are absent.
     :raise TypeError: If any required fields have the wrong type.
     """
-    def __init__(self, raw: Mapping[str, Any]):
+    def __init__(self, raw: Mapping[str, object]):
         super().__init__(raw)
+
         #: 'QMP' member
         self.QMP: QMPGreeting  # pylint: disable=invalid-name
 
@@ -67,7 +97,7 @@ def __init__(self, raw: Mapping[str, Any]):
         self.QMP = QMPGreeting(self._raw['QMP'])
 
 
-class QMPGreeting(Model):
+class QMPGreeting(StandaloneModel):
     """
     Defined in qmp-spec.txt, section 2.2, "Server Greeting".
 
@@ -75,8 +105,9 @@ class QMPGreeting(Model):
     :raise KeyError: If any required fields are absent.
     :raise TypeError: If any required fields have the wrong type.
     """
-    def __init__(self, raw: Mapping[str, Any]):
+    def __init__(self, raw: Mapping[str, object]):
         super().__init__(raw)
+
         #: 'version' member
         self.version: Mapping[str, object]
         #: 'capabilities' member
@@ -89,7 +120,7 @@ def __init__(self, raw: Mapping[str, Any]):
         self.capabilities = self._raw['capabilities']
 
 
-class ErrorResponse(Model):
+class ErrorResponse(MessageModel):
     """
     Defined in qmp-spec.txt, section 2.4.2, "error".
 
@@ -97,8 +128,9 @@ class ErrorResponse(Model):
     :raise KeyError: If any required fields are absent.
     :raise TypeError: If any required fields have the wrong type.
     """
-    def __init__(self, raw: Mapping[str, Any]):
+    def __init__(self, raw: Mapping[str, object]):
         super().__init__(raw)
+
         #: 'error' member
         self.error: ErrorInfo
         #: 'id' member
@@ -111,7 +143,7 @@ def __init__(self, raw: Mapping[str, Any]):
             self.id = raw['id']
 
 
-class ErrorInfo(Model):
+class ErrorInfo(StandaloneModel):
     """
     Defined in qmp-spec.txt, section 2.4.2, "error".
 
@@ -119,8 +151,9 @@ class ErrorInfo(Model):
     :raise KeyError: If any required fields are absent.
     :raise TypeError: If any required fields have the wrong type.
     """
-    def __init__(self, raw: Mapping[str, Any]):
+    def __init__(self, raw: Mapping[str, object]):
         super().__init__(raw)
+
         #: 'class' member, with an underscore to avoid conflicts in Python.
         self.class_: str
         #: 'desc' member
-- 
2.31.1


