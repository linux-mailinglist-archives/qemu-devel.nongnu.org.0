Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8562FBEFC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:31:05 +0100 (CET)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vmS-00076b-J4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLd-0007oY-3c
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1vLb-0005TW-GI
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611079398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbkfW/5FHbt4kV4zbz6lvbzg2zNEEUQdO380g35ehGs=;
 b=WCXXt7UtK6zDS7yx1plAvdOwI/QTkRffQGb0dtRIMe796J6fZDjs0CGAlVx+kP5W/Nm/Eo
 OosXHIeUxoA2mwYADYqqG8rAC5xfQWgVrZaPrdIzWTzmZEWJWNH/hMXXYBTyBFNq/hXP5+
 G8EDt6n7q05H9GlaFmHpmcTdaMYFoVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-cBQxEgOfOFKxpnaMPrxAtg-1; Tue, 19 Jan 2021 13:03:16 -0500
X-MC-Unique: cBQxEgOfOFKxpnaMPrxAtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 997D959
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 18:03:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB1F85D9DD;
 Tue, 19 Jan 2021 18:03:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/17] qapi/gen: Support for switching to another module
 temporarily
Date: Tue, 19 Jan 2021 13:02:38 -0500
Message-Id: <20210119180242.1570753-14-jsnow@redhat.com>
In-Reply-To: <20210119180242.1570753-1-jsnow@redhat.com>
References: <20210119180242.1570753-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 4b5d3ea3a5b..86abdabb57a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -290,6 +290,13 @@ def _add_module(self, name: str, blurb: str) -> None:
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


