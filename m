Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6858548204
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 10:53:54 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0fpZ-0005j6-T0
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 04:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fiL-00061v-V0
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1o0fiG-0001L7-12
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 04:46:22 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso8175453pjl.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 01:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B9mN71vJSF0an5/WG4cW+x6V7jbwNnhvgbdLohCOYTI=;
 b=gzyYyPKrRWZLL0tzDJfrvvH02hlmpOuGi27x66Z7Q3eTpM8JgpGj56lvyLb4HvdORS
 WbWfF68EfyIzcxKyDZiJhVtIAK56TYve17YTR7gIxza+rRdbwCtBrO3G03x+CSHo0z+u
 QmplDBfxID1TIYnnHvLHmBHcUravBlpPT7hMe1gpixc55W9tgG2TAHIO65FAdLEEj54a
 XNK5jhVa0VwSA1V3ls3qbHVAxhhyOVoZkqpFnigBnHSsH4B7HGowqaGpB/265OjrscfV
 FB7l5MxjjhjxYVtwnY6WCUJuWAoyYITs9bKgj0gxcR/sQU91N5CT0SjKhTf3pPc+H4zV
 K+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B9mN71vJSF0an5/WG4cW+x6V7jbwNnhvgbdLohCOYTI=;
 b=nntyAKXwSnd/Zi8tAwbyWxzxnQp+KhuHBDntWqKaTbxO5Ss7hVudraETwKwoZGInzd
 JWiUNWklBt4mFmUeTI3OvJ/IkF1+dGua1MLTp4KJOJPloIuqI3PtLO6anRo424jsleUa
 5eRtkkbT6giNvEUTrgnqV0JpT2mF4CVPEmJOtE+g9s6PvNtpv+eTJZ7zB5DZ88FIIqa2
 9F2YixaZU2ek42fFDLw+m1Q/Olis/YIo+fgsYsJ6Gqa+cv7IUe1TtQ7HmopNPJVNlDC0
 BiJ+J/LerUvfZP0LHqnfEnB5+nOxbbaEkitTnEjoZyJ80aISLkeQiZIvB4lSjcqKPCts
 Z0iA==
X-Gm-Message-State: AOAM533JfJK53k9VXriUifkWdcR7ZgUGBCSz+huj0GW7OmDpRJYI4Hna
 Mv9I2gAArsuEIJxc8tfY+vmi7Q==
X-Google-Smtp-Source: ABdhPJy7DDoMVClhpqgLY0Ka7a6Ga7MNPrMxR21EMncT6o5FFHaHdo/O/BVH9vn1Kbzr/dS3hP0u8Q==
X-Received: by 2002:a17:903:234a:b0:167:997f:bc53 with SMTP id
 c10-20020a170903234a00b00167997fbc53mr30219781plh.47.1655109977799; 
 Mon, 13 Jun 2022 01:46:17 -0700 (PDT)
Received: from FVFDK26JP3YV.usts.net ([139.177.225.251])
 by smtp.gmail.com with ESMTPSA id
 f27-20020aa79d9b000000b0050dc762814fsm4729196pfq.41.2022.06.13.01.46.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:46:17 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com, arei.gonglei@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Cc: helei.sig11@bytedance.com,
	pizhenwei@bytedance.com,
	jasowang@redhat.com
Subject: [PATCH 2/7] crypto: Support more ASN.1 types
Date: Mon, 13 Jun 2022 16:45:26 +0800
Message-Id: <20220613084531.8086-3-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220613084531.8086-1-helei.sig11@bytedance.com>
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

1. support decoding of 'bit string','octet string',
'object id', and 'context specific tag' for DER decoder.
2. support encoding of int and sequence for DER decoder.
3. add test suites for the above changes.

Signed-off-by: lei he <helei.sig11@bytedance.com>
---
 crypto/der.c                 | 174 +++++++++++++++++++++++++++++++++++++------
 crypto/der.h                 | 128 ++++++++++++++++++++++++++++++-
 tests/unit/test-crypto-der.c | 126 +++++++++++++++++++++++++------
 3 files changed, 382 insertions(+), 46 deletions(-)

