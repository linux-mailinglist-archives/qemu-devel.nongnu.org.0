Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72B91E096D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 May 2020 10:58:45 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jd8wW-00011a-SF
	for lists+qemu-devel@lfdr.de; Mon, 25 May 2020 04:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1jd8vn-0000W5-3Q; Mon, 25 May 2020 04:57:59 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:39172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1jd8vl-0000FC-OI; Mon, 25 May 2020 04:57:58 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 46EB72E1469;
 Mon, 25 May 2020 11:57:54 +0300 (MSK)
Received: from sas1-9998cec34266.qloud-c.yandex.net
 (sas1-9998cec34266.qloud-c.yandex.net [2a02:6b8:c14:3a0e:0:640:9998:cec3])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 tixeNvdHtN-vo2O58qn; Mon, 25 May 2020 11:57:54 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590397074; bh=90wMu+iZclOKuX3s2GzQRMQkjE7C5K3HtioXlbfRWGI=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=hMlFVc6lZoIiQcibVeL/x5n0d7nf3WIQumUcA8NApDioVnz2S/UWUycShYzBC7jK1
 NhTSpxWgB/qgZvsOOq6n007MyMXufH5EOvdSCqr8nMp5yHFCMHEKneWMcm4AECqOzK
 8cqeC5tMcumficnV+wIIHJ+QsV+n48O1lr87hJOQ=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:105::1:6])
 by sas1-9998cec34266.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 tiVZhOf8SY-voWS3gu9; Mon, 25 May 2020 11:57:50 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
Date: Mon, 25 May 2020 11:57:49 +0300
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/2] vhost-user-blk: delay vhost_user_blk_disconnect
Message-ID: <20200525085741.GA7645@dimastep-nix>
References: <cover.1589989075.git.dimastep@yandex-team.ru>
 <0dfb37f8728aba26c8d6c117018332a5b7dc9b56.1589989075.git.dimastep@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dfb37f8728aba26c8d6c117018332a5b7dc9b56.1589989075.git.dimastep@yandex-team.ru>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 04:57:54
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, dgilbert@redhat.com, mreitz@redhat.com, fengli@smartx.com,
 yc-core@yandex-team.ru, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 20, 2020 at 06:53:13PM +0300, Dima Stepanov wrote:
> A socket write during vhost-user communication may trigger a disconnect
> event, calling vhost_user_blk_disconnect() and clearing all the
> vhost_dev structures holding data that vhost-user functions expect to
> remain valid to roll back initialization correctly. Delay the cleanup to
> keep vhost_dev structure valid.
> There are two possible states to handle:
> 1. RUN_STATE_PRELAUNCH: skip bh oneshot call and perform disconnect in
> the caller routine.
> 2. RUN_STATE_RUNNING: delay by using bh
> 
> BH changes are based on the similar changes for the vhost-user-net
> device:
>   commit e7c83a885f865128ae3cf1946f8cb538b63cbfba
>   "vhost-user: delay vhost_user_stop"
> 
> Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>

I've reworked the patch based on Raphael's comment and send it for
review. Also i added a TODO comment in the vhost_user_blk_event()
routine. After review i'll send a v4 patch set.

---
 hw/block/vhost-user-blk.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 9d8c0b3..76838e7 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -349,6 +349,19 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
     vhost_dev_cleanup(&s->dev);
 }
 
+static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
+
+static void vhost_user_blk_chr_closed_bh(void *opaque)
+{
+    DeviceState *dev = opaque;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VHostUserBlk *s = VHOST_USER_BLK(vdev);
+
+    vhost_user_blk_disconnect(dev);
+    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
+            NULL, opaque, NULL, true);
+}
+
 static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
 {
     DeviceState *dev = opaque;
@@ -363,7 +376,30 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
         }
         break;
     case CHR_EVENT_CLOSED:
-        vhost_user_blk_disconnect(dev);
+        /*
+         * A close event may happen during a read/write, but vhost
+         * code assumes the vhost_dev remains setup, so delay the
+         * stop & clear. There are two possible paths to hit this
+         * disconnect event:
+         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
+         * vhost_user_blk_device_realize() is a caller.
+         * 2. In tha main loop phase after VM start.
+         *
+         * For p2 the disconnect event will be delayed. We can't
+         * do the same for p1, because we are not running the loop
+         * at this moment. So just skip this step and perform
+         * disconnect in the caller function.
+         *
+         * TODO: maybe it is a good idea to make the same fix
+         * for other vhost-user devices.
+         */
+        if (runstate_is_running()) {
+            AioContext *ctx = qemu_get_current_aio_context();
+
+            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
+                    NULL, NULL, false);
+            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
+        }
         break;
     case CHR_EVENT_BREAK:
     case CHR_EVENT_MUX_IN:
-- 
2.7.4


