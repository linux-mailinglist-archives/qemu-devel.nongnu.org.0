Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886C2DA470
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:57:56 +0100 (CET)
Received: from localhost ([::1]:39408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxj1-000893-93
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf4-0003Hj-0s
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf2-0000tm-97
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yVunUmIG6winirkBVZemtaF3IjSeIhFGCw8J53mrOFg=;
 b=AAmBz/K8z79r8mm9NZB4UXSws4NCqs8CFaI9zAuuDCaFMZQ+kvJk/MgIY7LkGt/Ns7wcuJ
 +jNU9ir7yJCaIPoa/6QJaBGfrrzxq1RIrGFMLuZsMDN4uSjeqcPNv/OWYUuJuNXwk313c4
 131xFI77sXeoEWecuVgeDPW8XO7mQm4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-9c5lhPtQOGqSjwBzM9J5MQ-1; Mon, 14 Dec 2020 18:53:45 -0500
X-MC-Unique: 9c5lhPtQOGqSjwBzM9J5MQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0201F59
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:45 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43F3F13470;
 Mon, 14 Dec 2020 23:53:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] qapi/source: Add builtin null-object sentinel
Date: Mon, 14 Dec 2020 18:53:21 -0500
Message-Id: <20201214235327.1007124-7-jsnow@redhat.com>
In-Reply-To: <20201214235327.1007124-1-jsnow@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We use None to represent an object that has no source information
because it's a builtin. This complicates interface typing, since many
interfaces expect that there is an info object available to print errors
with.

Introduce a special QAPISourceInfo that represents these built-ins so
that if an error should so happen to occur relating to one of these
builtins that we will be able to print its information, and interface
typing becomes simpler: you will always have a source info object.

This object will evaluate as False, so "if info" is a valid idiomatic
construct.

NB: It was intentional to not allow empty constructors or similar to
create "empty" source info objects; callers must explicitly invoke
'builtin()' to pro-actively opt into using the sentinel. This should
prevent use-by-accident.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/source.py | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index d7a79a9b8aee..64af7318cb67 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -11,7 +11,12 @@
 
 import copy
 import sys
-from typing import List, Optional, TypeVar
+from typing import (
+    List,
+    Optional,
+    Type,
+    TypeVar,
+)
 
 
 class QAPISchemaPragma:
@@ -41,6 +46,17 @@ def __init__(self, fname: str, line: int,
         self.defn_meta: Optional[str] = None
         self.defn_name: Optional[str] = None
 
+    @classmethod
+    def builtin(cls: Type[T]) -> T:
+        """
+        Create a SourceInfo object corresponding to a builtin definition.
+        """
+        return cls('', -1, None)
+
+    def __bool__(self) -> bool:
+        # "if info: ..." is false if info is the builtin sentinel.
+        return bool(self.fname)
+
     def set_defn(self, meta: str, name: str) -> None:
         self.defn_meta = meta
         self.defn_name = name
@@ -73,4 +89,6 @@ def include_path(self) -> str:
         return ret
 
     def __str__(self) -> str:
+        if not bool(self):
+            return '[builtin]'
         return self.include_path() + self.in_defn() + self.loc()
-- 
2.26.2


