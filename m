Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A37615EC6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 10:03:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9eF-00056P-Rh; Wed, 02 Nov 2022 05:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq9eD-000561-Me
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:02:57 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <helei.sig11@bytedance.com>)
 id 1oq9eB-0004tR-RO
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:02:57 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso1480470pjg.5
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kb/NPJxK30IHoMQNW2Nzr/GYWuG/nV+A2wzTkpBaUO4=;
 b=SXV6zIHg7xMOXj2k4Wr4Pd9knqCt9lzlvXvDKClcp6j66sjvE/agVtJi2d5Ogv6y+b
 QkHzB8BQyCnaJfP+zjS0JjdeNP9JPoUkaIctBW1FRwy4d0XPykvZ9MxSMwJrtCGc4ZXy
 uC06K4qjwiE5RODD9PUSs8W0eoGjeBottc0Dmj5ofGo+toizftR4koIzdESv/C1TAQSd
 c9SEa9l88rjbfcdSk6slFuzmX4ootIqQo2DQxJr2lZiSPqvPEcnRnPVDqetMiCmnCrOZ
 t7hfSYJfb271zkc3Ug2Y4CZDW/iw1fYBm3H6TXAR/z11/xHvFwXEA8+28M4Po9lm6N8t
 a4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kb/NPJxK30IHoMQNW2Nzr/GYWuG/nV+A2wzTkpBaUO4=;
 b=CTgFCRM/E8NiJcm91fZdzgrCpBFqDp8C73bAnXbSCy7RX/jope5ygxZCy5ymR50HUd
 sq1LL+kDBvM2IGk7sjez5s58n3Yqx45d0dKSq4oxGjW4P3CI98LFf5kQfNi/XWE7D9mN
 FvQsBbFQMFWIE3soz8EnZee+XhzKBHu8F9dclj5nAO3rwOTWuL59WJfgbVlCVylcbqGs
 Ii3EYX3nR5jh35oE0SXcGUrOBNm1eA0jSV+LHi4C+GAhqHgKFq3lRn0XB+0HIv7MwVzm
 YH5CH7G/X6hkgrC29IRjHENffgTd8soZRCPSqHS46yGR28OHgSVtpbHZVbHexGWCFNGg
 ZtwA==
X-Gm-Message-State: ACrzQf0c6lVUVrecqvU/uuTMszUZ9on/CwdUY8n2csGtmijFDljdmE3w
 BW8f0iIckOZo9M1VEhLLrQTGng==
X-Google-Smtp-Source: AMsMyM7Xm3SiHvuqskO6zHCPsLMuupZ1MJ8+/Jdv9HML1MTmU03DG7KB/MeClfNKBkSU8X1dyb1lSQ==
X-Received: by 2002:a17:902:e54f:b0:187:2e45:e190 with SMTP id
 n15-20020a170902e54f00b001872e45e190mr11136265plf.173.1667379774225; 
 Wed, 02 Nov 2022 02:02:54 -0700 (PDT)
Received: from FVFDK26JP3YV.bytedance.net ([139.177.225.245])
 by smtp.gmail.com with ESMTPSA id
 x129-20020a623187000000b0056da073b2b7sm4359987pfx.210.2022.11.02.02.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 02:02:53 -0700 (PDT)
From: Lei He <helei.sig11@bytedance.com>
To: mst@redhat.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com
Cc: pizhenwei@bytedance.com, qemu-devel@nongnu.org,
 Lei He <helei.sig11@bytedance.com>
Subject: [PATCH 1/2] cryptodev: avoid unreasonable use of g_autoptr
Date: Wed,  2 Nov 2022 17:02:42 +0800
Message-Id: <20221102090243.52140-2-helei.sig11@bytedance.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221102090243.52140-1-helei.sig11@bytedance.com>
References: <20221102090243.52140-1-helei.sig11@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=helei.sig11@bytedance.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Avoid using g_autoptr to free memory that not allocated in the same
function, just use g_free instead.

Signed-off-by: Lei He <helei.sig11@bytedance.com>
---
 hw/virtio/virtio-crypto.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 39c8f5914e..7ba63790d5 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -495,6 +495,7 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
         }
     }
 
+    g_free(req->in_iov);
     g_free(req);
 }
 
@@ -505,6 +506,7 @@ virtio_crypto_sym_input_data_helper(VirtIODevice *vdev,
                 CryptoDevBackendSymOpInfo *sym_op_info)
 {
     size_t s, len;
+    struct iovec *in_iov = req->in_iov;
 
     if (status != VIRTIO_CRYPTO_OK) {
         return;
@@ -512,18 +514,18 @@ virtio_crypto_sym_input_data_helper(VirtIODevice *vdev,
 
     len = sym_op_info->src_len;
     /* Save the cipher result */
-    s = iov_from_buf(req->in_iov, req->in_num, 0, sym_op_info->dst, len);
+    s = iov_from_buf(in_iov, req->in_num, 0, sym_op_info->dst, len);
     if (s != len) {
         virtio_error(vdev, "virtio-crypto dest data incorrect");
         return;
     }
 
-    iov_discard_front(&req->in_iov, &req->in_num, len);
+    iov_discard_front(&in_iov, &req->in_num, len);
 
     if (sym_op_info->op_type ==
                       VIRTIO_CRYPTO_SYM_OP_ALGORITHM_CHAINING) {
         /* Save the digest result */
-        s = iov_from_buf(req->in_iov, req->in_num, 0,
+        s = iov_from_buf(in_iov, req->in_num, 0,
                          sym_op_info->digest_result,
                          sym_op_info->digest_result_len);
         if (s != sym_op_info->digest_result_len) {
@@ -538,6 +540,7 @@ virtio_crypto_akcipher_input_data_helper(VirtIODevice *vdev,
         CryptoDevBackendAsymOpInfo *asym_op_info)
 {
     size_t s, len;
+    struct iovec *in_iov = req->in_iov;
 
     if (status != VIRTIO_CRYPTO_OK) {
         return;
@@ -548,13 +551,13 @@ virtio_crypto_akcipher_input_data_helper(VirtIODevice *vdev,
         return;
     }
 
-    s = iov_from_buf(req->in_iov, req->in_num, 0, asym_op_info->dst, len);
+    s = iov_from_buf(in_iov, req->in_num, 0, asym_op_info->dst, len);
     if (s != len) {
         virtio_error(vdev, "virtio-crypto asym dest data incorrect");
         return;
     }
 
-    iov_discard_front(&req->in_iov, &req->in_num, len);
+    iov_discard_front(&in_iov, &req->in_num, len);
 
     /* For akcipher, dst_len may be changed after operation */
     req->in_len = sizeof(struct virtio_crypto_inhdr) + asym_op_info->dst_len;
@@ -566,7 +569,6 @@ static void virtio_crypto_req_complete(void *opaque, int ret)
     VirtIOCrypto *vcrypto = req->vcrypto;
     VirtIODevice *vdev = VIRTIO_DEVICE(vcrypto);
     uint8_t status = -ret;
-    g_autofree struct iovec *in_iov_copy = req->in_iov;
 
     if (req->flags == CRYPTODEV_BACKEND_ALG_SYM) {
         virtio_crypto_sym_input_data_helper(vdev, req, status,
@@ -863,7 +865,7 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
      */
     request->in_num = in_num;
     request->in_iov = in_iov;
-    /* now, we free the in_iov_copy inside virtio_crypto_req_complete */
+    /* now, we free the in_iov_copy inside virtio_crypto_free_request */
     in_iov_copy = NULL;
 
     opcode = ldl_le_p(&req.header.opcode);
-- 
2.11.0


