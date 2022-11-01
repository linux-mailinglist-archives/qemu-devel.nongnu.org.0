Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A13061433D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 03:29:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oph00-0007bM-JM; Mon, 31 Oct 2022 22:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1opgzu-0007at-Hz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1opgzt-0004oW-1i
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667269644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uImy8CYEK7qTLFcTbThhmzYKmaphV5b3T0SJ+M91peo=;
 b=gENJI+sGTF30IUH4tiLNc/VDT+MXFDzoidExACr0wXq7Gskw+lFnIsqrCUg+imAIWykZS1
 /9MJeh7qioepx58WjbbKA2Ji3BANDCYY2h9AiFTLK7UExb6ixGbCi/and318rRdoz4u2OH
 OqWVfv+ay3QhW2K0/xTyN/PRIKum82s=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-437-wF-ecWp0MmuN_RXbjk1EdA-1; Mon, 31 Oct 2022 22:27:21 -0400
X-MC-Unique: wF-ecWp0MmuN_RXbjk1EdA-1
Received: by mail-pg1-f197.google.com with SMTP id
 f19-20020a63f113000000b0046fde69a09dso1341913pgi.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 19:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uImy8CYEK7qTLFcTbThhmzYKmaphV5b3T0SJ+M91peo=;
 b=hXEUAS5P2v5nq9KKkgqfcn7jhp+eMhNWFEqkIGZjUOXOB3OcDEJX/IlzfRFOkn48FG
 Be2raakYtiRATETH6FkEqaGlGPM0W6Yu0+Kpp+O626p/jnwCTD4RRGPP1HOEjzRXQA3e
 rm8MqIch7ww8sQtJafOnRBHkaFMANGeL1+SROPJNx8soYdy4+bbmFRk0E5vsWqsOmwAD
 49hplP95UjnNFgSsihBDt0lOS6/2VqDqVVBbZtotP7u9YO7lp+Z5fv3ADBQg9ZEpRBiT
 vDEgWVG4nf5FnWunvJLFuhBuZQUvHIsOrlOrgKGegdICUqYWzzXQpvgRmHERIIG4/U+2
 nixA==
X-Gm-Message-State: ACrzQf20EhYFGyexZhzIvAi3twAGpnhmgE3EAwyo9J7E6Rs8/+/q8wqE
 wWP0o1PzZEzJQQVHNWVf0ZUzARj9l20+CRGnbiVfDZ/gceC7HBhoIO/JApLU4xD/C/7FijcSeVY
 Cz79JaiPgFq49hrg=
X-Received: by 2002:a63:ea4e:0:b0:454:26eb:b73f with SMTP id
 l14-20020a63ea4e000000b0045426ebb73fmr15405507pgk.451.1667269640886; 
 Mon, 31 Oct 2022 19:27:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6boPkqEZNFuCLUnd43O8ylTfhECONw2Amtod/UUXe3d9nFG4na/66olRwo6QhU0ZDEJ7tJNQ==
X-Received: by 2002:a63:ea4e:0:b0:454:26eb:b73f with SMTP id
 l14-20020a63ea4e000000b0045426ebb73fmr15405488pgk.451.1667269640589; 
 Mon, 31 Oct 2022 19:27:20 -0700 (PDT)
Received: from [10.72.13.181] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a625b45000000b0053e38ac0ff4sm5302319pfb.115.2022.10.31.19.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 19:27:20 -0700 (PDT)
Message-ID: <878485d4-124e-9062-847f-a690889ef42a@redhat.com>
Date: Tue, 1 Nov 2022 10:27:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 4/4] vhost: convert byte order on avail_event read
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-5-eperezma@redhat.com>
 <a08bc5b7-8481-49f7-c4fb-a4c780783e5b@linaro.org>
 <CAJaqyWerZzwFK01+rrdp-dHqFAmrUx-3PYfK+VGY3zGRDOwJBw@mail.gmail.com>
 <20221031083449-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221031083449-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/10/31 20:35, Michael S. Tsirkin 写道:
> On Mon, Oct 31, 2022 at 09:29:53AM +0100, Eugenio Perez Martin wrote:
>> On Sat, Oct 29, 2022 at 12:53 AM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>> On 28/10/22 18:02, Eugenio Pérez wrote:
>>>> This causes errors on virtio modern devices on big endian hosts
>>>>
>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>> ---
>>>>    hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
>>>> index 18a49e1ecb..3131903edd 100644
>>>> --- a/hw/virtio/vhost-shadow-virtqueue.c
>>>> +++ b/hw/virtio/vhost-shadow-virtqueue.c
>>>> @@ -231,7 +231,8 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
>>>>            size_t num = svq->vring.num;
>>>>            uint16_t *avail_event = (uint16_t *)&svq->vring.used->ring[num];
>>>>
>>>     uint16_t avail_event = virtio_lduw_p(svq->vdev,
>>>                                          &svq->vring.used->ring[num]);
>>>     needs_kick = vring_need_event(avail_event,
>>>                                   svq->shadow_avail_idx,
>>>                                   svq->shadow_avail_idx - 1);
>>>
>> It would work, but just because all vrings must be little endian for
>> the moment. If we support legacy drivers on a big endian host and
>> guest in the future, it would not work.
>>
>> virtio_ld and virtio_st handle the conversions between the guest and
>> the emulated device in qemu, but this conversion is between qemu
>> shadow vring and the vdpa device (assuming modern, little endian for
>> the moment).
>>
>> Right now the feature set must be the same, but it could not be that
>> way in the future.
>>
>> Thanks!
>
> I don't think this works  legacy and virtio data path are similar but
> not similar enough to allow switches through svq alone.


Then we need full copy in that case, looks more like a normal network 
backend instead of registering it to as vhost backend.

Thanks


>
>
>>>> -        needs_kick = vring_need_event(*avail_event, svq->shadow_avail_idx,
>>>> +        needs_kick = vring_need_event(le16_to_cpu(*avail_event),
>>>> +                                      svq->shadow_avail_idx,
>>>>                                          svq->shadow_avail_idx - 1);
>>>>        } else {
>>>>            needs_kick = !(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY);


