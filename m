Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2162A6946
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 17:17:57 +0100 (CET)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaLTw-0007e4-4h
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 11:17:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLFN-0002kb-Ti
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kaLFL-0005e1-U2
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604505770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g4QmvrMlj+iLH18/CA4NzjeA5an0Jr4EgVc4cml3ftg=;
 b=LnkEGWBjao1bZNPvv5zHSR+MQdJM87Wt+5RUy15DK8ukytbrDk1EB6vILvb5htb+jPCEN8
 wzlN/KNjqI7/XQVCEi6NxXUTwMfVBuCUTe/zHFtPZtndZaJ5qb9x9yqaDAcQ5steJquEoH
 UIF54seHw7C42HUSp/gALb/11X1gDvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-gwn6WpJXNtW8Vh9aIXZPTQ-1; Wed, 04 Nov 2020 11:02:49 -0500
X-MC-Unique: gwn6WpJXNtW8Vh9aIXZPTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 945CB10A4D71;
 Wed,  4 Nov 2020 16:02:29 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ED4C60BFA;
 Wed,  4 Nov 2020 16:02:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/44] qdev: PROP_* macros
Date: Wed,  4 Nov 2020 11:00:16 -0500
Message-Id: <20201104160021.2342108-40-ehabkost@redhat.com>
In-Reply-To: <20201104160021.2342108-1-ehabkost@redhat.com>
References: <20201104160021.2342108-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new helper macros are just wrappers to DEFINE_PROP_* that can
be used directly as arguments to object_class_property_add_field().

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v2 of the series
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-properties.h | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0a44a91e6e..89c820eeb7 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -173,6 +173,60 @@ extern const PropertyInfo prop_info_link;
 #define DEFINE_PROP_END_OF_LIST()               \
     {}
 
+/*
+ * The PROP_* macros can be used as arguments for
+ * object_class_property_add_field().  They will evaluate to a
+ * pointer to a static variable.
+ */
+
+#define FIELD_PROP(def) \
+    ({ static Property _p = def; &p; })
+
+#define PROP_SIGNED(...) \
+    FIELD_PROP(DEFINE_PROP_SIGNED(NULL, __VA_ARGS__))
+#define PROP_SIGNED_NODEFAULT(...) \
+    FIELD_PROP(DEFINE_PROP_SIGNED_NODEFAULT(NULL, __VA_ARGS__))
+#define PROP_BIT(...) \
+    FIELD_PROP(DEFINE_PROP_BIT(NULL, __VA_ARGS__))
+#define PROP_UNSIGNED(...) \
+    FIELD_PROP(DEFINE_PROP_UNSIGNED(NULL, __VA_ARGS__))
+#define PROP_UNSIGNED_NODEFAULT(...) \
+    FIELD_PROP(DEFINE_PROP_UNSIGNED_NODEFAULT(NULL, __VA_ARGS__))
+#define PROP_BIT64(...) \
+    FIELD_PROP(DEFINE_PROP_BIT64(NULL, __VA_ARGS__))
+#define PROP_BOOL(...) \
+    FIELD_PROP(DEFINE_PROP_BOOL(NULL, __VA_ARGS__))
+#define PROP_ARRAY(...) \
+    FIELD_PROP(DEFINE_PROP_ARRAY(NULL, __VA_ARGS__))
+#define PROP_LINK(...) \
+    FIELD_PROP(DEFINE_PROP_LINK(NULL, __VA_ARGS__))
+#define PROP_UINT8(...) \
+    FIELD_PROP(DEFINE_PROP_UINT8(NULL, __VA_ARGS__))
+#define PROP_UINT16(...) \
+    FIELD_PROP(DEFINE_PROP_UINT16(NULL, __VA_ARGS__))
+#define PROP_UINT32(...) \
+    FIELD_PROP(DEFINE_PROP_UINT32(NULL, __VA_ARGS__))
+#define PROP_INT32(...) \
+    FIELD_PROP(DEFINE_PROP_INT32(NULL, __VA_ARGS__))
+#define PROP_UINT64(...) \
+    FIELD_PROP(DEFINE_PROP_UINT64(NULL, __VA_ARGS__))
+#define PROP_INT64(...) \
+    FIELD_PROP(DEFINE_PROP_INT64(NULL, __VA_ARGS__))
+#define PROP_SIZE(...) \
+    FIELD_PROP(DEFINE_PROP_SIZE(NULL, __VA_ARGS__))
+#define PROP_STRING(...) \
+    FIELD_PROP(DEFINE_PROP_STRING(NULL, __VA_ARGS__))
+#define PROP_ON_OFF_AUTO(...) \
+    FIELD_PROP(DEFINE_PROP_ON_OFF_AUTO(NULL, __VA_ARGS__))
+#define PROP_SIZE32(...) \
+    FIELD_PROP(DEFINE_PROP_SIZE32(NULL, __VA_ARGS__))
+#define PROP_UUID(...) \
+    FIELD_PROP(DEFINE_PROP_UUID(NULL, __VA_ARGS__))
+#define PROP_UUID_NODEFAULT(...) \
+    FIELD_PROP(DEFINE_PROP_UUID_NODEFAULT(NULL, __VA_ARGS__))
+#define PROP_END_OF_LIST(...) \
+    FIELD_PROP(DEFINE_PROP_END_OF_LIST(NULL, __VA_ARGS__))
+
 /**
  * object_class_property_add_field: Add a field property to object class
  * @oc: object class
-- 
2.28.0


