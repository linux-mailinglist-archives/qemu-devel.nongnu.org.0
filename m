Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C91366F14
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 17:26:15 +0200 (CEST)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZEk2-0007cZ-22
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 11:26:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZEij-0006lO-6A
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZEif-00060c-PS
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619018688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2DXopwAnDtsm6RozYKB0FZmZQaXaVCm74at9KrjeJxM=;
 b=RrAp5B4UWhjp0kI6mZa40HIOKAghRbdOkwu9NTsIHRBemw/pfM2K68yB924+Of+NSG9Kx3
 mq9ds9KOhn5nzwUqWXpTAmA2oR3+s0Mi9/3Us9griRuUCHswRK/unoOWbJKGKL8wW4c6ii
 j3NsvXBVzxWBVkd6awmDHBQDPGmazBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-Mn-V8mFNMnyHIQ888hu1QA-1; Wed, 21 Apr 2021 11:24:32 -0400
X-MC-Unique: Mn-V8mFNMnyHIQ888hu1QA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB59618397B7;
 Wed, 21 Apr 2021 15:24:10 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4E305C1D5;
 Wed, 21 Apr 2021 15:24:05 +0000 (UTC)
Date: Wed, 21 Apr 2021 17:24:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v3 2/3] vhost-user-blk: perform immediate cleanup if
 disconnect on initialization
Message-ID: <YIBDlEQ0AlRc9r0y@merkur.fritz.box>
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
 <20210325151217.262793-3-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20210325151217.262793-3-den-plotnikov@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-block@nongnu.org, mst@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, yc-core@yandex-team.ru, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.03.2021 um 16:12 hat Denis Plotnikov geschrieben:
> Commit 4bcad76f4c39 ("vhost-user-blk: delay vhost_user_blk_disconnect")
> introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
> because of connection problems with vhost-blk daemon.
> 
> However, it introdues a new problem. Now, any communication errors
> during execution of vhost_dev_init() called by vhost_user_blk_device_realize()
> lead to qemu abort on assert in vhost_dev_get_config().
> 
> This happens because vhost_user_blk_disconnect() is postponed but
> it should have dropped s->connected flag by the time
> vhost_user_blk_device_realize() performs a new connection opening.
> On the connection opening, vhost_dev initialization in
> vhost_user_blk_connect() relies on s->connection flag and
> if it's not dropped, it skips vhost_dev initialization and returns
> with success. Then, vhost_user_blk_device_realize()'s execution flow
> goes to vhost_dev_get_config() where it's aborted on the assert.
> 
> To fix the problem this patch adds immediate cleanup on device
> initialization(in vhost_user_blk_device_realize()) using different
> event handlers for initialization and operation introduced in the
> previous patch.
> On initialization (in vhost_user_blk_device_realize()) we fully
> control the initialization process. At that point, nobody can use the
> device since it isn't initialized and we don't need to postpone any
> cleanups, so we can do cleaup right away when there is a communication
> problem with the vhost-blk daemon.
> On operation we leave it as is, since the disconnect may happen when
> the device is in use, so the device users may want to use vhost_dev's data
> to do rollback before vhost_dev is re-initialized (e.g. in vhost_dev_set_log()).
> 
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

I think there is something wrong with this patch.

I'm debugging an error case, specifically num-queues being larger in
QEMU that in the vhost-user-blk export. Before this patch, it has just
an unfriendly error message:

qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: Unexpected end-of-file before all data were read
qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: Failed to read msg header. Read 0 instead of 12. Original request 24.
qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: vhost-user-blk: get block config failed
qemu-system-x86_64: Failed to set msg fds.
qemu-system-x86_64: vhost VQ 0 ring restore failed: -1: Resource temporarily unavailable (11)

After the patch, it crashes:

