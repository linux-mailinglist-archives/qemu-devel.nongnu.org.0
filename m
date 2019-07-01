Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62E27DD8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 15:16:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTnZw-00043R-0p
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 09:16:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTnH4-0003rP-9Y
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:56:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTn4W-0000vg-9A
	for qemu-devel@nongnu.org; Thu, 23 May 2019 08:43:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43652)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hTn4W-0000vD-2j; Thu, 23 May 2019 08:43:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B5644ACDF;
	Thu, 23 May 2019 12:43:39 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39CE667C9B;
	Thu, 23 May 2019 12:43:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 14:43:06 +0200
Message-Id: <20190523124320.28726-2-philmd@redhat.com>
In-Reply-To: <20190523124320.28726-1-philmd@redhat.com>
References: <20190523124320.28726-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 23 May 2019 12:43:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 01/15] hw/nvram/fw_cfg: Add trace events
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add trace events to dump the key content.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20190422195020.1494-2-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c     | 63 ++++++++++++++++++++++++++++++++++++++++++-
 hw/nvram/trace-events |  7 ++++-
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 5c3a46ce6f..d374a970fe 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -60,6 +60,62 @@ struct FWCfgEntry {
     FWCfgWriteCallback write_cb;
 };
=20
+/**
+ * key_name:
+ *
+ * @key: The uint16 selector key.
+ *
+ * Returns: The stringified name if the selector refers to a well-known
+ *          numerically defined item, or NULL on key lookup failure.
+ */
+static const char *key_name(uint16_t key)
+{
+    static const char *fw_cfg_wellknown_keys[FW_CFG_FILE_FIRST] =3D {
+        [FW_CFG_SIGNATURE] =3D "signature",
+        [FW_CFG_ID] =3D "id",
+        [FW_CFG_UUID] =3D "uuid",
+        [FW_CFG_RAM_SIZE] =3D "ram_size",
+        [FW_CFG_NOGRAPHIC] =3D "nographic",
+        [FW_CFG_NB_CPUS] =3D "nb_cpus",
+        [FW_CFG_MACHINE_ID] =3D "machine_id",
+        [FW_CFG_KERNEL_ADDR] =3D "kernel_addr",
+        [FW_CFG_KERNEL_SIZE] =3D "kernel_size",
+        [FW_CFG_KERNEL_CMDLINE] =3D "kernel_cmdline",
+        [FW_CFG_INITRD_ADDR] =3D "initrd_addr",
+        [FW_CFG_INITRD_SIZE] =3D "initdr_size",
+        [FW_CFG_BOOT_DEVICE] =3D "boot_device",
+        [FW_CFG_NUMA] =3D "numa",
+        [FW_CFG_BOOT_MENU] =3D "boot_menu",
+        [FW_CFG_MAX_CPUS] =3D "max_cpus",
+        [FW_CFG_KERNEL_ENTRY] =3D "kernel_entry",
+        [FW_CFG_KERNEL_DATA] =3D "kernel_data",
+        [FW_CFG_INITRD_DATA] =3D "initrd_data",
+        [FW_CFG_CMDLINE_ADDR] =3D "cmdline_addr",
+        [FW_CFG_CMDLINE_SIZE] =3D "cmdline_size",
+        [FW_CFG_CMDLINE_DATA] =3D "cmdline_data",
+        [FW_CFG_SETUP_ADDR] =3D "setup_addr",
+        [FW_CFG_SETUP_SIZE] =3D "setup_size",
+        [FW_CFG_SETUP_DATA] =3D "setup_data",
+        [FW_CFG_FILE_DIR] =3D "file_dir",
+    };
+
+    if (key & FW_CFG_ARCH_LOCAL) {
+        return NULL;
+    }
+    if (key < FW_CFG_FILE_FIRST) {
+        return fw_cfg_wellknown_keys[key];
+    }
+
+    return NULL;
+}
+
+static inline const char *trace_key_name(uint16_t key)
+{
+    const char *name =3D key_name(key);
+
+    return name ? name : "unknown";
+}
+
 #define JPG_FILE 0
 #define BMP_FILE 1
