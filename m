Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7343367BC0
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 10:10:46 +0200 (CEST)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZUQ9-0008Iq-AP
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 04:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lZUOq-0007gi-FG; Thu, 22 Apr 2021 04:09:24 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:48224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lZUOl-0003GE-9e; Thu, 22 Apr 2021 04:09:22 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id C72942E16EF;
 Thu, 22 Apr 2021 11:09:14 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Z5cAMYDhSE-9D1qsO0U; Thu, 22 Apr 2021 11:09:14 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619078954; bh=pDIaIuVHZUBBi+OJKk0jiG6likcDba6lZ2TaMctOT3w=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=uIZezTXbarueGMm/KpPUHjRam4RsLi15bSRClEBUJfHlY1NTbtzhaZ4XgxMSNd3F6
 Ka80Je6aj3kplHdENvWG4+kaIaYZhRgemrbdGg2MaRjKCsgocZwlwjzgyfooFcDKX0
 SGz1BrBadUII/BIGz/1s3Ba/naeNYZLO3PEOMEjk=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8802::1:6])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 B2MypYRCO7-9DpSAsM2; Thu, 22 Apr 2021 11:09:13 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v3 2/3] vhost-user-blk: perform immediate cleanup if
 disconnect on initialization
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210325151217.262793-1-den-plotnikov@yandex-team.ru>
 <20210325151217.262793-3-den-plotnikov@yandex-team.ru>
 <YIBDlEQ0AlRc9r0y@merkur.fritz.box>
 <88b9912e-97d3-f18a-b3cc-7891f3c55e3a@yandex-team.ru>
 <20210421155929-mutt-send-email-mst@kernel.org>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <2d86da71-2392-7740-dd8b-5890e1b76ed7@yandex-team.ru>
Date: Thu, 22 Apr 2021 11:09:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210421155929-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, yc-core@yandex-team.ru, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21.04.2021 22:59, Michael S. Tsirkin wrote:
> On Wed, Apr 21, 2021 at 07:13:24PM +0300, Denis Plotnikov wrote:
>> On 21.04.2021 18:24, Kevin Wolf wrote:
>>> Am 25.03.2021 um 16:12 hat Denis Plotnikov geschrieben:
>>>> Commit 4bcad76f4c39 ("vhost-user-blk: delay vhost_user_blk_disconnect")
>>>> introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
>>>> because of connection problems with vhost-blk daemon.
>>>>
>>>> However, it introdues a new problem. Now, any communication errors
>>>> during execution of vhost_dev_init() called by vhost_user_blk_device_realize()
>>>> lead to qemu abort on assert in vhost_dev_get_config().
>>>>
>>>> This happens because vhost_user_blk_disconnect() is postponed but
>>>> it should have dropped s->connected flag by the time
>>>> vhost_user_blk_device_realize() performs a new connection opening.
>>>> On the connection opening, vhost_dev initialization in
>>>> vhost_user_blk_connect() relies on s->connection flag and
>>>> if it's not dropped, it skips vhost_dev initialization and returns
>>>> with success. Then, vhost_user_blk_device_realize()'s execution flow
>>>> goes to vhost_dev_get_config() where it's aborted on the assert.
>>>>
>>>> To fix the problem this patch adds immediate cleanup on device
>>>> initialization(in vhost_user_blk_device_realize()) using different
>>>> event handlers for initialization and operation introduced in the
>>>> previous patch.
>>>> On initialization (in vhost_user_blk_device_realize()) we fully
>>>> control the initialization process. At that point, nobody can use the
>>>> device since it isn't initialized and we don't need to postpone any
>>>> cleanups, so we can do cleaup right away when there is a communication
>>>> problem with the vhost-blk daemon.
>>>> On operation we leave it as is, since the disconnect may happen when
>>>> the device is in use, so the device users may want to use vhost_dev's data
>>>> to do rollback before vhost_dev is re-initialized (e.g. in vhost_dev_set_log()).
>>>>
>>>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
>>>> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>>> I think there is something wrong with this patch.
>>>
>>> I'm debugging an error case, specifically num-queues being larger in
>>> QEMU that in the vhost-user-blk export. Before this patch, it has just
>>> an unfriendly error message:
>>>
>>> qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: Unexpected end-of-file before all data were read
>>> qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: Failed to read msg header. Read 0 instead of 12. Original request 24.
>>> qemu-system-x86_64: -device vhost-user-blk-pci,chardev=vhost1,id=blk1,iommu_platform=off,disable-legacy=on,num-queues=4: vhost-user-blk: get block config failed
>>> qemu-system-x86_64: Failed to set msg fds.
>>> qemu-system-x86_64: vhost VQ 0 ring restore failed: -1: Resource temporarily unavailable (11)
>>>
>>> After the patch, it crashes:
>>>
>>> #0  0x0000555555d0a4bd in vhost_user_read_cb (source=0x5555568f4690, condition=(G_IO_IN | G_IO_HUP), opaque=0x7fffffffcbf0) at ../hw/virtio/vhost-user.c:313
>>> #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=0x555557c3f750, callback=0x555555d0a478 <vhost_user_read_cb>, user_data=0x7fffffffcbf0) at ../io/channel-watch.c:84
>>> #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>> #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/libglib-2.0.so.0
>>> #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>>> #5  0x0000555555d0a724 in vhost_user_read (dev=0x555557bc62f8, msg=0x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
>>> #6  0x0000555555d0ee6b in vhost_user_get_config (dev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost-user.c:2133
>>> #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost.c:1566
>>> #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
>>> #9  0x0000555555d08f6d in virtio_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
>>>
>>> The problem is that vhost_user_read_cb() still accesses dev->opaque even
>>> though the device has been cleaned up meanwhile when the connection was
>>> closed (the vhost_user_blk_disconnect() added by this patch), so it's
>>> NULL now. This problem was actually mentioned in the comment that is
>>> removed by this patch.
>>>
>>> I tried to fix this by making vhost_user_read() cope with the fact that
>>> the device might have been cleaned up meanwhile, but then I'm running
>>> into the next set of problems.
>>>
>>> The first is that retrying is pointless, the error condition is in the
>>> configuration, it will never change.
>>>
>>> The other is that after many repetitions of the same error message, I
>>> got a crash where the device is cleaned up a second time in
>>> vhost_dev_init() and the virtqueues are already NULL.
>>>
>>> So it seems to me that erroring out during the initialisation phase
>>> makes a lot more sense than retrying.
>>>
>>> Kevin
>> But without the patch there will be another problem which the patch actually
>> addresses.
>>
>> It seems to me that there is a case when the retrying is useless and this is
>> exactly your case -- we'll never get a proper configuration.
>>
>> What if we get rid of the re-connection and give the only try to realize the
>> device? Than we don't need case separating for initialization and operation
>> of device, correct? But I don't familiar with the cases where the reconnect
>> is needed? Do you know something it?
> Reconnect is for when server is restarted while we are talking to it.

