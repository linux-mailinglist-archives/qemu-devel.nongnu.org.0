Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544A60FF5D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:33:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6kY-0000to-Hx; Thu, 27 Oct 2022 13:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jt-0007ny-DH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oo6jl-00012r-5n
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666891932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DepC1jmS4hv3EJdblzOts0Bm6mnbIDWFvzBu25+c284=;
 b=VwiQG+ty8njAyMWOQoMxeHroHnwNHjaR+v0eAETryBw5joD7/m35aHy5v8zXbhNqKvdjcK
 gP7+pXoTQaU3MWFSzn061jA1rgBVaM97ibCP/1Ee7DNDtn0Z+TYKM/JYnmPGvRMBBfQgMB
 9lcMpK1Kxt+tO2KP5tlatgiwWCxfrBE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-zIMu1_UHOOOLLD4DoUlfbg-1; Thu, 27 Oct 2022 13:32:08 -0400
X-MC-Unique: zIMu1_UHOOOLLD4DoUlfbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17E5412496F9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 17:31:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E19740C6EC3;
 Thu, 27 Oct 2022 17:31:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PULL 20/20] crypto: add test cases for many malformed LUKS header
 scenarios
Date: Thu, 27 Oct 2022 18:31:03 +0100
Message-Id: <20221027173103.299479-21-berrange@redhat.com>
In-Reply-To: <20221027173103.299479-1-berrange@redhat.com>
References: <20221027173103.299479-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Validate that we diagnose each malformed LUKS header scenario with a
distinct error report.

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/unit/test-crypto-block.c | 299 +++++++++++++++++++++++++++++++++
 1 file changed, 299 insertions(+)

diff --git a/tests/unit/test-crypto-block.c b/tests/unit/test-crypto-block.c
index 3d50eb4b6e..b629e240a9 100644
--- a/tests/unit/test-crypto-block.c
+++ b/tests/unit/test-crypto-block.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "crypto/init.h"
 #include "crypto/block.h"
+#include "crypto/block-luks-priv.h"
 #include "qemu/buffer.h"
 #include "qemu/module.h"
 #include "crypto/secret.h"
@@ -345,6 +346,230 @@ static void test_block(gconstpointer opaque)
 }
 
 
