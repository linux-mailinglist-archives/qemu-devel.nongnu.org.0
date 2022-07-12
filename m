Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A605713E1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:03:01 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBArE-0003de-7G
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAi7-00065m-Fs
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAi3-0001rB-Ca
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657612410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+0ckJ/YZUM299BybSeCoLQedIA9luFD16bRPT/CHCc=;
 b=Sji4GYa545xDPJB+hvVfRo1qZNA1F+6YqP2eU0mh/bsNhiooeUxYCoWyLmQF7AlvVCwy2P
 g0dQR+AmVQ840dKbichLfb5xL+2CqumJ1/A9LKvnp7hjdneibPjL8MrrLHs7MwdEFuilG3
 SAVHMXhSVQT1v5aOg3Umqax3GrHw/7w=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-rnGpMVpYO8eZsIl37ii1BQ-1; Tue, 12 Jul 2022 03:53:29 -0400
X-MC-Unique: rnGpMVpYO8eZsIl37ii1BQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 mi13-20020a17090b4b4d00b001ef9759d26aso608254pjb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A+0ckJ/YZUM299BybSeCoLQedIA9luFD16bRPT/CHCc=;
 b=2dnJbc03yNOE1rVQH2xhbB0rh+FC9PXLf1wCADws0mderdJVLNgxjwwfW1TUkMJcOh
 /4pU/LFD7PJUz6vEDn/IMUIjhr6ORQVeTVVP0fzU480Y5nUJvBDbpBvczrETmKxoPxyJ
 2rS/r5GJ63BkPuDG4LZ630Lu6kZI5Iyhn3ontEb5GveeoUKbjRa467wyLBSAUC9dnjzS
 Qp+cGE1SSoM6e10ic394L8G1JO2U2BmXwipd7UF/xFM9Iu6jU2+7kXugOv0poeGPXaQy
 AuT847vdv59aXe1aNZu0jf6lVIyYEoprSLrVYi/b8hvX8Pzi/2F7tB8u/3nDpRuJwIlp
 dA0w==
X-Gm-Message-State: AJIora9/6UlV3kKvips7m0yics6l47MTbgUqSEUlK+BAlU0PMlBNuyxx
 42nhjHtwaFcsX+k2OSXmlaGVPhAkn+NcQIC1Iz40qlQcXiix1iyPgfCxHjfYOD+X8JkQDttq53y
 d3MIL5TWlRSEpfak=
X-Received: by 2002:a17:902:6acb:b0:16b:efc7:8de7 with SMTP id
 i11-20020a1709026acb00b0016befc78de7mr22161248plt.63.1657612408618; 
 Tue, 12 Jul 2022 00:53:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgEYXhC6gQ7N7fy6XW0OJPFAACgbidOkZomiBknFSNN2Nk+40TwsiblTXl8wXI1wQEfCUl3g==
X-Received: by 2002:a17:902:6acb:b0:16b:efc7:8de7 with SMTP id
 i11-20020a1709026acb00b0016befc78de7mr22161227plt.63.1657612408355; 
 Tue, 12 Jul 2022 00:53:28 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090ad0c300b001ef7655fcc0sm6018862pjw.10.2022.07.12.00.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:53:27 -0700 (PDT)
Message-ID: <bcaee23e-6d48-e35b-856b-97e1d397d418@redhat.com>
Date: Tue, 12 Jul 2022 15:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 12/23] vhost: Add opaque member to SVQElement
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
 <20220706184008.1649478-13-eperezma@redhat.com>
 <ffa1e417-846a-0da8-7fa1-fe473e860215@redhat.com>
 <CAJaqyWccXPE5A4wAQb5rymPGfEDjQzNMeVCHhjCAXww2fdk7Pw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWccXPE5A4wAQb5rymPGfEDjQzNMeVCHhjCAXww2fdk7Pw@mail.gmail.com>
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


