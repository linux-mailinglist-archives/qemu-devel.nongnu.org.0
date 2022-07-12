Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81DA571417
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:12:38 +0200 (CEST)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBB0W-0007zj-Jm
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAXP-0007d4-8L
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:42:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oBAXM-0008UF-0h
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657611746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+6p3DZyttj6arkbCMFGtMsjBQ3GI8Z35Ebcxz3S8CK0=;
 b=UqNM8gLgxCeQ4RXRXe2IREjFR8tzPfnMLcKVuRGTjsuCt/cD3QEufHC6RcwnZ/bSKwvDNB
 M9fuet2op75u2+0gukM1PmLW3qzhS6dS/jm/x/hBEXqqsZt7162fEr8x39h6U2DcDHVXxW
 jtyU4kV1SQ7Yl+myqCcZ0Ytdd8Cu6yY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-Of0yDUemNpy3GYj3eG6blg-1; Tue, 12 Jul 2022 03:42:25 -0400
X-MC-Unique: Of0yDUemNpy3GYj3eG6blg-1
Received: by mail-pg1-f199.google.com with SMTP id
 r145-20020a632b97000000b004126f7aa5c5so2960020pgr.10
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+6p3DZyttj6arkbCMFGtMsjBQ3GI8Z35Ebcxz3S8CK0=;
 b=4Mp24fpaTCaO97TI+C2+BHmz95pGHp/5AfThM97Scjhb0TvmfC/1dCJU3hn+x68haU
 k8X9M3nS9PsU8WZ7cEAQHZNkVrdDtOuCZLIVeGf+AyaIKTQT4IDbEccuUE4VLGfZ6HkI
 OVZgHGObdXXpIn/A1z6XhNnqr5sSxlTVUJlfdyXjIGbGcVghmQSgnNsr57GUW3hDqFvS
 VqItCer99XzICqK2wPkHZtQWqNsLc/EUSE84OvvUF/zleV0dB7YaINnny8rPaw/rTM2v
 7+fKoQORIMk62w52eOWAFVwNrPHLEBKU1mhLb1E7JGjBVtrMtfUy9RR1UxWeQxvR4zD/
 gk5A==
X-Gm-Message-State: AJIora8oMTDtj6lVO70lWaM9ESh1p6TzTrnhWlfUg0RcirQ/EF8ngGJO
 1VLgNlg4tpRSk3faw4Nv8Yfvg6wc/3U28YJEtzhHs2++rRyw6L9zK5fuo2B1eqyumzkmlCEoMfi
 LX/xE73B07AfWRRs=
X-Received: by 2002:a17:90b:1b45:b0:1f0:941:f09c with SMTP id
 nv5-20020a17090b1b4500b001f00941f09cmr2730827pjb.65.1657611744139; 
 Tue, 12 Jul 2022 00:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vSNjPrf6BcS2fA0ixraDgI8IJKF6nLpy6fwVEB8joklc30DbnU0uCvrf+pGszpFXhArId8ag==
X-Received: by 2002:a17:90b:1b45:b0:1f0:941:f09c with SMTP id
 nv5-20020a17090b1b4500b001f00941f09cmr2730798pjb.65.1657611743825; 
 Tue, 12 Jul 2022 00:42:23 -0700 (PDT)
Received: from [10.72.12.111] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 w81-20020a627b54000000b0050dc7628178sm5998666pfc.82.2022.07.12.00.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:42:23 -0700 (PDT)
Message-ID: <e3d5000e-993b-597c-2e1e-4acc4a89bb04@redhat.com>
Date: Tue, 12 Jul 2022 15:42:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 04/23] vhost: Get vring base from vq, not svq
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
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
 <20220706184008.1649478-5-eperezma@redhat.com>
 <CACGkMEv660pXKK9-E+eLhph_Pq346PVELVEryg=MKNtB0BL5eg@mail.gmail.com>
 <CAJaqyWcqmpyXGvz6OvJaO=qJG+PFyjF_M+Bm0o-9cSQ+fbuApg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWcqmpyXGvz6OvJaO=qJG+PFyjF_M+Bm0o-9cSQ+fbuApg@mail.gmail.com>
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


