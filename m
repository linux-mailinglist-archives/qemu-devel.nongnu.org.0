Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8DA4B0CCE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:53:27 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI80s-0004Gi-Ao
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:53:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7uH-0004HW-59
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:46:37 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:38102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7uA-0007nT-C5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:46:32 -0500
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 8E1362E1C6C
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:46:24 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 j8j70NF3a8-kOG4v3gJ; Thu, 10 Feb 2022 14:46:24 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644493584; bh=o6Xrn94LnXH7onEP2lFHv5yeYRe+EYPcyhCeOfmlTcg=;
 h=Date:To:From:Subject:Message-ID:Cc;
 b=ZJNbkni3iNDTrA37KwpuYJM/tKcD/oJXrGuK4MSLPAZ65H4gdU2kPTDjHbeW+Rki3
 EzCgrLF2TKY0q40k/LabjTVykORqGpBGB0Gk6B9Tdw0u3zTaaIBKUJ7n2JZnwzkf20
 5FzUskwhHHcq07sa/OPx8IlZF/Ly6Pfst7U7xFtI=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b081:8101::1:28])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HvSPOIGIlo-kOIChQXR; Thu, 10 Feb 2022 14:46:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH] vhost: fix repeated memory unmap in error paths
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Feb 2022 14:46:23 +0300
Message-ID: <164449358353.2210343.10106072767435805975.stgit@dynamic-vpn.dhcp.yndx.net>
User-Agent: StGit/1.4.dev11+gd5bef96
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fuzzing found that on some error paths vhost_memory_unmap() is called twice or
for NULL address. Let's reset pointers after unmap and ingnore unmap for NULL.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/virtio/vhost.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b03efccec..4e5d5f2ea4 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -335,7 +335,7 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
                                hwaddr len, int is_write,
                                hwaddr access_len)
 {
-    if (!vhost_dev_has_iommu(dev)) {
+    if (buffer && !vhost_dev_has_iommu(dev)) {
         cpu_physical_memory_unmap(buffer, len, is_write, access_len);
     }
 }
@@ -1191,6 +1191,7 @@ fail_alloc_avail:
     vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
                        0, 0);
 fail_alloc_desc:
+    vq->used = vq->avail = vq->desc = NULL;
     return r;
 }
 
@@ -1238,6 +1239,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
                        0, virtio_queue_get_avail_size(vdev, idx));
     vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
                        0, virtio_queue_get_desc_size(vdev, idx));
+    vq->used = vq->avail = vq->desc = NULL;
 }
 
 static void vhost_eventfd_add(MemoryListener *listener,


