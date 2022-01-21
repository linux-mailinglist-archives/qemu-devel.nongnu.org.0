Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7E949584F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 03:32:31 +0100 (CET)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAjj3-0007lh-R8
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 21:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nAjf1-0005CB-Dh
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 21:28:19 -0500
Received: from [2607:f8b0:4864:20::1031] (port=43552
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nAjey-0002B6-Em
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 21:28:17 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so7832113pja.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 18:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kiWY+ES/f92QyNigpn3R6a5lLo4wAGB7X7aXsL6h8aM=;
 b=tvoOY0TcgODfHUJQskielmksDFpYalfcy6zMVBjMH/P1uv0esmqrXbeGGtB+0aLN9w
 3twJmhVa8Y7WJlEjjxVy3CBwqZ8bQTF8j0zlsiLttIhF/VfOak9EFlNxB4BxhWFmd97y
 xlkQ5wYX2JEtJJTghKJdzMgv3c36kynf3wPINOU29OzfjGMPPlvvL5Bkl1U7EkSIw4kS
 yVb1TheosnlxT4HadSLEIMEWTROGsmSNEue33MVVEcr/tQ6F6Obj5Vwb645IyZkvnrh1
 slJkz+vdXumRwAciHZvAawn9TVMmO7G0wlJzMwzzhnAvQFFBTg2YwD0GHLdHaqI3sPDz
 joYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kiWY+ES/f92QyNigpn3R6a5lLo4wAGB7X7aXsL6h8aM=;
 b=flOYdQlJsVFxErn5Bmdmbiy/jprI9m+/l2s1uqXNbjWVHAi2cB+YCw+g2nF7M9gkVr
 ilbNhTewDp82p/TkRwgCFkKZo9+LL0Y5fGnGZauwr2DG8I61ExaFAhQtiKUzbwWTY1Db
 Rf29Xdo0Eoa6lb2Q2B0pSET+6VOaUD1Tta06wu1/Qpbjy63huPuqumfGWCEEsuII2CUs
 ZB4TRjeshrCcek3xu5xp3VWb4AL8QvxfSD0Nh7+cXNJ6mMKGwTTJ1sIRjiYZ/czki8RM
 axIrYphVTLMLbfupAR8ADBNEvc6wAFUUtR5X9hPF0rkVSt4fLidBoqyl3XLAXCu7pw4J
 4VvA==
X-Gm-Message-State: AOAM532YlWJ+CDQhZ3msQUZwlIJa3Igsx6AhcYDfAfhOVWkgEpKuz8HA
 B+02LQyZhXhmwm9Exba/f3msJA==
X-Google-Smtp-Source: ABdhPJz/IrczjDIUJewHxlMlapkJFGEGPgRTRTQyFalmymJcpNlMtUtuMLdx17kkPvUfbInbPTj/OA==
X-Received: by 2002:a17:90a:4601:: with SMTP id
 w1mr14576152pjg.113.1642732095279; 
 Thu, 20 Jan 2022 18:28:15 -0800 (PST)
Received: from libai.bytedance.net ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id d1sm4825404pfj.179.2022.01.20.18.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 18:28:14 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: arei.gonglei@huawei.com,
	mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH 1/3] virtio-crypto: header update
Date: Fri, 21 Jan 2022 10:26:58 +0800
Message-Id: <20220121022700.1042649-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121022700.1042649-1-pizhenwei@bytedance.com>
References: <20220121022700.1042649-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 helei.sig11@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update header from linux, support akcipher service.

Signed-off-by: lei he <helei.sig11@bytedance.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 .../standard-headers/linux/virtio_crypto.h    | 98 +++++++++++++++++--
 1 file changed, 89 insertions(+), 9 deletions(-)

diff --git a/include/standard-headers/linux/virtio_crypto.h b/include/standard-headers/linux/virtio_crypto.h
index 5ff0b4ee59..1dba57248d 100644
--- a/include/standard-headers/linux/virtio_crypto.h
+++ b/include/standard-headers/linux/virtio_crypto.h
@@ -33,10 +33,11 @@
 #include "standard-headers/linux/virtio_config.h"
 
 
-#define VIRTIO_CRYPTO_SERVICE_CIPHER 0
-#define VIRTIO_CRYPTO_SERVICE_HASH   1
-#define VIRTIO_CRYPTO_SERVICE_MAC    2
-#define VIRTIO_CRYPTO_SERVICE_AEAD   3
+#define VIRTIO_CRYPTO_SERVICE_CIPHER   0
+#define VIRTIO_CRYPTO_SERVICE_HASH     1
+#define VIRTIO_CRYPTO_SERVICE_MAC      2
+#define VIRTIO_CRYPTO_SERVICE_AEAD     3
+#define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
 
 #define VIRTIO_CRYPTO_OPCODE(service, op)   (((service) << 8) | (op))
 
@@ -57,6 +58,10 @@ struct virtio_crypto_ctrl_header {
 	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x02)
 #define VIRTIO_CRYPTO_AEAD_DESTROY_SESSION \
 	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x03)
+#define VIRTIO_CRYPTO_AKCIPHER_CREATE_SESSION \
+	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x04)
+#define VIRTIO_CRYPTO_AKCIPHER_DESTROY_SESSION \
+	   VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x05)
 	uint32_t opcode;
 	uint32_t algo;
 	uint32_t flag;
@@ -180,6 +185,57 @@ struct virtio_crypto_aead_create_session_req {
 	uint8_t padding[32];
 };
 
