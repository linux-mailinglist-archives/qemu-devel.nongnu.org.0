Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2DB2B10C3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:58:01 +0100 (CET)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKbQ-0004ch-NV
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPI-00063O-7I
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPE-0003LP-Cr
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42qmy84WjZoUzL6hvj8BR/4hg53C3KSeiLhnNSHXnjQ=;
 b=X43SAQOEVGIHn2qKKYdW+q3Ua5KtRbpbFbNbCHp8oTX1tSDMDpQluPN3haVbN5koRi+xVV
 R9ObS8HSklaOBdLpoEtX9prwzQ1CeeIK/4d5cmJ1A9ztT18emCv4MVVuPW5gx22wmB+gFh
 6c5oyrfs3Ah0yLBu71ug6MelUn+n+Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-TYl-mB2BPKOzdQR8yqOloA-1; Thu, 12 Nov 2020 16:45:19 -0500
X-MC-Unique: TYl-mB2BPKOzdQR8yqOloA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C4E1190A3E0;
 Thu, 12 Nov 2020 21:45:18 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AC4F5D9CA;
 Thu, 12 Nov 2020 21:45:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/53] qdev: Reuse DEFINE_PROP in all DEFINE_PROP_* macros
Date: Thu, 12 Nov 2020 16:43:13 -0500
Message-Id: <20201112214350.872250-17-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Instead of duplicating the code that sets name, info, offset,
and does type checking, make DEFINE_PROP accept a variable number
of arguments and reuse it in all DEFINE_PROP_* macros.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v1 -> v2:
* Redone after UUID property was moved
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/qdev-properties-system.h |  19 ++---
 include/hw/qdev-properties.h        | 114 ++++++++++------------------
 2 files changed, 46 insertions(+), 87 deletions(-)

diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 29529dc999..0ac327ae60 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -63,22 +63,15 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pcie_link_width, \
                         PCIExpLinkWidth)
 
-#define DEFINE_PROP_UUID(_name, _state, _field) {                  \
-        .name      = (_name),                                      \
-        .info      = &qdev_prop_uuid,                              \
-        .offset    = offsetof(_state, _field)                      \
-            + type_check(QemuUUID, typeof_field(_state, _field)),  \
-        .set_default = true,                                       \
-        }
+#define DEFINE_PROP_UUID(_name, _state, _field) \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID, \
+                .set_default = true)
+
 #define DEFINE_PROP_AUDIODEV(_n, _s, _f) \
     DEFINE_PROP(_n, _s, _f, qdev_prop_audiodev, QEMUSoundCard)
 
-#define DEFINE_PROP_UUID_NODEFAULT(_name, _state, _field) {        \
-        .name      = (_name),                                      \
-        .info      = &qdev_prop_uuid,                              \
-        .offset    = offsetof(_state, _field)                      \
-            + type_check(QemuUUID, typeof_field(_state, _field)),  \
-        }
+#define DEFINE_PROP_UUID_NODEFAULT(_name, _state, _field) \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID)
 
 
 #endif
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index d35d4aae84..1b58e4f922 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -61,73 +61,46 @@ extern const PropertyInfo qdev_prop_size32;
 extern const PropertyInfo qdev_prop_arraylen;
 extern const PropertyInfo qdev_prop_link;
 
-#define DEFINE_PROP(_name, _state, _field, _prop, _type) { \
+#define DEFINE_PROP(_name, _state, _field, _prop, _type, ...) {  \
         .name      = (_name),                                    \
         .info      = &(_prop),                                   \
         .offset    = offsetof(_state, _field)                    \
             + type_check(_type, typeof_field(_state, _field)),   \
+        __VA_ARGS__                                              \
         }
 
-#define DEFINE_PROP_SIGNED(_name, _state, _field, _defval, _prop, _type) { \
-        .name      = (_name),                                           \
-        .info      = &(_prop),                                          \
-        .offset    = offsetof(_state, _field)                           \
-            + type_check(_type,typeof_field(_state, _field)),           \
-        .set_default = true,                                            \
-        .defval.i  = (_type)_defval,                                    \
-        }
+#define DEFINE_PROP_SIGNED(_name, _state, _field, _defval, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type,                     \
+                .set_default = true,                                     \
+                .defval.i    = (_type)_defval)
 
-#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type) { \
-        .name      = (_name),                                           \
-        .info      = &(_prop),                                          \
-        .offset    = offsetof(_state, _field)                           \
-            + type_check(_type, typeof_field(_state, _field)),          \
-        }
+#define DEFINE_PROP_SIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type)
 
