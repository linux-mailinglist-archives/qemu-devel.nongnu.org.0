Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE99625465
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:26:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOOt-0001iJ-Gv; Fri, 11 Nov 2022 02:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otOOp-0001hr-AK
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:24:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otOOn-0000KT-Hg
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668151463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mGF1hqUyS/IuY67TmrVD3p9aLrEy04dzHTj0jnkQqlo=;
 b=Jqmfg2g37A/GrV7rT2eWtLQ3Pl3NMQ7eFU4/fy0gPdJIt32Wr2WgMtMmicbr5fByQLzoeo
 YStHeN+Qa/PHsiVuUzuMV742gucJ0Ajo2ftWkRcjRg/gRAxZSH2HW281eCGn06KdZIb0RT
 6wjrUNWtW+2YJqMJBqOJCWmyBKW90kY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-cNiJqT6BMr-iyFI8Ts1Lnw-1; Fri, 11 Nov 2022 02:24:21 -0500
X-MC-Unique: cNiJqT6BMr-iyFI8Ts1Lnw-1
Received: by mail-pj1-f71.google.com with SMTP id
 r10-20020a17090a1bca00b002137a500398so2419332pjr.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mGF1hqUyS/IuY67TmrVD3p9aLrEy04dzHTj0jnkQqlo=;
 b=t5yhyuRAYz8hRahLlYjkevrn2cZnQWKuLyAa9h0xlfWZudUeiIBlVOssz6UDLJeOIF
 fAnM5oBUo5ESjjp5qNL/Tm2QXgjP3JPb/mSjZ1KRWiLlRbDWNTFLYZH8J2RPzo6nJhss
 fAUSbzS3l75BlCQZsJOkJKHIrpBOeK+NN31zS5cnGWTSR021yS5sDm9DIGKBHP0qscv7
 dioufoEENdHeyMirjtaBsbyjyr/sfjN7HkimEin54ado71h3aJtMZziVC5s+MeS/qCLB
 p9YdtepjhxjWOKxjZe2dLDiWJSBGKwrOFDon7OHJ4nqhLzAwSNKbPfjHDNzOjYvA9TTo
 F8yQ==
X-Gm-Message-State: ANoB5pl4wv4mrAIONhuAfuu2dmwoMVbaWKLTYwqABr/ePMFaiBwgYxjA
 /94DTxkMif/ysh8N4I3/vXF4suVPDy8RbRWnQhY7dFONy9pvZkG0I3XNzgj/ah9/jVai1XM2vDu
 uf3ACc0Sk5MDriWE=
X-Received: by 2002:a17:90a:8c82:b0:210:c745:2a22 with SMTP id
 b2-20020a17090a8c8200b00210c7452a22mr611659pjo.36.1668151460357; 
 Thu, 10 Nov 2022 23:24:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5cQGHmxl3EySgMqHg52aLNTbRSBXk2KymTU9czlvB/0wUg1mXUFWP5ReINRE3uyIggmPX1bA==
X-Received: by 2002:a17:90a:8c82:b0:210:c745:2a22 with SMTP id
 b2-20020a17090a8c8200b00210c7452a22mr611628pjo.36.1668151460062; 
 Thu, 10 Nov 2022 23:24:20 -0800 (PST)
Received: from [10.72.13.217] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa7940a000000b0053b723a74f7sm891523pfo.90.2022.11.10.23.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 23:24:18 -0800 (PST)
Message-ID: <259e543e-2ede-e84c-3f3a-1542e072bbb5@redhat.com>
Date: Fri, 11 Nov 2022 15:24:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 01/10] vdpa: Use v->shadow_vqs_enabled in
 vhost_vdpa_svqs_start & stop
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-2-eperezma@redhat.com>
 <CACGkMEtvbSbsNZQV5RB1yyNzpam4QezdJ-f75nh4ToMJU=KYQQ@mail.gmail.com>
 <CAJaqyWdf-A8xEDVyX9f6y3FZhyp9bYMnuFU2jWFStCCvVNkDTA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdf-A8xEDVyX9f6y3FZhyp9bYMnuFU2jWFStCCvVNkDTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/11/10 20:54, Eugenio Perez Martin 写道:
> On Thu, Nov 10, 2022 at 6:22 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Wed, Nov 9, 2022 at 1:08 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> This function used to trust in v->shadow_vqs != NULL to know if it must
>>> start svq or not.
>>>
>>> This is not going to be valid anymore, as qemu is going to allocate svq
>>> unconditionally (but it will only start them conditionally).
>> It might be a waste of memory if we did this. Any reason for this?
>>
> Well, it's modelled after vhost_vdpa notifier member [1].


Right, this could be optimized in the future as well.


>
> But sure we can reduce the memory usage if SVQ is not used. The first
> function that needs it is vhost_set_vring_kick. But I think it is not
> a good function to place the delayed allocation.
>
> Would it work to move the allocation to vhost_set_features vhost op?
> It seems unlikely to me to call callbacks that can affect SVQ earlier
> than that one. Or maybe to create a new one and call it the first on
> vhost.c:vhost_dev_start?


Rethink about this, so I think we can leave this in the future.

Thanks


>
> Thanks!
>
> [1] The notifier member already allocates VIRTIO_QUEUE_MAX
> VhostVDPAHostNotifier for each vhost_vdpa, It is easy to reduce at
> least to the number of virtqueues on a vhost_vdpa. Should I send a
> patch for this one?
>
>
>> Thanks
>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   hw/virtio/vhost-vdpa.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 7468e44b87..7f0ff4df5b 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -1029,7 +1029,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
>>>       Error *err = NULL;
>>>       unsigned i;
>>>
>>> -    if (!v->shadow_vqs) {
>>> +    if (!v->shadow_vqs_enabled) {
>>>           return true;
>>>       }
>>>
>>> @@ -1082,7 +1082,7 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>>>   {
>>>       struct vhost_vdpa *v = dev->opaque;
>>>
>>> -    if (!v->shadow_vqs) {
>>> +    if (!v->shadow_vqs_enabled) {
>>>           return;
>>>       }
>>>
>>> --
>>> 2.31.1
>>>


