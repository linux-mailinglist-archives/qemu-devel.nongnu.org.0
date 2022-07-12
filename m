Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A9571435
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:16:43 +0200 (CEST)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBB4S-0003l4-I1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAYw-0000fS-Jn
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAYu-0000HB-HX
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657611841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2R3TAhxIx/+WmgkNIpvKhKgfc0QzCQSe7vJkHDSeeHo=;
 b=VhHwhiC1+yZBI9vncdzzvs9oe0QbPt119EP9vkhlDAokQ0UMiR2hrQeNxOdzfUv7rfe770
 F5GFMNCMxstiYRjlMMyaBcixM7ihqo8RuRfGpQJv0hJ0VW6TtI20C6NRqGbLb/yBTVpeRW
 FQn8oZdg3SwtN93h5NrwuwTXgeeH4pg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-CKNjfCvNNNy9QYxcvX-Emg-1; Tue, 12 Jul 2022 03:44:00 -0400
X-MC-Unique: CKNjfCvNNNy9QYxcvX-Emg-1
Received: by mail-pf1-f200.google.com with SMTP id
 d83-20020a621d56000000b00528ce187233so1946018pfd.23
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2R3TAhxIx/+WmgkNIpvKhKgfc0QzCQSe7vJkHDSeeHo=;
 b=qwvooYDDOauGR23yUkKe+WBg8eJw3oYA8h13cmL5fvAafMPVP6d9LnwOiOgidFo/V7
 5e8QDqQzQKNtvjQ6ItDp/DmZwjfOTkTAWt99gDaPFv9OhTB+UPzhzy7vSdD0Q76H/f1P
 fbgmFLGyf/+USOQHXCLuVQSJQszzfN4aNu3XA2kv0MyNU44FrSexJYjDkwO/h9/FBZYw
 EcEFu5dxVV9QSF7QRUYwPANJC6dlFPut23hiez3YaR7NNbDoPbIB0wI2M4gg5n2DdoAE
 GVNXsDqaUcxU63S9lB7YekfkwahXSyRCQo7eSk4+HVmGUYY8Y+GEK/yyh78rTOo4alJy
 brLg==
X-Gm-Message-State: AJIora/Gv8obb3J7Dc+6UK8bfHgW4+kRNbFJ3cseSQ/r4UH+LijaZr8H
 tYG0FmXw2l5SeLO9j/C3RpAIeN42wVNF+ad+92qSXea2EPsCL85ql/liGqvtJa3E2pPTRKjZK6B
 vJWmP2bYBG60ewuA=
X-Received: by 2002:a17:902:d2c8:b0:16c:58d:7278 with SMTP id
 n8-20020a170902d2c800b0016c058d7278mr23107608plc.45.1657611839137; 
 Tue, 12 Jul 2022 00:43:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1um42HJb++7caqHWDq5Y0lmnZzYwqv+i7kRfvZlCwKUd6WFvaPASJEHpmBcvX8uHhIpWE7Xpg==
X-Received: by 2002:a17:902:d2c8:b0:16c:58d:7278 with SMTP id
 n8-20020a170902d2c800b0016c058d7278mr23107581plc.45.1657611838830; 
 Tue, 12 Jul 2022 00:43:58 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a170902ef5100b0016be82cc7b4sm168390plx.8.2022.07.12.00.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:43:58 -0700 (PDT)
Message-ID: <40865b2f-353f-8910-a73c-94260ec6fe07@redhat.com>
Date: Tue, 12 Jul 2022 15:43:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 08/23] vhost: Decouple vhost_svq_add_split from
 VirtQueueElement
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
 <20220706184008.1649478-9-eperezma@redhat.com>
 <48852cd1-fe92-81a1-8c35-ec1d8956f1a8@redhat.com>
 <CAJaqyWftrXQ3bg9LFjC14SYOGP1g_3t-_iekHmBDSvd5XVRKAA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWftrXQ3bg9LFjC14SYOGP1g_3t-_iekHmBDSvd5XVRKAA@mail.gmail.com>
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