Can we eliminate reconnect on vhost-user-blk device initialization?

In addition to Kevin's case, I saw an inconvenient behavior when qmp 
add_device command hangs untill it manages to connect to server properly.

Denis

>
>> Denis
>>
>>>>    hw/block/vhost-user-blk.c | 48 +++++++++++++++++++--------------------
>>>>    1 file changed, 24 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>>>> index 1af95ec6aae7..4e215f71f152 100644
>>>> --- a/hw/block/vhost-user-blk.c
>>>> +++ b/hw/block/vhost-user-blk.c
>>>> @@ -402,38 +402,38 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
>>>>            break;
>>>>        case CHR_EVENT_CLOSED:
>>>>            /*
>>>> -         * A close event may happen during a read/write, but vhost
>>>> -         * code assumes the vhost_dev remains setup, so delay the
>>>> -         * stop & clear. There are two possible paths to hit this
>>>> -         * disconnect event:
>>>> -         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
>>>> -         * vhost_user_blk_device_realize() is a caller.
>>>> -         * 2. In tha main loop phase after VM start.
>>>> -         *
>>>> -         * For p2 the disconnect event will be delayed. We can't
>>>> -         * do the same for p1, because we are not running the loop
>>>> -         * at this moment. So just skip this step and perform
>>>> -         * disconnect in the caller function.
>>>> -         *
>>>> -         * TODO: maybe it is a good idea to make the same fix
>>>> -         * for other vhost-user devices.
>>>> +         * Closing the connection should happen differently on device
>>>> +         * initialization and operation stages.
>>>> +         * On initalization, we want to re-start vhost_dev initialization
>>>> +         * from the very beginning right away when the connection is closed,
>>>> +         * so we clean up vhost_dev on each connection closing.
>>>> +         * On operation, we want to postpone vhost_dev cleanup to let the
>>>> +         * other code perform its own cleanup sequence using vhost_dev data
>>>> +         * (e.g. vhost_dev_set_log).
>>>>             */
>>>>            if (realized) {
>>>> +            /*
>>>> +             * A close event may happen during a read/write, but vhost
>>>> +             * code assumes the vhost_dev remains setup, so delay the
>>>> +             * stop & clear.
>>>> +             */
>>>>                AioContext *ctx = qemu_get_current_aio_context();
>>>>                qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
>>>>                        NULL, NULL, false);
>>>>                aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
>>>> -        }
>>>> -        /*
>>>> -         * Move vhost device to the stopped state. The vhost-user device
>>>> -         * will be clean up and disconnected in BH. This can be useful in
>>>> -         * the vhost migration code. If disconnect was caught there is an
>>>> -         * option for the general vhost code to get the dev state without
>>>> -         * knowing its type (in this case vhost-user).
>>>> -         */
>>>> -        s->dev.started = false;
>>>> +            /*
>>>> +             * Move vhost device to the stopped state. The vhost-user device
>>>> +             * will be clean up and disconnected in BH. This can be useful in
>>>> +             * the vhost migration code. If disconnect was caught there is an
>>>> +             * option for the general vhost code to get the dev state without
>>>> +             * knowing its type (in this case vhost-user).
>>>> +             */
>>>> +            s->dev.started = false;
>>>> +        } else {
>>>> +            vhost_user_blk_disconnect(dev);
>>>> +        }
>>>>            break;
>>>>        case CHR_EVENT_BREAK:
>>>>        case CHR_EVENT_MUX_IN:
>>>> -- 
>>>> 2.25.1
>>>>

