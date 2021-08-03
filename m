Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C739A3DF4EE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:45:59 +0200 (CEST)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzQM-0001Yc-SH
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBL-0004dJ-0X
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBI-0006Ez-KS
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gR41IE+kGoP0JSZxV+hXkuelAdRVAc2t06EahyqxYMI=;
 b=BcR5WVlupKnxUtueAWgV89z9kaV0cc0RnvCuBViJ3+/hzgA1xyP51elOl0Z29WxA9PBHd1
 I+3NrdsBhPeDemUvzxDzce+JxjL8oeLa7lk8UqRGB3XjfE0goWeY8hEw/V+SYESNXm5eRc
 eyfYvrCTyZC29xPoUsm04wg0B+TjYwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-1zrqsuOXPSiKg1OsmyR_Cw-1; Tue, 03 Aug 2021 14:30:21 -0400
X-MC-Unique: 1zrqsuOXPSiKg1OsmyR_Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57FE81B2C99C;
 Tue,  3 Aug 2021 18:30:20 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A3CD226E9;
 Tue,  3 Aug 2021 18:30:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/25] python/aqmp: add QMP Message format
Date: Tue,  3 Aug 2021 14:29:29 -0400
Message-Id: <20210803182941.504537-14-jsnow@redhat.com>
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

The Message class is here primarily to serve as a solid type to use for
mypy static typing for unambiguous annotation and documentation.

We can also stuff JSON serialization and deserialization into this class
itself so it can be re-used even outside this infrastructure.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |   4 +-
 python/qemu/aqmp/message.py  | 209 +++++++++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/message.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 88ead4c0238..96fff1e5f3e 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -22,12 +22,14 @@
 # the COPYING file in the top-level directory.
 
 from .error import AQMPError
+from .message import Message
 from .protocol import ConnectError, Runstate, StateError
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
-    # Classes
+    # Classes, most to least important
+    'Message',
     'Runstate',
 
     # Exceptions, most generic to most explicit
