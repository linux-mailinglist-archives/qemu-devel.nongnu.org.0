Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7282B1194
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 23:34:32 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdLAl-0001nk-EI
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 17:34:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRQ-0000Jc-Na
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKRM-0003o3-3w
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWzmX4QSxGjzUC1rfBAMCIuzvaMvttd7vGWA8RCJy10=;
 b=YPcBkwyBbYo+Z5GAVYx2EllVhOfdE3g8jl7qeVQzS/kFu44GHzAroCU7lnwjKW/Vgqut5p
 5wvCbfZALDkc/N9cm4ithBAsdB+HetpZlGhgcYWXL+Av07mGqsJbAfKxUe4a4yZh45Hm0Q
 x35/g1gP2g4NfQV94lQ/iSMBBMA98Oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-YNuptHFHO1Ot2FW-3PmgQQ-1; Thu, 12 Nov 2020 16:47:27 -0500
X-MC-Unique: YNuptHFHO1Ot2FW-3PmgQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4450807325;
 Thu, 12 Nov 2020 21:47:26 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 806E81002382;
 Thu, 12 Nov 2020 21:47:23 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 51/53] qom: PROP_* macros
Date: Thu, 12 Nov 2020 16:43:48 -0500
Message-Id: <20201112214350.872250-52-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new helper macros are similar to the old DEFINE_PROP_* macros, but
don't take a name argument.  They can be used directly as argument to
object_class_property_add_field().

The DEFINE_PROP_* macros were redefined to just be wrappers to PROP_*.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Now the DEFINE_PROP_* macros are defined using PROP_*,
  not the other way around
* Remove unused macros (PROP_UNSIGNED*, PROP_SIGNED*, PROP_UUID)
* Removed PROP_ARRAY because it isn't as trivial as the others
* Now PROP_* won't return a pointer to a static variable anymore,
  but just a compound literal for a Property struct.

This is a new patch added in v2 of the series

---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/qom/property-types.h | 141 ++++++++++++++++++++++-------------
 1 file changed, 90 insertions(+), 51 deletions(-)

diff --git a/include/qom/property-types.h b/include/qom/property-types.h
index 91b166badf..3132ddafd9 100644
--- a/include/qom/property-types.h
+++ b/include/qom/property-types.h
@@ -23,6 +23,64 @@ extern const PropertyInfo prop_info_size32;
 extern const PropertyInfo prop_info_arraylen;
 extern const PropertyInfo prop_info_link;
 
