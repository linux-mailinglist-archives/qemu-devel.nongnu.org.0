Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5C66DC49C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 10:47:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plnAS-0005xr-1H; Mon, 10 Apr 2023 04:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1plnAG-0005xU-0L; Mon, 10 Apr 2023 04:46:16 -0400
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arbn@yandex-team.com>)
 id 1plnAD-0007pc-Ay; Mon, 10 Apr 2023 04:46:15 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:47ac:0:640:70fa:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 2BA6060163;
 Mon, 10 Apr 2023 11:35:00 +0300 (MSK)
Received: from dellarbn.yandex.net (unknown [2a02:6b8:b081:b401::1:1f])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id lYPUCF0OcKo0-sMqn7sOw; Mon, 10 Apr 2023 11:34:59 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.com;
 s=default; 
 t=1681115699; bh=RdztJx/oyOON0vgfJPqkyc6f/SUKBKiefGCYyoBMIMQ=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=0v+kHT/CtjTEb0Y1HIo30hnL1ou73eVLKcqELN0Pj+ZYpLKWhueze1Lsa2l60ijKO
 BKIe0+oRTLVRyjU3JvAJHt6kuvHfvXBcDi+NxF9vbzvJjbHDQ+ZH9jyROjVMNDzk+D
 Yjv/Xf1Hhjj2u8zOCSPQfFDQPr2exKDJVvqb9UBg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.com
From: Andrey Ryabinin <arbn@yandex-team.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Cc: Yongji Xie <xieyongji@baidu.com>, Chai Wen <chaiwen@baidu.com>,
 Ni Xun <nixun@baidu.com>, d-tatianin@yandex-team.com,
 yc-core@yandex-team.com, Andrey Ryabinin <arbn@yandex-team.com>
Subject: [PATCH] block/vhost-user-blk: Fix hang on boot for some odd guests
Date: Mon, 10 Apr 2023 10:35:09 +0200
Message-Id: <20230410083509.3311-1-arbn@yandex-team.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=arbn@yandex-team.com; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some guests hang on boot when using the vhost-user-blk-pci device,
but boot normally when using the virtio-blk device. The problem occurs
because the guest advertises VIRTIO_F_VERSION_1 but kicks the virtqueue
before setting VIRTIO_CONFIG_S_DRIVER_OK, causing vdev->start_on_kick to
be false in vhost_user_blk_handle_output() and preventing the device from
starting.

Fix this by removing the check for vdev->start_on_kick to ensure
that the device starts after the kick. This aligns the behavior of
'vhost-user-blk-pci' device with 'virtio-blk' as it does the similar
thing in its virtio_blk_handle_output() function.

Fixes: 110b9463d5c8 ("vhost-user-blk: start vhost when guest kicks")
Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
---
 hw/block/vhost-user-blk.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index aff4d2b8cbd..448ead448f3 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -279,10 +279,6 @@ static void vhost_user_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
     Error *local_err = NULL;
     int i, ret;
 
-    if (!vdev->start_on_kick) {
-        return;
-    }
-
     if (!s->connected) {
         return;
     }
-- 
2.39.2