在 2022/7/11 17:56, Eugenio Perez Martin 写道:
> On Mon, Jul 11, 2022 at 11:05 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/7/7 02:39, Eugenio Pérez 写道:
>>> When qemu injects buffers to the vdpa device it will be used to maintain
>>> contextual data. If SVQ has no operation, it will be used to maintain
>>> the VirtQueueElement pointer.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-shadow-virtqueue.h |  3 ++-
>>>    hw/virtio/vhost-shadow-virtqueue.c | 13 +++++++------
>>>    2 files changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
>>> index 0e434e9fd0..a811f90e01 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.h
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.h
>>> @@ -16,7 +16,8 @@
>>>    #include "hw/virtio/vhost-iova-tree.h"
>>>
>>>    typedef struct SVQElement {
>>> -    VirtQueueElement *elem;
>>> +    /* Opaque data */
>>> +    void *opaque;
>>
>> So I wonder if we can simply:
>>
>> 1) introduce a opaque to VirtQueueElement
> (answered in other thread, pasting here for completion)
>
> It does not work for messages that are not generated by the guest. For
> example, the ones used to restore the device state at live migration
> destination.


For the ones that requires more metadata, we can store it in elem->opaque?


>
>> 2) store pointers to ring_id_maps
>>
> I think you mean to keep storing VirtQueueElement at ring_id_maps?


Yes and introduce a pointer to metadata in VirtQueueElement


> Otherwise, looking for them will not be immediate.
>
>> Since
>>
>> 1) VirtQueueElement's member looks general
> Not general enough :).
>
>> 2) help to reduce the tricky codes like vhost_svq_empty_elem() and
>> vhost_svq_empty_elem().
>>
> I'm ok to change to whatever other method, but to allocate them
> individually seems worse to me. Both performance wise and because
> error paths are more complicated. Maybe it would be less tricky if I
> try to move the use of them less "by value" and more "as pointers"?


Or let's having a dedicated arrays (like desc_state/desc_extra in 
kernel) instead of trying to reuse ring_id_maps.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>>        /* Last descriptor of the chain */
>>>        uint32_t last_chain_id;
>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>> index c5e49e51c5..492bb12b5f 100644
>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>> @@ -237,7 +237,7 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
>>>     */
>>>    static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>>>                              size_t out_num, const struct iovec *in_sg,
>>> -                          size_t in_num, VirtQueueElement *elem)
>>> +                          size_t in_num, void *opaque)
>>>    {
>>>        SVQElement *svq_elem;
>>>        unsigned qemu_head;
>>> @@ -245,13 +245,12 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>>>        bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
>>>                                      &qemu_head);
>>>        if (unlikely(!ok)) {
>>> -        g_free(elem);
>>>            return false;
>>>        }
>>>
>>>        n = out_num + in_num;
>>>        svq_elem = &svq->ring_id_maps[qemu_head];
>>> -    svq_elem->elem = elem;
>>> +    svq_elem->opaque = opaque;
>>>        svq_elem->last_chain_id = vhost_svq_last_desc_of_chain(svq, n, qemu_head);
>>>        return true;
>>>    }
>>> @@ -277,6 +276,8 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
>>>                                elem->in_num, elem);
>>>        if (ok) {
>>>            vhost_svq_kick(svq);
>>> +    } else {
>>> +        g_free(elem);
>>>        }
>>>
>>>        return ok;
>>> @@ -392,7 +393,7 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
>>>
>>>    static bool vhost_svq_is_empty_elem(SVQElement elem)
>>>    {
>>> -    return elem.elem == NULL;
>>> +    return elem.opaque == NULL;
>>>    }
>>>
>>>    static SVQElement vhost_svq_empty_elem(void)
>>> @@ -483,7 +484,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>>>                    break;
>>>                }
>>>
>>> -            elem = g_steal_pointer(&svq_elem.elem);
>>> +            elem = g_steal_pointer(&svq_elem.opaque);
>>>                virtqueue_fill(vq, elem, len, i++);
>>>            }
>>>
>>> @@ -651,7 +652,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>
>>>        for (unsigned i = 0; i < svq->vring.num; ++i) {
>>>            g_autofree VirtQueueElement *elem = NULL;
>>> -        elem = g_steal_pointer(&svq->ring_id_maps[i].elem);
>>> +        elem = g_steal_pointer(&svq->ring_id_maps[i].opaque);
>>>            if (elem) {
>>>                virtqueue_detach_element(svq->vq, elem, 0);
>>>            }