在 2022/7/11 16:27, Eugenio Perez Martin 写道:
> On Mon, Jul 11, 2022 at 10:00 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/7/7 02:39, Eugenio Pérez 写道:
>>> VirtQueueElement comes from the guest, but we're heading SVQ to be able
>>> to inject element without the guest's knowledge.
>>>
>>> To do so, make this accept sg buffers directly, instead of using
>>> VirtQueueElement.
>>>
>>> Add vhost_svq_add_element to maintain element convenience
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.c | 38 +++++++++++++++++++++---------
>>>    1 file changed, 27 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index 2fc5789b73..46d3c1d74f 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -172,30 +172,32 @@ static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
>>>    }
>>>
>>>    static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
>>> -                                VirtQueueElement *elem, unsigned *head)
>>> +                                const struct iovec *out_sg, size_t out_num,
>>> +                                const struct iovec *in_sg, size_t in_num,
>>> +                                unsigned *head)
>>>    {
>>>        unsigned avail_idx;
>>>        vring_avail_t *avail = svq->vring.avail;
>>>        bool ok;
>>> -    g_autofree hwaddr *sgs = g_new(hwaddr, MAX(elem->out_num, elem->in_num));
>>> +    g_autofree hwaddr *sgs = NULL;
>>
>> Is this change a must for this patch? (looks not related to the
>> decoupling anyhow)
>>
> Right, the delay on the variable assignment is an artifact I missed in
> the cleaning. I can revert for the next version if any.
>
> With that reverted, can I add the acked-by tag from you?


Yes.

Thanks


>
> Thanks!
>
>> Other looks good.
>>
>> Thanks
>>
>>
>>>        *head = svq->free_head;
>>>
>>>        /* We need some descriptors here */
>>> -    if (unlikely(!elem->out_num && !elem->in_num)) {
>>> +    if (unlikely(!out_num && !in_num)) {
>>>            qemu_log_mask(LOG_GUEST_ERROR,
>>>                          "Guest provided element with no descriptors");
>>>            return false;
>>>        }
>>>
>>> -    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
>>> -                                     elem->in_num > 0, false);
>>> +    sgs = g_new(hwaddr, MAX(out_num, in_num));
>>> +    ok = vhost_svq_vring_write_descs(svq, sgs, out_sg, out_num, in_num > 0,
>>> +                                     false);
>>>        if (unlikely(!ok)) {
>>>            return false;
>>>        }
>>>
>>> -    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
>>> -                                     true);
>>> +    ok = vhost_svq_vring_write_descs(svq, sgs, in_sg, in_num, false, true);
>>>        if (unlikely(!ok)) {
>>>            /* TODO unwind out_sg */
>>>            return false;
>>> @@ -223,10 +225,13 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
>>>     * takes ownership of the element: In case of failure, it is free and the SVQ
>>>     * is considered broken.
>>>     */
>>> -static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
>>> +static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>>> +                          size_t out_num, const struct iovec *in_sg,
>>> +                          size_t in_num, VirtQueueElement *elem)
>>>    {
>>>        unsigned qemu_head;
>>> -    bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
>>> +    bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
>>> +                                  &qemu_head);
>>>        if (unlikely(!ok)) {
>>>            g_free(elem);
>>>            return false;
>>> @@ -250,6 +255,18 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
>>>        event_notifier_set(&svq->hdev_kick);
>>>    }
>>>
>>> +static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
>>> +                                  VirtQueueElement *elem)
>>> +{
>>> +    bool ok = vhost_svq_add(svq, elem->out_sg, elem->out_num, elem->in_sg,
>>> +                            elem->in_num, elem);
>>> +    if (ok) {
>>> +        vhost_svq_kick(svq);
>>> +    }
>>> +
>>> +    return ok;
>>> +}
>>> +
>>>    /**
>>>     * Forward available buffers.
>>>     *
>>> @@ -302,12 +319,11 @@ static void vhost_handle_guest_kick(VhostShadowVirtqueue *svq)
>>>                    return;
>>>                }
>>>
>>> -            ok = vhost_svq_add(svq, elem);
>>> +            ok = vhost_svq_add_element(svq, g_steal_pointer(&elem));
>>>                if (unlikely(!ok)) {
>>>                    /* VQ is broken, just return and ignore any other kicks */
>>>                    return;
>>>                }
>>> -            vhost_svq_kick(svq);
>>>            }
>>>
>>>            virtio_queue_set_notification(svq->vq, true);


