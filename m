Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4E2C151F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:04:16 +0100 (CET)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khI4N-0002Us-KG
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHqA-0006YT-Fi
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHq5-0007x9-3n
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2xG23QU2BBr4WUJwpoqrLR+KDBqozVx87q5a4/razE=;
 b=YUoZS045nE1501JqUS66l3Sx2RFY5KOJzzvuVidY44NwjmP1yPF5e1DmLaefoUxBsoooUX
 P+HpGC6e0BJZS4QvuniPLSEW4ThI7FRHSJ3hClyZx8Wq+QOZjPwHOCooSuJjk5djK5MHFR
 s91JTgDI1GsiYwxrq5pQLmXPZSLDYNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-XMfvKki8M4-eU0F4ZSDNRg-1; Mon, 23 Nov 2020 14:49:24 -0500
X-MC-Unique: XMfvKki8M4-eU0F4ZSDNRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB30AFA86
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:49:23 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43C8B5C1BD;
 Mon, 23 Nov 2020 19:49:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] qom: Delete set_default_value_bool()
Date: Mon, 23 Nov 2020 14:48:18 -0500
Message-Id: <20201123194818.2773508-20-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

set_default_value_bool() can be completely replaced by
object_property_set_default(), we don't need that function
anymore.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch in v3 of this series.

In v2 of the series, equivalent changes were part of "qom: Use
qlit to represent property defaults".
---
 qom/property-types.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/qom/property-types.c b/qom/property-types.c
index 399e36c29e..cb7ba2a229 100644
--- a/qom/property-types.c
+++ b/qom/property-types.c
@@ -84,19 +84,11 @@ static void prop_set_bit(Object *obj, Visitor *v, const char *name,
     bit_prop_set(obj, prop, value);
 }
 
-static void set_default_value_bool(ObjectProperty *op, const Property *prop,
-                                   const QObject *defval)
-{
-    QBool *qb = qobject_to(QBool, defval);
-    object_property_set_default_bool(op, qbool_get_bool(qb));
-}
-
 const PropertyInfo prop_info_bit = {
     .name  = "bool",
     .description = "on/off",
     .get   = prop_get_bit,
     .set   = prop_set_bit,
-    .set_default_value = set_default_value_bool,
 };
 
 /* Bit64 */
@@ -145,7 +137,6 @@ const PropertyInfo prop_info_bit64 = {
     .description = "on/off",
     .get   = prop_get_bit64,
     .set   = prop_set_bit64,
-    .set_default_value = set_default_value_bool,
 };
 
 /* --- bool --- */
@@ -172,7 +163,6 @@ const PropertyInfo prop_info_bool = {
     .name  = "bool",
     .get   = get_bool,
     .set   = set_bool,
-    .set_default_value = set_default_value_bool,
 };
 
 /* --- 8bit integer --- */
-- 
2.28.0


