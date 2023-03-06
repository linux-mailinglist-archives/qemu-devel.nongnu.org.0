Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F996ABF87
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:31:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9yD-0008NA-Pq; Mon, 06 Mar 2023 07:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9xR-0007em-Eb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZ9xP-0003Lr-8v
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678105726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bu0nSiCU+C/5t2FSu0ntDv4BlvxCta95wWhADz5BY5k=;
 b=eOROC2bRuutca29AbTERF4k78qc2N6pYBtljbNoA1OA2EiovXxCMBf88quvKRzxOIML7uo
 HYyQ5VMGsEcoLEm3doegq9AkGjBcTaaAoCwnce8IzZVtC16wmTlcyNY3ht47Bvv5pN5m0D
 9afouVnIFhJa8qAW0oQZSxPAP1+nvBA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-hXOhZz99OHi_qz8bOu_QBQ-1; Mon, 06 Mar 2023 07:28:39 -0500
X-MC-Unique: hXOhZz99OHi_qz8bOu_QBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE0E71C04325;
 Mon,  6 Mar 2023 12:28:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1736940C83B6;
 Mon,  6 Mar 2023 12:28:23 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v4 07/11] qapi/gen: run C code through clang-format,
 if possible
Date: Mon,  6 Mar 2023 16:27:47 +0400
Message-Id: <20230306122751.2355515-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
References: <20230306122751.2355515-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Make the resulting code even prettier, if possible.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/gen.py        | 15 ++++++++++++++-
 scripts/qapi/introspect.py |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b5a8d03e8e..c0ec9aa412 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -14,6 +14,7 @@
 from contextlib import contextmanager
 import os
 import re
+import subprocess
 from typing import (
     Dict,
     Iterator,
@@ -133,6 +134,7 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 class QAPIGenCCode(QAPIGen):
     def __init__(self, fname: str):
         super().__init__(fname)
+        self.skip_format: bool = False
         self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] = None
 
     def start_if(self, ifcond: QAPISchemaIfCond) -> None:
@@ -149,7 +151,18 @@ def end_if(self) -> None:
 
     def get_content(self) -> str:
         assert self._start_if is None
-        return super().get_content()
+
+        text = super().get_content()
+        if not self.skip_format:
+            try:
+                text = subprocess.run(["clang-format"],
+                                      input=text,
+                                      text=True,
+                                      capture_output=True,
+                                      check=True).stdout
+            except FileNotFoundError:
+                pass
+        return text
 
 
 class QAPIGenC(QAPIGenCCode):
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 67c7d89aae..1a8cac37ef 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -174,6 +174,8 @@ def __init__(self, prefix: str, unmask: bool):
         super().__init__(
             prefix, 'qapi-introspect',
             ' * QAPI/QMP schema introspection', __doc__)
+        # for some reasons, the generated code is making clang-format go crazy
+        self._genc.skip_format = True
         self._unmask = unmask
         self._schema: Optional[QAPISchema] = None
         self._trees: List[Annotated[SchemaInfo]] = []
-- 
2.39.2


