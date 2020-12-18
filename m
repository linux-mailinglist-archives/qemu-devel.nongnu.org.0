Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF322DEA9C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 21:56:20 +0100 (CET)
Received: from localhost ([::1]:55622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqMnS-0002os-Ih
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 15:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlb-000141-Gd
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kqMlZ-0002wE-Fr
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608324860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kiu34yZPMbDq9A//PdWwlmecaLa8JCyoCuAnIWCd9jQ=;
 b=BA3uwx5Y5a22cNEJuKT9ZfLcFOL5OH5JFDzTzrTOh0WwQFYxKgORN6N3+HuDoEJQTK9mpn
 D3O6W4Nc/3WTrTO6B4Acmvm9YutacQtwCKTdYU1kGab1LTs9baZwx7HncQ2+SEt9DCb7Ig
 ioGxoHD6sxLKatgPtP3bcdWJ/goiprY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-VxNn6ZUrMMmX4CmysaYe3A-1; Fri, 18 Dec 2020 15:54:19 -0500
X-MC-Unique: VxNn6ZUrMMmX4CmysaYe3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E7EE10054FF
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:54:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B262D5C233;
 Fri, 18 Dec 2020 20:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E7ECA11275EC; Fri, 18 Dec 2020 21:54:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] qapi/gen: Support for switching to another module
 temporarily
Date: Fri, 18 Dec 2020 21:54:05 +0100
Message-Id: <20201218205407.1326907-10-armbru@redhat.com>
In-Reply-To: <20201218205407.1326907-1-armbru@redhat.com>
References: <20201218205407.1326907-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/gen.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index d9f8bac9aa..cb00229f5d 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -15,6 +15,7 @@ from contextlib import contextmanager
 import os
 import re
 from typing import (
+    ContextManager,
     Dict,
     Iterator,
     List,
@@ -296,6 +297,13 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         self._module[name] = (genc, genh)
         self._current_module = name
 
+    @contextmanager
+    def _temp_module(self, name: str) -> ContextManager[None]:
+        old_module = self._current_module
+        self._current_module = name
+        yield
+        self._current_module = old_module
+
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
             if self._is_builtin_module(name) and not opt_builtins:
-- 
2.26.2


