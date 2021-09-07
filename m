Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0487B4028B3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:25:41 +0200 (CEST)
Received: from localhost ([::1]:43518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaAW-0006HS-09
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5h-0006LG-O3
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5e-0006Ev-L1
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pM9YBBMfyGc8ihULzRDaBFtydsgznGpDpdOjwz7lH0=;
 b=jSin6aP2qeVMOnNPiWcl36ecVrpjvX7pMjWOAexkDIxvnnE+v0W6CcN8Kv+z5b+VSJJycU
 G8yX00tm0p00BV1qnW09q6MGwdGlPSGjCn/FoLc86oqNAK2qDzHxbaHL6ur84W+EBDAj38
 vxcMRqseORhFjxtw2Ui4qWd+x9aXylo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-iD874eePO56ZV9DQydrd1g-1; Tue, 07 Sep 2021 08:20:35 -0400
X-MC-Unique: iD874eePO56ZV9DQydrd1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4410188E3C1
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:20:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93D96781ED;
 Tue,  7 Sep 2021 12:20:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 03/32] scripts/qapi: teach c_param_type() to return const
 argument type
Date: Tue,  7 Sep 2021 16:19:14 +0400
Message-Id: <20210907121943.3498701-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The argument isn't owned by the callee, so it better be const.
But a lot of code in QEMU rely on non-const arguments to tweak it (steal
values etc).

Since Rust types / bindings are derived from the C version, we have to
be more accurate there to do correct ownership in the bindings.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/schema.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3d72c7dfc9..1f6301c394 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -226,8 +226,15 @@ def c_type(self):
         pass
 
     # Return the C type to be used in a parameter list.
-    def c_param_type(self):
-        return self.c_type()
+    #
+    # The argument should be considered const, since no ownership is given to
+    # the callee, but qemu C code frequently tweaks it. Set const=True for a
+    # stricter declaration.
+    def c_param_type(self, const: bool = False):
+        c_type = self.c_type()
+        if const and c_type.endswith(POINTER_SUFFIX):
+            c_type = 'const ' + c_type
+        return c_type
 
     # Return the C type to be used where we suppress boxing.
     def c_unboxed_type(self):
@@ -280,10 +287,10 @@ def c_name(self):
     def c_type(self):
         return self._c_type_name
 
-    def c_param_type(self):
+    def c_param_type(self, const: bool = False):
         if self.name == 'str':
             return 'const ' + self._c_type_name
-        return self._c_type_name
+        return super().c_param_type(const)
 
     def json_type(self):
         return self._json_type_name
-- 
2.33.0.113.g6c40894d24


