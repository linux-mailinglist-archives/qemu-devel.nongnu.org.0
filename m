Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19D60FF5E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:34:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6kU-0000UE-Fm; Thu, 27 Oct 2022 13:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jT-0006vw-O7
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jR-0000yt-Mp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVeXsEDh3hon+fvjxL3se0g0zJHrgHGXlE2YAkey3E4=;
 b=YJOZzrNwXMNyeuXM1Uw2FnZ1qCT4ZB/D+BYO/mzqdKpPO6Lv2p1LON4ZbyZDPae987qK/u
 D1d8Si0JCRWUZR2+S8BtgGFCTM2Ft3cN292aqyeVaZ0jkkzBw9cFv8nBB1QzHWwOWQwjDw
 ULGj2tKW8gMbUsBOBm4/Ccbqq1ydJAA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-dVbgiExAPKyh28O0HzCrVA-1; Thu, 27 Oct 2022 13:31:51 -0400
X-MC-Unique: dVbgiExAPKyh28O0HzCrVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 068D11C14345
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:26 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52AF8414A809;
 Thu, 27 Oct 2022 17:31:25 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 16/20] crypto: split LUKS header definitions off into file
Date: Thu, 27 Oct 2022 18:30:59 +0100
Message-Id: <20221027173103.299479-17-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This will allow unit testing code to use the structs.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks-priv.h | 137 +++++++++++++++++++++++++++++++++++++++
 crypto/block-luks.c      |  94 +--------------------------
 2 files changed, 138 insertions(+), 93 deletions(-)
 create mode 100644 crypto/block-luks-priv.h

diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
new file mode 100644
index 0000000000..1516571dcb
--- /dev/null
+++ b/crypto/block-luks-priv.h
@@ -0,0 +1,137 @@
+/*
+ * QEMU Crypto block device encryption LUKS format
+ *
+ * Copyright (c) 2015-2016 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/bswap.h"
+
+#include "block-luks.h"
+
+#include "crypto/hash.h"
+#include "crypto/afsplit.h"
+#include "crypto/pbkdf.h"
+#include "crypto/secret.h"
+#include "crypto/random.h"
+#include "qemu/uuid.h"
+
+#include "qemu/coroutine.h"
+#include "qemu/bitmap.h"
+
+/*
+ * Reference for the LUKS format implemented here is
+ *
+ *   docs/on-disk-format.pdf
+ *
+ * in 'cryptsetup' package source code
+ *
+ * This file implements the 1.2.1 specification, dated
+ * Oct 16, 2011.
+ */
+
+typedef struct QCryptoBlockLUKSHeader QCryptoBlockLUKSHeader;
+typedef struct QCryptoBlockLUKSKeySlot QCryptoBlockLUKSKeySlot;
+
+
+/* The following constants are all defined by the LUKS spec */
+#define QCRYPTO_BLOCK_LUKS_VERSION 1
+
+#define QCRYPTO_BLOCK_LUKS_MAGIC_LEN 6
+#define QCRYPTO_BLOCK_LUKS_CIPHER_NAME_LEN 32
+#define QCRYPTO_BLOCK_LUKS_CIPHER_MODE_LEN 32
+#define QCRYPTO_BLOCK_LUKS_HASH_SPEC_LEN 32
+#define QCRYPTO_BLOCK_LUKS_DIGEST_LEN 20
+#define QCRYPTO_BLOCK_LUKS_SALT_LEN 32
+#define QCRYPTO_BLOCK_LUKS_UUID_LEN 40
+#define QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS 8
+#define QCRYPTO_BLOCK_LUKS_STRIPES 4000
+#define QCRYPTO_BLOCK_LUKS_MIN_SLOT_KEY_ITERS 1000
+#define QCRYPTO_BLOCK_LUKS_MIN_MASTER_KEY_ITERS 1000
+#define QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET 4096
+
+#define QCRYPTO_BLOCK_LUKS_KEY_SLOT_DISABLED 0x0000DEAD
+#define QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED 0x00AC71F3
+
+#define QCRYPTO_BLOCK_LUKS_SECTOR_SIZE 512LL
+
+#define QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME_MS 2000
+#define QCRYPTO_BLOCK_LUKS_ERASE_ITERATIONS 40
+
+static const char qcrypto_block_luks_magic[QCRYPTO_BLOCK_LUKS_MAGIC_LEN] = {
+    'L', 'U', 'K', 'S', 0xBA, 0xBE
+};
+
+/*
+ * This struct is written to disk in big-endian format,
+ * but operated upon in native-endian format.
+ */
+struct QCryptoBlockLUKSKeySlot {
+    /* state of keyslot, enabled/disable */
+    uint32_t active;
+    /* iterations for PBKDF2 */
+    uint32_t iterations;
+    /* salt for PBKDF2 */
+    uint8_t salt[QCRYPTO_BLOCK_LUKS_SALT_LEN];
+    /* start sector of key material */
+    uint32_t key_offset_sector;
+    /* number of anti-forensic stripes */
+    uint32_t stripes;
+};
+
+/*
+ * This struct is written to disk in big-endian format,
+ * but operated upon in native-endian format.
+ */
+struct QCryptoBlockLUKSHeader {
+    /* 'L', 'U', 'K', 'S', '0xBA', '0xBE' */
+    char magic[QCRYPTO_BLOCK_LUKS_MAGIC_LEN];
+
+    /* LUKS version, currently 1 */
+    uint16_t version;
+
+    /* cipher name specification (aes, etc) */
+    char cipher_name[QCRYPTO_BLOCK_LUKS_CIPHER_NAME_LEN];
+
+    /* cipher mode specification (cbc-plain, xts-essiv:sha256, etc) */
+    char cipher_mode[QCRYPTO_BLOCK_LUKS_CIPHER_MODE_LEN];
+
+    /* hash specification (sha256, etc) */
+    char hash_spec[QCRYPTO_BLOCK_LUKS_HASH_SPEC_LEN];
+
+    /* start offset of the volume data (in 512 byte sectors) */
+    uint32_t payload_offset_sector;
+
+    /* Number of key bytes */
+    uint32_t master_key_len;
+
+    /* master key checksum after PBKDF2 */
+    uint8_t master_key_digest[QCRYPTO_BLOCK_LUKS_DIGEST_LEN];
+
+    /* salt for master key PBKDF2 */
+    uint8_t master_key_salt[QCRYPTO_BLOCK_LUKS_SALT_LEN];
+
+    /* iterations for master key PBKDF2 */
+    uint32_t master_key_iterations;
+
+    /* UUID of the partition in standard ASCII representation */
+    uint8_t uuid[QCRYPTO_BLOCK_LUKS_UUID_LEN];
+
+    /* key slots */
+    QCryptoBlockLUKSKeySlot key_slots[QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS];
+};
diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 254490c256..375cce44cd 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -23,6 +23,7 @@
 #include "qemu/bswap.h"
 
 #include "block-luks.h"
+#include "block-luks-priv.h"
 
 #include "crypto/hash.h"
 #include "crypto/afsplit.h"
@@ -46,37 +47,6 @@
  */
 
 typedef struct QCryptoBlockLUKS QCryptoBlockLUKS;
