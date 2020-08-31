Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66825767F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 11:28:59 +0200 (CEST)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCg7W-0002rN-E5
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 05:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kCg6a-0001Vx-50; Mon, 31 Aug 2020 05:28:00 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:59834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kCg6Y-0004zc-Dy; Mon, 31 Aug 2020 05:27:59 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 9C0512E15E7;
 Mon, 31 Aug 2020 12:27:53 +0300 (MSK)
Received: from sas1-58a37b48fb94.qloud-c.yandex.net
 (sas1-58a37b48fb94.qloud-c.yandex.net [2a02:6b8:c08:1d1b:0:640:58a3:7b48])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 XkxenMCgdz-Rqv8PXdx; Mon, 31 Aug 2020 12:27:53 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1598866073; bh=w4HAjC+uPauCS+4y5UQZrU0FI/SIeVh9OnDJmAmUQsg=;
 h=In-Reply-To:In-Reply-To:Message-Id:References:References:Date:
 Subject:To:From:Cc;
 b=1aHShIP1bnot4avwtSApn/lP4DBkJ5xoIPEb5IClup1+dxfXNxiH8B2eCI0cio/pq
 6dROcY/pOGAun4Z3Q+ctWS2bEVkpacsBrTTwtQVWxKeQcwrFdJlgVIxT0pGgx+ByPV
 TP4zVLZMD+tuRSSokSKHIxKI7tIGXZB5XZKdPhW4=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:216::1:a])
 by sas1-58a37b48fb94.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 yaozkQMlmT-Rqm81KUg; Mon, 31 Aug 2020 12:27:52 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] vhost: check queue state in the vhost_dev_set_log
 routine
Date: Mon, 31 Aug 2020 12:27:18 +0300
Message-Id: <2da64fc45789094b6bd6f1c283cac9e47eeeb786.1598865610.git.dimastep@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1598865610.git.dimastep@yandex-team.ru>
References: <cover.1598865610.git.dimastep@yandex-team.ru>
In-Reply-To: <cover.1598865610.git.dimastep@yandex-team.ru>
References: <cover.1598865610.git.dimastep@yandex-team.ru>
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 04:24:12
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, mreitz@redhat.com, fengli@smartx.com,
 yc-core@yandex-team.ru, pbonzini@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the vhost-user-blk daemon provides only one virtqueue, but device was
added with several queues, then QEMU will send more VHOST-USER command
than expected by daemon side. The vhost_virtqueue_start() routine
handles such case by checking the return value from the
virtio_queue_get_desc_addr() function call. Add the same check to the
vhost_dev_set_log() routine.

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
---
 hw/virtio/vhost.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index ffef7ab..a33ffd4 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -825,12 +825,24 @@ static int vhost_dev_set_features(struct vhost_dev *dev,
 static int vhost_dev_set_log(struct vhost_dev *dev, bool enable_log)
 {
     int r, i, idx;
+    hwaddr addr;
+
     r = vhost_dev_set_features(dev, enable_log);
     if (r < 0) {
         goto err_features;
     }
     for (i = 0; i < dev->nvqs; ++i) {
         idx = dev->vhost_ops->vhost_get_vq_index(dev, dev->vq_index + i);
+        addr = virtio_queue_get_desc_addr(dev->vdev, idx);
+        if (!addr) {
+            /*
+             * The queue might not be ready for start. If this
+             * is the case there is no reason to continue the process.
+             * The similar logic is used by the vhost_virtqueue_start()
+             * routine.
+             */
+            break;
+        }
         r = vhost_virtqueue_set_addr(dev, dev->vqs + i, idx,
                                      enable_log);
         if (r < 0) {
-- 
2.7.4


