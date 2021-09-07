Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9FB402923
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:45:12 +0200 (CEST)
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaTP-0006QH-FG
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7w-00036t-CZ
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7u-0007li-QP
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EcNUWh89umV/1/EES3d61Y6beBZYrL8xwzLfr7verkc=;
 b=D/sBvAVP5VjAJFNWtrWKwKlffJ4TYkguU4FgvPjAcS0BYwo/NVwdOHJMghF6+JQf+zDZSF
 rD4z0E5rpifL58JDKQ5mNKn2KCwp43mNWOvLVTTVkCjbc2i0g5J37osY4RXAye7eznaDmU
 ukLri4Xr3/bQ73qbFYmzrC8jfTzgaHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-1EnQa6TRPue6ZgpO__LKBA-1; Tue, 07 Sep 2021 08:22:56 -0400
X-MC-Unique: 1EnQa6TRPue6ZgpO__LKBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9718801B3D
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:22:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94DC41B46B;
 Tue,  7 Sep 2021 12:22:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 14/32] scripts/qapi: add QAPISchemaIfCond.rsgen()
Date: Tue,  7 Sep 2021 16:19:25 +0400
Message-Id: <20210907121943.3498701-15-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
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

Generate Rust #[cfg(...)] guards from QAPI 'if' conditions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py | 16 ++++++++++++++++
 scripts/qapi/schema.py |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 5f8f76e5b2..6d22c66391 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -201,6 +201,22 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
+def rsgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
+
+    def cfg(ifcond: Union[str, Dict[str, Any]]):
+        if isinstance(ifcond, str):
+            return ifcond
+        if isinstance(ifcond, list):
+            return ', '.join([cfg(c) for c in ifcond])
+        oper, operands = next(iter(ifcond.items()))
+        operands = cfg(operands)
+        return f'{oper}({operands})'
+
+    if not ifcond:
+        return ''
+    return '#[cfg(%s)]' % cfg(ifcond)
+
+
 def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
                cond_fmt: str, not_fmt: str,
                all_operator: str, any_operator: str) -> str:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 6455a8f425..c61f35e13f 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -26,6 +26,7 @@
     docgen_ifcond,
     gen_endif,
     gen_if,
+    rsgen_ifcond,
 )
 from .error import QAPIError, QAPISemError, QAPISourceError
 from .expr import check_exprs
@@ -48,6 +49,9 @@ def gen_endif(self):
     def docgen(self):
         return docgen_ifcond(self.ifcond)
 
+    def rsgen(self):
+        return rsgen_ifcond(self.ifcond)
+
     def is_present(self):
         return bool(self.ifcond)
 
-- 
2.33.0.113.g6c40894d24