-typedef struct QCryptoBlockLUKSHeader QCryptoBlockLUKSHeader;
-typedef struct QCryptoBlockLUKSKeySlot QCryptoBlockLUKSKeySlot;
-
-
-/* The following constants are all defined by the LUKS spec */
-#define QCRYPTO_BLOCK_LUKS_VERSION 1
-
-#define QCRYPTO_BLOCK_LUKS_MAGIC_LEN 6
-#define QCRYPTO_BLOCK_LUKS_CIPHER_NAME_LEN 32
-#define QCRYPTO_BLOCK_LUKS_CIPHER_MODE_LEN 32
-#define QCRYPTO_BLOCK_LUKS_HASH_SPEC_LEN 32
-#define QCRYPTO_BLOCK_LUKS_DIGEST_LEN 20
-#define QCRYPTO_BLOCK_LUKS_SALT_LEN 32
-#define QCRYPTO_BLOCK_LUKS_UUID_LEN 40
-#define QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS 8
-#define QCRYPTO_BLOCK_LUKS_STRIPES 4000
-#define QCRYPTO_BLOCK_LUKS_MIN_SLOT_KEY_ITERS 1000
-#define QCRYPTO_BLOCK_LUKS_MIN_MASTER_KEY_ITERS 1000
-#define QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET 4096
-
-#define QCRYPTO_BLOCK_LUKS_KEY_SLOT_DISABLED 0x0000DEAD
-#define QCRYPTO_BLOCK_LUKS_KEY_SLOT_ENABLED 0x00AC71F3
-
-#define QCRYPTO_BLOCK_LUKS_SECTOR_SIZE 512LL
-
-#define QCRYPTO_BLOCK_LUKS_DEFAULT_ITER_TIME_MS 2000
-#define QCRYPTO_BLOCK_LUKS_ERASE_ITERATIONS 40
-
-static const char qcrypto_block_luks_magic[QCRYPTO_BLOCK_LUKS_MAGIC_LEN] = {
-    'L', 'U', 'K', 'S', 0xBA, 0xBE
-};
 
 typedef struct QCryptoBlockLUKSNameMap QCryptoBlockLUKSNameMap;
 struct QCryptoBlockLUKSNameMap {
@@ -134,69 +104,7 @@ qcrypto_block_luks_cipher_name_map[] = {
     { "twofish", qcrypto_block_luks_cipher_size_map_twofish },
 };
 
-
-/*
- * This struct is written to disk in big-endian format,
- * but operated upon in native-endian format.
- */
-struct QCryptoBlockLUKSKeySlot {
-    /* state of keyslot, enabled/disable */
-    uint32_t active;
-    /* iterations for PBKDF2 */
-    uint32_t iterations;
-    /* salt for PBKDF2 */
-    uint8_t salt[QCRYPTO_BLOCK_LUKS_SALT_LEN];
-    /* start sector of key material */
-    uint32_t key_offset_sector;
-    /* number of anti-forensic stripes */
-    uint32_t stripes;
-};
-
 QEMU_BUILD_BUG_ON(sizeof(struct QCryptoBlockLUKSKeySlot) != 48);
-
-
-/*
- * This struct is written to disk in big-endian format,
- * but operated upon in native-endian format.
- */
-struct QCryptoBlockLUKSHeader {
-    /* 'L', 'U', 'K', 'S', '0xBA', '0xBE' */
-    char magic[QCRYPTO_BLOCK_LUKS_MAGIC_LEN];
-
-    /* LUKS version, currently 1 */
-    uint16_t version;
-
-    /* cipher name specification (aes, etc) */
-    char cipher_name[QCRYPTO_BLOCK_LUKS_CIPHER_NAME_LEN];
-
-    /* cipher mode specification (cbc-plain, xts-essiv:sha256, etc) */
-    char cipher_mode[QCRYPTO_BLOCK_LUKS_CIPHER_MODE_LEN];
-
-    /* hash specification (sha256, etc) */
-    char hash_spec[QCRYPTO_BLOCK_LUKS_HASH_SPEC_LEN];
-
-    /* start offset of the volume data (in 512 byte sectors) */
-    uint32_t payload_offset_sector;
-
-    /* Number of key bytes */
-    uint32_t master_key_len;
-
-    /* master key checksum after PBKDF2 */
-    uint8_t master_key_digest[QCRYPTO_BLOCK_LUKS_DIGEST_LEN];
-
-    /* salt for master key PBKDF2 */
-    uint8_t master_key_salt[QCRYPTO_BLOCK_LUKS_SALT_LEN];
-
-    /* iterations for master key PBKDF2 */
-    uint32_t master_key_iterations;
-
-    /* UUID of the partition in standard ASCII representation */
-    uint8_t uuid[QCRYPTO_BLOCK_LUKS_UUID_LEN];
-
-    /* key slots */
-    QCryptoBlockLUKSKeySlot key_slots[QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS];
-};
-
 QEMU_BUILD_BUG_ON(sizeof(struct QCryptoBlockLUKSHeader) != 592);
 
 
-- 
2.37.3