+#ifdef TEST_LUKS
+typedef const char *(*LuksHeaderDoBadStuff)(QCryptoBlockLUKSHeader *hdr);
+
+static void
+test_luks_bad_header(gconstpointer data)
+{
+    LuksHeaderDoBadStuff badstuff = data;
+    QCryptoBlock *blk;
+    Buffer buf;
+    Object *sec = test_block_secret();
+    QCryptoBlockLUKSHeader hdr;
+    Error *err = NULL;
+    const char *msg;
+
+    memset(&buf, 0, sizeof(buf));
+    buffer_init(&buf, "header");
+
+    /* Correctly create the volume initially */
+    blk = qcrypto_block_create(&luks_create_opts_default, NULL,
+                               test_block_init_func,
+                               test_block_write_func,
+                               &buf,
+                               &error_abort);
+    g_assert(blk);
+
+    qcrypto_block_free(blk);
+
+    /* Mangle it in some unpleasant way */
+    g_assert(buf.offset >= sizeof(hdr));
+    memcpy(&hdr, buf.buffer, sizeof(hdr));
+    qcrypto_block_luks_to_disk_endian(&hdr);
+
+    msg = badstuff(&hdr);
+
+    qcrypto_block_luks_from_disk_endian(&hdr);
+    memcpy(buf.buffer, &hdr, sizeof(hdr));
+
+    /* Check that we fail to open it again */
+    blk = qcrypto_block_open(&luks_open_opts, NULL,
+                             test_block_read_func,
+                             &buf,
+                             0,
+                             1,
+                             &err);
+    g_assert(!blk);
+    g_assert(err);
+
+    g_assert_cmpstr(error_get_pretty(err), ==, msg);
+    error_free(err);
+
+    object_unparent(sec);
+
+    buffer_free(&buf);
+}
+
+static const char *luks_bad_null_term_cipher_name(QCryptoBlockLUKSHeader *hdr)
+{
+    /* Replace NUL termination with spaces */
+    char *offset = hdr->cipher_name + strlen(hdr->cipher_name);
+    memset(offset, ' ', sizeof(hdr->cipher_name) - (offset - hdr->cipher_name));
+
+    return "LUKS header cipher name is not NUL terminated";
+}
+
+static const char *luks_bad_null_term_cipher_mode(QCryptoBlockLUKSHeader *hdr)
+{
+    /* Replace NUL termination with spaces */
+    char *offset = hdr->cipher_mode + strlen(hdr->cipher_mode);
+    memset(offset, ' ', sizeof(hdr->cipher_mode) - (offset - hdr->cipher_mode));
+
+    return "LUKS header cipher mode is not NUL terminated";
+}
+
+static const char *luks_bad_null_term_hash_spec(QCryptoBlockLUKSHeader *hdr)
+{
+    /* Replace NUL termination with spaces */
+    char *offset = hdr->hash_spec + strlen(hdr->hash_spec);
+    memset(offset, ' ', sizeof(hdr->hash_spec) - (offset - hdr->hash_spec));
+
+    return "LUKS header hash spec is not NUL terminated";
+}
+
+static const char *luks_bad_cipher_name_empty(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_name, "", 1);
+
+    return "Algorithm '' with key size 32 bytes not supported";
+}
+
+static const char *luks_bad_cipher_name_unknown(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_name, "aess", 5);
+
+    return "Algorithm 'aess' with key size 32 bytes not supported";
+}
+
+static const char *luks_bad_cipher_xts_size(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->master_key_len = 33;
+
+    return "XTS cipher key length should be a multiple of 2";
+}
+
+static const char *luks_bad_cipher_cbc_size(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->master_key_len = 33;
+    memcpy(hdr->cipher_mode, "cbc-essiv", 10);
+
+    return "Algorithm 'aes' with key size 33 bytes not supported";
+}
+
+static const char *luks_bad_cipher_mode_empty(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_mode, "", 1);
+
+    return "Unexpected cipher mode string format ''";
+}
+
+static const char *luks_bad_cipher_mode_unknown(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_mode, "xfs", 4);
+
+    return "Unexpected cipher mode string format 'xfs'";
+}
+
+static const char *luks_bad_ivgen_separator(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_mode, "xts:plain64", 12);
+
+    return "Unexpected cipher mode string format 'xts:plain64'";
+}
+
+static const char *luks_bad_ivgen_name_empty(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_mode, "xts-", 5);
+
+    return "IV generator '' not supported";
+}
+
+static const char *luks_bad_ivgen_name_unknown(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_mode, "xts-plain65", 12);
+
+    return "IV generator 'plain65' not supported";
+}
+
+static const char *luks_bad_ivgen_hash_empty(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_mode, "xts-plain65:", 13);
+
+    return "Hash algorithm '' not supported";
+}
+
+static const char *luks_bad_ivgen_hash_unknown(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->cipher_mode, "xts-plain65:sha257", 19);
+
+    return "Hash algorithm 'sha257' not supported";
+}
+
+static const char *luks_bad_hash_spec_empty(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->hash_spec, "", 1);
+
+    return "Hash algorithm '' not supported";
+}
+
+static const char *luks_bad_hash_spec_unknown(QCryptoBlockLUKSHeader *hdr)
+{
+    memcpy(hdr->hash_spec, "sha2566", 8);
+
+    return "Hash algorithm 'sha2566' not supported";
+}
+
+static const char *luks_bad_stripes(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->key_slots[0].stripes = 3999;
+
+    return "Keyslot 0 is corrupted (stripes 3999 != 4000)";
+}
+
+static const char *luks_bad_key_overlap_header(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->key_slots[0].key_offset_sector = 2;
+
+    return "Keyslot 0 is overlapping with the LUKS header";
+}
+
+static const char *luks_bad_key_overlap_key(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->key_slots[0].key_offset_sector = hdr->key_slots[1].key_offset_sector;
+
+    return "Keyslots 0 and 1 are overlapping in the header";
+}
+
+static const char *luks_bad_key_overlap_payload(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->key_slots[0].key_offset_sector = hdr->payload_offset_sector + 42;
+
+    return "Keyslot 0 is overlapping with the encrypted payload";
+}
+
+static const char *luks_bad_payload_overlap_header(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->payload_offset_sector = 2;
+
+    return "LUKS payload is overlapping with the header";
+}
+
+static const char *luks_bad_key_iterations(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->key_slots[0].iterations = 0;
+
+    return "Keyslot 0 iteration count is zero";
+}
+
+static const char *luks_bad_iterations(QCryptoBlockLUKSHeader *hdr)
+{
+    hdr->master_key_iterations = 0;
+
+    return "LUKS key iteration count is zero";
+}
+#endif
+
 int main(int argc, char **argv)
 {
     gsize i;
@@ -365,5 +590,79 @@ int main(int argc, char **argv)
         }
     }
 
+#ifdef TEST_LUKS
+    if (g_test_slow()) {
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-name-nul-term",
+                             luks_bad_null_term_cipher_name,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-mode-nul-term",
+                             luks_bad_null_term_cipher_mode,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/hash-spec-nul-term",
+                             luks_bad_null_term_hash_spec,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-name-empty",
+                             luks_bad_cipher_name_empty,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-name-unknown",
+                             luks_bad_cipher_name_unknown,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-xts-size",
+                             luks_bad_cipher_xts_size,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-cbc-size",
+                             luks_bad_cipher_cbc_size,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-mode-empty",
+                             luks_bad_cipher_mode_empty,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/cipher-mode-unknown",
+                             luks_bad_cipher_mode_unknown,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/ivgen-separator",
+                             luks_bad_ivgen_separator,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/ivgen-name-empty",
+                             luks_bad_ivgen_name_empty,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/ivgen-name-unknown",
+                             luks_bad_ivgen_name_unknown,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/ivgen-hash-empty",
+                             luks_bad_ivgen_hash_empty,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/ivgen-hash-unknown",
+                             luks_bad_ivgen_hash_unknown,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/hash-spec-empty",
+                             luks_bad_hash_spec_empty,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/hash-spec-unknown",
+                             luks_bad_hash_spec_unknown,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/stripes",
+                             luks_bad_stripes,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/key-overlap-header",
+                             luks_bad_key_overlap_header,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/key-overlap-key",
+                             luks_bad_key_overlap_key,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/key-overlap-payload",
+                             luks_bad_key_overlap_payload,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/payload-overlap-header",
+                             luks_bad_payload_overlap_header,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/iterations",
+                             luks_bad_iterations,
+                             test_luks_bad_header);
+        g_test_add_data_func("/crypto/block/luks/bad/key-iterations",
+                             luks_bad_key_iterations,
+                             test_luks_bad_header);
+    }
+#endif
+
     return g_test_run();
 }
-- 
2.37.3