diff --git a/crypto/der.c b/crypto/der.c
index f877390bbb..edf2c6c313 100644
--- a/crypto/der.c
+++ b/crypto/der.c
@@ -27,15 +27,68 @@ enum QCryptoDERTypeTag {
     QCRYPTO_DER_TYPE_TAG_INT = 0x2,
     QCRYPTO_DER_TYPE_TAG_BIT_STR = 0x3,
     QCRYPTO_DER_TYPE_TAG_OCT_STR = 0x4,
-    QCRYPTO_DER_TYPE_TAG_OCT_NULL = 0x5,
-    QCRYPTO_DER_TYPE_TAG_OCT_OID = 0x6,
+    QCRYPTO_DER_TYPE_TAG_NULL = 0x5,
+    QCRYPTO_DER_TYPE_TAG_OID = 0x6,
     QCRYPTO_DER_TYPE_TAG_SEQ = 0x10,
     QCRYPTO_DER_TYPE_TAG_SET = 0x11,
 };
 
-#define QCRYPTO_DER_CONSTRUCTED_MASK 0x20
+enum QCryptoDERTagClass {
+    QCRYPTO_DER_TAG_CLASS_UNIV = 0x0,
+    QCRYPTO_DER_TAG_CLASS_APPL = 0x1,
+    QCRYPTO_DER_TAG_CLASS_CONT = 0x2,
+    QCRYPTO_DER_TAG_CLASS_PRIV = 0x3,
+};
+
+enum QCryptoDERTagEnc {
+    QCRYPTO_DER_TAG_ENC_PRIM = 0x0,
+    QCRYPTO_DER_TAG_ENC_CONS = 0x1,
+};
+
+#define QCRYPTO_DER_TAG_ENC_MASK 0x20
+#define QCRYPTO_DER_TAG_ENC_SHIFT 5
+
+#define QCRYPTO_DER_TAG_CLASS_MASK 0xc0
+#define QCRYPTO_DER_TAG_CLASS_SHIFT 6
+
+#define QCRYPTO_DER_TAG_VAL_MASK 0x1f
 #define QCRYPTO_DER_SHORT_LEN_MASK 0x80
 
