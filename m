Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89FB30B0BD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:48:02 +0100 (CET)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6fB3-0006q7-UI
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1p-0003Lf-Mr
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6f1k-0005lX-83
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612208303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9qk247eIhc+fKn8oWnKzH/5O8fVRxygCDws3cO6i6U=;
 b=DxyhffsEawe8C9t+yF00B/L3Mhsn533vGNQkXvxRVwNm1UJL3Z9nl177jlL2p1gsJbo2FH
 BKnIsL/Z2FDxz1ZM3rKY4A3kUNXgeQHnOPZqtPvI2M863BVoE5JydhbiOL7k2NBIzpY/Ex
 wjwQmveezNfBqrUShqwifN6NNRejLl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-kaDdSzYZNbiIXUruKKoxeQ-1; Mon, 01 Feb 2021 14:38:21 -0500
X-MC-Unique: kaDdSzYZNbiIXUruKKoxeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2B431842140;
 Mon,  1 Feb 2021 19:38:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAC1760C05;
 Mon,  1 Feb 2021 19:38:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/16] qapi/gen: Support for switching to another module
 temporarily
Date: Mon,  1 Feb 2021 14:37:43 -0500
Message-Id: <20210201193747.2169670-13-jsnow@redhat.com>
In-Reply-To: <20210201193747.2169670-1-jsnow@redhat.com>
References: <20210201193747.2169670-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/gen.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b2bb9d12ffc..a0a5df333e0 100644
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
2.29.2


