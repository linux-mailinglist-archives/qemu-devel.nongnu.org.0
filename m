Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60041579462
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:40:55 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhqg-0003Kz-HC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDhon-0001rX-BQ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDhoj-0008Ax-Um
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658216331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIqtdgQysNDZiza0add+vnwamMX8iuTMyvT0q7Gp/Ss=;
 b=G7UK4fUAIeesHGkSloMYhvSaIWb8EXAvNY2s9THfvTAEtWshvUKv4VMdNw6IhQMZ+R1K5f
 f6509IKQObuHaX8nEpDogzHE8z1mqQm6Sw8g/j1xQx7OhVKiwH07yUdOlxl5LDS+7bSNyF
 MOpSnHuVMM/PIwt7FtjVwCJgL+0/TXU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-anYKgj1YPyuHELqATtbngg-1; Tue, 19 Jul 2022 03:38:50 -0400
X-MC-Unique: anYKgj1YPyuHELqATtbngg-1
Received: by mail-pj1-f71.google.com with SMTP id
 i15-20020a17090a2a0f00b001ef826b921dso8404759pjd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nIqtdgQysNDZiza0add+vnwamMX8iuTMyvT0q7Gp/Ss=;
 b=TOQAptwNlgCg7UzuZncqLaAtfPCQQ+m07FWKZs/I1hDrY2/rPIqfRbrORQYW7u50Uo
 7Iy9FKGuBIesHES72OWiRP7DDgHwtNXBbgVeL0ql1TW/IHtrifbaKaeGOkmIr3L4SBFf
 RyVrbt1fm1AHQRM4Rg97KYF5OWqO67rX7qZpluMDwaVw/fpeafTv54sp7LmoNxqAPvil
 4hCr4GmT5Z5N9My8EWFUiwFQEdKtnjnMBaipzHE74xBT6YBCbsGzNq36QKebgkVUyNPi
 pyVIsJPoITW6Bet06iWj8ouagbIwEriX8TpteXua+CMHZRFQdndjM6OYl5vsHdxQ7enu
 6n/Q==
X-Gm-Message-State: AJIora+nudMKac0s+XNtwXeiyFKbNoNTr+pCxj9twU+sJfxlaL88pr83
 nKuZxFLj0HmRsX8WNrXGxQASVa1ybmilREzVa3+qYGlXiz3tasAqdbdCd8j7WiHhhdvBUlUcVjX
 MJsTnX6UV20nyHkU=
X-Received: by 2002:a65:6056:0:b0:419:78b3:e612 with SMTP id
 a22-20020a656056000000b0041978b3e612mr28603646pgp.252.1658216327956; 
 Tue, 19 Jul 2022 00:38:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1us8oe3f7pJC/9vtOv387o/oANkAZIpFjCx2VaxmqFfNIqvH5H84q1B4FJRvdn8BlJMVUTtlw==
X-Received: by 2002:a65:6056:0:b0:419:78b3:e612 with SMTP id
 a22-20020a656056000000b0041978b3e612mr28603613pgp.252.1658216327639; 
 Tue, 19 Jul 2022 00:38:47 -0700 (PDT)
Received: from [10.72.13.162] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a170902ed8200b0016c16648213sm10864788plj.20.2022.07.19.00.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:38:47 -0700 (PDT)
Message-ID: <c5ee2d97-a86a-9f98-c45a-940b720f601a@redhat.com>
Date: Tue, 19 Jul 2022 15:38:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 12/19] vhost: add vhost_svq_poll
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong
 <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-13-eperezma@redhat.com>
 <CACGkMEuHR_R6Jxjvznv1T-d6SGngsYQyfhCNw8-HoTb3FLcX0w@mail.gmail.com>
 <CAJaqyWfwODXUr_z3Qzp7_MSbEamG0W8MxUtxn1kV-NE_qfBi-A@mail.gmail.com>
 <CACGkMEvfPDMK+7jg+r5hunxA+EXuN9V_d_KZfkCfufe-ONbXFQ@mail.gmail.com>
 <CAJaqyWdf-VQxP4rYasSzdq3yaYLPw1_G6J=Kqq5SXXWEDYpKCA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdf-VQxP4rYasSzdq3yaYLPw1_G6J=Kqq5SXXWEDYpKCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/16 01:05, Eugenio Perez Martin 写道:
