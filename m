Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ACD6FB361
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:03:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2NK-0006r2-4c; Mon, 08 May 2023 11:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pw2NI-0006qt-1J
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pw2NG-00064d-2h
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683558120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2AH48WfnEzrkqPCbtYXQbr4GsnphlUrKqUdZs/3EEt0=;
 b=Nho3gjKH+QLw7BE/d4Hem34fya4vbk4pdr9yFv6tvsVMPE+qW0WF5gNJ3fdvhDSgk8cgxW
 PceD9EW1wjbHl9nWaf8TsesZrj211MefqTNRbde5fRmJZ8CeiF9AacAeSzrmCV94z8IDj4
 zH5v05XqN44U98DCUzhhNI3+vhFSkYE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-sfeTxgZJNvO8wQchAa0h5Q-1; Mon, 08 May 2023 11:01:57 -0400
X-MC-Unique: sfeTxgZJNvO8wQchAa0h5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8240829DD989;
 Mon,  8 May 2023 15:01:56 +0000 (UTC)
Received: from f37-work.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8A761121314;
 Mon,  8 May 2023 15:01:54 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com,
 taoym@zju.edu.cn, mcascell@redhat.com
Subject: [PATCH] virtio-crypto: fix NULL pointer dereference in
 virtio_crypto_free_request
Date: Mon,  8 May 2023 17:01:46 +0200
Message-Id: <20230508150146.1092355-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ensure op_info is not NULL in case of QCRYPTODEV_BACKEND_ALG_SYM algtype.

Fixes: 02ed3e7c ("virtio-crypto: zeroize the key material before free")
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: Yiming Tao <taoym@zju.edu.cn>
---
 hw/virtio/virtio-crypto.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 2fe804510f..c729a1f79e 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -476,15 +476,17 @@ static void virtio_crypto_free_request(VirtIOCryptoReq *req)
         size_t max_len;
         CryptoDevBackendSymOpInfo *op_info = req->op_info.u.sym_op_info;
 
-        max_len = op_info->iv_len +
-                  op_info->aad_len +
-                  op_info->src_len +
-                  op_info->dst_len +
-                  op_info->digest_result_len;
-
-        /* Zeroize and free request data structure */
-        memset(op_info, 0, sizeof(*op_info) + max_len);
-        g_free(op_info);
+        if (op_info) {
+            max_len = op_info->iv_len +
+                      op_info->aad_len +
+                      op_info->src_len +
+                      op_info->dst_len +
+                      op_info->digest_result_len;
+
+            /* Zeroize and free request data structure */
+            memset(op_info, 0, sizeof(*op_info) + max_len);
+            g_free(op_info);
+        }
     } else if (req->flags == QCRYPTODEV_BACKEND_ALG_ASYM) {
         CryptoDevBackendAsymOpInfo *op_info = req->op_info.u.asym_op_info;
         if (op_info) {
-- 
2.40.1


