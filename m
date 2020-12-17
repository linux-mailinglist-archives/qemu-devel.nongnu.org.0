Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70F2DCAEC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:18:32 +0100 (CET)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpisB-0002yr-Rg
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpia7-0002EV-9c
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiZx-0007Ar-V1
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPyhPA0LQsrutFNs3gyJCJgOExNTaIdt0Mdj53/n+WU=;
 b=K0w0VsFMn2HQ8xfbLKoXbgpV/3qBcKwNHIvfPWfDKuNml9dlj6Vnb6gCu77mabzFaclLG7
 E8eu2A4Y8HrKlzfbmT/jYJ9vuTyOPEMHDIjLB/NpoJRIEVujOQUhehnzyh1aE6q/hBjpdN
 Wd90kV/tlDmoM8gQXq9Ef/IxqjuQdyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-Jx4Vl1LSOT2kHtTVjWQq6w-1; Wed, 16 Dec 2020 20:59:38 -0500
X-MC-Unique: Jx4Vl1LSOT2kHtTVjWQq6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8FFC59;
 Thu, 17 Dec 2020 01:59:37 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7751E5;
 Thu, 17 Dec 2020 01:59:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] qapi/source: Add builtin null-object sentinel
Date: Wed, 16 Dec 2020 20:59:21 -0500
Message-Id: <20201217015927.197287-7-jsnow@redhat.com>
In-Reply-To: <20201217015927.197287-1-jsnow@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
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

This object will evaluate as False, so "if info" remains a valid
idiomatic construct.

NB: It was intentional to not allow empty constructors or similar to
create "empty" source info objects; callers must explicitly invoke
'builtin()' to pro-actively opt into using the sentinel. This should
prevent use-by-accident.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/source.py | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index d7a79a9b8ae..a049b73b57b 100644
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
+        Create an instance corresponding to a built-in definition.
+        """
+        return cls('', -1, None)
+
+    def __bool__(self) -> bool:
+        # "if info" is false if @info corresponds to a built-in definition.
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