+struct virtio_crypto_rsa_session_para {
+#define VIRTIO_CRYPTO_RSA_RAW_PADDING   0
+#define VIRTIO_CRYPTO_RSA_PKCS1_PADDING 1
+	uint32_t padding_algo;
+
+#define VIRTIO_CRYPTO_RSA_NO_HASH   0
+#define VIRTIO_CRYPTO_RSA_MD2       1
+#define VIRTIO_CRYPTO_RSA_MD3       2
+#define VIRTIO_CRYPTO_RSA_MD4       3
+#define VIRTIO_CRYPTO_RSA_MD5       4
+#define VIRTIO_CRYPTO_RSA_SHA1      5
+#define VIRTIO_CRYPTO_RSA_SHA256    6
+#define VIRTIO_CRYPTO_RSA_SHA384    7
+#define VIRTIO_CRYPTO_RSA_SHA512    8
+#define VIRTIO_CRYPTO_RSA_SHA224    9
+	uint32_t hash_algo;
+};
+
+struct virtio_crypto_ecdsa_session_para {
+#define VIRTIO_CRYPTO_CURVE_UNKNOWN   0
+#define VIRTIO_CRYPTO_CURVE_NIST_P192 1
+#define VIRTIO_CRYPTO_CURVE_NIST_P224 2
+#define VIRTIO_CRYPTO_CURVE_NIST_P256 3
+#define VIRTIO_CRYPTO_CURVE_NIST_P384 4
+#define VIRTIO_CRYPTO_CURVE_NIST_P521 5
+	uint32_t curve_id;
+};
+
+struct virtio_crypto_akcipher_session_para {
+#define VIRTIO_CRYPTO_NO_AKCIPHER    0
+#define VIRTIO_CRYPTO_AKCIPHER_RSA   1
+#define VIRTIO_CRYPTO_AKCIPHER_DSA   2
+#define VIRTIO_CRYPTO_AKCIPHER_ECDSA 3
+	uint32_t algo;
+
+#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PUBLIC  1
+#define VIRTIO_CRYPTO_AKCIPHER_KEY_TYPE_PRIVATE 2
+	uint32_t keytype;
+	uint32_t keylen;
+
+	union {
+		struct virtio_crypto_rsa_session_para rsa;
+		struct virtio_crypto_ecdsa_session_para ecdsa;
+	} u;
+};
+
+struct virtio_crypto_akcipher_create_session_req {
+	struct virtio_crypto_akcipher_session_para para;
+	uint8_t padding[36];
+};
+
 struct virtio_crypto_alg_chain_session_para {
 #define VIRTIO_CRYPTO_SYM_ALG_CHAIN_ORDER_HASH_THEN_CIPHER  1
 #define VIRTIO_CRYPTO_SYM_ALG_CHAIN_ORDER_CIPHER_THEN_HASH  2
@@ -247,6 +303,8 @@ struct virtio_crypto_op_ctrl_req {
 			mac_create_session;
 		struct virtio_crypto_aead_create_session_req
 			aead_create_session;
+		struct virtio_crypto_akcipher_create_session_req
+			akcipher_create_session;
 		struct virtio_crypto_destroy_session_req
 			destroy_session;
 		uint8_t padding[56];
@@ -266,6 +324,14 @@ struct virtio_crypto_op_header {
 	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x00)
 #define VIRTIO_CRYPTO_AEAD_DECRYPT \
 	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AEAD, 0x01)
+#define VIRTIO_CRYPTO_AKCIPHER_ENCRYPT \
+	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x00)
+#define VIRTIO_CRYPTO_AKCIPHER_DECRYPT \
+	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x01)
+#define VIRTIO_CRYPTO_AKCIPHER_SIGN \
+	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
+#define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
+	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
 	uint32_t opcode;
 	/* algo should be service-specific algorithms */
 	uint32_t algo;
@@ -390,6 +456,16 @@ struct virtio_crypto_aead_data_req {
 	uint8_t padding[32];
 };
 
+struct virtio_crypto_akcipher_para {
+	uint32_t src_data_len;
+	uint32_t dst_data_len;
+};
+
+struct virtio_crypto_akcipher_data_req {
+	struct virtio_crypto_akcipher_para para;
+	uint8_t padding[40];
+};
+
 /* The request of the data virtqueue's packet */
 struct virtio_crypto_op_data_req {
 	struct virtio_crypto_op_header header;
@@ -399,15 +475,18 @@ struct virtio_crypto_op_data_req {
 		struct virtio_crypto_hash_data_req hash_req;
 		struct virtio_crypto_mac_data_req mac_req;
 		struct virtio_crypto_aead_data_req aead_req;
+		struct virtio_crypto_akcipher_data_req akcipher_req;
 		uint8_t padding[48];
 	} u;
 };
 
-#define VIRTIO_CRYPTO_OK        0
-#define VIRTIO_CRYPTO_ERR       1
-#define VIRTIO_CRYPTO_BADMSG    2
-#define VIRTIO_CRYPTO_NOTSUPP   3
-#define VIRTIO_CRYPTO_INVSESS   4 /* Invalid session id */
+#define VIRTIO_CRYPTO_OK            0
+#define VIRTIO_CRYPTO_ERR           1
+#define VIRTIO_CRYPTO_BADMSG        2
+#define VIRTIO_CRYPTO_NOTSUPP       3
+#define VIRTIO_CRYPTO_INVSESS       4 /* Invalid session id */
+#define VIRTIO_CRYPTO_NOSPC         5 /* no free session ID */
+#define VIRTIO_CRYPTO_KEY_REJECTED  6 /* Signature verification failed */
 
 /* The accelerator hardware is ready */
 #define VIRTIO_CRYPTO_S_HW_READY  (1 << 0)
@@ -441,6 +520,7 @@ struct virtio_crypto_config {
 	uint32_t reserve;
 	/* Maximum size of each crypto request's content */
 	uint64_t max_size;
+	uint32_t akcipher_algo;
 };
 
 struct virtio_crypto_inhdr {
-- 
2.25.1


