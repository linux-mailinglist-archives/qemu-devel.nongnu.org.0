Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AF1D0535
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 05:02:38 +0200 (CEST)
Received: from localhost ([::1]:45660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYhfJ-0006wZ-Go
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 23:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jYhe4-0006OH-3e
 for qemu-devel@nongnu.org; Tue, 12 May 2020 23:01:20 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58169
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jYhe1-0003ZG-Kk
 for qemu-devel@nongnu.org; Tue, 12 May 2020 23:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589338876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzqXph4n2vuI/a2SZraZy+JPwSx2S1F8nLi2CRSRKgw=;
 b=GTZO2+Ic/zJDD71Vf6b6mDuJlWF6Qa01kzP8mLpzQ8grrDfHSZBMiZ1RHjz5vrNpvMe2jc
 FZKwvgRgqBdmaLbjuOYt/8mg/gK681G4PHNVoFsnJwS92P8iGeaDn+yEB/FGkwreIXzdCx
 R+ccZmzMkeG9tcsc/cXBnFIx3cGZsZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-rUO6LKx4Py6jd3Y3Up8kAg-1; Tue, 12 May 2020 23:01:14 -0400
X-MC-Unique: rUO6LKx4Py6jd3Y3Up8kAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 700F1184193C;
 Wed, 13 May 2020 03:01:12 +0000 (UTC)
Received: from [10.72.13.188] (ovpn-13-188.pek2.redhat.com [10.72.13.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CEDC783B3;
 Wed, 13 May 2020 03:00:40 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] vhost: check vring address before calling unmap
To: Dima Stepanov <dimastep@yandex-team.ru>
References: <cover.1588252861.git.dimastep@yandex-team.ru>
 <2d4952df2cc246f7421b4b9023a581b22210fc41.1588252862.git.dimastep@yandex-team.ru>
 <4a03e4aa-3a21-d678-be98-13268343b674@redhat.com>
 <20200511091117.GB27319@dimastep-nix>
 <aea84690-3809-bf8f-a918-08fc74394a19@redhat.com>
 <20200512090803.GA4983@dimastep-nix>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <561037cb-763f-53fe-6b2c-9e1b90893175@redhat.com>
Date: Wed, 13 May 2020 11:00:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512090803.GA4983@dimastep-nix>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 21:16:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, kwolf@redhat.com, yc-core@yandex-team.ru,
 qemu-block@nongnu.org, mst@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, arei.gonglei@huawei.com, raphael.norwitz@nutanix.com,
 fengli@smartx.com, stefanha@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/5/12 下午5:08, Dima Stepanov wrote:
> On Tue, May 12, 2020 at 11:26:11AM +0800, Jason Wang wrote:
>> On 2020/5/11 下午5:11, Dima Stepanov wrote:
>>> On Mon, May 11, 2020 at 11:05:58AM +0800, Jason Wang wrote:
>>>> On 2020/4/30 下午9:36, Dima Stepanov wrote:
>>>>> Since disconnect can happen at any time during initialization not all
>>>>> vring buffers (for instance used vring) can be intialized successfully.
>>>>> If the buffer was not initialized then vhost_memory_unmap call will lead
>>>>> to SIGSEGV. Add checks for the vring address value before calling unmap.
>>>>> Also add assert() in the vhost_memory_unmap() routine.
>>>>>
>>>>> Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
>>>>> ---
>>>>>   hw/virtio/vhost.c | 27 +++++++++++++++++++++------
>>>>>   1 file changed, 21 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>>>>> index ddbdc53..3ee50c4 100644
>>>>> --- a/hw/virtio/vhost.c
>>>>> +++ b/hw/virtio/vhost.c
>>>>> @@ -314,6 +314,8 @@ static void vhost_memory_unmap(struct vhost_dev *dev, void *buffer,
>>>>>                                  hwaddr len, int is_write,
>>>>>                                  hwaddr access_len)
>>>>>   {
>>>>> +    assert(buffer);
>>>>> +
>>>>>       if (!vhost_dev_has_iommu(dev)) {
>>>>>           cpu_physical_memory_unmap(buffer, len, is_write, access_len);
>>>>>       }
>>>>> @@ -1132,12 +1134,25 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
>>>>>                                                   vhost_vq_index);
>>>>>       }
>>>>> -    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
>>>>> -                       1, virtio_queue_get_used_size(vdev, idx));
>>>>> -    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
>>>>> -                       0, virtio_queue_get_avail_size(vdev, idx));
>>>>> -    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
>>>>> -                       0, virtio_queue_get_desc_size(vdev, idx));
>>>>> +    /*
>>>>> +     * Since the vhost-user disconnect can happen during initialization
>>>>> +     * check if vring was initialized, before making unmap.
>>>>> +     */
>>>>> +    if (vq->used) {
>>>>> +        vhost_memory_unmap(dev, vq->used,
>>>>> +                           virtio_queue_get_used_size(vdev, idx),
>>>>> +                           1, virtio_queue_get_used_size(vdev, idx));
>>>>> +    }
>>>>> +    if (vq->avail) {
>>>>> +        vhost_memory_unmap(dev, vq->avail,
>>>>> +                           virtio_queue_get_avail_size(vdev, idx),
>>>>> +                           0, virtio_queue_get_avail_size(vdev, idx));
>>>>> +    }
>>>>> +    if (vq->desc) {
>>>>> +        vhost_memory_unmap(dev, vq->desc,
>>>>> +                           virtio_queue_get_desc_size(vdev, idx),
>>>>> +                           0, virtio_queue_get_desc_size(vdev, idx));
>>>>> +    }
>>>> Any reason not checking hdev->started instead? vhost_dev_start() will set it
>>>> to true if virtqueues were correctly mapped.
>>>>
>>>> Thanks
>>> Well i see it a little bit different:
>>>   - vhost_dev_start() sets hdev->started to true before starting
>>>     virtqueues
>>>   - vhost_virtqueue_start() maps all the memory
>>> If we hit the vhost disconnect at the start of the
>>> vhost_virtqueue_start(), for instance for this call:
>>>    r = dev->vhost_ops->vhost_set_vring_base(dev, &state);
>>> Then we will call vhost_user_blk_disconnect:
>>>    vhost_user_blk_disconnect()->
>>>      vhost_user_blk_stop()->
>>>        vhost_dev_stop()->
>>>          vhost_virtqueue_stop()
>>> As a result we will come in this routine with the hdev->started still
>>> set to true, but if used/avail/desc fields still uninitialized and set
>>> to 0.
>>
>> I may miss something, but consider both vhost_dev_start() and
>> vhost_user_blk_disconnect() were serialized in main loop. Can this really
>> happen?
> Yes, consider the case when we start the vhost-user-blk device:
>    vhost_dev_start->
>      vhost_virtqueue_start
> And we got a disconnect in the middle of vhost_virtqueue_start()
> routine, for instance:
>    1000     vq->num = state.num = virtio_queue_get_num(vdev, idx);
>    1001     r = dev->vhost_ops->vhost_set_vring_num(dev, &state);
>    1002     if (r) {
>    1003         VHOST_OPS_DEBUG("vhost_set_vring_num failed");
>    1004         return -errno;
>    1005     }
>    --> Here we got a disconnect <--
>    1006
>    1007     state.num = virtio_queue_get_last_avail_idx(vdev, idx);
>    1008     r = dev->vhost_ops->vhost_set_vring_base(dev, &state);
>    1009     if (r) {
>    1010         VHOST_OPS_DEBUG("vhost_set_vring_base failed");
>    1011         return -errno;
>    1012     }
> As a result call to vhost_set_vring_base will call the disconnect
> routine. The backtrace log for SIGSEGV is as follows:
>    Thread 4 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>    [Switching to Thread 0x7ffff2ea9700 (LWP 183150)]
>    0x00007ffff4d60840 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>    (gdb) bt
>    #0  0x00007ffff4d60840 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>    #1  0x000055555590fd90 in flatview_write_continue (fv=0x7fffec4a2600,
>        addr=0, attrs=..., ptr=0x0, len=1028, addr1=0,
>        l=1028, mr=0x555556b1b310) at ./exec.c:3142
>    #2  0x000055555590fe98 in flatview_write (fv=0x7fffec4a2600, addr=0,
>        attrs=..., buf=0x0, len=1028) at ./exec.c:3177
>    #3  0x00005555559101ed in address_space_write (as=0x555556893940
>        <address_space_memory>, addr=0, attrs=..., buf=0x0,
>        len=1028) at ./exec.c:3268
>    #4  0x0000555555910caf in address_space_unmap (as=0x555556893940
>        <address_space_memory>, buffer=0x0, len=1028,
>        is_write=true, access_len=1028) at ./exec.c:3592
>    #5  0x0000555555910d82 in cpu_physical_memory_unmap (buffer=0x0,
>        len=1028, is_write=true, access_len=1028) at ./exec.c:3613
>    #6  0x0000555555a16fa1 in vhost_memory_unmap (dev=0x7ffff22723e8,
>        buffer=0x0, len=1028, is_write=1, access_len=1028)
>        at ./hw/virtio/vhost.c:318
>    #7  0x0000555555a192a2 in vhost_virtqueue_stop (dev=0x7ffff22723e8,
>        vdev=0x7ffff22721a0, vq=0x55555770abf0, idx=0) at ./hw/virtio/vhost.c:1136
>    #8  0x0000555555a1acc0 in vhost_dev_stop (hdev=0x7ffff22723e8,
>        vdev=0x7ffff22721a0) at ./hw/virtio/vhost.c:1702
>    #9  0x00005555559b6532 in vhost_user_blk_stop (vdev=0x7ffff22721a0)
>        at ./hw/block/vhost-user-blk.c:196
>    #10 0x00005555559b6b73 in vhost_user_blk_disconnect (dev=0x7ffff22721a0)
>        at ./hw/block/vhost-user-blk.c:365
>    #11 0x00005555559b6c4f in vhost_user_blk_event (opaque=0x7ffff22721a0,
>        event=CHR_EVENT_CLOSED) at ./hw/block/vhost-user-blk.c:384
>    #12 0x0000555555e65f7e in chr_be_event (s=0x555556b182e0, event=CHR_EVENT_CLOSED)
>        at chardev/char.c:60
>    #13 0x0000555555e6601a in qemu_chr_be_event (s=0x555556b182e0,
>        event=CHR_EVENT_CLOSED) at chardev/char.c:80
>    #14 0x0000555555e6eef3 in tcp_chr_disconnect_locked (chr=0x555556b182e0)
>        at chardev/char-socket.c:488
>    #15 0x0000555555e6e23f in tcp_chr_write (chr=0x555556b182e0,
>        buf=0x7ffff2ea8220 "\n", len=20) at chardev/char-socket.c:178
>    #16 0x0000555555e6616c in qemu_chr_write_buffer (s=0x555556b182e0,
>        buf=0x7ffff2ea8220 "\n", len=20, offset=0x7ffff2ea8150, write_all=true)
>        at chardev/char.c:120
>    #17 0x0000555555e662d9 in qemu_chr_write (s=0x555556b182e0, buf=0x7ffff2ea8220 "\n",
>        len=20, write_all=true) at chardev/char.c:155
>    #18 0x0000555555e693cc in qemu_chr_fe_write_all (be=0x7ffff2272360,
>        buf=0x7ffff2ea8220 "\n", len=20) at chardev/char-fe.c:53
>    #19 0x0000555555a1c489 in vhost_user_write (dev=0x7ffff22723e8,
>        msg=0x7ffff2ea8220, fds=0x0, fd_num=0) at ./hw/virtio/vhost-user.c:350
>    #20 0x0000555555a1d325 in vhost_set_vring (dev=0x7ffff22723e8,
>        request=10, ring=0x7ffff2ea8520) at ./hw/virtio/vhost-user.c:660
>    #21 0x0000555555a1d4c6 in vhost_user_set_vring_base (dev=0x7ffff22723e8,
>        ring=0x7ffff2ea8520) at ./hw/virtio/vhost-user.c:704
>    #22 0x0000555555a18c1b in vhost_virtqueue_start (dev=0x7ffff22723e8,
>        vdev=0x7ffff22721a0, vq=0x55555770abf0, idx=0) at ./hw/virtio/vhost.c:1009
>    #23 0x0000555555a1a9f5 in vhost_dev_start (hdev=0x7ffff22723e8, vdev=0x7ffff22721a0)
>        at ./hw/virtio/vhost.c:1639
>    #24 0x00005555559b6367 in vhost_user_blk_start (vdev=0x7ffff22721a0)
>        at ./hw/block/vhost-user-blk.c:150
>    #25 0x00005555559b6653 in vhost_user_blk_set_status (vdev=0x7ffff22721a0, status=15 '\017')
>        at ./hw/block/vhost-user-blk.c:233
>    #26 0x0000555555a1072d in virtio_set_status (vdev=0x7ffff22721a0, val=15 '\017')
>        at ./hw/virtio/virtio.c:1956
> ---Type <return> to continue, or q <return> to quit---
>
> So while we inside vhost_user_blk_start() (frame#24) we are calling
> vhost_user_blk_disconnect() (frame#10). And for this call the
> dev->started field will be set to true.
>    (gdb) frame 8
>    #8  0x0000555555a1acc0 in vhost_dev_stop (hdev=0x7ffff22723e8, vdev=0x7ffff22721a0)
>        at ./hw/virtio/vhost.c:1702
>    1702            vhost_virtqueue_stop(hdev,
>    (gdb) p hdev->started
>    $1 = true
>
> It isn't an easy race to reproduce: to hit a disconnect at this window.
> We were able to hit it during long testing on one of the reconnect
> iteration. After it we were able to reproduce it with 100% by adding a
> sleep() call inside qemu to make the race window bigger.


Thanks for the patience.

I miss the fact that the disconnection routine could be triggered from 
chardev write.

But the codes turns out to be very tricky and hard to debug since the 
code was wrote to deal with the error returned from vhost_ops directly, 
it doesn't expect vhost_dev_cleanup() was call silently for each 
vhost_user_write(). It would introduce troubles if we want to add new 
codes/operations to vhost.

More questions:

- Do we need to have some checking against hdev->started in each vhost 
user ops?
- Do we need to reset vq->avail/vq->desc/vq->used in vhost_dev_stop()?

Thanks


>
>> Thanks
>>
>>
>>>>>   }
>>>>>   static void vhost_eventfd_add(MemoryListener *listener,


