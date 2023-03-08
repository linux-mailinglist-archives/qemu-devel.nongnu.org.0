Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665EF6AFBE2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiKu-0000eY-LZ; Tue, 07 Mar 2023 20:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKs-0000XB-OV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiKr-0001WQ-1T
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsSdnH9a7tudhjoUI7fD5la6QwQG8MoHhpYbHRlxQoQ=;
 b=XNyOHlFwjMyrN8BhoAIjWPI3+An+ZrjsXNOwK+8U0rx5OzMWrqLGxz5Y35dSpD4GuJJ6n6
 MyIenuGziK1nX7t0vAI3uulAoRI04yxRta3sKQHXDah0YsaOvHN1R8wfSns+UOO9aUJlq+
 gmhwoN8SiRQizPzIlk1Qfbsti9Tn0Vc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-bDRNbuA7Oymq45aHXoOYWQ-1; Tue, 07 Mar 2023 20:11:12 -0500
X-MC-Unique: bDRNbuA7Oymq45aHXoOYWQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 m7-20020a056000008700b002c7047ea429so2601003wrx.21
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237871;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsSdnH9a7tudhjoUI7fD5la6QwQG8MoHhpYbHRlxQoQ=;
 b=mPLPvbQ9KZTnduIMNOo7UI0bWDyh0zDfbBUFr9eXf0Wpo2Sg4XTqqEXIbyKcDAOt2C
 2bu/aQqQsnOp1etjLhIH7GGWz9qbOpgH39oiddi3wqr+3Nq5MI+d2m1cYy3P3idki75k
 lWikox/H/7p+FML8lwbV2OAESwkQ80WGZmVOJPqRYl2znTsvjd550bf3D1SHynGu6UvU
 2Rkp+NiEmIESBkaVLe9EJfgZ84ZoOW3yz8ItydIBhG/+xkjNDcKbdVpgMzOE7rk6RoEF
 06mt44UztZlsuPOp6sXDwOA2WfZzpAcmmZqvCIgz2PfzDdozQHprJTR7PPI8KGy7JEgO
 YfMw==
X-Gm-Message-State: AO0yUKUfilemWZCEksinsNySIfO96dpEP2/Refxj+Xf6vAG+U9xVrx+S
 9rNywxl7JVvIrnnjIRpTh9QRkt/5GPYtFuuXgvfDqMz34pRV1sjV4p/j8OiDJEykCNVIwZVepMv
 7xCS2I0ZNL1Aag2f6IkNDKOqjuk0RVpMg4v9SZD9db2RYzkvlTheg5KU/Sm+eeUh6NuLh
X-Received: by 2002:a05:600c:3108:b0:3eb:37ce:4c3d with SMTP id
 g8-20020a05600c310800b003eb37ce4c3dmr14088739wmo.38.1678237870945; 
 Tue, 07 Mar 2023 17:11:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+rJF1/4MaPpU8Yrg7U+xjS2DcE6+zUtgKtktyzhC0sSJVpm7bjIC62ioeab3+VLv5kUAsBBw==
X-Received: by 2002:a05:600c:3108:b0:3eb:37ce:4c3d with SMTP id
 g8-20020a05600c310800b003eb37ce4c3dmr14088720wmo.38.1678237870641; 
 Tue, 07 Mar 2023 17:11:10 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003e20970175dsm20237605wms.32.2023.03.07.17.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:10 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 zhenwei pi <pizhenwei@bytedance.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PULL 06/73] cryptodev-builtin: Detect akcipher capability
Message-ID: <abca0fc329a89c1a497974db50f284a37c32f2f5.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: zhenwei pi <pizhenwei@bytedance.com>

Rather than exposing akcipher service/RSA algorithm to virtio crypto
device unconditionally, detect akcipher capability from akcipher
crypto framework. This avoids unsuccessful requests.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20230301105847.253084-7-pizhenwei@bytedance.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 backends/cryptodev-builtin.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index c0fbb650d7..c45b5906c5 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -59,6 +59,19 @@ struct CryptoDevBackendBuiltin {
     CryptoDevBackendBuiltinSession *sessions[MAX_NUM_SESSIONS];
 };
 
+static void cryptodev_builtin_init_akcipher(CryptoDevBackend *backend)
+{
+    QCryptoAkCipherOptions opts;
+
+    opts.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+    opts.u.rsa.padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
+    if (qcrypto_akcipher_supports(&opts)) {
+        backend->conf.crypto_services |=
+                     (1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER);
+        backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
+    }
+}
+
 static void cryptodev_builtin_init(
              CryptoDevBackend *backend, Error **errp)
 {
@@ -81,11 +94,9 @@ static void cryptodev_builtin_init(
     backend->conf.crypto_services =
                          1u << QCRYPTODEV_BACKEND_SERVICE_CIPHER |
                          1u << QCRYPTODEV_BACKEND_SERVICE_HASH |
-                         1u << QCRYPTODEV_BACKEND_SERVICE_MAC |
-                         1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER;
+                         1u << QCRYPTODEV_BACKEND_SERVICE_MAC;
     backend->conf.cipher_algo_l = 1u << VIRTIO_CRYPTO_CIPHER_AES_CBC;
     backend->conf.hash_algo = 1u << VIRTIO_CRYPTO_HASH_SHA1;
-    backend->conf.akcipher_algo = 1u << VIRTIO_CRYPTO_AKCIPHER_RSA;
     /*
      * Set the Maximum length of crypto request.
      * Why this value? Just avoid to overflow when
@@ -94,6 +105,7 @@ static void cryptodev_builtin_init(
     backend->conf.max_size = LONG_MAX - sizeof(CryptoDevBackendOpInfo);
     backend->conf.max_cipher_key_len = CRYPTODEV_BUITLIN_MAX_CIPHER_KEY_LEN;
     backend->conf.max_auth_key_len = CRYPTODEV_BUITLIN_MAX_AUTH_KEY_LEN;
+    cryptodev_builtin_init_akcipher(backend);
 
     cryptodev_backend_set_ready(backend, true);
 }
-- 
MST


