Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02892C157F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:16:24 +0100 (CET)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIG7-00065q-Pz
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpu-0006Rz-9T
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpp-0007uq-Ab
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xQldrGgePq9IKz8ZDRqERFSVJbb2ANqN1ThasIyDiKc=;
 b=KGFlst6My79RlwbEAYKMDRvHGjutDnifuckkmkNlHszUggP5mPGnFOVnoUsFbbW97aJ8v5
 Ncrfl8SW0LclQu9dgGf5DPO7Qvo0krrDaFTPQvo4/olepEjoioh/9jBEJDNKmyu6Hkc+or
 p0wRyWFvvCGi42LAGjMzIZxoV1vWiVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595--Qn6CCECPSWRDFAcXXOVCw-1; Mon, 23 Nov 2020 14:49:08 -0500
X-MC-Unique: -Qn6CCECPSWRDFAcXXOVCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5066518C43C1
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:49:07 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92CC16062F;
 Mon, 23 Nov 2020 19:49:03 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/19] qom: Make object_property_set_default() public
Date: Mon, 23 Nov 2020 14:48:14 -0500
Message-Id: <20201123194818.2773508-16-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

The function will be used outside qom/object.c, to simplify the
field property code that sets the property default value.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qom/object.h | 11 +++++++++++
 qom/object.c         |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 2ab124b8f0..4234cc9b66 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1090,6 +1090,17 @@ ObjectProperty *object_class_property_add(ObjectClass *klass, const char *name,
                                           ObjectPropertyRelease *release,
                                           void *opaque);
 
+/**
+ * object_property_set_default:
+ * @prop: the property to set
+ * @value: the value to be written to the property
+ *
+ * Set the property default value.
+ *
+ * Ownership of @value is transferred to the property.
+ */
+void object_property_set_default(ObjectProperty *prop, QObject *value);
+
 /**
  * object_property_set_default_bool:
  * @prop: the property to set
diff --git a/qom/object.c b/qom/object.c
index 7c11bcd3b1..6b0d9d8c79 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1547,7 +1547,7 @@ static void object_property_init_defval(Object *obj, ObjectProperty *prop)
     visit_free(v);
 }
 
-static void object_property_set_default(ObjectProperty *prop, QObject *defval)
+void object_property_set_default(ObjectProperty *prop, QObject *defval)
 {
     assert(!prop->defval);
     assert(!prop->init);
-- 
2.28.0


