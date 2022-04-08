Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE64F96E7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:38:44 +0200 (CEST)
Received: from localhost ([::1]:45054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncop1-0005kN-SH
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ncol4-0002rJ-Pq
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ncol3-0003cX-0G
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649424876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9vkaECCZXkAflzlL3P30ZPEXvMKzVcAl99HEU/aA4A=;
 b=C/nokY+jC3lE343X+MGlhsePDuxLbpn0NKbyDPEYHCfBj6OT5YNDAu2JuPQhWtwSGcIQYs
 dMHev0CREhSLfrVO+yeFkA7k4ec56riLXs5IwRSdDFUqUU1YNWTUM2sfqJGUFh3FsS1Q6y
 2Ushe+xXMs0t1nNdkU1lLFkwFrah6M0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-6J2yBloDMsalyLn6S5cbAA-1; Fri, 08 Apr 2022 09:34:33 -0400
X-MC-Unique: 6J2yBloDMsalyLn6S5cbAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BA3D28EA705;
 Fri,  8 Apr 2022 13:34:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D9F614583E7;
 Fri,  8 Apr 2022 13:34:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 04/23] hw/virtio: Replace g_memdup() by g_memdup2()
Date: Fri,  8 Apr 2022 15:33:56 +0200
Message-Id: <20220408133415.1371760-5-eperezma@redhat.com>
In-Reply-To: <20220408133415.1371760-1-eperezma@redhat.com>
References: <20220408133415.1371760-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
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


