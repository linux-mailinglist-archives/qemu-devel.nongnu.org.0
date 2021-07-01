Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E923B8CEE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:24:22 +0200 (CEST)
Received: from localhost ([::1]:45320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoFS-0007nW-0t
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5L-0001Cj-Gn
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5J-0000w5-7M
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwUGGY5uyWyYQd5Zurxfm8CsvdBOc3cG50bLx3lkVDI=;
 b=DZ3xRpH37hCXtHKOJWg3XH+JOFsmLz6hXtYJcTVLuKOYzwil81ecU2QPlKaCVXJ84JPr6i
 ajgeCj/k3K2sGBxRIVVKZPKUMsjff5Zl8dp/d8SSXgRe9wUzMBxiH5qrlPHLmCKxRCvA+M
 Bxt4eTKOBfua7ebzt++aNj5gQmEhkpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-O5it89rGPCOIMVQoqQD9tA-1; Thu, 01 Jul 2021 00:13:49 -0400
X-MC-Unique: O5it89rGPCOIMVQoqQD9tA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91DF118414A2;
 Thu,  1 Jul 2021 04:13:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C61769CB4;
 Thu,  1 Jul 2021 04:13:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/20] python/aqmp: add well-known QMP object models
Date: Thu,  1 Jul 2021 00:13:06 -0400
Message-Id: <20210701041313.1696009-14-jsnow@redhat.com>
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

The QMP spec doesn't define very many objects that are iron-clad in
their format, but there are a few. This module makes it trivial to
validate them without relying on an external third-party library.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/models.py | 133 +++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 python/qemu/aqmp/models.py

diff --git a/python/qemu/aqmp/models.py b/python/qemu/aqmp/models.py
new file mode 100644
index 0000000000..24c94123ac
--- /dev/null
+++ b/python/qemu/aqmp/models.py
@@ -0,0 +1,133 @@
+"""
+QMP Data Models
+
+This module provides simplistic data classes that represent the few
+structures that the QMP spec mandates; they are used to verify incoming
+data to make sure it conforms to spec.
+"""
+# pylint: disable=too-few-public-methods
+
+from collections import abc
+from typing import (
+    Any,
+    Mapping,
+    Optional,
+    Sequence,
+)
+
+
+class Model:
+    """
+    Abstract data model, representing some QMP object of some kind.
+
+    :param raw: The raw object to be validated.
+    :raise KeyError: If any required fields are absent.
+    :raise TypeError: If any required fields have the wrong type.
+    """
+    def __init__(self, raw: Mapping[str, Any]):
+        self._raw = raw
+
+    def _check_key(self, key: str) -> None:
+        if key not in self._raw:
+            raise KeyError(f"'{self._name}' object requires '{key}' member")
+
+    def _check_value(self, key: str, type_: type, typestr: str) -> None:
+        assert key in self._raw
+        if not isinstance(self._raw[key], type_):
+            raise TypeError(
+                f"'{self._name}' member '{key}' must be a {typestr}"
+            )
+
+    def _check_member(self, key: str, type_: type, typestr: str) -> None:
+        self._check_key(key)
+        self._check_value(key, type_, typestr)
+
+    @property
+    def _name(self) -> str:
+        return type(self).__name__
+
+    def __repr__(self) -> str:
+        return f"{self._name}({self._raw!r})"
+
+
+class Greeting(Model):
+    """
+    Defined in qmp-spec.txt, section 2.2, "Server Greeting".
+
+    :param raw: The raw Greeting object.
+    :raise KeyError: If any required fields are absent.
+    :raise TypeError: If any required fields have the wrong type.
+    """
+    def __init__(self, raw: Mapping[str, Any]):
+        super().__init__(raw)
+        #: 'QMP' member
+        self.QMP: QMPGreeting  # pylint: disable=invalid-name
+
+        self._check_member('QMP', abc.Mapping, "JSON object")
+        self.QMP = QMPGreeting(self._raw['QMP'])
+
+
+class QMPGreeting(Model):
+    """
+    Defined in qmp-spec.txt, section 2.2, "Server Greeting".
+
+    :param raw: The raw QMPGreeting object.
+    :raise KeyError: If any required fields are absent.
+    :raise TypeError: If any required fields have the wrong type.
+    """
+    def __init__(self, raw: Mapping[str, Any]):
+        super().__init__(raw)
+        #: 'version' member
+        self.version: Mapping[str, object]
+        #: 'capabilities' member
+        self.capabilities: Sequence[object]
+
+        self._check_member('version', abc.Mapping, "JSON object")
+        self.version = self._raw['version']
+
+        self._check_member('capabilities', abc.Sequence, "JSON array")
+        self.capabilities = self._raw['capabilities']
+
+
+class ErrorResponse(Model):
+    """
+    Defined in qmp-spec.txt, section 2.4.2, "error".
+
+    :param raw: The raw ErrorResponse object.
+    :raise KeyError: If any required fields are absent.
+    :raise TypeError: If any required fields have the wrong type.
+    """
+    def __init__(self, raw: Mapping[str, Any]):
+        super().__init__(raw)
+        #: 'error' member
+        self.error: ErrorInfo
+        #: 'id' member
+        self.id: Optional[object] = None  # pylint: disable=invalid-name
+
+        self._check_member('error', abc.Mapping, "JSON object")
+        self.error = ErrorInfo(self._raw['error'])
+
+        if 'id' in raw:
+            self.id = raw['id']
+
+
+class ErrorInfo(Model):
+    """
+    Defined in qmp-spec.txt, section 2.4.2, "error".
+
+    :param raw: The raw ErrorInfo object.
+    :raise KeyError: If any required fields are absent.
+    :raise TypeError: If any required fields have the wrong type.
+    """
+    def __init__(self, raw: Mapping[str, Any]):
+        super().__init__(raw)
+        #: 'class' member, with an underscore to avoid conflicts in Python.
+        self.class_: str
+        #: 'desc' member
+        self.desc: str
+
+        self._check_member('class', str, "string")
+        self.class_ = self._raw['class']
+
+        self._check_member('desc', str, "string")
+        self.desc = self._raw['desc']
-- 
2.31.1


