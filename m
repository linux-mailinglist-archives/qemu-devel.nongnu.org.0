Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF12121233B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 14:22:30 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqyEX-0000wD-ND
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 08:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqyD7-0008ND-5L
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:21:01 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44891
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqyD4-0000Mp-GU
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 08:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593692457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=tZpyUC8O0kFmGIJyFMAqx1/t3IDSz35Y6yMJtiML0fQ=;
 b=JmV1m9+Sgs5QoG1VgFmLH0sczCOsbym9ztZ1tW4Fy07aVu/9N6/EH29j5JbPoWQ/4SXOui
 UvjC92V7xrnwWO8mp1RsIP3j6mnezzlUzTli2EqUgajAzQnjXDWV7alJr0cJdOTsDVZmRl
 j4vLonlvyKgQn3ZKG8IPZreUT7tvfJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-5safvjGGNuCXU2nldRLoeA-1; Thu, 02 Jul 2020 08:20:55 -0400
X-MC-Unique: 5safvjGGNuCXU2nldRLoeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D124F1083E9B
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 12:20:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB02598FE0;
 Thu,  2 Jul 2020 12:20:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 33FBC31E87; Thu,  2 Jul 2020 14:20:48 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] object: qom module support
Date: Thu,  2 Jul 2020 14:20:40 +0200
Message-Id: <20200702122048.27798-3-kraxel@redhat.com>
In-Reply-To: <20200702122048.27798-1-kraxel@redhat.com>
References: <20200702122048.27798-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Little helper function to load modules on demand.  In most cases adding
module loading support for devices and other objects is just
s/object_class_by_name/module_object_class_by_name/ in the right spot.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20200624131045.14512-3-kraxel@redhat.com
---
 include/qom/object.h | 12 ++++++++++++
 qom/object.c         | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index 94a61ccc3fe8..51f188137f1f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -994,6 +994,18 @@ bool object_class_is_abstract(ObjectClass *klass);
  */
 ObjectClass *object_class_by_name(const char *typename);
 
+/**
+ * module_object_class_by_name:
+ * @typename: The QOM typename to obtain the class for.
+ *
+ * For objects which might be provided by a module.  Behaves like
+ * object_class_by_name, but additionally tries to load the module
+ * needed in case the class is not available.
+ *
+ * Returns: The class for @typename or %NULL if not found.
+ */
+ObjectClass *module_object_class_by_name(const char *typename);
+
 void object_class_foreach(void (*fn)(ObjectClass *klass, void *opaque),
                           const char *implements_type, bool include_abstract,
                           void *opaque);
diff --git a/qom/object.c b/qom/object.c
index 6ece96bc2bfc..34daaf1280f5 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -985,6 +985,20 @@ ObjectClass *object_class_by_name(const char *typename)
     return type->class;
 }
 
+ObjectClass *module_object_class_by_name(const char *typename)
+{
+    ObjectClass *oc;
+
+    oc = object_class_by_name(typename);
+#ifdef CONFIG_MODULES
+    if (!oc) {
+        module_load_qom_one(typename);
+        oc = object_class_by_name(typename);
+    }
+#endif
+    return oc;
+}
+
 ObjectClass *object_class_get_parent(ObjectClass *class)
 {
     TypeImpl *type = type_get_parent(class->type);
-- 
2.18.4


