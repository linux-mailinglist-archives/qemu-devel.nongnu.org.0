Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C953A52558A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 21:14:44 +0200 (CEST)
Received: from localhost ([::1]:40120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npEGp-00031N-Ju
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 15:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4l-0000lT-Rw
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4i-0001kr-OD
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PkJ9AftPi32TpD+kjV0SOKYsI2NXHREerwEsgX8ncQ=;
 b=OFO2I68IBoRc+IsCLVMC7Tq4R7uysTPXoA41pB41KmrCkp0slkmJ8tkdklWd+Kb9tEnUbE
 yA/VibsQU5cpisMY9XwOt4Gt8lMcWliO0eBWc/Cxa7dwgxLS7VHime5QVa7tAzeoGMS1tv
 wtQBsfo3cI7Vg0EinQBSIdfAcJaVgrM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-lj35mmpdNyuKqmB19TRU7g-1; Thu, 12 May 2022 13:58:02 -0400
X-MC-Unique: lj35mmpdNyuKqmB19TRU7g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46C4E811E80;
 Thu, 12 May 2022 17:58:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AE1443E390;
 Thu, 12 May 2022 17:58:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH 5/6] hw/virtio: Replace g_memdup() by g_memdup2()
Date: Thu, 12 May 2022 19:57:46 +0200
Message-Id: <20220512175747.142058-6-eperezma@redhat.com>
In-Reply-To: <20220512175747.142058-1-eperezma@redhat.com>
References: <20220512175747.142058-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/virtio-net.c       | 3 ++-
 hw/virtio/virtio-crypto.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1067e72b39..e4748a7e6c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1443,7 +1443,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        iov2 = iov = g_memdup2(elem->out_sg,
+                               sizeof(struct iovec) * elem->out_num);
         s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (s != sizeof(ctrl)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index dcd80b904d..0e31e3cc04 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         out_num = elem->out_num;
-        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+        out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
         out_iov = out_iov_copy;
 
         in_num = elem->in_num;
@@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     }
 
     out_num = elem->out_num;
-    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+    out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
     out_iov = out_iov_copy;
 
     in_num = elem->in_num;
-    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
+    in_iov_copy = g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
     in_iov = in_iov_copy;
 
     if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
-- 
2.27.0