=20
@@ -233,7 +289,7 @@ static int fw_cfg_select(FWCfgState *s, uint16_t key)
         }
     }
=20
-    trace_fw_cfg_select(s, key, ret);
+    trace_fw_cfg_select(s, key, trace_key_name(key), ret);
     return ret;
 }
=20
@@ -616,6 +672,7 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, =
uint16_t key,
=20
 void fw_cfg_add_bytes(FWCfgState *s, uint16_t key, void *data, size_t le=
n)
 {
+    trace_fw_cfg_add_bytes(key, trace_key_name(key), len);
     fw_cfg_add_bytes_callback(s, key, NULL, NULL, NULL, data, len, true)=
;
 }
=20
@@ -623,6 +680,7 @@ void fw_cfg_add_string(FWCfgState *s, uint16_t key, c=
onst char *value)
 {
     size_t sz =3D strlen(value) + 1;
=20
+    trace_fw_cfg_add_string(key, trace_key_name(key), value);
     fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
 }
=20
@@ -632,6 +690,7 @@ void fw_cfg_add_i16(FWCfgState *s, uint16_t key, uint=
16_t value)
=20
     copy =3D g_malloc(sizeof(value));
     *copy =3D cpu_to_le16(value);
+    trace_fw_cfg_add_i16(key, trace_key_name(key), value);
     fw_cfg_add_bytes(s, key, copy, sizeof(value));
 }
=20
@@ -651,6 +710,7 @@ void fw_cfg_add_i32(FWCfgState *s, uint16_t key, uint=
32_t value)
=20
     copy =3D g_malloc(sizeof(value));
     *copy =3D cpu_to_le32(value);
+    trace_fw_cfg_add_i32(key, trace_key_name(key), value);
     fw_cfg_add_bytes(s, key, copy, sizeof(value));
 }
=20
@@ -660,6 +720,7 @@ void fw_cfg_add_i64(FWCfgState *s, uint16_t key, uint=
64_t value)
=20
     copy =3D g_malloc(sizeof(value));
     *copy =3D cpu_to_le64(value);
+    trace_fw_cfg_add_i64(key, trace_key_name(key), value);
     fw_cfg_add_bytes(s, key, copy, sizeof(value));
 }
=20
diff --git a/hw/nvram/trace-events b/hw/nvram/trace-events
index e191991e2a..0dea9260ce 100644
--- a/hw/nvram/trace-events
+++ b/hw/nvram/trace-events
@@ -5,6 +5,11 @@ nvram_read(uint32_t addr, uint32_t ret) "read addr %d: 0=
x%02x"
 nvram_write(uint32_t addr, uint32_t old, uint32_t val) "write addr %d: 0=
x%02x -> 0x%02x"
=20
 # fw_cfg.c
-fw_cfg_select(void *s, uint16_t key, int ret) "%p key %d =3D %d"
+fw_cfg_select(void *s, uint16_t key_value, const char *key_name, int ret=
) "%p key 0x%04" PRIx16 " '%s', ret: %d"
 fw_cfg_read(void *s, uint64_t ret) "%p =3D 0x%"PRIx64
+fw_cfg_add_bytes(uint16_t key_value, const char *key_name, size_t len) "=
key 0x%04" PRIx16 " '%s', %zu bytes"
 fw_cfg_add_file(void *s, int index, char *name, size_t len) "%p #%d: %s =
(%zd bytes)"
+fw_cfg_add_string(uint16_t key_value, const char *key_name, const char *=
value) "key 0x%04" PRIx16 " '%s', value '%s'"
+fw_cfg_add_i16(uint16_t key_value, const char *key_name, uint16_t value)=
 "key 0x%04" PRIx16 " '%s', value 0x%" PRIx16
+fw_cfg_add_i32(uint16_t key_value, const char *key_name, uint32_t value)=
 "key 0x%04" PRIx16 " '%s', value 0x%" PRIx32
+fw_cfg_add_i64(uint16_t key_value, const char *key_name, uint64_t value)=
 "key 0x%04" PRIx16 " '%s', value 0x%" PRIx64
--=20
2.20.1


