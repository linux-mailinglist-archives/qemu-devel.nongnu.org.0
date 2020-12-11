Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706F02D8255
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 23:52:16 +0100 (CET)
Received: from localhost ([::1]:52872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrGo-0000t9-Iz
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 17:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqa9-0003Ds-IA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1knqZk-0006pY-Qv
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607724463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qEmjy/8vk3/5tVoHt3DAuCGhxai+lJk/GoA2h1anmJA=;
 b=GCZbKPwdA+cBPAaMC1t+/3w02KdZs64NIxvPdz3xGgTZcQFAYjmJMJmAGo3oDPxWkyPOO6
 cYmzafYzPpK58RYaX84KzVUj4nG+Sdh334cbXpry8aTj44T0XmAHKARFjzd7ZkVMlILmG7
 /hKY/3MPssMvlI48aWyfdIqN2GENBiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-6ojzbqprPIum9yEA41rcSg-1; Fri, 11 Dec 2020 17:07:39 -0500
X-MC-Unique: 6ojzbqprPIum9yEA41rcSg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DDD419251A0;
 Fri, 11 Dec 2020 22:07:38 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB94460BE5;
 Fri, 11 Dec 2020 22:07:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 29/32] qdev: Rename qdev_prop_* to prop_info_*
Date: Fri, 11 Dec 2020 17:05:26 -0500
Message-Id: <20201211220529.2290218-30-ehabkost@redhat.com>
In-Reply-To: <20201211220529.2290218-1-ehabkost@redhat.com>
References: <20201211220529.2290218-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The basic property types in qdev-properties.c are not going to be
qdev-specific anymore.  Rename the variables to prop_info_*.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Redone patch after moving UUID property to qdev-properties-system.c
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 include/hw/qdev-properties.h | 62 ++++++++++++++++++------------------
 hw/core/qdev-properties.c    | 36 ++++++++++-----------
 hw/intc/arm_gicv3_common.c   |  2 +-
 hw/intc/rx_icu.c             |  4 +--
 hw/misc/arm_sysctl.c         |  4 +--
 hw/net/e1000e.c              |  6 ++--
 target/arm/cpu.c             |  2 +-
 target/sparc/cpu.c           |  2 +-
 8 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 68e544708b..90222822f1 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -44,22 +44,22 @@ struct PropertyInfo {
 
 /*** qdev-properties.c ***/
 
-extern const PropertyInfo qdev_prop_bit;
-extern const PropertyInfo qdev_prop_bit64;
-extern const PropertyInfo qdev_prop_bool;
-extern const PropertyInfo qdev_prop_enum;
-extern const PropertyInfo qdev_prop_uint8;
-extern const PropertyInfo qdev_prop_uint16;
-extern const PropertyInfo qdev_prop_uint32;
-extern const PropertyInfo qdev_prop_int32;
-extern const PropertyInfo qdev_prop_uint64;
-extern const PropertyInfo qdev_prop_int64;
-extern const PropertyInfo qdev_prop_size;
-extern const PropertyInfo qdev_prop_string;
-extern const PropertyInfo qdev_prop_on_off_auto;
-extern const PropertyInfo qdev_prop_size32;
-extern const PropertyInfo qdev_prop_arraylen;
-extern const PropertyInfo qdev_prop_link;
+extern const PropertyInfo prop_info_bit;
+extern const PropertyInfo prop_info_bit64;
+extern const PropertyInfo prop_info_bool;
+extern const PropertyInfo prop_info_enum;
+extern const PropertyInfo prop_info_uint8;
+extern const PropertyInfo prop_info_uint16;
+extern const PropertyInfo prop_info_uint32;
+extern const PropertyInfo prop_info_int32;
+extern const PropertyInfo prop_info_uint64;
+extern const PropertyInfo prop_info_int64;
+extern const PropertyInfo prop_info_size;
+extern const PropertyInfo prop_info_string;
+extern const PropertyInfo prop_info_on_off_auto;
+extern const PropertyInfo prop_info_size32;
+extern const PropertyInfo prop_info_arraylen;
+extern const PropertyInfo prop_info_link;
 
 #define DEFINE_PROP(_name, _state, _field, _prop, _type, ...) {  \
         .name      = (_name),                                    \
@@ -78,7 +78,7 @@ extern const PropertyInfo qdev_prop_link;
     DEFINE_PROP(_name, _state, _field, _prop, _type)
 
 #define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval)   \
-    DEFINE_PROP(_name, _state, _field, qdev_prop_bit, uint32_t, \
+    DEFINE_PROP(_name, _state, _field, prop_info_bit, uint32_t, \
                 .bitnr       = (_bit),                          \
                 .set_default = true,                            \
                 .defval.u    = (bool)_defval)
@@ -92,13 +92,13 @@ extern const PropertyInfo qdev_prop_link;
     DEFINE_PROP(_name, _state, _field, _prop, _type)
 
 #define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval)   \
-    DEFINE_PROP(_name, _state, _field, qdev_prop_bit64, uint64_t, \
+    DEFINE_PROP(_name, _state, _field, prop_info_bit64, uint64_t, \
                 .bitnr    = (_bit),                               \
                 .set_default = true,                              \
                 .defval.u  = (bool)_defval)
 
 #define DEFINE_PROP_BOOL(_name, _state, _field, _defval)     \
-    DEFINE_PROP(_name, _state, _field, qdev_prop_bool, bool, \
+    DEFINE_PROP(_name, _state, _field, prop_info_bool, bool, \
                 .set_default = true,                         \
                 .defval.u    = (bool)_defval)
 
@@ -131,7 +131,7 @@ extern const PropertyInfo qdev_prop_link;
 #define DEFINE_PROP_ARRAY(_name, _state, _field,               \
                           _arrayfield, _arrayprop, _arraytype) \
     DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),                 \
-                _state, _field, qdev_prop_arraylen, uint32_t,  \
+                _state, _field, prop_info_arraylen, uint32_t,  \
                 .set_default = true,                           \
                 .defval.u = 0,                                 \
                 .arrayinfo = &(_arrayprop),                    \
@@ -139,29 +139,29 @@ extern const PropertyInfo qdev_prop_link;
                 .arrayoffset = offsetof(_state, _arrayfield))
 
 #define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type)     \
-    DEFINE_PROP(_name, _state, _field, qdev_prop_link, _ptr_type,     \
+    DEFINE_PROP(_name, _state, _field, prop_info_link, _ptr_type,     \
                 .link_type  = _type)
 
 #define DEFINE_PROP_UINT8(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint8, uint8_t)
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint8, uint8_t)
 #define DEFINE_PROP_UINT16(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint16, uint16_t)
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint16, uint16_t)
 #define DEFINE_PROP_UINT32(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint32, uint32_t)
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint32, uint32_t)
 #define DEFINE_PROP_INT32(_n, _s, _f, _d)                      \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_int32, int32_t)
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int32, int32_t)
 #define DEFINE_PROP_UINT64(_n, _s, _f, _d)                      \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint64, uint64_t)
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_uint64, uint64_t)
 #define DEFINE_PROP_INT64(_n, _s, _f, _d)                      \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_int64, int64_t)
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_int64, int64_t)
 #define DEFINE_PROP_SIZE(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size, uint64_t)
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size, uint64_t)
 #define DEFINE_PROP_STRING(_n, _s, _f)             \
