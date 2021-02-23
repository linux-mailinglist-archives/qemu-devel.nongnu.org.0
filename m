Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8109B322343
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 01:44:34 +0100 (CET)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lELoX-0003SY-Ja
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 19:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELgg-0002ML-Cx
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lELej-0005NV-S5
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 19:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614040465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doA9yJHacEQkyLpm+WjaQHNzN48+joYVgFx8ILUzw4E=;
 b=ea/LpzDm9JRqcn1BkwEhPurikkkRVF2Qv3UI0NOWmZoHlyM+GSepFi0bdFdYa98NPr7DZc
 jloh/5xuy8UlS8+aHEOYw+ZyoGSMYG6j11bpoU2s4Vlh0JAOq5P9Z+s8axcdcE3ANcDpD2
 nTlJOB35Os3SdpjsNNluSVEoShEz7oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-eAsAKVpLMwi7rjPOG7pp7w-1; Mon, 22 Feb 2021 19:34:22 -0500
X-MC-Unique: eAsAKVpLMwi7rjPOG7pp7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB451005501;
 Tue, 23 Feb 2021 00:34:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE3A85D74E;
 Tue, 23 Feb 2021 00:34:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 13/16] qapi/expr.py: Modify check_keys to accept any
 Collection
Date: Mon, 22 Feb 2021 19:34:05 -0500
Message-Id: <20210223003408.964543-14-jsnow@redhat.com>
In-Reply-To: <20210223003408.964543-1-jsnow@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a minor adjustment that allows the 'required' and 'optional'
keys fields to take a default value of an empty, immutable sequence (the
empty tuple).

This reveals a quirk of this function, which is that "a + b" is
list-specific behavior. We can accept a wider variety of types if we
avoid that behavior. Using Collection allows us to accept things like
lists, tuples, sets, and so on.

(Iterable would also have worked, but Iterable also includes things like
generator expressions which are consumed upon iteration, which would
require a rewrite to make sure that each input was only traversed once.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2b96bec722f..0b841f292d7 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -33,6 +33,7 @@
 
 import re
 from typing import (
+    Collection,
     Iterable,
     List,
     MutableMapping,
@@ -133,8 +134,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
 def check_keys(value: _JSObject,
                info: QAPISourceInfo,
                source: str,
-               required: List[str],
-               optional: List[str]) -> None:
+               required: Collection[str] = (),
+               optional: Collection[str] = ()) -> None:
     """
     Ensures an object has a specific set of keys. [Const]
 
@@ -155,7 +156,7 @@ def pprint(elems: Iterable[str]) -> str:
             "%s misses key%s %s"
             % (source, 's' if len(missing) > 1 else '',
                pprint(missing)))
-    allowed = set(required + optional)
+    allowed = set(required) | set(optional)
     unknown = set(value) - allowed
     if unknown:
         raise QAPISemError(
-- 
2.29.2


