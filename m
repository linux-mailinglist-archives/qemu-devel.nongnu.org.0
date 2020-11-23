Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2702C1586
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:20:23 +0100 (CET)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIJy-00013N-9k
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHq4-0006Ui-6E
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpt-0007vR-Mh
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbLCIF6CtGHcuuTHcvlnbNvJqP2vd8/l7+RtnDAhzMY=;
 b=ijOmjwab/dgcblB/0R+NK3Q4BIuxWsSQez5V9MC29MGvsAfySTeeHPvykpdW79Fh7FDbzB
 DZ+nCCBAx+sq3alJxKg/UzELkJP5ZdADQD0n+mD8G3SwI8k0m36spi+EfE7LyK+fs6vdxo
 O1tRA8e3U8IT77EnbFYsGjuOAP82X80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-2sL3Bg0sNyGyHjUYjgnjeQ-1; Mon, 23 Nov 2020 14:49:13 -0500
X-MC-Unique: 2sL3Bg0sNyGyHjUYjgnjeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F027C1012E5E
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:49:12 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7274B19D9D;
 Mon, 23 Nov 2020 19:49:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/19] qom: Make PropertyInfo.set_default_value optional
Date: Mon, 23 Nov 2020 14:48:15 -0500
Message-Id: <20201123194818.2773508-17-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

If .set_default_value is not set, call
object_property_set_default().  This will let us delete most of
the .set_default_value functions later.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch in v3 of this series.

In v2 of the series, equivalent functionality was implemented by
"qom: Use qlit to represent property defaults".
---
 include/qom/field-property.h |  3 +++
 qom/field-property.c         | 12 ++++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/qom/field-property.h b/include/qom/field-property.h
index 951cec2fb0..00b83ee9ba 100644
--- a/include/qom/field-property.h
+++ b/include/qom/field-property.h
@@ -53,6 +53,9 @@ struct PropertyInfo {
      * @set_default_value: Callback for initializing the default value
      *
      * @defval is a weak reference.
+     *
+     * Optional.  If not set and Property.defval is not QTYPE_NONE,
+     * object_property_set_default() will be called.
      */
     void (*set_default_value)(ObjectProperty *op, const Property *prop,
                               const QObject *defval);
diff --git a/qom/field-property.c b/qom/field-property.c
index 593ffb53e9..d21ff98862 100644
--- a/qom/field-property.c
+++ b/qom/field-property.c
@@ -72,8 +72,16 @@ static void field_prop_set_default_value(ObjectProperty *op,
     }
 
     defval = qobject_from_qlit(&prop->defval);
-    assert(prop->info->set_default_value);
-    prop->info->set_default_value(op, prop, defval);
+    if (prop->info->set_default_value) {
+        /* .set_default_value() gets a weak reference */
+        prop->info->set_default_value(op, prop, defval);
+    } else {
+        /*
+         * object_property_set_default() takes ownership,
+         * so qobject_ref() is needed.
+         */
+        object_property_set_default(op, qobject_ref(defval));
+    }
     qobject_unref(defval);
 }
 
-- 
2.28.0


