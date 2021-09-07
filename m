Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2E4028B0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:23:19 +0200 (CEST)
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNa8E-0001Lo-Jo
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa60-0006t3-8g
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5y-0006T6-OI
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsPeXLVMoNfGTjP5mwOeVlJxyCx81Jkf/m76BRxp31I=;
 b=EHvqbZBPEUFf9g+QPdC8C0lF//fNZr8satbLKoG46tVJwFLiq9opVMeaelPieMpk1m2/fD
 B0EBViIHz9e49SAMCKbt7M9ciYcqvQimXMrucDiSx7AzGrfWbDF/gPcEKuixsMgljxBYKq
 9Oq/x/YiK3UqmnGPB9K5/hNT3Eyrrfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-OP1SMThyPO6yAeUOJ2p_zw-1; Tue, 07 Sep 2021 08:20:56 -0400
X-MC-Unique: OP1SMThyPO6yAeUOJ2p_zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24403188E3D6
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:20:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D47519736;
 Tue,  7 Sep 2021 12:20:49 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 05/32] scripts/qapi: add QAPISchemaVisitor.visit_module_end
Date: Tue,  7 Sep 2021 16:19:16 +0400
Message-Id: <20210907121943.3498701-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Used in following patches to generate code after visiting a module.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/schema.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 1f6301c394..6455a8f425 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -128,6 +128,9 @@ def visit_end(self):
     def visit_module(self, name):
         pass
 
+    def visit_module_end(self, name) -> None:
+        pass
+
     def visit_needed(self, entity):
         # Default to visiting everything
         return True
@@ -207,6 +210,7 @@ def visit(self, visitor):
         for entity in self._entity_list:
             if visitor.visit_needed(entity):
                 entity.visit(visitor)
+        visitor.visit_module_end(self.name)
 
 
 class QAPISchemaInclude(QAPISchemaEntity):
-- 
2.33.0.113.g6c40894d24


