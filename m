Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8735E375
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:06:21 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLYS-0002O3-Jv
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOc-0001TY-F8
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOY-0000BT-7p
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618329365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XufJ2CLgjzIAubGvoiYCX7qy1kGVUEO3CHR9Ppm6GRY=;
 b=gk0JavkqhuQHwSWAFl/tOfIL0oZtdRiSa+ZPheVghXnh4PTKzMrjj2akjWVH/5/8uIkjC2
 CppRyw3YPzED41hCTrGrFi9GD17tXGo41uvNTr2CiqfKRaaRQPIjcK1YIrvbBpSNOXHjN0
 pNcQoMb8QSk7VgchKyNib1FSdJzCbhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-f9L2cPjUPwS_iyt-XlwkqA-1; Tue, 13 Apr 2021 11:56:03 -0400
X-MC-Unique: f9L2cPjUPwS_iyt-XlwkqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7393B79EC5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:56:02 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4EB06A034;
 Tue, 13 Apr 2021 15:56:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 4/7] message: add QMP Message type
Date: Tue, 13 Apr 2021 11:55:50 -0400
Message-Id: <20210413155553.2660523-5-jsnow@redhat.com>
In-Reply-To: <20210413155553.2660523-1-jsnow@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: crosa@redhat.com, John Snow <jsnow@redhat.com>, ehabkost@redhat.com,
 stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an abstraction that represents a single message either sent to
or received from the server. It is used to subclass the
AsyncProtocol(Generic[T]) type.

It was written such that it can be populated by either raw data or by a
dict, with the other form being generated on-demand, as-needed.

It behaves almost exactly like a dict, but has some extra methods and a
special constructor. (It should quack fairly convincingly.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 message.py | 196 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 message.py

diff --git a/message.py b/message.py
new file mode 100644
index 0000000..5c7e828
--- /dev/null
+++ b/message.py
@@ -0,0 +1,196 @@
+"""
+QMP Message format and errors.
+
+This module provides the `Message` class, which represents a single QMP
+message sent to or from the server. Several error-classes that depend on
+knowing the format of this message are also included here.
+"""
+
+import json
+from json import JSONDecodeError
+from typing import (
+    Dict,
+    ItemsView,
+    Iterable,
+    KeysView,
+    Optional,
+    Union,
+    ValuesView,
+)
+
+from error import (
+    DeserializationError,
+    ProtocolError,
+    UnexpectedTypeError,
+)
+
+
+class Message:
+    """
+    Represents a single QMP protocol message.
+
+    QMP uses JSON objects as its basic communicative unit; so this
+    object behaves like a MutableMapping. It may be instantiated from
+    either another mapping (like a dict), or from raw bytes that still
+    need to be deserialized.
+
+    :param value: Initial value, if any.
+    :param eager: When true, attempt to serialize (or deserialize) the
+                  initial value immediately, such that conversion exceptions
+                  are raised during the call to the initialization method.
+    """
+    # TODO: make Message properly a MutableMapping so it can be typed as such?
+    def __init__(self,
+                 value: Union[bytes, Dict[str, object]] = b'', *,
+                 eager: bool = True):
+        self._data: Optional[bytes] = None
+        self._obj: Optional[Dict[str, object]] = None
+
+        if isinstance(value, bytes):
+            self._data = value
+            if eager:
+                self._obj = self._deserialize(self._data)
+        else:
+            self._obj = value
+            if eager:
+                self._data = self._serialize(self._obj)
+
+    @classmethod
+    def _serialize(cls, value: object) -> bytes:
+        """
+        Serialize a JSON object as bytes.
+
+        :raises: ValueError, TypeError from the json library.
+        """
+        return json.dumps(value, separators=(',', ':')).encode('utf-8')
+
+    @classmethod
+    def _deserialize(cls, data: bytes) -> Dict[str, object]:
+        """
+        Deserialize JSON bytes into a native python dict.
+
+        :raises: DeserializationError if JSON deserialization
+                 fails for any reason.
+        :raises: UnexpectedTypeError if data does not represent
+                 a JSON object.
+        """
+        try:
+            obj = json.loads(data)
+        except JSONDecodeError as err:
+            emsg = "Failed to deserialize QMP message."
+            raise DeserializationError(emsg, data) from err
+        if not isinstance(obj, dict):
+            raise UnexpectedTypeError(
+                "Incoming QMP message is not a JSON object.",
+                data
+            )
+        return obj
+
+    @property
+    def data(self) -> bytes:
+        """
+        bytes representing this QMP message.
+
+        Generated on-demand if required.
+        """
+        if self._data is None:
+            self._data = self._serialize(self._obj or {})
+        return self._data
+
+    @property
+    def _object(self) -> Dict[str, object]:
+        """
+        dict representing this QMP message.
+
+        Generated on-demand if required; Private because it returns an
+        object that could be used to validate the internal state of the
+        Message object.
+        """
+        if self._obj is None:
+            self._obj = self._deserialize(self._data or b'')
+        return self._obj
+
+    def __str__(self) -> str:
+        """Pretty-printed representation of this QMP message."""
+        return json.dumps(self._object, indent=2)
+
+    def __bytes__(self) -> bytes:
+        return self.data
+
+    def __contains__(self, item: str) -> bool:  # Container, Collection
+        return item in self._object
+
+    def __iter__(self) -> Iterable[str]:  # Iterable, Collection, Mapping
+        return iter(self._object)
+
+    def __len__(self) -> int:  # Sized, Collection, Mapping
+        return len(self._object)
+
+    def __getitem__(self, key: str) -> object:  # Mapping
+        return self._object[key]
+
+    def __setitem__(self, key: str, value: object) -> None:  # MutableMapping
+        self._object[key] = value
+        self._data = None
+
+    def __delitem__(self, key: str) -> None:  # MutableMapping
+        del self._object[key]
+        self._data = None
+
+    def keys(self) -> KeysView[str]:
+        """Return a KeysView object containing all field names."""
+        return self._object.keys()
+
+    def items(self) -> ItemsView[str, object]:
+        """Return an ItemsView object containing all key:value pairs."""
+        return self._object.items()
+
+    def values(self) -> ValuesView[object]:
+        """Return a ValuesView object containing all field values."""
+        return self._object.values()
+
+    def get(self, key: str,
+            default: Optional[object] = None) -> Optional[object]:
+        """Get the value for a single key."""
+        return self._object.get(key, default)
+
+
+class MsgProtocolError(ProtocolError):
+    """Abstract error class for protocol errors that have a JSON object."""
+    def __init__(self, error_message: str, msg: Message):
+        super().__init__(error_message)
+        self.msg = msg
+
+    def __str__(self) -> str:
+        return "\n".join([
+            super().__str__(),
+            f"  Message was: {str(self.msg)}\n",
+        ])
+
+
+class ObjectTypeError(MsgProtocolError):
+    """
+    Incoming message was a JSON object, but has an unexpected data shape.
+
+    e.g.: A malformed greeting may cause this error.
+    """
+
+
+# FIXME: Remove this? Current draft simply trashes these replies.
+
+# class OrphanedError(MsgProtocolError):
+#     """
+#     Received message, but had no queue to deliver it to.
+#
+#     e.g.: A reply arrives from the server, but the ID does not match any
+#     pending execution requests we are aware of.
+#     """
+
+
+class ServerParseError(MsgProtocolError):
+    """
+    Server sent a `ParsingError` message.
+
+    e.g. A reply arrives from the server, but it is missing the "ID"
+    field, which indicates a parsing error on behalf of the server.
+    """
-- 
2.30.2


