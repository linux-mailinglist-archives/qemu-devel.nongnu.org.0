Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167EB5B503F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 19:25:32 +0200 (CEST)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXQi3-0000I0-65
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 13:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXQfH-00038i-Ij
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 13:22:40 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:34506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXQfE-0003Lr-5b
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 13:22:39 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R591e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VPKkjDy_1662916948; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VPKkjDy_1662916948) by smtp.aliyun-inc.com;
 Mon, 12 Sep 2022 01:22:29 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v4 15/15] vhost: vhost-kernel: enable vq reset feature
Date: Mon, 12 Sep 2022 01:22:11 +0800
Message-Id: <fa23dc20c0250e6a09fbae47e4b3ed140ca55f86.1662916759.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.43;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-43.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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

Add virtqueue reset feature for vhost-kernel.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 hw/net/vhost_net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 1059aa45b4..97cdf9280b 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -46,6 +46,7 @@ static const int kernel_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_HASH_REPORT,
     VHOST_INVALID_FEATURE_BIT
 };
-- 
2.32.0


