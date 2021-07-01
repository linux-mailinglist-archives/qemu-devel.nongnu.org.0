Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34BD3B8CE5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:22:12 +0200 (CEST)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoDL-0003jN-Qc
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5M-0001GD-DM
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5H-0000v6-8d
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRpDFNNJwzb5qxCP1zWhem3RH82wFJKoJsqX5HskYAs=;
 b=KR0/ElB74BvPBzS5ZOJPMRWXuVQp1WJbzN6w6HcOcgJPZsCzqpMgH7BDL529wa63WvSvea
 U0XeX9s/mpWkFmwhzI8va24jq4wdsXKlYV5AJB+viSrUY9waniSfyffyusGqQhcVcez95S
 DzLIzBhGNyHuJ8bY2sCksRa7EYb4Z+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-1HdwwOINPe-sbnM7tgCc5Q-1; Thu, 01 Jul 2021 00:13:48 -0400
X-MC-Unique: 1HdwwOINPe-sbnM7tgCc5Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77956362F9;
 Thu,  1 Jul 2021 04:13:47 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F891604CC;
 Thu,  1 Jul 2021 04:13:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/20] python/aqmp: add QMP Message format
Date: Thu,  1 Jul 2021 00:13:05 -0400
Message-Id: <20210701041313.1696009-13-jsnow@redhat.com>
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

The Message class is here primarily to serve as a solid type to use for
mypy static typing for unambiguous annotation and documentation.

We can also stuff JSON serialization and deserialization into this class
itself so it can be re-used even outside this infrastructure.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |   4 +-
 python/qemu/aqmp/message.py  | 207 +++++++++++++++++++++++++++++++++++
 2 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/message.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 5c44fabeea..c1ec68a023 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -22,12 +22,14 @@
 # the COPYING file in the top-level directory.
 
 from .error import AQMPError, MultiException
+from .message import Message
 from .protocol import ConnectError, Runstate
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
-    # Classes
+    # Classes, most to least important
+    'Message',
     'Runstate',
 
     # Exceptions, most generic to most explicit
diff --git a/python/qemu/aqmp/message.py b/python/qemu/aqmp/message.py
new file mode 100644
index 0000000000..3a4b283032
--- /dev/null
+++ b/python/qemu/aqmp/message.py
@@ -0,0 +1,207 @@
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
+                 value: Union[bytes, Mapping[str, object]] = b'', *,
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
+        return f"Message({self._object!r})"
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
+    #
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
+            self._obj = self._deserialize(self._data or b'')
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