-#define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval) {  \
-        .name      = (_name),                                    \
-        .info      = &(qdev_prop_bit),                           \
-        .bitnr    = (_bit),                                      \
-        .offset    = offsetof(_state, _field)                    \
-            + type_check(uint32_t,typeof_field(_state, _field)), \
-        .set_default = true,                                     \
-        .defval.u  = (bool)_defval,                              \
-        }
+#define DEFINE_PROP_BIT(_name, _state, _field, _bit, _defval)   \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_bit, uint32_t, \
+                .bitnr       = (_bit),                          \
+                .set_default = true,                            \
+                .defval.u    = (bool)_defval)
 
-#define DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _type) { \
-        .name      = (_name),                                           \
-        .info      = &(_prop),                                          \
-        .offset    = offsetof(_state, _field)                           \
-            + type_check(_type, typeof_field(_state, _field)),          \
-        .set_default = true,                                            \
-        .defval.u  = (_type)_defval,                                    \
-        }
+#define DEFINE_PROP_UNSIGNED(_name, _state, _field, _defval, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type,                       \
+                .set_default = true,                                       \
+                .defval.u  = (_type)_defval)
 
-#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) { \
-        .name      = (_name),                                           \
-        .info      = &(_prop),                                          \
-        .offset    = offsetof(_state, _field)                           \
-            + type_check(_type, typeof_field(_state, _field)),          \
-        }
+#define DEFINE_PROP_UNSIGNED_NODEFAULT(_name, _state, _field, _prop, _type) \
+    DEFINE_PROP(_name, _state, _field, _prop, _type)
 
-#define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval) {       \
-        .name      = (_name),                                           \
-        .info      = &(qdev_prop_bit64),                                \
-        .bitnr    = (_bit),                                             \
-        .offset    = offsetof(_state, _field)                           \
-            + type_check(uint64_t, typeof_field(_state, _field)),       \
-        .set_default = true,                                            \
-        .defval.u  = (bool)_defval,                                     \
-        }
+#define DEFINE_PROP_BIT64(_name, _state, _field, _bit, _defval)   \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_bit64, uint64_t, \
+                .bitnr    = (_bit),                               \
+                .set_default = true,                              \
+                .defval.u  = (bool)_defval)
 
-#define DEFINE_PROP_BOOL(_name, _state, _field, _defval) {       \
-        .name      = (_name),                                    \
-        .info      = &(qdev_prop_bool),                          \
-        .offset    = offsetof(_state, _field)                    \
-            + type_check(bool, typeof_field(_state, _field)),    \
-        .set_default = true,                                     \
-        .defval.u    = (bool)_defval,                            \
-        }
+#define DEFINE_PROP_BOOL(_name, _state, _field, _defval)     \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_bool, bool, \
+                .set_default = true,                         \
+                .defval.u    = (bool)_defval)
 
 #define PROP_ARRAY_LEN_PREFIX "len-"
 
@@ -155,26 +128,19 @@ extern const PropertyInfo qdev_prop_link;
  * It is the responsibility of the device deinit code to free the
  * @_arrayfield memory.
  */
-#define DEFINE_PROP_ARRAY(_name, _state, _field,                        \
-                          _arrayfield, _arrayprop, _arraytype) {        \
-        .name = (PROP_ARRAY_LEN_PREFIX _name),                          \
-        .info = &(qdev_prop_arraylen),                                  \
-        .set_default = true,                                            \
-        .defval.u = 0,                                                  \
-        .offset = offsetof(_state, _field)                              \
-            + type_check(uint32_t, typeof_field(_state, _field)),       \
-        .arrayinfo = &(_arrayprop),                                     \
-        .arrayfieldsize = sizeof(_arraytype),                           \
-        .arrayoffset = offsetof(_state, _arrayfield),                   \
-        }
+#define DEFINE_PROP_ARRAY(_name, _state, _field,               \
+                          _arrayfield, _arrayprop, _arraytype) \
+    DEFINE_PROP((PROP_ARRAY_LEN_PREFIX _name),                 \
+                _state, _field, qdev_prop_arraylen, uint32_t,  \
+                .set_default = true,                           \
+                .defval.u = 0,                                 \
+                .arrayinfo = &(_arrayprop),                    \
+                .arrayfieldsize = sizeof(_arraytype),          \
+                .arrayoffset = offsetof(_state, _arrayfield))
 
-#define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type) {     \
-        .name = (_name),                                                \
-        .info = &(qdev_prop_link),                                      \
-        .offset = offsetof(_state, _field)                              \
-            + type_check(_ptr_type, typeof_field(_state, _field)),      \
-        .link_type  = _type,                                            \
-        }
+#define DEFINE_PROP_LINK(_name, _state, _field, _type, _ptr_type)     \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_link, _ptr_type,     \
+                .link_type  = _type)
 
 #define DEFINE_PROP_UINT8(_n, _s, _f, _d)                       \
     DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_uint8, uint8_t)
-- 
2.28.0


