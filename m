Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9275AE4A6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:46:50 +0200 (CEST)
Received: from localhost ([::1]:43152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVAP-0006pF-Ph
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9m-0006rn-BZ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9e-0006NP-Dk
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfFcAnfp5OEA+MoznHCmu5AJGiwnrym6i3GmQrVEHjk=;
 b=SgO7dgh2QwtJ0GMtQHO4ePUp9aIuMI76S7iws6YBFGj9iwIivZYZUcBxnwMO+7VwWSE+1Y
 wESDJxVld5XIYboOOCYczQiM61t4eapQhqGE+ECazRTmurAuRm1poQvq5hdfaqQsQfTa6Y
 tDale5sZzkOQLS0cNosyY2IXu2+ranM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-v-I_oC4OMMKT0iGL3RCFTA-1; Tue, 06 Sep 2022 04:41:56 -0400
X-MC-Unique: v-I_oC4OMMKT0iGL3RCFTA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CE39101A54E
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:56 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB52BC15BB3;
 Tue,  6 Sep 2022 08:41:55 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 07/11] crypto: split LUKS header definitions off into file
Date: Tue,  6 Sep 2022 09:41:43 +0100
Message-Id: <20220906084147.1423045-8-berrange@redhat.com>
In-Reply-To: <20220906084147.1423045-1-berrange@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow unit testing code to use the structs.

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
2.37.2