-    DEFINE_PROP(_n, _s, _f, qdev_prop_string, char*)
+    DEFINE_PROP(_n, _s, _f, prop_info_string, char*)
 #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
-    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
+    DEFINE_PROP_SIGNED(_n, _s, _f, _d, prop_info_on_off_auto, OnOffAuto)
 #define DEFINE_PROP_SIZE32(_n, _s, _f, _d)                       \
-    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size32, uint32_t)
+    DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, prop_info_size32, uint32_t)
 
 #define DEFINE_PROP_END_OF_LIST()               \
     {}
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index d2f565f552..c1dd4ae71b 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -121,7 +121,7 @@ void field_prop_set_default_value_enum(ObjectProperty *op,
         qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
 }
 
-const PropertyInfo qdev_prop_enum = {
+const PropertyInfo prop_info_enum = {
     .name  = "enum",
     .get   = field_prop_get_enum,
     .set   = field_prop_set_enum,
@@ -132,7 +132,7 @@ const PropertyInfo qdev_prop_enum = {
 
 static uint32_t qdev_get_prop_mask(Property *prop)
 {
-    assert(prop->info == &qdev_prop_bit);
+    assert(prop->info == &prop_info_bit);
     return 0x1 << prop->bitnr;
 }
 
@@ -174,7 +174,7 @@ static void set_default_value_bool(ObjectProperty *op, const Property *prop)
     object_property_set_default_bool(op, prop->defval.u);
 }
 
-const PropertyInfo qdev_prop_bit = {
+const PropertyInfo prop_info_bit = {
     .name  = "bool",
     .description = "on/off",
     .get   = prop_get_bit,
@@ -186,7 +186,7 @@ const PropertyInfo qdev_prop_bit = {
 
 static uint64_t qdev_get_prop_mask64(Property *prop)
 {
-    assert(prop->info == &qdev_prop_bit64);
+    assert(prop->info == &prop_info_bit64);
     return 0x1ull << prop->bitnr;
 }
 
@@ -223,7 +223,7 @@ static void prop_set_bit64(Object *obj, Visitor *v, const char *name,
     bit64_prop_set(obj, prop, value);
 }
 
-const PropertyInfo qdev_prop_bit64 = {
+const PropertyInfo prop_info_bit64 = {
     .name  = "bool",
     .description = "on/off",
     .get   = prop_get_bit64,
@@ -251,7 +251,7 @@ static void set_bool(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_bool(v, name, ptr, errp);
 }
 
-const PropertyInfo qdev_prop_bool = {
+const PropertyInfo prop_info_bool = {
     .name  = "bool",
     .get   = get_bool,
     .set   = set_bool,
@@ -290,7 +290,7 @@ void field_prop_set_default_value_uint(ObjectProperty *op,
     object_property_set_default_uint(op, prop->defval.u);
 }
 
-const PropertyInfo qdev_prop_uint8 = {
+const PropertyInfo prop_info_uint8 = {
     .name  = "uint8",
     .get   = get_uint8,
     .set   = set_uint8,
@@ -317,7 +317,7 @@ static void set_uint16(Object *obj, Visitor *v, const char *name,
     visit_type_uint16(v, name, ptr, errp);
 }
 
-const PropertyInfo qdev_prop_uint16 = {
+const PropertyInfo prop_info_uint16 = {
     .name  = "uint16",
     .get   = get_uint16,
     .set   = set_uint16,
@@ -362,14 +362,14 @@ static void set_int32(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_int32(v, name, ptr, errp);
 }
 
-const PropertyInfo qdev_prop_uint32 = {
+const PropertyInfo prop_info_uint32 = {
     .name  = "uint32",
     .get   = get_uint32,
     .set   = set_uint32,
     .set_default_value = field_prop_set_default_value_uint,
 };
 
-const PropertyInfo qdev_prop_int32 = {
+const PropertyInfo prop_info_int32 = {
     .name  = "int32",
     .get   = field_prop_get_int32,
     .set   = set_int32,
@@ -414,14 +414,14 @@ static void set_int64(Object *obj, Visitor *v, const char *name,
     visit_type_int64(v, name, ptr, errp);
 }
 
-const PropertyInfo qdev_prop_uint64 = {
+const PropertyInfo prop_info_uint64 = {
     .name  = "uint64",
     .get   = get_uint64,
     .set   = set_uint64,
     .set_default_value = field_prop_set_default_value_uint,
 };
 
-const PropertyInfo qdev_prop_int64 = {
+const PropertyInfo prop_info_int64 = {
     .name  = "int64",
     .get   = get_int64,
     .set   = set_int64,
@@ -464,7 +464,7 @@ static void set_string(Object *obj, Visitor *v, const char *name,
     *ptr = str;
 }
 
-const PropertyInfo qdev_prop_string = {
+const PropertyInfo prop_info_string = {
     .name  = "str",
     .release = release_string,
     .get   = get_string,
@@ -473,7 +473,7 @@ const PropertyInfo qdev_prop_string = {
 
 /* --- on/off/auto --- */
 
-const PropertyInfo qdev_prop_on_off_auto = {
+const PropertyInfo prop_info_on_off_auto = {
     .name = "OnOffAuto",
     .description = "on/off/auto",
     .enum_table = &OnOffAuto_lookup,
@@ -516,7 +516,7 @@ static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
     *ptr = value;
 }
 
-const PropertyInfo qdev_prop_size32 = {
+const PropertyInfo prop_info_size32 = {
     .name  = "size",
     .get = field_prop_get_size32,
     .set = set_size32,
@@ -613,7 +613,7 @@ static void set_prop_arraylen(Object *obj, Visitor *v, const char *name,
     }
 }
 
-const PropertyInfo qdev_prop_arraylen = {
+const PropertyInfo prop_info_arraylen = {
     .name = "uint32",
     .get = get_uint32,
     .set = set_prop_arraylen,
@@ -812,7 +812,7 @@ static void set_size(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_size(v, name, ptr, errp);
 }
 
-const PropertyInfo qdev_prop_size = {
+const PropertyInfo prop_info_size = {
     .name  = "size",
     .get = get_size,
     .set = set_size,
@@ -830,7 +830,7 @@ static ObjectProperty *create_link_property(ObjectClass *oc, const char *name,
                                           OBJ_PROP_LINK_STRONG);
 }
 
-const PropertyInfo qdev_prop_link = {
+const PropertyInfo prop_info_link = {
     .name = "link",
     .create = create_link_property,
 };
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..6d06b4d4c5 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -496,7 +496,7 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
-                      redist_region_count, qdev_prop_uint32, uint32_t),
+                      redist_region_count, prop_info_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/rx_icu.c b/hw/intc/rx_icu.c
index e5c01807b9..dde05eaf8b 100644
--- a/hw/intc/rx_icu.c
+++ b/hw/intc/rx_icu.c
@@ -363,9 +363,9 @@ static const VMStateDescription vmstate_rxicu = {
 
 static Property rxicu_properties[] = {
     DEFINE_PROP_ARRAY("ipr-map", RXICUState, nr_irqs, map,
-                      qdev_prop_uint8, uint8_t),
+                      prop_info_uint8, uint8_t),
     DEFINE_PROP_ARRAY("trigger-level", RXICUState, nr_sense, init_sense,
-                      qdev_prop_uint8, uint8_t),
+                      prop_info_uint8, uint8_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/misc/arm_sysctl.c b/hw/misc/arm_sysctl.c
index 42d4693854..634f3d916f 100644
--- a/hw/misc/arm_sysctl.c
+++ b/hw/misc/arm_sysctl.c
@@ -628,10 +628,10 @@ static Property arm_sysctl_properties[] = {
     DEFINE_PROP_UINT32("proc_id", arm_sysctl_state, proc_id, 0),
     /* Daughterboard power supply voltages (as reported via SYS_CFG) */
     DEFINE_PROP_ARRAY("db-voltage", arm_sysctl_state, db_num_vsensors,
-                      db_voltage, qdev_prop_uint32, uint32_t),
+                      db_voltage, prop_info_uint32, uint32_t),
     /* Daughterboard clock reset values (as reported via SYS_CFG) */
     DEFINE_PROP_ARRAY("db-clock", arm_sysctl_state, db_num_clocks,
-                      db_clock_reset, qdev_prop_uint32, uint32_t),
+                      db_clock_reset, prop_info_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index a8a77eca95..9d2f471c7c 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -686,15 +686,15 @@ static void e1000e_class_init(ObjectClass *class, void *data)
     dc->reset = e1000e_qdev_reset;
     dc->vmsd = &e1000e_vmstate;
 
-    e1000e_prop_disable_vnet = qdev_prop_uint8;
+    e1000e_prop_disable_vnet = prop_info_uint8;
     e1000e_prop_disable_vnet.description = "Do not use virtio headers, "
                                            "perform SW offloads emulation "
                                            "instead";
 
-    e1000e_prop_subsys_ven = qdev_prop_uint16;
+    e1000e_prop_subsys_ven = prop_info_uint16;
     e1000e_prop_subsys_ven.description = "PCI device Subsystem Vendor ID";
 
-    e1000e_prop_subsys = qdev_prop_uint16;
+    e1000e_prop_subsys = prop_info_uint16;
     e1000e_prop_subsys.description = "PCI device Subsystem ID";
 
     device_class_set_props(dc, e1000e_properties);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d6188f6566..bb34ff1aab 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1111,7 +1111,7 @@ static Property arm_cpu_has_mpu_property =
 static Property arm_cpu_pmsav7_dregion_property =
             DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
                                            pmsav7_dregion,
-                                           qdev_prop_uint32, uint32_t);
+                                           prop_info_uint32, uint32_t);
 
 static bool arm_get_pmu(Object *obj, Error **errp)
 {
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index b730146bbe..0da2190cac 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -839,7 +839,7 @@ static Property sparc_cpu_properties[] = {
     DEFINE_PROP_BIT("cmt",      SPARCCPU, env.def.features, 12, false),
     DEFINE_PROP_BIT("gl",       SPARCCPU, env.def.features, 13, false),
     DEFINE_PROP_UNSIGNED("iu-version", SPARCCPU, env.def.iu_version, 0,
-                         qdev_prop_uint64, target_ulong),
+                         prop_info_uint64, target_ulong),
     DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, 0),
     DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, 0),
     DEFINE_PROP("nwindows",     SPARCCPU, env.def.nwindows,
-- 
2.28.0


