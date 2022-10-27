Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E560A60FF62
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:35:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6kW-0000dr-6n; Thu, 27 Oct 2022 13:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jg-0007do-5N
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jd-00012O-Gj
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COB/O4A1mkhyD4/QvyJTcWcyJ2Kdf8xqO8JAWlAQtjc=;
 b=RIDfqaJqpehyHWqSpDNdwQXFOAt06t1zG/ySubJJVZfVX2fDzlq5m4yQ9w9duwjSxIUkp1
 WikvgOQrmLo41jFVw/qFUcgiZJn2TEAc/ew3ZmtMOV2TfJStRbwfcHUKWr/TjXWaDgGbge
 Yruwra/byQt83z9NVEfsbqQa+ykCH+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-BlDdKPZ3OpWUWjsjPSf2Nw-1; Thu, 27 Oct 2022 13:32:03 -0400
X-MC-Unique: BlDdKPZ3OpWUWjsjPSf2Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1980C196EFBF
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 404AD40C6EC3;
 Thu, 27 Oct 2022 17:31:26 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 17/20] crypto: split off helpers for converting LUKS header
 endianess
Date: Thu, 27 Oct 2022 18:31:00 +0100
Message-Id: <20221027173103.299479-18-berrange@redhat.com>
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

The unit test suite is shortly going to want to convert header
endianness separately from the main I/O functions.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks-priv.h |  6 +++
 crypto/block-luks.c      | 79 ++++++++++++++++++++++++----------------
 2 files changed, 53 insertions(+), 32 deletions(-)

diff --git a/crypto/block-luks-priv.h b/crypto/block-luks-priv.h
index 1516571dcb..90a20d432b 100644
--- a/crypto/block-luks-priv.h
+++ b/crypto/block-luks-priv.h
@@ -135,3 +135,9 @@ struct QCryptoBlockLUKSHeader {
     /* key slots */
     QCryptoBlockLUKSKeySlot key_slots[QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS];
 };
+
+
+void
+qcrypto_block_luks_to_disk_endian(QCryptoBlockLUKSHeader *hdr);
+void
+qcrypto_block_luks_from_disk_endian(QCryptoBlockLUKSHeader *hdr);
diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 375cce44cd..bb89c10225 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -348,6 +348,51 @@ qcrypto_block_luks_splitkeylen_sectors(const QCryptoBlockLUKS *luks,
     return ROUND_UP(splitkeylen_sectors, header_sectors);
 }
 
+
+void
+qcrypto_block_luks_to_disk_endian(QCryptoBlockLUKSHeader *hdr)
+{
+    size_t i;
+
+    /*
+     * Everything on disk uses Big Endian (tm), so flip header fields
+     * before writing them
+     */
+    cpu_to_be16s(&hdr->version);
+    cpu_to_be32s(&hdr->payload_offset_sector);
+    cpu_to_be32s(&hdr->master_key_len);
+    cpu_to_be32s(&hdr->master_key_iterations);
+
+    for (i = 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
+        cpu_to_be32s(&hdr->key_slots[i].active);
+        cpu_to_be32s(&hdr->key_slots[i].iterations);
+        cpu_to_be32s(&hdr->key_slots[i].key_offset_sector);
+        cpu_to_be32s(&hdr->key_slots[i].stripes);
+    }
+}
+
+void
+qcrypto_block_luks_from_disk_endian(QCryptoBlockLUKSHeader *hdr)
+{
+    size_t i;
+
+    /*
+     * The header is always stored in big-endian format, so
+     * convert everything to native
+     */
+    be16_to_cpus(&hdr->version);
+    be32_to_cpus(&hdr->payload_offset_sector);
+    be32_to_cpus(&hdr->master_key_len);
+    be32_to_cpus(&hdr->master_key_iterations);
+
+    for (i = 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
+        be32_to_cpus(&hdr->key_slots[i].active);
+        be32_to_cpus(&hdr->key_slots[i].iterations);
+        be32_to_cpus(&hdr->key_slots[i].key_offset_sector);
+        be32_to_cpus(&hdr->key_slots[i].stripes);
+    }
+}
+
 /*
  * Stores the main LUKS header, taking care of endianess
  */
@@ -359,28 +404,13 @@ qcrypto_block_luks_store_header(QCryptoBlock *block,
 {
     const QCryptoBlockLUKS *luks = block->opaque;
     Error *local_err = NULL;
-    size_t i;
     g_autofree QCryptoBlockLUKSHeader *hdr_copy = NULL;
 
     /* Create a copy of the header */
     hdr_copy = g_new0(QCryptoBlockLUKSHeader, 1);
     memcpy(hdr_copy, &luks->header, sizeof(QCryptoBlockLUKSHeader));
 
-    /*
-     * Everything on disk uses Big Endian (tm), so flip header fields
-     * before writing them
-     */
-    cpu_to_be16s(&hdr_copy->version);
-    cpu_to_be32s(&hdr_copy->payload_offset_sector);
-    cpu_to_be32s(&hdr_copy->master_key_len);
-    cpu_to_be32s(&hdr_copy->master_key_iterations);
-
-    for (i = 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
-        cpu_to_be32s(&hdr_copy->key_slots[i].active);
-        cpu_to_be32s(&hdr_copy->key_slots[i].iterations);
-        cpu_to_be32s(&hdr_copy->key_slots[i].key_offset_sector);
-        cpu_to_be32s(&hdr_copy->key_slots[i].stripes);
-    }
+    qcrypto_block_luks_to_disk_endian(hdr_copy);
 
     /* Write out the partition header and key slot headers */
     writefunc(block, 0, (const uint8_t *)hdr_copy, sizeof(*hdr_copy),
@@ -404,7 +434,6 @@ qcrypto_block_luks_load_header(QCryptoBlock *block,
                                 Error **errp)
 {
     int rv;
-    size_t i;
     QCryptoBlockLUKS *luks = block->opaque;
 
     /*
@@ -420,21 +449,7 @@ qcrypto_block_luks_load_header(QCryptoBlock *block,
         return rv;
     }
 
-    /*
-     * The header is always stored in big-endian format, so
-     * convert everything to native
-     */
-    be16_to_cpus(&luks->header.version);
-    be32_to_cpus(&luks->header.payload_offset_sector);
-    be32_to_cpus(&luks->header.master_key_len);
-    be32_to_cpus(&luks->header.master_key_iterations);
-
-    for (i = 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
-        be32_to_cpus(&luks->header.key_slots[i].active);
-        be32_to_cpus(&luks->header.key_slots[i].iterations);
-        be32_to_cpus(&luks->header.key_slots[i].key_offset_sector);
-        be32_to_cpus(&luks->header.key_slots[i].stripes);
-    }
+    qcrypto_block_luks_from_disk_endian(&luks->header);
 
     return 0;
 }
-- 
2.37.3