> On Fri, Jul 15, 2022 at 10:48 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Fri, Jul 15, 2022 at 1:39 PM Eugenio Perez Martin
>> <eperezma@redhat.com> wrote:
>>> On Fri, Jul 15, 2022 at 5:59 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> On Fri, Jul 15, 2022 at 12:32 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>> It allows the Shadow Control VirtQueue to wait for the device to use the
>>>>> available buffers.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>   hw/virtio/vhost-shadow-virtqueue.h |  1 +
>>>>>   hw/virtio/vhost-shadow-virtqueue.c | 22 ++++++++++++++++++++++
>>>>>   2 files changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>>>> index 1692541cbb..b5c6e3b3b4 100644
>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>>>> @@ -89,6 +89,7 @@ void vhost_svq_push_elem(VhostShadowVirtqueue *svq, const SVQElement *elem,
>>>>>   int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>>>>>                     size_t out_num, const struct iovec *in_sg, size_t in_num,
>>>>>                     SVQElement *elem);
>>>>> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq);
>>>>>
>>>>>   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>>>>>   void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
>>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>>>> index 5244896358..31a267f721 100644
>>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>>>> @@ -486,6 +486,28 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>>>>>       } while (!vhost_svq_enable_notification(svq));
>>>>>   }
>>>>>
>>>>> +/**
>>>>> + * Poll the SVQ for one device used buffer.
>>>>> + *
>>>>> + * This function race with main event loop SVQ polling, so extra
>>>>> + * synchronization is needed.
>>>>> + *
>>>>> + * Return the length written by the device.
>>>>> + */
>>>>> +size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
>>>>> +{
>>>>> +    do {
>>>>> +        uint32_t len;
>>>>> +        SVQElement *elem = vhost_svq_get_buf(svq, &len);
>>>>> +        if (elem) {
>>>>> +            return len;
>>>>> +        }
>>>>> +
>>>>> +        /* Make sure we read new used_idx */
>>>>> +        smp_rmb();
>>>> There's already one smp_rmb(0 in vhost_svq_get_buf(). So this seems useless?
>>>>
>>> That rmb is after checking for new entries with (vq->last_used_idx !=
>>> svq->shadow_used_idx) , to avoid reordering used_idx read with the
>>> actual used entry. So my understanding is
>>> that the compiler is free to skip that check within the while loop.
>> What do you mean by "that check" here?
>>
> The first check of (presumably cached) last_used_idx !=
> shadow_used_idx. Right before the SVQ's vring fetch of
> svq->vring.used->idx.
>
>>> Maybe the right solution is to add it in vhost_svq_more_used after the
>>> condition (vq->last_used_idx != svq->shadow_used_idx) is false?
>> I'm not sure I get the goal of the smp_rmb() here. What barrier does it pair?
>>
> It pairs with the actual device memory write.
>
> Note that I'm worried about compiler optimizations or reordering
> causing an infinite loop, not that the memory is updated properly.
>
> Let's say we just returned from vhost_svq_add, and avail_idx -
> used_idx > 0. The device still did not update SVQ vring used idx, and
> qemu is very fast so it completes a full call of vhost_svq_get_buf
> before the device is able to increment the used index. We can trace
> the full vhost_svq_get_buf without a memory barrier.
>
> If the compiler inlines enough and we delete the new smp_rmb barrier,
> this is what it sees:
>
> size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> {
>      do {
>          more_used = false
>          // The next conditional returns false
>          if (svq->last_used_idx != svq->shadow_used_idx) {
>              goto useful;
>          }
>
>          svq->shadow_used_idx = cpu_to_le16(svq->vring.used->idx);
>
>          // next conditional returns false too
>          if (!(svq->last_used_idx != svq->shadow_used_idx))
>              continue;
>
> useful:
>          // actual code to handle new used buffer
>          break;
>          }
>      }
> }
>
> And qemu does not need to read again none of the variables since
> nothing modifies them within the loop before "useful" tag
> (svq->vring.used->idx, svq->last_used_idx, svq->shadow_used_idx). So
> it could freely rewrite as:
>
> size_t vhost_svq_poll(VhostShadowVirtqueue *svq) {
>      if (svq->last_used_idx == svq->shadow_used_idx &&
>          svq->last_used_idx == svq->vring.used->idx) {
>              for (;;);
>      }
> }
>
> That's why I think the right place for the mb is right after caller
> code see (potentially cached) last_used_idx == shadow_used_idx, and it
> needs to read a value paired with the "device's mb" in the SVQ vring.


I think you need "volatile" instead of the memory barriers. If I 
understand correctly, you want the load from the memory instead of the 
registers here.

Thanks


>
> We didn't have that problem before, since we clear event_notifier
> right before the do{}while(), and event loop should hit a memory
> barrier in the next select / poll / read / whatever syscall to check
> that event notifier fd is set again.
>
>> Since we are in the busy loop, we will read the for new used_idx for
>> sure,
> I'm not so sure of that, but maybe I've missed something.
>
> I'm sending v3 with this comment pending, so we can iterate faster.
>
> Thanks!
>
>> and we can't forecast when the used_idx is committed to memory.
>>


