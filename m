Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35ACFC06
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 16:10:12 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHqBn-0007kQ-Of
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 10:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iHq00-0004pY-1U
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iHpzu-0005PH-Pv
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:57:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35818)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iHpzt-0005OK-Bk
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:57:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 920C03084025;
 Tue,  8 Oct 2019 13:57:52 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD55E600CE;
 Tue,  8 Oct 2019 13:57:49 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/12] fw_cfg: add "modify" functions for all types
Date: Tue,  8 Oct 2019 15:55:33 +0200
Message-Id: <20191008135537.197867-8-slp@redhat.com>
In-Reply-To: <20191008135537.197867-1-slp@redhat.com>
References: <20191008135537.197867-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 08 Oct 2019 13:57:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to alter the contents of an already added item.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 include/hw/nvram/fw_cfg.h | 42 +++++++++++++++++++++++++++++++++++++++
 hw/nvram/fw_cfg.c         | 29 +++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 80e435d303..b5291eefad 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -98,6 +98,20 @@ void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, voi=
d *data, size_t len);
  */
 void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value);
=20
+/**
+ * fw_cfg_modify_string:
+ * @s: fw_cfg device being modified
+ * @key: selector key value for new fw_cfg item
+ * @value: NUL-terminated ascii string
+ *
+ * Replace the fw_cfg item available by selecting the given key. The new
+ * data will consist of a dynamically allocated copy of the provided str=
ing,
+ * including its NUL terminator. The data being replaced, assumed to hav=
e
+ * been dynamically allocated during an earlier call to either
+ * fw_cfg_add_string() or fw_cfg_modify_string(), is freed before return=
ing.
+ */
+void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value=
);
+
 /**
  * fw_cfg_add_i16:
  * @s: fw_cfg device being modified
@@ -136,6 +150,20 @@ void fw_cfg_modify_i16(FWCfgState *s, uint16_t key, =
uint16_t value);
  */
 void fw_cfg_add_i32(FWCfgState *s, uint16_t key, uint32_t value);
=20
+/**
+ * fw_cfg_modify_i32:
+ * @s: fw_cfg device being modified
+ * @key: selector key value for new fw_cfg item
+ * @value: 32-bit integer
+ *
+ * Replace the fw_cfg item available by selecting the given key. The new
+ * data will consist of a dynamically allocated copy of the given 32-bit
+ * value, converted to little-endian representation. The data being repl=
aced,
+ * assumed to have been dynamically allocated during an earlier call to
+ * either fw_cfg_add_i32() or fw_cfg_modify_i32(), is freed before retur=
ning.
+ */
+void fw_cfg_modify_i32(FWCfgState *s, uint16_t key, uint32_t value);
+
 /**
  * fw_cfg_add_i64:
  * @s: fw_cfg device being modified
@@ -148,6 +176,20 @@ void fw_cfg_add_i32(FWCfgState *s, uint16_t key, uin=
t32_t value);
  */
 void fw_cfg_add_i64(FWCfgState *s, uint16_t key, uint64_t value);
=20
+/**
+ * fw_cfg_modify_i64:
+ * @s: fw_cfg device being modified
+ * @key: selector key value for new fw_cfg item
+ * @value: 64-bit integer
+ *
+ * Replace the fw_cfg item available by selecting the given key. The new
+ * data will consist of a dynamically allocated copy of the given 64-bit
+ * value, converted to little-endian representation. The data being repl=
aced,
+ * assumed to have been dynamically allocated during an earlier call to
+ * either fw_cfg_add_i64() or fw_cfg_modify_i64(), is freed before retur=
ning.
+ */
+void fw_cfg_modify_i64(FWCfgState *s, uint16_t key, uint64_t value);
+
 /**
  * fw_cfg_add_file:
  * @s: fw_cfg device being modified
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 7dc3ac378e..aef1727250 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -690,6 +690,15 @@ void fw_cfg_add_string(FWCfgState *s, uint16_t key, =
const char *value)
     fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
 }
=20
+void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value=
)
+{
+    size_t sz =3D strlen(value) + 1;
+    char *old;
+
+    old =3D fw_cfg_modify_bytes_read(s, key, g_memdup(value, sz), sz);
+    g_free(old);
+}
+
 void fw_cfg_add_i16(FWCfgState *s, uint16_t key, uint16_t value)
 {
     uint16_t *copy;
@@ -720,6 +729,16 @@ void fw_cfg_add_i32(FWCfgState *s, uint16_t key, uin=
t32_t value)
     fw_cfg_add_bytes(s, key, copy, sizeof(value));
 }
=20
+void fw_cfg_modify_i32(FWCfgState *s, uint16_t key, uint32_t value)
+{
+    uint32_t *copy, *old;
+
+    copy =3D g_malloc(sizeof(value));
+    *copy =3D cpu_to_le32(value);
+    old =3D fw_cfg_modify_bytes_read(s, key, copy, sizeof(value));
+    g_free(old);
+}
+
 void fw_cfg_add_i64(FWCfgState *s, uint16_t key, uint64_t value)
 {
     uint64_t *copy;
@@ -730,6 +749,16 @@ void fw_cfg_add_i64(FWCfgState *s, uint16_t key, uin=
t64_t value)
     fw_cfg_add_bytes(s, key, copy, sizeof(value));
 }
=20
+void fw_cfg_modify_i64(FWCfgState *s, uint16_t key, uint64_t value)
+{
+    uint64_t *copy, *old;
+
+    copy =3D g_malloc(sizeof(value));
+    *copy =3D cpu_to_le64(value);
+    old =3D fw_cfg_modify_bytes_read(s, key, copy, sizeof(value));
+    g_free(old);
+}
+
 void fw_cfg_set_order_override(FWCfgState *s, int order)
 {
     assert(s->fw_cfg_order_override =3D=3D 0);
--=20
2.21.0


