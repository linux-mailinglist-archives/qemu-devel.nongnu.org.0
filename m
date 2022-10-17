Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC75600B9E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:54:52 +0200 (CEST)
Received: from localhost ([::1]:49570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMpf-0003Js-IO
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMO5-0005ZQ-CL
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:26:21 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:49151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMNx-0002sH-3Y
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:26:14 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R921e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VSMILXV_1665998766; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VSMILXV_1665998766) by smtp.aliyun-inc.com;
 Mon, 17 Oct 2022 17:26:07 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Kangjie Xu <kangjie.xu@linux.alibaba.com>
Subject: [PATCH v6 06/15] virtio-pci: support queue enable
Date: Mon, 17 Oct 2022 17:25:49 +0800
Message-Id: <20221017092558.111082-7-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20221017092558.111082-1-xuanzhuo@linux.alibaba.com>
References: <20221017092558.111082-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 3b20cde7ef
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

PCI devices support device specific vq enable.

Based on this function, the driver can re-enable the virtqueue after the
virtqueue is reset.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a41c1dfe71..9d948e21f6 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1342,6 +1342,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                        proxy->vqs[vdev->queue_sel].used[0]);
             proxy->vqs[vdev->queue_sel].enabled = 1;
             proxy->vqs[vdev->queue_sel].reset = 0;
+            virtio_queue_enable(vdev, vdev->queue_sel);
         } else {
             virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
         }
-- 
2.32.0.3.g01195cf9f


