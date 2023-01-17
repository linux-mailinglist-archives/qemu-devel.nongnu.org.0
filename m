Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B6666E1C3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:11:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHnbR-0001Ei-A6; Tue, 17 Jan 2023 10:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pHnbO-0001D8-O1
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pHnbL-0001fa-OO
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673968212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BUbqRH+Re7nW/hYsjw6Xie/de38OKoRyqk+qned7B0=;
 b=WoSY40S1Syj4brmOzbZeEc1+N1ZJoILwhwzXXWQRGi5kEBcemIRUnjNr84J+lSEnUPqFz7
 hNvL/s1bb93VdHRKrdVp+vxbLx+QJlnXQe2tOOBpdKN0tQHbIZpdAZYk/vjQ59ilvFY6ua
 grUSCNc1NzHu9Oydm+ixJiyn8AHzAH4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-5lkF5W8HOCuD3dK_d-iuDQ-1; Tue, 17 Jan 2023 10:09:53 -0500
X-MC-Unique: 5lkF5W8HOCuD3dK_d-iuDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 151D718A646F;
 Tue, 17 Jan 2023 15:07:04 +0000 (UTC)
Received: from [10.39.208.23] (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA5C2026D4B;
 Tue, 17 Jan 2023 15:07:01 +0000 (UTC)
Message-ID: <df4a0bb0-a43b-8729-8eae-b651112b36f2@redhat.com>
Date: Tue, 17 Jan 2023 16:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>
Cc: Yajun Wu <yajunw@nvidia.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Parav Pandit <parav@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-77-mst@redhat.com>
 <43145ede-89dc-280e-b953-6a2b436de395@redhat.com>
 <20230109054633-mutt-send-email-mst@kernel.org>
 <c0acea1d-7bae-120e-9422-82b0a5c432cf@redhat.com>
 <31f87c1d-9cce-6507-8e90-4d7942d7dc54@redhat.com>
 <DM4PR12MB51687AF2EAEC37929A7D3C4AB6C19@DM4PR12MB5168.namprd12.prod.outlook.com>
 <1cb334f0-d495-45f8-564e-4093746850d6@redhat.com>
 <20230117131257.231473d4@bahia> <20230117133645.78c5d8a8@bahia>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start
In-Reply-To: <20230117133645.78c5d8a8@bahia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/17/23 13:36, Greg Kurz wrote:
> On Tue, 17 Jan 2023 13:12:57 +0100
> Greg Kurz <groug@kaod.org> wrote:
> 
>> Hi Maxime,
>>
>> On Tue, 17 Jan 2023 10:49:37 +0100
>> Maxime Coquelin <maxime.coquelin@redhat.com> wrote:
>>
>>> Hi Yajun,
>>>
>>> On 1/16/23 08:14, Yajun Wu wrote:
>>>> Not quite sure about the whole picture.
>>>>
>>>> Seems while qemu waiting response of vhost_user_get_status, dpdk send out VHOST_USER_SLAVE_IOTLB_MSG and trigger qemu function vhost_backend_update_device_iotlb.
>>>> Qemu wait on reply of VHOST_USER_IOTLB_MSG but get VHOST_USER_GET_STATUS reply.
>>>
>>> Thanks for the backtrace, that helps a lot.
>>>
>>> The issue happens because:
>>>    1. Introduction of nested event loop in vhost_user_read() [0] features
>>> that enables handling slave channel request while waiting for reply on
>>> the masyer channel.
>>>    2. Slave VHOST_USER_SLAVE_IOTLB_MSG slave request handling ends-up
>>> sending a VHOST_USER_IOTLB_MSG on the master channel.
>>>
>>> So while waiting for VHOST_USER_IOTLB_MSG reply, it receives the reply
>>> for the first request sent on the master channel, here the
>>> VHOST_USER_GET_STATUS reply.
>>>
>>> I don't see an easy way to fix it.
>>>
>>> One option would be to have the slave channel being handled by another
>>> thread, and protect master channel with a lock to enforce the
>>> synchronization. But this may induce other issues, so that's not a light
>>> change.
>>>
>>
>> This is going to be tough because the back-end might have set the
>> VHOST_USER_NEED_REPLY_MASK flag on the VHOST_USER_SLAVE_IOTLB_MSG
>> request and thus might be waiting for a response on the slave
>> channel. In order to emit such a response, the front-end must
>> send VHOST_USER_SLAVE_IOTLB_MSG updates on the master channel *first*
>> according to the protocol specification. This means that we really
>> cannot handle VHOST_USER_SLAVE_IOTLB_MSG requests while there's
>> an on-going transaction on the master channel.

Since the slave channel would be handled on another thread, it means the
on-going transaction on the master channel can continue. Once done, it
will release the mutex, and the thread handling the slave channel can
take it send the IOTLB update on the master channel.

That would work with DPDK, which does not request reply-ack on IOTLB
misses.

For the DAX enablement case, my understanding is that the handling of
the slave requests by QEMU does not induce sending requests on the
master channel, so if I'm not mistaken, it should work too. The thread
handling the slave requests can send the reply on the slave channel,
while the thread handling the master channel is blocked waiting for the
GET_VRING_BASE reply. Is that correct?

>>
>>> (Adding Greg and Stefan, who worked on the nested event loop series.)
>>>
>>> Simply reverting nested event loop support may not be an option, since
>>> it would break virtiofsd, as if my understanding is correct, waits for
>>> some slave channel request to complete in order to complete a request
>>> made by QEMU on the master channel.
>>>
>>> Any thougths?
>>>
>>
>> Well... the nested even loop was added as preparatory work for "the
>> upcoming enablement of DAX with virtio-fs". This requires changes on
>> the QEMU side that haven't been merged yet. Technically, it seems that
>> reverting the nested event loop won't break anything in upstream QEMU
>> at this point (but this will bite again as soon as DAX enablement gets
>> merged).
>>
> 
> Cc'ing Dave to know about the DAX enablement status.
> 
>> AFAIK the event loop is only needed for the VHOST_USER_GET_VRING_BASE
>> message. Another possibility might be to create the nested event loop
>> in this case only : this would allow VHOST_USER_GET_STATUS to complete
>> before QEMU starts processing the VHOST_USER_SLAVE_IOTLB_MSG requests.
>>
>> Cheers,
>>
>> --
>> Greg
>>
>>> Maxime
>>>
>>> [0]:
>>> https://patchwork.ozlabs.org/project/qemu-devel/patch/20210312092212.782255-6-groug@kaod.org/
>>>
>>>
>>>> Break on first error message("Received unexpected msg type. Expected 22 received 40")
>>>>
>>>> #0  0x0000555555b72ed4 in process_message_reply (dev=0x5555584dd600, msg=0x7fffffffa330) at ../hw/virtio/vhost-user.c:445
>>>> #1  0x0000555555b77c26 in vhost_user_send_device_iotlb_msg (dev=0x5555584dd600, imsg=0x7fffffffa600) at ../hw/virtio/vhost-user.c:2341
>>>> #2  0x0000555555b7179e in vhost_backend_update_device_iotlb (dev=0x5555584dd600, iova=10442706944, uaddr=140736119902208, len=4096, perm=IOMMU_RW) at ../hw/virtio/vhost-backend.c:361
>>>> #3  0x0000555555b6e34c in vhost_device_iotlb_miss (dev=0x5555584dd600, iova=10442706944, write=1) at ../hw/virtio/vhost.c:1113
>>>> #4  0x0000555555b718d9 in vhost_backend_handle_iotlb_msg (dev=0x5555584dd600, imsg=0x7fffffffa7b0) at ../hw/virtio/vhost-backend.c:393
>>>> #5  0x0000555555b76144 in slave_read (ioc=0x555557a38680, condition=G_IO_IN, opaque=0x5555584dd600) at ../hw/virtio/vhost-user.c:1726
>>>> #6  0x0000555555c797a5 in qio_channel_fd_source_dispatch (source=0x555556a06fb0, callback=0x555555b75f86 <slave_read>, user_data=0x5555584dd600) at ../io/channel-watch.c:84
>>>> #7  0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>>> #8  0x00007ffff5548d18 in g_main_context_iterate.isra () at /lib64/libglib-2.0.so.0
>>>> #9  0x00007ffff5549042 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>>>> #10 0x0000555555b72de7 in vhost_user_read (dev=0x5555584dd600, msg=0x7fffffffac50) at ../hw/virtio/vhost-user.c:413
>>>> #11 0x0000555555b72e9b in process_message_reply (dev=0x5555584dd600, msg=0x7fffffffaf10) at ../hw/virtio/vhost-user.c:439
>>>> #12 0x0000555555b77c26 in vhost_user_send_device_iotlb_msg (dev=0x5555584dd600, imsg=0x7fffffffb1e0) at ../hw/virtio/vhost-user.c:2341
>>>> #13 0x0000555555b7179e in vhost_backend_update_device_iotlb (dev=0x5555584dd600, iova=10468392960, uaddr=140736145588224, len=4096, perm=IOMMU_RW) at ../hw/virtio/vhost-backend.c:361
>>>> #14 0x0000555555b6e34c in vhost_device_iotlb_miss (dev=0x5555584dd600, iova=10468392960, write=1) at ../hw/virtio/vhost.c:1113
>>>> #15 0x0000555555b718d9 in vhost_backend_handle_iotlb_msg (dev=0x5555584dd600, imsg=0x7fffffffb390) at ../hw/virtio/vhost-backend.c:393
>>>> #16 0x0000555555b76144 in slave_read (ioc=0x555557a38680, condition=G_IO_IN, opaque=0x5555584dd600) at ../hw/virtio/vhost-user.c:1726
>>>> #17 0x0000555555c797a5 in qio_channel_fd_source_dispatch (source=0x555556c70250, callback=0x555555b75f86 <slave_read>, user_data=0x5555584dd600) at ../io/channel-watch.c:84
>>>> #18 0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>>> #19 0x00007ffff5548d18 in g_main_context_iterate.isra () at /lib64/libglib-2.0.so.0
>>>> #20 0x00007ffff5549042 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>>>> #21 0x0000555555b72de7 in vhost_user_read (dev=0x5555584dd600, msg=0x7fffffffb830) at ../hw/virtio/vhost-user.c:413
>>>> #22 0x0000555555b72e9b in process_message_reply (dev=0x5555584dd600, msg=0x7fffffffbaf0) at ../hw/virtio/vhost-user.c:439
>>>> #23 0x0000555555b77c26 in vhost_user_send_device_iotlb_msg (dev=0x5555584dd600, imsg=0x7fffffffbdc0) at ../hw/virtio/vhost-user.c:2341
>>>> #24 0x0000555555b7179e in vhost_backend_update_device_iotlb (dev=0x5555584dd600, iova=10442702848, uaddr=140736119898112, len=4096, perm=IOMMU_RW) at ../hw/virtio/vhost-backend.c:361
>>>> #25 0x0000555555b6e34c in vhost_device_iotlb_miss (dev=0x5555584dd600, iova=10442702848, write=1) at ../hw/virtio/vhost.c:1113
>>>> #26 0x0000555555b718d9 in vhost_backend_handle_iotlb_msg (dev=0x5555584dd600, imsg=0x7fffffffbf70) at ../hw/virtio/vhost-backend.c:393
>>>> #27 0x0000555555b76144 in slave_read (ioc=0x555557a38680, condition=G_IO_IN, opaque=0x5555584dd600) at ../hw/virtio/vhost-user.c:1726
>>>> #28 0x0000555555c797a5 in qio_channel_fd_source_dispatch (source=0x555556f1a530, callback=0x555555b75f86 <slave_read>, user_data=0x5555584dd600) at ../io/channel-watch.c:84
>>>> #29 0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>>> #30 0x00007ffff5548d18 in g_main_context_iterate.isra () at /lib64/libglib-2.0.so.0
>>>> #31 0x00007ffff5549042 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>>>> #32 0x0000555555b72de7 in vhost_user_read (dev=0x5555584dd600, msg=0x7fffffffc420) at ../hw/virtio/vhost-user.c:413
>>>> #33 0x0000555555b754b1 in vhost_user_get_u64 (dev=0x5555584dd600, request=40, u64=0x7fffffffc6e0) at ../hw/virtio/vhost-user.c:1349
>>>> #34 0x0000555555b758ff in vhost_user_get_status (dev=0x5555584dd600, status=0x7fffffffc713 "W\020") at ../hw/virtio/vhost-user.c:1474
>>>> #35 0x0000555555b75967 in vhost_user_add_status (dev=0x5555584dd600, status=7 '\a') at ../hw/virtio/vhost-user.c:1488
>>>> #36 0x0000555555b78bf6 in vhost_user_dev_start (dev=0x5555584dd600, started=true) at ../hw/virtio/vhost-user.c:2758
>>>> #37 0x0000555555b709ad in vhost_dev_start (hdev=0x5555584dd600, vdev=0x555557b965d0, vrings=false) at ../hw/virtio/vhost.c:1988
>>>> #38 0x000055555584291c in vhost_net_start_one (net=0x5555584dd600, dev=0x555557b965d0) at ../hw/net/vhost_net.c:271
>>>> #39 0x0000555555842f1e in vhost_net_start (dev=0x555557b965d0, ncs=0x555557bc09e0, data_queue_pairs=1, cvq=0) at ../hw/net/vhost_net.c:412
>>>> #40 0x0000555555b1bf61 in virtio_net_vhost_status (n=0x555557b965d0, status=15 '\017') at ../hw/net/virtio-net.c:311
>>>> #41 0x0000555555b1c20c in virtio_net_set_status (vdev=0x555557b965d0, status=15 '\017') at ../hw/net/virtio-net.c:392
>>>> #42 0x0000555555b1ed04 in virtio_net_handle_mq (n=0x555557b965d0, cmd=0 '\000', iov=0x555556c7ef50, iov_cnt=1) at ../hw/net/virtio-net.c:1497
>>>> #43 0x0000555555b1eef0 in virtio_net_handle_ctrl_iov (vdev=0x555557b965d0, in_sg=0x555556a09880, in_num=1, out_sg=0x555556a09890, out_num=1) at ../hw/net/virtio-net.c:1534
>>>> #44 0x0000555555b1efe9 in virtio_net_handle_ctrl (vdev=0x555557b965d0, vq=0x7fffc04ac140) at ../hw/net/virtio-net.c:1557
>>>> #45 0x0000555555b63776 in virtio_queue_notify_vq (vq=0x7fffc04ac140) at ../hw/virtio/virtio.c:2249
>>>> #46 0x0000555555b669dc in virtio_queue_host_notifier_read (n=0x7fffc04ac1b4) at ../hw/virtio/virtio.c:3529
>>>> #47 0x0000555555e3f458 in aio_dispatch_handler (ctx=0x555556a016c0, node=0x7ffd8800e430) at ../util/aio-posix.c:369
>>>> #48 0x0000555555e3f613 in aio_dispatch_handlers (ctx=0x555556a016c0) at ../util/aio-posix.c:412
>>>> #49 0x0000555555e3f669 in aio_dispatch (ctx=0x555556a016c0) at ../util/aio-posix.c:422
>>>> #50 0x0000555555e585de in aio_ctx_dispatch (source=0x555556a016c0, callback=0x0, user_data=0x0) at ../util/async.c:321
>>>> #51 0x00007ffff554895d in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>>>> #52 0x0000555555e5abea in glib_pollfds_poll () at ../util/main-loop.c:295
>>>> #53 0x0000555555e5ac64 in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:318
>>>> #54 0x0000555555e5ad69 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:604
>>>> #55 0x00005555559693de in qemu_main_loop () at ../softmmu/runstate.c:731
>>>> #56 0x00005555556e7c06 in qemu_default_main () at ../softmmu/main.c:37
>>>> #57 0x00005555556e7c3c in main (argc=71, argv=0x7fffffffcda8) at ../softmmu/main.c:48
>>>>
>>>>
>>>>
>>>> -----Original Message-----
>>>> From: Maxime Coquelin <maxime.coquelin@redhat.com>
>>>> Sent: Thursday, January 12, 2023 5:26 PM
>>>> To: Laurent Vivier <lvivier@redhat.com>
>>>> Cc: qemu-devel@nongnu.org; Peter Maydell <peter.maydell@linaro.org>; Yajun Wu <yajunw@nvidia.com>; Parav Pandit <parav@nvidia.com>; Michael S. Tsirkin <mst@redhat.com>
>>>> Subject: Re: [PULL v4 76/83] vhost-user: Support vhost_dev_start
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> Hi Laurent,
>>>>
>>>> On 1/11/23 10:50, Laurent Vivier wrote:
>>>>> On 1/9/23 11:55, Michael S. Tsirkin wrote:
>>>>>> On Fri, Jan 06, 2023 at 03:21:43PM +0100, Laurent Vivier wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> it seems this patch breaks vhost-user with DPDK.
>>>>>>>
>>>>>>> See
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbu
>>>>>>> gzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D2155173&data=05%7C01%7Cyajun
>>>>>>> w%40nvidia.com%7C47e6e0fabd044383fd3308daf47f0253%7C43083d15727340c1
>>>>>>> b7db39efd9ccc17a%7C0%7C0%7C638091123577559319%7CUnknown%7CTWFpbGZsb3
>>>>>>> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D
>>>>>>> %7C3000%7C%7C%7C&sdata=1pjChYTKHVmBoempNitiZHBdrlPIMFjKoD6FeOVSay0%3
>>>>>>> D&reserved=0
>>>>>>>
>>>>>>> it seems QEMU doesn't receive the expected commands sequence:
>>>>>>>
>>>>>>> Received unexpected msg type. Expected 22 received 40 Fail to update
>>>>>>> device iotlb Received unexpected msg type. Expected 40 received 22
>>>>>>> Received unexpected msg type. Expected 22 received 11 Fail to update
>>>>>>> device iotlb Received unexpected msg type. Expected 11 received 22
>>>>>>> vhost VQ 1 ring restore failed: -71: Protocol error (71) Received
>>>>>>> unexpected msg type. Expected 22 received 11 Fail to update device
>>>>>>> iotlb Received unexpected msg type. Expected 11 received 22 vhost VQ
>>>>>>> 0 ring restore failed: -71: Protocol error (71) unable to start
>>>>>>> vhost net: 71: falling back on userspace virtio
>>>>>>>
>>>>>>> It receives VHOST_USER_GET_STATUS (40) when it expects
>>>>>>> VHOST_USER_IOTLB_MSG (22) and VHOST_USER_IOTLB_MSG when it expects
>>>>>>> VHOST_USER_GET_STATUS.
>>>>>>> and VHOST_USER_GET_VRING_BASE (11) when it expect
>>>>>>> VHOST_USER_GET_STATUS and so on.
>>>>>>>
>>>>>>> Any idea?
>>>>
>>>> We only have a single thread on DPDK side to handle Vhost-user requests, it will read a request, handle it and reply to it. Then it reads the next one, etc... So I don't think it is possible to mix request replies order on DPDK side.
>>>>
>>>> Maybe there are two threads concurrently sending requests on QEMU side?
>>>>
>>>> Regards,
>>>> Maxime
>>>>
>>>>>>> Thanks,
>>>>>>> Laurent
>>>>>>
>>>>>>
>>>>>> So I am guessing it's coming from:
>>>>>>
>>>>>>        if (msg.hdr.request != request) {
>>>>>>            error_report("Received unexpected msg type. Expected %d
>>>>>> received %d",
>>>>>>                         request, msg.hdr.request);
>>>>>>            return -EPROTO;
>>>>>>        }
>>>>>>
>>>>>> in process_message_reply and/or in vhost_user_get_u64.
>>>>>>
>>>>>>
>>>>>>> On 11/7/22 23:53, Michael S. Tsirkin wrote:
>>>>>>>> From: Yajun Wu <yajunw@nvidia.com>
>>>>>>>>
>>>>>>>> The motivation of adding vhost-user vhost_dev_start support is to
>>>>>>>> improve backend configuration speed and reduce live migration VM
>>>>>>>> downtime.
>>>>>>>>
>>>>>>>> Today VQ configuration is issued one by one. For virtio net with
>>>>>>>> multi-queue support, backend needs to update RSS (Receive side
>>>>>>>> scaling) on every rx queue enable. Updating RSS is time-consuming
>>>>>>>> (typical time like 7ms).
>>>>>>>>
>>>>>>>> Implement already defined vhost status and message in the vhost
>>>>>>>> specification [1].
>>>>>>>> (a) VHOST_USER_PROTOCOL_F_STATUS
>>>>>>>> (b) VHOST_USER_SET_STATUS
>>>>>>>> (c) VHOST_USER_GET_STATUS
>>>>>>>>
>>>>>>>> Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK
>>>>>>>> for device start and reset(0) for device stop.
>>>>>>>>
>>>>>>>> On reception of the DRIVER_OK message, backend can apply the needed
>>>>>>>> setting only once (instead of incremental) and also utilize
>>>>>>>> parallelism on enabling queues.
>>>>>>>>
>>>>>>>> This improves QEMU's live migration downtime with vhost user
>>>>>>>> backend implementation by great margin, specially for the large
>>>>>>>> number of VQs of 64 from 800 msec to 250 msec.
>>>>>>>>
>>>>>>>> [1]
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fq
>>>>>>>> emu-project.gitlab.io%2Fqemu%2Finterop%2Fvhost-user.html&data=05%7C
>>>>>>>> 01%7Cyajunw%40nvidia.com%7C47e6e0fabd044383fd3308daf47f0253%7C43083
>>>>>>>> d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638091123577559319%7CUnknown%
>>>>>>>> 7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
>>>>>>>> CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=YPbrFRJA92KLLwADMUDvwBt%2Fme2Ef
>>>>>>>> GZuVANOmXH5pic%3D&reserved=0
>>>>>>>>
>>>>>>>> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>>>>>>>> Acked-by: Parav Pandit <parav@nvidia.com>
>>>>>>>> Message-Id: <20221017064452.1226514-3-yajunw@nvidia.com>
>>>>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>>
>>>>>> Probably easiest to debug from dpdk side.
>>>>>> Does the problem go away if you disable the feature
>>>>>> VHOST_USER_PROTOCOL_F_STATUS in dpdk?
>>>>>
>>>>> Maxime could you help to debug this?
>>>>>
>>>>> Thanks,
>>>>> Laurent
>>>>>
>>>>
>>>
>>
>>
> 
> 


