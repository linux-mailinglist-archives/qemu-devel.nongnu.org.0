Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5030B4B0CC4
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:50:02 +0100 (CET)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7xZ-0007n2-DJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:50:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7sf-00034T-A5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:44:57 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:36036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <khlebnikov@yandex-team.ru>)
 id 1nI7sc-0007Mp-W7
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:44:57 -0500
Received: from sas2-3f1ffc04228d.qloud-c.yandex.net
 (sas2-3f1ffc04228d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:b7a3:0:640:3f1f:fc04])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id BAAB72E1C6C
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:44:49 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas2-3f1ffc04228d.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 lubIAcVuR8-inGunjeJ; Thu, 10 Feb 2022 14:44:49 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1644493489; bh=xi4CFOAZwgMEwDFdk94xfBssDZEFUlaxvQ7/Xng2bmQ=;
 h=Date:To:From:Subject:Message-ID:Cc;
 b=e1oUSbyxmQDZ3VwOeuNgbC6ug03hZpJbT9b89uIZWJSaBppCJEcNA4E8Zvzh0U93R
 9FRiP+3INNgVxEf9JUyBThSXkMvKMBCdbu9CXC68qPX56kbs0yIPKTo0oA49Ghpfwq
 McBOtzIrYPtyeprsrqlO4pSrGd0mx01G5iyStKAQ=
Authentication-Results: sas2-3f1ffc04228d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from localhost (dynamic-vpn.dhcp.yndx.net [2a02:6b8:b081:8101::1:28])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FnWPlI575d-inHCmdoG; Thu, 10 Feb 2022 14:44:49 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: [PATCH] virtio: update memory region cache when queue size changes
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Feb 2022 14:44:48 +0300
Message-ID: <164449348845.2210217.11689281350944593511.stgit@dynamic-vpn.dhcp.yndx.net>
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

Fuzzing found that queue size could be changed after writing queue address.
Resulting cached regions might be shorter than that and cause assert later.

Let's update cached memory regions after changing queue size.
This is no-op if queue address isn't set yet.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/781
Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 hw/virtio/virtio.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9e8f51dfb0..cd525a0f9a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2245,6 +2245,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
         return;
     }
     vdev->vq[n].vring.num = num;
+    virtio_init_region_cache(vdev, n);
 }
 
 VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector)