+#define PROP_SIGNED(_state, _field, _defval, _prop, _type, ...) \
+    FIELD_PROP(_state, _field, _prop, _type,                    \
+               .set_default = true,                             \
+               .defval.i    = (_type)_defval,                   \
+               __VA_ARGS__)
+
+#define PROP_UNSIGNED(_state, _field, _defval, _prop, _type, ...) \
+    FIELD_PROP(_state, _field, _prop, _type,                    \
+               .set_default = true,                             \
+               .defval.u  = (_type)_defval,                     \
+               __VA_ARGS__)
+
+#define PROP_BIT(_state, _field, _bit, _defval, ...) \
+    FIELD_PROP(_state, _field, prop_info_bit, uint32_t,         \
+               .bitnr       = (_bit),                           \
+               .set_default = true,                             \
+               .defval.u    = (bool)_defval,                    \
+               __VA_ARGS__)
+
+#define PROP_BIT64(_state, _field, _bit, _defval, ...) \
+    FIELD_PROP(_state, _field, prop_info_bit64, uint64_t,       \
+               .bitnr    = (_bit),                              \
+               .set_default = true,                             \
+               .defval.u  = (bool)_defval,                      \
+               __VA_ARGS__)
+
+#define PROP_BOOL(_state, _field, _defval, ...) \
+    FIELD_PROP(_state, _field, prop_info_bool, bool,            \
+               .set_default = true,                             \
+               .defval.u    = (bool)_defval,                    \
+               __VA_ARGS__)
+
+#define PROP_LINK(_state, _field, _type, _ptr_type, ...) \
+    FIELD_PROP(_state, _field, prop_info_link, _ptr_type,       \
+               .link_type  = _type,                             \
+               __VA_ARGS__)
+
+#define PROP_UINT8(_s, _f, _d, ...) \
+    PROP_UNSIGNED(_s, _f, _d, prop_info_uint8, uint8_t, __VA_ARGS__)
+#define PROP_UINT16(_s, _f, _d, ...) \
+    PROP_UNSIGNED(_s, _f, _d, prop_info_uint16, uint16_t, __VA_ARGS__)
+#define PROP_UINT32(_s, _f, _d, ...) \
+    PROP_UNSIGNED(_s, _f, _d, prop_info_uint32, uint32_t, __VA_ARGS__)
+#define PROP_INT32(_s, _f, _d, ...) \
+    PROP_SIGNED(_s, _f, _d, prop_info_int32, int32_t, __VA_ARGS__)
+#define PROP_UINT64(_s, _f, _d, ...) \
+    PROP_UNSIGNED(_s, _f, _d, prop_info_uint64, uint64_t, __VA_ARGS__)
+#define PROP_INT64(_s, _f, _d, ...) \
+    PROP_SIGNED(_s, _f, _d, prop_info_int64, int64_t, __VA_ARGS__)
+#define PROP_SIZE(_s, _f, _d, ...) \
+    PROP_UNSIGNED(_s, _f, _d, prop_info_size, uint64_t, __VA_ARGS__)
+#define PROP_STRING(_s, _f, ...) \
+    FIELD_PROP(_s, _f, prop_info_string, char*, __VA_ARGS__)
+#define PROP_ON_OFF_AUTO(_s, _f, _d, ...) \
+    PROP_SIGNED(_s, _f, _d, prop_info_on_off_auto, OnOffAuto, __VA_ARGS__)
+#define PROP_SIZE32(_s, _f, _d, ...) \
+    PROP_UNSIGNED(_s, _f, _d, prop_info_size32, uint32_t, __VA_ARGS__)
+
 /**
  * DEFINE_PROP: Define a #Property struct, including a property name
  *
@@ -43,33 +101,6 @@ extern const PropertyInfo prop_info_link;
                .name_template = (_name),                      \
                __VA_ARGS__)
 
-#define DEFINE_PROP_SIGNED(_name, _state, _field, _defval, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type,                     \
-                .set_default = true,                                     \
-                .defval.i    = (_type)_defval)
-
-#define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval)   \
-    DEFINE_PROP(_name, _state, _field, prop_info_bit, uint32_t, \
-                .bitnr       = (_bit),                          \
-                .set_default = true,                            \
-                .defval.u    = (bool)_defval)
-
-#define DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _type) \
-    DEFINE_PROP(_name, _state, _field, _prop, _type,                       \
-                .set_default = true,                                       \
-                .defval.u  = (_type)_defval)
-
-#define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval)   \
-    DEFINE_PROP(_name, _state, _field, prop_info_bit64, uint64_t, \
-                .bitnr    = (_bit),                               \
-                .set_default = true,                              \
-                .defval.u  = (bool)_defval)
-
-#define DEFINE_PROP_BOOL(_name, _state, _field, _defval)     \
-    DEFINE_PROP(_name, _state, _field, prop_info_bool, bool, \
-                .set_default = true,                         \
-                .defval.u    = (bool)_defval)
-
 #define PROP_ARRAY_LEN_PREFIX "len-"
 
 /**
@@ -106,30 +137,38 @@ extern const PropertyInfo prop_info_link;
                 .arrayfieldsize = sizeof(_arraytype),          \
                 .arrayoffset = offsetof(_state, _arrayfield))
 
-#define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type)     \
-    DEFINE_PROP(_name, _state, _field, prop_info_link, _ptr_type,     \
-                .link_type  = _type)
-
-#define DEFINE_PROP_UINT8(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint8, uint8_t)
-#define DEFINE_PROP_UINT16(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint16, uint16_t)
-#define DEFINE_PROP_UINT32(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint32, uint32_t)
-#define DEFINE_PROP_INT32(_n, _s, _f, _d)                      \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int32, int32_t)
-#define DEFINE_PROP_UINT64(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint64, uint64_t)
-#define DEFINE_PROP_INT64(_n, _s, _f, _d)                      \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int64, int64_t)
-#define DEFINE_PROP_SIZE(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size, uint64_t)
-#define DEFINE_PROP_STRING(_n, _s, _f)             \
-    DEFINE_PROP(_n, _s, _f, prop_info_string, char*)
-#define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_on_off_auto, OnOffAuto)
-#define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size32, uint32_t)
+#define DEFINE_PROP_SIGNED(_n, ...) \
+    PROP_SIGNED(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_BIT(_n, ...) \
+    PROP_BIT(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_UNSIGNED(_n, ...) \
+    PROP_UNSIGNED(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_BIT64(_n, ...) \
+    PROP_BIT64(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_BOOL(_n, ...) \
+    PROP_BOOL(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_LINK(_n, ...) \
+    PROP_LINK(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_UINT8(_n, ...) \
+    PROP_UINT8(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_UINT16(_n, ...) \
+    PROP_UINT16(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_UINT32(_n, ...) \
+    PROP_UINT32(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_INT32(_n, ...) \
+    PROP_INT32(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_UINT64(_n, ...) \
+    PROP_UINT64(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_INT64(_n, ...) \
+    PROP_INT64(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_SIZE(_n, ...) \
+    PROP_SIZE(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_STRING(_n, ...) \
+    PROP_STRING(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_ON_OFF_AUTO(_n, ...) \
+    PROP_ON_OFF_AUTO(__VA_ARGS__, .name_template = (_n))
+#define DEFINE_PROP_SIZE32(_n, ...) \
+    PROP_SIZE32(__VA_ARGS__, .name_template = (_n))
 
 #define DEFINE_PROP_END_OF_LIST()               \
     {}
-- 
2.28.0


