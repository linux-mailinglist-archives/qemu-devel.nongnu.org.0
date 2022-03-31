Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A54ED687
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 11:08:13 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZqmq-0004SK-5m
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 05:08:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZqZc-0000Ie-Ic
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZqZZ-0001j6-9K
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 04:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648716865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j17GQJP9z6Tngk3jEjdT0pOnEyheRiWn1tvazJzZq7c=;
 b=TuOhLYnF7i3NIeq97ZsweviZtgZJo5cnRbIiaAnjHDCF8Iaxcli/nm+SPjOIJFhVRpklK1
 e/INztLaTmSETuCbEjaeK4SLIgRx992lyGy0oirF0WAaVS1TbJLNsG5a9mWpPF3yIAbJbN
 NBinOcjVuqZgyMVK54VS+UxMHZ6Ys5k=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-9R5o2Ff7OQ2jdGFaSDsYGQ-1; Thu, 31 Mar 2022 04:54:23 -0400
X-MC-Unique: 9R5o2Ff7OQ2jdGFaSDsYGQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 j6-20020a170902c08600b0015442fe6256so9528890pld.23
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 01:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j17GQJP9z6Tngk3jEjdT0pOnEyheRiWn1tvazJzZq7c=;
 b=xo/4Ij3t2CAzfhT/U1J3JJ+H8Urw1F9q6Zhq5U3yXSdEtA8nCHOOphWVCZ1w+aaPVs
 fUl3p5+qjgvFatMv97f7+5qsSRFG55yiz/NbD0z1pyjvblDHZew6o4TOSB8hnin2JhnX
 DqskB8AdpTCWFAFTi+AElOwScDKuwOW6p8KQYq/Mce519xkiwG4ZqQvHF2WLvUfBwiIR
 A3tf7Yl2itJGKTorJIY6ztUzr1+6fo7KGK6N3MEjgNrqintNnl+zYawJDEp2ZOOVfbk7
 RAQE8XjLWygHRpeKfuTRNO+yhhiivWcPzk20VVfDKDs7VB7F3OCqAzGxu4i54MXzMS/C
 9XPw==
X-Gm-Message-State: AOAM53367cNjqavQh7ibggHTCnUkCAuy1yrXcyGtYUQPXOzDO31P2QQw
 PujpHZ5mLq8D9DoYiv897qSmsUy8aoTXz41AwKQm38XEV3ON4kZLkpVsYJjvb0c+dfgGUbpaiJl
 dxOM5kYpMUA78q1E=
X-Received: by 2002:a17:90b:1bc9:b0:1c7:228a:95ce with SMTP id
 oa9-20020a17090b1bc900b001c7228a95cemr4914619pjb.3.1648716862537; 
 Thu, 31 Mar 2022 01:54:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZqZgRTK2fbPpbHavMqVmNquXbuJTSlcffXsD+x9UZpOI1J7sm10tEVvsI/btdH8zCZxZrEw==
X-Received: by 2002:a17:90b:1bc9:b0:1c7:228a:95ce with SMTP id
 oa9-20020a17090b1bc900b001c7228a95cemr4914595pjb.3.1648716862203; 
 Thu, 31 Mar 2022 01:54:22 -0700 (PDT)
Received: from [10.72.13.146] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm26210186pfi.172.2022.03.31.01.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 01:54:21 -0700 (PDT)
Message-ID: <9a7c92a6-4551-48a7-6569-d3bc9d227fe2@redhat.com>
Date: Thu, 31 Mar 2022 16:54:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
To: Eugenio Perez Martin <eperezma@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
 <f8ace3a3-8f86-841e-c056-271528d5ba9c@oracle.com>
 <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eli Cohen <eli@mellanox.com>, qemu-level <qemu-devel@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/31 下午4:02, Eugenio Perez Martin 写道:
> On Thu, Mar 31, 2022 at 1:03 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/30/2022 12:01 PM, Eugenio Perez Martin wrote:
>>> On Wed, Mar 30, 2022 at 8:33 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>> The vhost_vdpa_one_time_request() branch in
>>>> vhost_vdpa_set_backend_cap() incorrectly sends down
>>>> iotls on vhost_dev with non-zero index. This may
>>>> end up with multiple VHOST_SET_BACKEND_FEATURES
>>>> ioctl calls sent down on the vhost-vdpa fd that is
>>>> shared between all these vhost_dev's.
>>>>
>>> Not only that. This means that qemu thinks the device supports iotlb
>>> batching as long as the device does not have cvq. If vdpa does not
>>> support batching, it will return an error later with no possibility of
>>> doing it ok.
>> I think the implicit assumption here is that the caller should back off
>> to where it was if it comes to error i.e. once the first
>> vhost_dev_set_features call gets an error, vhost_dev_start() will fail
>> straight.
> Sorry, I don't follow you here, and maybe my message was not clear enough.
>
> What I meant is that your patch fixes another problem not stated in
> the message: it is not possible to initialize a net vdpa device that
> does not have cvq and does not support iotlb batches without it. Qemu
> will assume that the device supports batching, so the write of
> VHOST_IOTLB_BATCH_BEGIN will fail. I didn't test what happens next but
> it probably cannot continue.


So you mean we actually didn't call VHOST_SET_BACKEND_CAP in this case. 
Fortunately, kernel didn't check the backend cap when accepting batching 
hints.

We are probably fine?

Thanks


> In that regard, this commit needs to be marked as "Fixes: ...", either
> ("a5bd058 vhost-vdpa: batch updating IOTLB mappings") or maybe better
> ("4d191cf vhost-vdpa: classify one time request"). We have a
> regression if we introduce both, or the second one and the support of
> any other backend feature.
>
>> Noted that the VHOST_SET_BACKEND_FEATURES ioctl is not per-vq
>> and it doesn't even need to. There seems to me no possibility for it to
>> fail in a way as thought here. The capture is that IOTLB batching is at
>> least a vdpa device level backend feature, if not per-kernel. Same as
>> IOTLB_MSG_V2.
>>
> At this moment it is per-kernel, yes. With your patch there is no need
> to fail because of the lack of _F_IOTLB_BATCH, the code should handle
> this case ok.
>
> But if VHOST_GET_BACKEND_FEATURES returns no support for
> VHOST_BACKEND_F_IOTLB_MSG_V2, the qemu code will happily send v2
> messages anyway. This has nothing to do with the patch, I'm just
> noting it here.
>
> In that case, maybe it is better to return something like -ENOTSUP?
>
> Thanks!
>
>> -Siwei
>>
>>>    Some open questions:
>>>
>>> Should we make the vdpa driver return error as long as a feature is
>>> used but not set by qemu, or let it as undefined? I guess we have to
>>> keep the batching at least without checking so the kernel supports old
>>> versions of qemu.
>>>
>>> On the other hand, should we return an error if IOTLB_MSG_V2 is not
>>> supported here? We're basically assuming it in other functions.
>>>
>>>> To fix it, send down ioctl only once via the first
>>>> vhost_dev with index 0. Toggle the polarity of the
>>>> vhost_vdpa_one_time_request() test would do the trick.
>>>>
>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>> Acked-by: Eugenio Pérez <eperezma@redhat.com>
>>>
>>>> ---
>>>>    hw/virtio/vhost-vdpa.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index c5ed7a3..27ea706 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>>>>
>>>>        features &= f;
>>>>
>>>> -    if (vhost_vdpa_one_time_request(dev)) {
>>>> +    if (!vhost_vdpa_one_time_request(dev)) {
>>>>            r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>>>>            if (r) {
>>>>                return -EFAULT;
>>>> --
>>>> 1.8.3.1
>>>>


