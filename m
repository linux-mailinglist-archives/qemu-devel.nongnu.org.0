Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9231403A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:19:40 +0100 (CET)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9D0V-0006YQ-FA
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974K-0005Yn-8s
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9742-0001c2-NF
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cKxhboqo+JBnPy5oOLXcx7d3/EZRWUQPg1AlFPmx5yY=;
 b=UG0vTS2iDMtX0fbvKt9PDXK5omPnZUxFaEdV+g65YIIryDgzXmJf0I61CU+1W6Psph8Az+
 Y+Brh7cf1puiGriHVZvG4Vp8sAhBniig5e29AfQ7nwYm6gD3fdRwn1iJsZDoXlqXLC9Cjq
 5Y643qKXVBEiD6T4ZWA0hh2IUG4mws8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-pW-HoDyxO5OiAPVzfHsqZA-1; Mon, 08 Feb 2021 08:58:50 -0500
X-MC-Unique: pW-HoDyxO5OiAPVzfHsqZA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB0FA85B663;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CDDE5D9DE;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7D28B1132922; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] qapi/gen: Support switching to another module temporarily
Date: Mon,  8 Feb 2021 14:58:42 +0100
Message-Id: <20210208135846.3707170-13-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-13-jsnow@redhat.com>
[Commit message tweaked]
---
 scripts/qapi/gen.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b2bb9d12ff..a0a5df333e 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -290,6 +290,13 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         self._module[name] = (genc, genh)
         self._current_module = name
 
+    @contextmanager
+    def _temp_module(self, name: str) -> Iterator[None]:
+        old_module = self._current_module
+        self._current_module = name
+        yield
+        self._current_module = old_module
+
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
-- 
2.26.2


