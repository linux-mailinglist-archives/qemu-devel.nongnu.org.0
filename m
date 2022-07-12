Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CEB57143F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:18:43 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBB6P-0005sm-Uc
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAn3-0001NH-ET
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:58:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAn0-0008Vu-9q
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657612717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QigzZa+W5zh+oI8K40g2omEr/Ae52Xhsu/eImjLe06o=;
 b=DcYeBsQ+xap6XpzDJ9YDKdxfMMhB/YVbUhqKdkU3QmUMXHAlF2B3Bk59xHvs9un9TwMMkD
 0EtijjbEqRwjMOyPjd36XjCSKlzmBDbwIx4ibZYmRGpgpR/kSq4d7Np37ZJACwCYGbU9HA
 68LKITugXw2EsrEg8Fvu8CIBaqTox8Q=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-lb-GyFDENYu-3h0mF_u9CQ-1; Tue, 12 Jul 2022 03:58:35 -0400
X-MC-Unique: lb-GyFDENYu-3h0mF_u9CQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 o21-20020a17090aac1500b001ef977190efso7167267pjq.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QigzZa+W5zh+oI8K40g2omEr/Ae52Xhsu/eImjLe06o=;
 b=g6+PF9kMiI51xnaQtZufx0AaPgZxAzDgCvGIjoMl+8AXDF4iG252MGYUQreCEoX25s
 QHzYq4QbF58kSVyLolZb7ybxqD+ZXrLyt+oCocEEx5Ww5ncpj9UJKBeUflhvSI1QjeXX
 mi/QWWoNx2BiAxVzJm+xvd0+ZMtjfJBC2ONp5dK1+d2DJHSXCRpkBmzrmYZCvaqv4Hb/
 Wyxz8rwk4JGNnOB4rfcKLarImF68Swn704YUraWuaN3+S6LyEgxEneDusUi6QlxcVDs8
 8UdwMvU25K6uc3GUVga7aj4ltMACm5KsOwBLBVKzBo4MOc9kPUzLOuX8/JFKSMy2O8FC
 yl+A==
X-Gm-Message-State: AJIora/aObGM171dBRJ5KwzX9PddjZ6Iqj5HRNiRnTx04/gVUvcGc57z
 XU7KAr8u5OkYlQrdrs8DeZbHh56LcZMN0wqdorkhyoca6CsK2cy/mYTHWZKjoohtL/PdSYNSKMQ
 wQm9SKyGQbipR9fE=
X-Received: by 2002:a17:902:dac4:b0:16c:34a3:e46f with SMTP id
 q4-20020a170902dac400b0016c34a3e46fmr15404121plx.61.1657612714162; 
 Tue, 12 Jul 2022 00:58:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sKgX3Fyucy/NKKn0GZDvt9nOK7QQfQNtP0TfgOi1+rM0s/r3WFWya5JrxN1IljQUS5hX6FFA==
X-Received: by 2002:a17:902:dac4:b0:16c:34a3:e46f with SMTP id
 q4-20020a170902dac400b0016c34a3e46fmr15404093plx.61.1657612713870; 
 Tue, 12 Jul 2022 00:58:33 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170902ec9100b00163d76696e1sm6166304plg.102.2022.07.12.00.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:58:33 -0700 (PDT)
Message-ID: <4d9d8580-e8c8-571c-85d3-bcfca35d29ac@redhat.com>
Date: Tue, 12 Jul 2022 15:58:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 13/23] vhost: Add vhost_svq_inject
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-14-eperezma@redhat.com>
 <5f1c6d8f-5d3f-8e13-05d5-3afed733626f@redhat.com>
 <CAJaqyWcnuM3n4Zpu48MZS9YqP_Czg4i-eq=pKtZcjQMvdHen8Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWcnuM3n4Zpu48MZS9YqP_Czg4i-eq=pKtZcjQMvdHen8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/7/11 17:43, Eugenio Perez Martin 写道:
> On Mon, Jul 11, 2022 at 11:14 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/7/7 02:39, Eugenio Pérez 写道:
>>> This allows qemu to inject buffers to the device.
>>
>> Not a native speaker but we probably need a better terminology than
>> inject here.
>>
>> Since the CVQ is totally under the control of the Qemu anyhow.
>>
> I'm totally fine to change terminology
>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.h |  2 ++
>>>    hw/virtio/vhost-shadow-virtqueue.c | 34 ++++++++++++++++++++++++++++++
>>>    2 files changed, 36 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>> index a811f90e01..d01d2370db 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>> @@ -98,6 +98,8 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp);
>>>
>>>    void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
>>>                             const VirtQueueElement *elem, uint32_t len);
>>> +int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
>>> +                     size_t out_num, size_t in_num, void *opaque);
>>>    void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
>>>    void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
>>>    void vhost_svq_get_vring_addr(const VhostShadowVirtqueue *svq,
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index 492bb12b5f..bd9e34b413 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -283,6 +283,40 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
>>>        return ok;
>>>    }
>>>
>>> +/**
>>> + * Inject a chain of buffers to the device
>>> + *
>>> + * @svq: Shadow VirtQueue
>>> + * @iov: I/O vector
>>> + * @out_num: Number of front out descriptors
>>> + * @in_num: Number of last input descriptors
>>> + * @opaque: Contextual data to store in descriptor
>>> + *
>>> + * Return 0 on success, -ENOMEM if cannot inject
>>> + */
>>> +int vhost_svq_inject(VhostShadowVirtqueue *svq, const struct iovec *iov,
>>> +                     size_t out_num, size_t in_num, void *opaque)
>>
>> If we manage to embed opaque into VirtqueueElement, we can simply use
>> vhost_svq_add() here.
>>
> That works fine as long as SVQ only forwards elements, but it needs to
> do more than that: We need to inject new elements without guest
> notice.
>
> How could we track elements that do not have corresponding
> VirtQueueElement, like the elements sent to restore the status at the
> LM destination?


Having a token for each VirtQueueElement will work? Or maybe I can ask 
differently, what kind of extra state that need to be tracked here?

(For virtio state it should be handled by shadow virtqueue core).

Thanks


>
> I'll try to make it clearer in the patch message.
>
> Thanks!
>
>> Thanks
>>
>>
>>> +{
>>> +    bool ok;
>>> +
>>> +    /*
>>> +     * All vhost_svq_inject calls are controlled by qemu so we won't hit this
>>> +     * assertions.
>>> +     */
>>> +    assert(out_num || in_num);
>>> +    assert(svq->ops);
>>> +
>>> +    if (unlikely(svq->next_guest_avail_elem)) {
>>> +        error_report("Injecting in a full queue");
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    ok = vhost_svq_add(svq, iov, out_num, iov + out_num, in_num, opaque);
>>> +    assert(ok);
>>> +    vhost_svq_kick(svq);
>>> +    return 0;
>>> +}
>>> +
>>>    /**
>>>     * Forward available buffers.
>>>     *