+#define QCRYPTO_DER_TAG(class, enc, val)        \
+    (((class) << QCRYPTO_DER_TAG_CLASS_SHIFT) | \
+     ((enc) << QCRYPTO_DER_TAG_ENC_SHIFT) | val)
+
+static void qcrypto_der_encode_data(const uint8_t *src, size_t src_len,
+                                    uint8_t *dst, size_t *dst_len)
+{
+    size_t max_length = 0xFF;
+    uint8_t length_bytes = 0, header_byte;
+
+    if (src_len < QCRYPTO_DER_SHORT_LEN_MASK) {
+        header_byte = src_len;
+        *dst_len = src_len + 1;
+    } else {
+        for (length_bytes = 1; max_length < src_len;) {
+            length_bytes++;
+            max_length = (max_length << 8) + max_length;
+        }
+        header_byte = length_bytes;
+        header_byte |= QCRYPTO_DER_SHORT_LEN_MASK;
+        *dst_len = src_len + length_bytes + 1;
+    }
+    if (!dst) {
+        return;
+    }
+    *dst++ = header_byte;
+    /* Bigendian length bytes */
+    while (length_bytes) {
+        *dst++ = (src_len >> (length_bytes - 1) * 8);
+        src_len >>= 8;
+        length_bytes--;
+    }
+    memcpy(dst, src, src_len);
+}
+
 static uint8_t qcrypto_der_peek_byte(const uint8_t **data, size_t *dlen)
 {
     return **data;
@@ -150,40 +203,119 @@ static int qcrypto_der_extract_data(const uint8_t **data, size_t *dlen,
     return qcrypto_der_extract_definite_data(data, dlen, cb, ctx, errp);
 }
 
-int qcrypto_der_decode_int(const uint8_t **data, size_t *dlen,
-                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+static int qcrypto_der_decode_tlv(const uint8_t expected_tag,
+                                  const uint8_t **data, size_t *dlen,
+                                  QCryptoDERDecodeCb cb,
+                                  void *ctx, Error **errp)
 {
+    const uint8_t *saved_data = *data;
+    size_t saved_dlen = *dlen;
     uint8_t tag;
+    int data_length;
+
     if (*dlen < 1) {
         error_setg(errp, "Need more data");
         return -1;
     }
     tag = qcrypto_der_cut_byte(data, dlen);
+    if (tag != expected_tag) {
+        error_setg(errp, "Unexpected tag: expected: %u, actual: %u",
+                   expected_tag, tag);
+        goto error;
+    }
 
-    /* INTEGER must encoded in primitive-form */
-    if (tag != QCRYPTO_DER_TYPE_TAG_INT) {
-        error_setg(errp, "Invalid integer type tag: %u", tag);
-        return -1;
+    data_length = qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+    if (data_length < 0) {
+        goto error;
     }
+    return data_length;
+
+error:
+    *data = saved_data;
+    *dlen = saved_dlen;
+    return -1;
+}
 
-    return qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+int qcrypto_der_decode_int(const uint8_t **data, size_t *dlen,
+                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    const uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                        QCRYPTO_DER_TAG_ENC_PRIM,
+                                        QCRYPTO_DER_TYPE_TAG_INT);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
 }
 
 int qcrypto_der_decode_seq(const uint8_t **data, size_t *dlen,
                            QCryptoDERDecodeCb cb, void *ctx, Error **errp)
 {
-    uint8_t tag;
-    if (*dlen < 1) {
-        error_setg(errp, "Need more data");
-        return -1;
-    }
-    tag = qcrypto_der_cut_byte(data, dlen);
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_CONS,
+                                  QCRYPTO_DER_TYPE_TAG_SEQ);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
 
-    /* SEQUENCE must use constructed form */
-    if (tag != (QCRYPTO_DER_TYPE_TAG_SEQ | QCRYPTO_DER_CONSTRUCTED_MASK)) {
-        error_setg(errp, "Invalid type sequence tag: %u", tag);
-        return -1;
+int qcrypto_der_decode_octet_str(const uint8_t **data, size_t *dlen,
+                                 QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_OCT_STR);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_bit_str(const uint8_t **data, size_t *dlen,
+                               QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_BIT_STR);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_oid(const uint8_t **data, size_t *dlen,
+                           QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                                  QCRYPTO_DER_TAG_ENC_PRIM,
+                                  QCRYPTO_DER_TYPE_TAG_OID);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+int qcrypto_der_decode_ctx_tag(const uint8_t **data, size_t *dlen, int tag_id,
+                               QCryptoDERDecodeCb cb, void *ctx, Error **errp)
+{
+    uint8_t tag = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_CONT,
+                                  QCRYPTO_DER_TAG_ENC_CONS,
+                                  tag_id);
+    return qcrypto_der_decode_tlv(tag, data, dlen, cb, ctx, errp);
+}
+
+void qcrypto_der_encode_int(const uint8_t *src, size_t src_len,
+                            uint8_t *dst, size_t *dst_len)
+{
+    if (!dst) {
+        qcrypto_der_encode_data(src, src_len, NULL, dst_len);
+        *dst_len += 1;
+        return;
     }
+    *dst++ = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                             QCRYPTO_DER_TAG_ENC_PRIM,
+                             QCRYPTO_DER_TYPE_TAG_INT);
+    qcrypto_der_encode_data(src, src_len, dst, dst_len);
+    *dst_len += 1;
+}
 
-    return qcrypto_der_extract_data(data, dlen, cb, ctx, errp);
+void qcrypto_der_encode_seq(const uint8_t *src, size_t src_len,
+                            uint8_t *dst, size_t *dst_len)
+{
+    if (!dst) {
+        qcrypto_der_encode_data(src, src_len, NULL, dst_len);
+        *dst_len += 1;
+        return;
+    }
+    *dst++ = QCRYPTO_DER_TAG(QCRYPTO_DER_TAG_CLASS_UNIV,
+                             QCRYPTO_DER_TAG_ENC_CONS,
+                             QCRYPTO_DER_TYPE_TAG_SEQ);
+    qcrypto_der_encode_data(src, src_len, dst, dst_len);
+    *dst_len += 1;
 }
diff --git a/crypto/der.h b/crypto/der.h
index e3d3aeacdc..ec1436d531 100644
--- a/crypto/der.h
+++ b/crypto/der.h
@@ -47,14 +47,13 @@ typedef int (*QCryptoDERDecodeCb) (void *opaque, const uint8_t *value,
  * will be set to the rest length of data, if cb is not NULL, must
  * return 0 to make decode success, at last, the length of the data
  * part of the decoded INTEGER will be returned. Otherwise, -1 is
- * returned.
+ * returned and the valued of *data and *dlen keep unchanged.
  */
 int qcrypto_der_decode_int(const uint8_t **data,
                            size_t *dlen,
                            QCryptoDERDecodeCb cb,
                            void *opaque,
                            Error **errp);
-
 /**
  * qcrypto_der_decode_seq:
  *
@@ -70,7 +69,7 @@ int qcrypto_der_decode_int(const uint8_t **data,
  * will be set to the rest length of data, if cb is not NULL, must
  * return 0 to make decode success, at last, the length of the data
  * part of the decoded SEQUENCE will be returned. Otherwise, -1 is
- * returned.
+ * returned and the valued of *data and *dlen keep unchanged.
  */
 int qcrypto_der_decode_seq(const uint8_t **data,
                            size_t *dlen,
@@ -78,4 +77,127 @@ int qcrypto_der_decode_seq(const uint8_t **data,
                            void *opaque,
                            Error **errp);
 
+/**
+ * qcrypto_der_decode_oid:
+ *
+ * Decode OID from DER-encoded data, similar with der_decode_int.
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded OID will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_oid(const uint8_t **data,
+                           size_t *dlen,
+                           QCryptoDERDecodeCb cb,
+                           void *opaque,
+                           Error **errp);
+
+/**
+ * qcrypto_der_decode_octet_str:
+ *
+ * Decode OCTET STRING from DER-encoded data, similar with der_decode_int.
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded OCTET STRING will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_octet_str(const uint8_t **data,
+                                 size_t *dlen,
+                                 QCryptoDERDecodeCb cb,
+                                 void *opaque,
+                                 Error **errp);
+
+/**
+ * qcrypto_der_decode_bit_str:
+ *
+ * Decode BIT STRING from DER-encoded data, similar with der_decode_int.
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded BIT STRING will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_bit_str(const uint8_t **data,
+                               size_t *dlen,
+                               QCryptoDERDecodeCb cb,
+                               void *opaque,
+                               Error **errp);
+
+
+/**
+ * qcrypto_der_decode_ctx_tag:
+ *
+ * Decode context specific tag
+ *
+ * @data: pointer to address of input data
+ * @dlen: pointer to length of input data
+ * @tag: expected value of context specific tag
+ * @cb: callback invoked when decode succeed, if cb equals NULL, no
+ * callback will be invoked
+ * @opaque: parameter passed to cb
+ *
+ * Returns: On success, *data points to rest data, and *dlen
+ * will be set to the rest length of data, if cb is not NULL, must
+ * return 0 to make decode success, at last, the length of the data
+ * part of the decoded BIT STRING will be returned. Otherwise, -1 is
+ * returned and the valued of *data and *dlen keep unchanged.
+ */
+int qcrypto_der_decode_ctx_tag(const uint8_t **data,
+                               size_t *dlen, int tag_id,
+                               QCryptoDERDecodeCb cb,
+                               void *opaque,
+                               Error **errp);
+
+/**
+ * qcrypto_der_encode_seq:
+ * @src: source data to be encoded
+ * @src_len: length of source data
+ * @dest: distination to save the encoded data, if dest is NULL, dst_len is
+ * set to expected buffer length and nothing more happends.
+ * @dst_len: output parameter, indicates how many bytes wat wrote to dest.
+ *
+ * Encode data as SEQUENCE in DER rules.
+ *
+ */
+void qcrypto_der_encode_seq(const uint8_t *src, size_t src_len,
+                            uint8_t *dst, size_t *dst_len);
+
+/**
+ * qcrypto_der_encode_int:
+ * @src: source data to be encoded
+ * @src_len: length of source data
+ * @dest: distination to save the encoded data, if dest is NULL, dst_len is
+ * set to expected buffer length and nothing more happends.
+ * @dst_len: output parameter, indicates how many bytes wat wrote to dest.
+ *
+ * Encode data as INTEGER in DER rules, the source data MUST be already
+ * encoded as two's complement in bigendian.
+ *
+ */
+void qcrypto_der_encode_int(const uint8_t *src, size_t src_len,
+                            uint8_t *dst, size_t *dst_len);
+
 #endif  /* QCRYPTO_ASN1_DECODER_H */
diff --git a/tests/unit/test-crypto-der.c b/tests/unit/test-crypto-der.c
index aed0f28d68..d218a7f170 100644
--- a/tests/unit/test-crypto-der.c
+++ b/tests/unit/test-crypto-der.c
@@ -147,13 +147,58 @@ static const uint8_t test_rsa2048_priv_key[] =
     "\x4e\x2f\x4c\xf9\xab\x97\x38\xe4\x20\x32\x32\x96\xc8\x9e\x79\xd3"
     "\x12";
 
+static const uint8_t test_ecdsa_p192_priv_key[] =
+    "\x30\x53"               /* SEQUENCE, offset 0, length 83 */
+    "\x02\x01\x01"           /* INTEGER, offset 2, length 1 */
+    "\x04\x18"               /* OCTET STRING, offset 5, length 24 */
+    "\xcb\xc8\x86\x0e\x66\x3c\xf7\x5a\x44\x13\xb8\xef\xea\x1d\x7b\xa6"
+    "\x1c\xda\xf4\x1b\xc7\x67\x6b\x35"
+    "\xa1\x34"               /* CONTEXT SPECIFIC 1, offset 31, length 52 */
+    "\x03\x32"               /* BIT STRING, offset 33, length 50 */
+    "\x00\x04\xc4\x16\xb3\xff\xac\xd5\x87\x98\xf7\xd9\x45\xfe\xd3\x5c"
+    "\x17\x9d\xb2\x36\x22\xcc\x07\xb3\x6d\x3c\x4e\x04\x5f\xeb\xb6\x52"
+    "\x58\xfb\x36\x10\x52\xb7\x01\x62\x0e\x94\x51\x1d\xe2\xef\x10\x82"
+    "\x88\x78";
+
+static const uint8_t test_ecdsa_p256_priv_key[] =
+    "\x30\x77"              /* SEQUENCE, offset 0, length 119 */
+    "\x02\x01\x01"          /* INTEGER, offset 2, length 1 */
+    "\x04\x20"              /* OCTET STRING, offset 5, length 32 */
+    "\xf6\x92\xdd\x29\x1c\x6e\xef\xb6\xb2\x73\x9f\x40\x1b\xb3\x2a\x28"
+    "\xd2\x37\xd6\x4a\x5b\xe4\x40\x4c\x6a\x95\x99\xfa\xf7\x92\x49\xbe"
+    "\xa0\x0a"              /* CONTEXT SPECIFIC 0, offset 39, length 10 */
+    "\x06\x08"              /* OID, offset 41, length 8 */
+    "\x2a\x86\x48\xce\x3d\x03\x01\x07"
+    "\xa1\x44"              /* CONTEXT SPECIFIC 1, offset 51, length 68 */
+    "\x03\x42"              /* BIT STRING, offset 53, length 66 */
+    "\x00\x04\xed\x42\x9c\x67\x79\xbe\x46\x83\x88\x3e\x8c\xc1\x33\xf3"
+    "\xc3\xf6\x2c\xf3\x13\x6a\x00\xc2\xc9\x3e\x87\x7f\x86\x39\xe6\xae"
+    "\xe3\xb9\xba\x2f\x58\x63\x32\x62\x62\x54\x07\x27\xf9\x5a\x3a\xc7"
+    "\x3a\x6b\x5b\xbc\x0d\x33\xba\xbb\xd4\xa3\xff\x4f\x9e\xdd\xf5\x59"
+    "\xc0\xf6";
+
 #define MAX_CHECKER_COUNT 32
 
+static int qcrypto_wrapped_decode_ctx_tag0(const uint8_t **data, size_t *dlen,
+                                           QCryptoDERDecodeCb cb, void *opaque,
+                                           Error **errp)
+{
+   return qcrypto_der_decode_ctx_tag(data, dlen, 0, cb, opaque, errp);
+}
+
+static int qcrypto_wrapped_decode_ctx_tag1(const uint8_t **data, size_t *dlen,
+                                           QCryptoDERDecodeCb cb, void *opaque,
+                                           Error **errp)
+{
+   return qcrypto_der_decode_ctx_tag(data, dlen, 1, cb, opaque, errp);
+}
+
 typedef struct QCryptoAns1DecoderResultChecker QCryptoAns1DecoderResultChecker;
 struct QCryptoAns1DecoderResultChecker {
     int (*action) (const uint8_t **data, size_t *dlen,
                    QCryptoDERDecodeCb cb, void *opaque, Error **errp);
     QCryptoDERDecodeCb cb;
+    bool constructed;
     const uint8_t *exp_value;
     size_t exp_vlen;
 };
@@ -204,7 +249,7 @@ static void test_ans1(const void *opaque)
         g_assert(checker->action(&c->data, &c->dlen, checker_callback,
                                  (void *)checker, &error_abort)
             == checker->exp_vlen);
-        if (checker->action == qcrypto_der_decode_seq) {
+        if (checker->constructed) {
             ++seq_depth;
             ctx[seq_depth].data = checker->exp_value;
             ctx[seq_depth].dlen = checker->exp_vlen;
@@ -225,25 +270,25 @@ static QCryptoAns1DecoderTestData test_data[] = {
     .test_data = test_rsa512_priv_key,
     .test_data_len = sizeof(test_rsa512_priv_key) - 1,
     .checker = {
-        { qcrypto_der_decode_seq, checker_callback,
+        { qcrypto_der_decode_seq, checker_callback, true,
           test_rsa512_priv_key + 4, 313 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 4 + 2, 1 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 7 + 2, 65 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 74 + 2, 3 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 79 + 2, 64 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 145 + 2, 33 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 180 + 2, 33 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 215 + 2, 32 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 249 + 2, 32 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa512_priv_key + 283 + 2, 32 },
     },
 },
@@ -252,29 +297,66 @@ static QCryptoAns1DecoderTestData test_data[] = {
     .test_data = test_rsa2048_priv_key,
     .test_data_len = sizeof(test_rsa2048_priv_key) - 1,
     .checker = {
-        { qcrypto_der_decode_seq, checker_callback,
+        { qcrypto_der_decode_seq, checker_callback, true,
           test_rsa2048_priv_key + 4, 1190 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 4 + 2, 1 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 7 + 4, 257 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 268 + 2, 3 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 273 + 4, 257 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 534 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 666 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 798 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 930 + 3, 129 },
-        { qcrypto_der_decode_int, checker_callback,
+        { qcrypto_der_decode_int, checker_callback, false,
           test_rsa2048_priv_key + 1062 + 3, 129 },
     },
 },
-
+{
+    .path = "/crypto/der/parse-ecdsa-p192-priv-key",
+    .test_data = test_ecdsa_p192_priv_key,
+    .test_data_len = sizeof(test_ecdsa_p192_priv_key) - 1,
+    .checker = {
+        { qcrypto_der_decode_seq, checker_callback, true,
+          test_ecdsa_p192_priv_key + 2, 83 },
+        { qcrypto_der_decode_int, checker_callback, false,
+          test_ecdsa_p192_priv_key + 2 + 2, 1 },
+        { qcrypto_der_decode_octet_str, checker_callback, false,
+          test_ecdsa_p192_priv_key + 5 + 2, 24 },
+        { qcrypto_wrapped_decode_ctx_tag1, checker_callback, true,
+          test_ecdsa_p192_priv_key + 31 + 2, 52 },
+        { qcrypto_der_decode_bit_str , checker_callback, false,
+          test_ecdsa_p192_priv_key + 33 + 2, 50 },
+    },
+},
+{
+    .path = "/crypto/der/parse-ecdsa-p256-priv-key",
+    .test_data = test_ecdsa_p256_priv_key,
+    .test_data_len = sizeof(test_ecdsa_p256_priv_key) - 1,
+    .checker = {
+        { qcrypto_der_decode_seq, checker_callback, true,
+          test_ecdsa_p256_priv_key + 2, 119 },
+        { qcrypto_der_decode_int, checker_callback, false,
+          test_ecdsa_p256_priv_key + 2 + 2, 1 },
+        { qcrypto_der_decode_octet_str, checker_callback, false,
+          test_ecdsa_p256_priv_key + 5 + 2, 32 },
+        { qcrypto_wrapped_decode_ctx_tag0, checker_callback, true,
+          test_ecdsa_p256_priv_key + 39 + 2, 10 },
+        { qcrypto_der_decode_oid, checker_callback, false,
+          test_ecdsa_p256_priv_key + 41 + 2, 8 },
+        { qcrypto_wrapped_decode_ctx_tag1, checker_callback, true,
+          test_ecdsa_p256_priv_key + 51 + 2, 68 },
+        { qcrypto_der_decode_bit_str , checker_callback, false,
+          test_ecdsa_p256_priv_key + 53 + 2, 66 },
+    },
+},
 };
 
 int main(int argc, char **argv)
-- 
2.11.0