diff --git a/python/qemu/aqmp/message.py b/python/qemu/aqmp/message.py
new file mode 100644
index 00000000000..f76ccc90746
--- /dev/null
+++ b/python/qemu/aqmp/message.py
@@ -0,0 +1,209 @@
+"""
+QMP Message Format
+
+This module provides the `Message` class, which represents a single QMP
+message sent to or from the server.
+"""
+
+import json
+from json import JSONDecodeError
+from typing import (
+    Dict,
+    Iterator,
+    Mapping,
+    MutableMapping,
+    Optional,
+    Union,
+)
+
+from .error import ProtocolError
+
+
+class Message(MutableMapping[str, object]):
+    """
+    Represents a single QMP protocol message.
+
+    QMP uses JSON objects as its basic communicative unit; so this
+    Python object is a :py:obj:`~collections.abc.MutableMapping`. It may
+    be instantiated from either another mapping (like a `dict`), or from
+    raw `bytes` that still need to be deserialized.
+
+    Once instantiated, it may be treated like any other MutableMapping::
+
+        >>> msg = Message(b'{"hello": "world"}')
+        >>> assert msg['hello'] == 'world'
+        >>> msg['id'] = 'foobar'
+        >>> print(msg)
+        {
+          "hello": "world",
+          "id": "foobar"
+        }
+
+    It can be converted to `bytes`::
+
+        >>> msg = Message({"hello": "world"})
+        >>> print(bytes(msg))
+        b'{"hello":"world","id":"foobar"}'
+
+    Or back into a garden-variety `dict`::
+
+       >>> dict(msg)
+       {'hello': 'world'}
+
+
+    :param value: Initial value, if any.
+    :param eager:
+        When `True`, attempt to serialize or deserialize the initial value
+        immediately, so that conversion exceptions are raised during
+        the call to ``__init__()``.
+    """
+    # pylint: disable=too-many-ancestors
+
+    def __init__(self,
+                 value: Union[bytes, Mapping[str, object]] = b'{}', *,
+                 eager: bool = True):
+        self._data: Optional[bytes] = None
+        self._obj: Optional[Dict[str, object]] = None
+
+        if isinstance(value, bytes):
+            self._data = value
+            if eager:
+                self._obj = self._deserialize(self._data)
+        else:
+            self._obj = dict(value)
+            if eager:
+                self._data = self._serialize(self._obj)
+
+    # Methods necessary to implement the MutableMapping interface, see:
+    # https://docs.python.org/3/library/collections.abc.html#collections.abc.MutableMapping
+
+    # We get pop, popitem, clear, update, setdefault, __contains__,
+    # keys, items, values, get, __eq__ and __ne__ for free.
+
+    def __getitem__(self, key: str) -> object:
+        return self._object[key]
+
+    def __setitem__(self, key: str, value: object) -> None:
+        self._object[key] = value
+        self._data = None
+
+    def __delitem__(self, key: str) -> None:
+        del self._object[key]
+        self._data = None
+
+    def __iter__(self) -> Iterator[str]:
+        return iter(self._object)
+
+    def __len__(self) -> int:
+        return len(self._object)
+
+    # Dunder methods not related to MutableMapping:
+
+    def __repr__(self) -> str:
+        if self._obj is not None:
+            return f"Message({self._object!r})"
+        return f"Message({bytes(self)!r})"
+
+    def __str__(self) -> str:
+        """Pretty-printed representation of this QMP message."""
+        return json.dumps(self._object, indent=2)
+
+    def __bytes__(self) -> bytes:
+        """bytes representing this QMP message."""
+        if self._data is None:
+            self._data = self._serialize(self._obj or {})
+        return self._data
+
+    # Conversion Methods
+
+    @property
+    def _object(self) -> Dict[str, object]:
+        """
+        A `dict` representing this QMP message.
+
+        Generated on-demand, if required. This property is private
+        because it returns an object that could be used to invalidate
+        the internal state of the `Message` object.
+        """
+        if self._obj is None:
+            self._obj = self._deserialize(self._data or b'{}')
+        return self._obj
+
+    @classmethod
+    def _serialize(cls, value: object) -> bytes:
+        """
+        Serialize a JSON object as `bytes`.
+
+        :raise ValueError: When the object cannot be serialized.
+        :raise TypeError: When the object cannot be serialized.
+
+        :return: `bytes` ready to be sent over the wire.
+        """
+        return json.dumps(value, separators=(',', ':')).encode('utf-8')
+
+    @classmethod
+    def _deserialize(cls, data: bytes) -> Dict[str, object]:
+        """
+        Deserialize JSON `bytes` into a native Python `dict`.
+
+        :raise DeserializationError:
+            If JSON deserialization fails for any reason.
+        :raise UnexpectedTypeError:
+            If the data does not represent a JSON object.
+
+        :return: A `dict` representing this QMP message.
+        """
+        try:
+            obj = json.loads(data)
+        except JSONDecodeError as err:
+            emsg = "Failed to deserialize QMP message."
+            raise DeserializationError(emsg, data) from err
+        if not isinstance(obj, dict):
+            raise UnexpectedTypeError(
+                "QMP message is not a JSON object.",
+                obj
+            )
+        return obj
+
+
+class DeserializationError(ProtocolError):
+    """
+    A QMP message was not understood as JSON.
+
+    When this Exception is raised, ``__cause__`` will be set to the
+    `json.JSONDecodeError` Exception, which can be interrogated for
+    further details.
+
+    :param error_message: Human-readable string describing the error.
+    :param raw: The raw `bytes` that prompted the failure.
+    """
+    def __init__(self, error_message: str, raw: bytes):
+        super().__init__(error_message)
+        #: The raw `bytes` that were not understood as JSON.
+        self.raw: bytes = raw
+
+    def __str__(self) -> str:
+        return "\n".join([
+            super().__str__(),
+            f"  raw bytes were: {str(self.raw)}",
+        ])
+
+
+class UnexpectedTypeError(ProtocolError):
+    """
+    A QMP message was JSON, but not a JSON object.
+
+    :param error_message: Human-readable string describing the error.
+    :param value: The deserialized JSON value that wasn't an object.
+    """
+    def __init__(self, error_message: str, value: object):
+        super().__init__(error_message)
+        #: The JSON value that was expected to be an object.
+        self.value: object = value
+
+    def __str__(self) -> str:
+        strval = json.dumps(self.value, indent=2)
+        return "\n".join([
+            super().__str__(),
+            f"  json value was: {strval}",
+        ])
-- 
2.31.1