#0  0x0000555555d0a4bd in vhost_user_read_cb (source=0x5555568f4690, condition=(G_IO_IN | G_IO_HUP), opaque=0x7fffffffcbf0) at ../hw/virtio/vhost-user.c:313
#1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=0x555557c3f750, callback=0x555555d0a478 <vhost_user_read_cb>, user_data=0x7fffffffcbf0) at ../io/channel-watch.c:84
#2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
#3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/libglib-2.0.so.0
#4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
#5  0x0000555555d0a724 in vhost_user_read (dev=0x555557bc62f8, msg=0x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
#6  0x0000555555d0ee6b in vhost_user_get_config (dev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost-user.c:2133
#7  0x0000555555d56d46 in vhost_dev_get_config (hdev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost.c:1566
#8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
#9  0x0000555555d08f6d in virtio_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcff0) at ../hw/virtio/virtio.c:3660

The problem is that vhost_user_read_cb() still accesses dev->opaque even
though the device has been cleaned up meanwhile when the connection was
closed (the vhost_user_blk_disconnect() added by this patch), so it's
NULL now. This problem was actually mentioned in the comment that is
removed by this patch.

I tried to fix this by making vhost_user_read() cope with the fact that
the device might have been cleaned up meanwhile, but then I'm running
into the next set of problems.

The first is that retrying is pointless, the error condition is in the
configuration, it will never change.

The other is that after many repetitions of the same error message, I
got a crash where the device is cleaned up a second time in
vhost_dev_init() and the virtqueues are already NULL.

So it seems to me that erroring out during the initialisation phase
makes a lot more sense than retrying.

Kevin

>  hw/block/vhost-user-blk.c | 48 +++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 1af95ec6aae7..4e215f71f152 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -402,38 +402,38 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
>          break;
>      case CHR_EVENT_CLOSED:
>          /*
> -         * A close event may happen during a read/write, but vhost
> -         * code assumes the vhost_dev remains setup, so delay the
> -         * stop & clear. There are two possible paths to hit this
> -         * disconnect event:
> -         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
> -         * vhost_user_blk_device_realize() is a caller.
> -         * 2. In tha main loop phase after VM start.
> -         *
> -         * For p2 the disconnect event will be delayed. We can't
> -         * do the same for p1, because we are not running the loop
> -         * at this moment. So just skip this step and perform
> -         * disconnect in the caller function.
> -         *
> -         * TODO: maybe it is a good idea to make the same fix
> -         * for other vhost-user devices.
> +         * Closing the connection should happen differently on device
> +         * initialization and operation stages.
> +         * On initalization, we want to re-start vhost_dev initialization
> +         * from the very beginning right away when the connection is closed,
> +         * so we clean up vhost_dev on each connection closing.
> +         * On operation, we want to postpone vhost_dev cleanup to let the
> +         * other code perform its own cleanup sequence using vhost_dev data
> +         * (e.g. vhost_dev_set_log).
>           */
>          if (realized) {
> +            /*
> +             * A close event may happen during a read/write, but vhost
> +             * code assumes the vhost_dev remains setup, so delay the
> +             * stop & clear.
> +             */
>              AioContext *ctx = qemu_get_current_aio_context();
>  
>              qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
>                      NULL, NULL, false);
>              aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
> -        }
>  
> -        /*
> -         * Move vhost device to the stopped state. The vhost-user device
> -         * will be clean up and disconnected in BH. This can be useful in
> -         * the vhost migration code. If disconnect was caught there is an
> -         * option for the general vhost code to get the dev state without
> -         * knowing its type (in this case vhost-user).
> -         */
> -        s->dev.started = false;
> +            /*
> +             * Move vhost device to the stopped state. The vhost-user device
> +             * will be clean up and disconnected in BH. This can be useful in
> +             * the vhost migration code. If disconnect was caught there is an
> +             * option for the general vhost code to get the dev state without
> +             * knowing its type (in this case vhost-user).
> +             */
> +            s->dev.started = false;
> +        } else {
> +            vhost_user_blk_disconnect(dev);
> +        }
>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:
> -- 
> 2.25.1
> 


