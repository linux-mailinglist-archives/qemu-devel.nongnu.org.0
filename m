Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6BB4BD766
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 08:48:19 +0100 (CET)
Received: from localhost ([::1]:47160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM3Qg-0003LR-Dv
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 02:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM3Mj-00011Q-SJ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:44:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nM3Mh-0005Mx-Ok
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 02:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645429451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuKgTI/RwPWsvniqSsC4/B9sBnaFVNlbje0ummfh5IQ=;
 b=ORCH7qZpCwtqf4wlG50/JltEiGtNZIFVtjcvQ5/vI1rNQEL4k9qR5lsiPqF6GbgHoW5T4X
 r4M8ZsKOAKFERHoitW2404I4TkoqGaAyHGytXvhefSpleABAKtS8a7B24u6G9dHGdq2Sjl
 1IezjhwwVFDupKoGefXjGQu2yhtYya4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-DisjJ6gjOFerIIigTjxRMA-1; Mon, 21 Feb 2022 02:44:08 -0500
X-MC-Unique: DisjJ6gjOFerIIigTjxRMA-1
Received: by mail-pj1-f71.google.com with SMTP id
 b9-20020a17090aa58900b001b8b14b4aabso10609033pjq.9
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 23:44:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kuKgTI/RwPWsvniqSsC4/B9sBnaFVNlbje0ummfh5IQ=;
 b=S7H1ySgBoUHqmG6UcECUvPdvb2UFINObCE0Y8nvR5KVDZ6JjnBhFctyZXLJCgNsJpV
 Nk9IhqRe9OvZTqFPnjv0uAArhTX6+mggNlODGby/AV/q09AEtDakLUzDpQ0lndnpOcK0
 XxELoyTdd1l7hoN8W5obMaDYa6wSpvw5BifZxYa8vM72SHx6WN1vZBJ2swSnI34rttRc
 CJxPYjo1v0LUiwfv2JYP2mZif2nIfowiddZOYkdOTswR4812EsUye20Sj/wJEm+ZfQRX
 cogNdm2Y5qxRlGSuQ8e54Trx9TIQqef8mHCHEg9zdixyhCnkkxgPNNINIvUD1cMrqMoc
 BICw==
X-Gm-Message-State: AOAM532251YzSGxut5Yt5ngjj0k1bp5rE/INGqxtwVeTbqkYZrKe6AAL
 q74QGjk34ITCz6Lr34Y66vjI044ieMlInNPzotqgjQxrwVbQl0+uVTNvpV5dQoJ7PN3WKCF8bf+
 qB2Ww8i7g0TtG6So=
X-Received: by 2002:a63:6242:0:b0:348:601c:25fc with SMTP id
 w63-20020a636242000000b00348601c25fcmr15173748pgb.467.1645429447033; 
 Sun, 20 Feb 2022 23:44:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvgt0TkFXVzZ6g3rO66/RNNA49lcJFSfwSFXoaEu42XpK0EhDU8ZV453i7HX3w75IKc+TeHg==
X-Received: by 2002:a63:6242:0:b0:348:601c:25fc with SMTP id
 w63-20020a636242000000b00348601c25fcmr15173738pgb.467.1645429446796; 
 Sun, 20 Feb 2022 23:44:06 -0800 (PST)
Received: from [10.72.12.96] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e20sm10151695pfv.42.2022.02.20.23.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Feb 2022 23:44:06 -0800 (PST)
Message-ID: <7e72def5-a1e9-ad92-2c83-fda72ffd7b60@redhat.com>
Date: Mon, 21 Feb 2022 15:43:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 18/31] vhost: Shadow virtqueue buffers forwarding
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-19-eperezma@redhat.com>
 <62e877ca-51d7-da85-13c9-d469a85f33c9@redhat.com>
 <CAJaqyWfF01k3LntM7RLEmFcej=EY2d4+2MARKXPptQ2J7VnB9A@mail.gmail.com>
 <7c52e50a-4c8e-7865-1c3d-8b156986c13a@redhat.com>
 <CAJaqyWedqtzRW=ur7upchneSc-oOkvkr3FUph_BfphV3zTmnkw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWedqtzRW=ur7upchneSc-oOkvkr3FUph_BfphV3zTmnkw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/17 下午8:48, Eugenio Perez Martin 写道:
> On Tue, Feb 8, 2022 at 9:16 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/2/1 下午7:25, Eugenio Perez Martin 写道:
>>> On Sun, Jan 30, 2022 at 7:47 AM Jason Wang <jasowang@redhat.com> wrote:
>>>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>>>> @@ -272,6 +590,28 @@ void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd)
>>>>>     void vhost_svq_stop(VhostShadowVirtqueue *svq)
>>>>>     {
>>>>>         event_notifier_set_handler(&svq->svq_kick, NULL);
>>>>> +    g_autofree VirtQueueElement *next_avail_elem = NULL;
>>>>> +
>>>>> +    if (!svq->vq) {
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    /* Send all pending used descriptors to guest */
>>>>> +    vhost_svq_flush(svq, false);
>>>> Do we need to wait for all the pending descriptors to be completed here?
>>>>
>>> No, this function does not wait, it only completes the forwarding of
>>> the *used* descriptors.
>>>
>>> The best example is the net rx queue in my opinion. This call will
>>> check SVQ's vring used_idx and will forward the last used descriptors
>>> if any, but all available descriptors will remain as available for
>>> qemu's VQ code.
>>>
>>> To skip it would miss those last rx descriptors in migration.
>>>
>>> Thanks!
>>
>> So it's probably to not the best place to ask. It's more about the
>> inflight descriptors so it should be TX instead of RX.
>>
>> I can imagine the migration last phase, we should stop the vhost-vDPA
>> before calling vhost_svq_stop(). Then we should be fine regardless of
>> inflight descriptors.
>>
> I think I'm still missing something here.
>
> To be on the same page. Regarding tx this could cause repeated tx
> frames (one at source and other at destination), but never a missed
> buffer not transmitted. The "stop before" could be interpreted as "SVQ
> is not forwarding available buffers anymore". Would that work?


Right, but this only work if

1) a flush to make sure TX DMA for inflight descriptors are all completed

2) just mark all inflight descriptor used

Otherwise there could be buffers that is inflight forever.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>>> Thanks
>>>>
>>>>
>>>>> +
>>>>> +    for (unsigned i = 0; i < svq->vring.num; ++i) {
>>>>> +        g_autofree VirtQueueElement *elem = NULL;
>>>>> +        elem = g_steal_pointer(&svq->ring_id_maps[i]);
>>>>> +        if (elem) {
>>>>> +            virtqueue_detach_element(svq->vq, elem, elem->len);
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    next_avail_elem = g_steal_pointer(&svq->next_guest_avail_elem);
>>>>> +    if (next_avail_elem) {
>>>>> +        virtqueue_detach_element(svq->vq, next_avail_elem,
>>>>> +                                 next_avail_elem->len);
>>>>> +    }
>>>>>     }