在 2022/7/8 18:10, Eugenio Perez Martin 写道:
> On Fri, Jul 8, 2022 at 11:12 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Thu, Jul 7, 2022 at 2:40 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>> The used idx used to match with this, but it will not match from the
>>> moment we introduce svq_inject.
>> It might be better to explain what "svq_inject" means here.
>>
> Good point, I'll change for the next version.
>
>>> Rewind all the descriptors not used by
>>> vdpa device and get the vq state properly.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>   include/hw/virtio/virtio.h | 1 +
>>>   hw/virtio/vhost-vdpa.c     | 7 +++----
>>>   hw/virtio/virtio.c         | 5 +++++
>>>   3 files changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>>> index db1c0ddf6b..4b51ab9d06 100644
>>> --- a/include/hw/virtio/virtio.h
>>> +++ b/include/hw/virtio/virtio.h
>>> @@ -302,6 +302,7 @@ hwaddr virtio_queue_get_desc_size(VirtIODevice *vdev, int n);
>>>   hwaddr virtio_queue_get_avail_size(VirtIODevice *vdev, int n);
>>>   hwaddr virtio_queue_get_used_size(VirtIODevice *vdev, int n);
>>>   unsigned int virtio_queue_get_last_avail_idx(VirtIODevice *vdev, int n);
>>> +unsigned int virtio_queue_get_in_use(const VirtQueue *vq);
>>>   void virtio_queue_set_last_avail_idx(VirtIODevice *vdev, int n,
>>>                                        unsigned int idx);
>>>   void virtio_queue_restore_last_avail_idx(VirtIODevice *vdev, int n);
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index 2ee8009594..de76128030 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -1189,12 +1189,10 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>>>                                          struct vhost_vring_state *ring)
>>>   {
>>>       struct vhost_vdpa *v = dev->opaque;
>>> -    int vdpa_idx = ring->index - dev->vq_index;
>>>       int ret;
>>>
>>>       if (v->shadow_vqs_enabled) {
>>> -        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
>>> -
>>> +        const VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
>>>           /*
>>>            * Setting base as last used idx, so destination will see as available
>>>            * all the entries that the device did not use, including the in-flight
>>> @@ -1203,7 +1201,8 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>>>            * TODO: This is ok for networking, but other kinds of devices might
>>>            * have problems with these retransmissions.
>>>            */
>>> -        ring->num = svq->last_used_idx;
>>> +        ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index) -
>>> +                    virtio_queue_get_in_use(vq);
>> I think we need to change the above comment as well otherwise readers
>> might get confused.
>>
> Re-thinking this: This part has always been buggy, so this is actually
> a fix. I'll tag it for next versions or, even better, send it
> separately.
>
> But the comment still holds: We cannot use the device's used idx since
> it could not match with the guest visible one. This is actually easy
> to trigger if we migrate a guest many times with traffic.


I may miss someting, maybe you can give me an example on this (I assume 
the size of the svq is the same as what guest can see).


>
> Maybe it's cleaner to export directly used_idx from VirtQueue? Extra
> care is needed with packed vq, but SVQ still does not support it. I
> didn't want to duplicate that logic in virtio ring handling.


So two more questions here:

1) what's the reason of rewinding via virtio_queue_get_in_use()?

2) it looks like we could end up with underflow with the above math?

Thanks


>
>> I wonder why we need to bother at this time. Is this an issue for
>> networking devices?
> Every device has this issue when migrating as soon as the device's
> used index is not the same as the guest's one.
>
>> And for block device, it's not sufficient since
>> there's no guarantee that the descriptor is handled in order?
>>
> Right, that part still hold here.
>
> Thanks!
>


