Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91654B0CC7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:52:17 +0100 (CET)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7zl-00021X-2g
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:52:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7sb-0002pm-Vp
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:44:54 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:58174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7sY-0007Lx-2P
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:44:52 -0500
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 91CFB2E0DC2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:44:43 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 dbonYVdsOk-ihGSvA2f; Thu, 10 Feb 2022 14:44:43 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644493483; bh=pkXsRZPtJYbYslIag+LWJ4jPqR7UqqIwUKlz4vAAnyQ=;
 h=Date:To:From:Subject:Message-ID:Cc;
 b=vnbHDJbVPUzCn1Wf16QjC7h0Kt74lzcdAdvbERjr91g3lSdp7conEGRCboVFXnwGo
 6a6wNMv+DpG8rDF/fuZu9VcuA8BfepoAakLn/pwVNAztGwpIv/9OJQGILIJMUnQxfs
 xE/RrMyemR4ATntiDhVg7zsruzRWg4SlxpXQmWp0=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b081:8101::1:28])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 684zSQ7u6S-ihIKTHuK; Thu, 10 Feb 2022 14:44:43 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH] virtio-net: break gracefully on packet without valid header
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Feb 2022 14:44:42 +0300
Message-ID: <164449348255.2210192.2702615307678007456.stgit@dynamic-vpn.dhcp.yndx.net>
User-Agent: StGit/1.4.dev11+gd5bef96
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=khlebnikov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Right now too short packet from guest triggers assert in iov_copy().
(because requested offset does not fit into io vector)

For legacy virtio without feature VIRTIO_F_ANY_LAYOUT virtio-net header
must fit exactly in the first descriptor. With features VIRTIO_F_ANY_LAYOUT
or VIRTIO_F_VERSION_1 header is usually fused with data but sides must
support any arbitrary layout, so header may not fit into first descriptor.

Present check verifies only count of descriptors, which isn't helpful.
Let's check total length to intercept such short packets.

Alternative solution is removing asserts from io vector helpers and
checking results of copying from io vector where needed.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/762
Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/net/virtio-net.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index cf8ab0f8af..b47f70076d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2533,8 +2533,8 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
 
         out_num = elem->out_num;
         out_sg = elem->out_sg;
-        if (out_num < 1) {
-            virtio_error(vdev, "virtio-net header not in first element");
+        if (iov_size(out_sg, out_num) < n->guest_hdr_len) {
+            virtio_error(vdev, "virtio-net header is missing");
             virtqueue_detach_element(q->tx_vq, elem, 0);
             g_free(elem);
             return -EINVAL;


