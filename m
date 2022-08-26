Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8495A2669
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:03:29 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRX7Y-0000uc-C9
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oRX0z-0002jM-H9
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:56:41 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:54124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oRX0r-00016M-Ct
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:56:38 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VNIqN4C_1661511381; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VNIqN4C_1661511381) by smtp.aliyun-inc.com;
 Fri, 26 Aug 2022 18:56:22 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, arei.gonglei@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH 1/8] docs: vhost-user: add VHOST_USER_RESET_VRING message
Date: Fri, 26 Aug 2022 18:56:13 +0800
Message-Id: <015b59aa0f722c00187081f0346b86014ba42d8d.1661510725.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1661510725.git.kangjie.xu@linux.alibaba.com>
References: <cover.1661510725.git.kangjie.xu@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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

To support the reset operation for an individual virtqueue,
we introduce a new message VHOST_USER_RESET_VRING. This
message is submitted by the front-end to reset an individual
virtqueue to initial states in the back-end. The reply is
needed to ensure that the reset operation is complete.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 docs/interop/vhost-user.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424e..ce7991b9d3 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1422,6 +1422,16 @@ Front-end message types
   query the back-end for its device status as defined in the Virtio
   specification.
 
+``VHOST_USER_RESET_VRING``
+  :id: 41
+  :equivalent ioctl: N/A
+  :request payload: vring state description
+  :reply payload: ``u64``
+
+  When the feature ``VIRTIO_F_RING_RESET`` feature has been successfully
+  negotiated, this message is submitted by the front-end to reset an
+  individual virtqueue to initial states in the back-end. It will ask
+  for a reply to ensure the virtqueue is successfully reset in the back-end.
 
 Back-end message types
 ----------------------
-- 
2.32.0


