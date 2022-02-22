Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B854BF2C7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:44:46 +0100 (CET)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPqn-00057v-9f
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMPo1-0004LH-Jr
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:41:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMPny-0005eM-5T
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645515708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGrx4EtwRfyNbdr1Hsz29eiLereNmvESiiY5K98iiTU=;
 b=cuSKtWmPYxM5Za250Zhtiljr0LFoha86r8AL9sLwHV2ICG2mDLGgg2xvXAkfiBgvR8J7mo
 XA0Wh4Q5hGmprzpqqB6OdIB+t6bHs5lMyRlX+cVUhTFODZRojeLTfJ1blDoVqpdyP6x2kV
 FZuDZGEsGiHAnw5ZFAo9HK/cUxaalhs=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-pWddIfonMqq470-iBWs7FQ-1; Tue, 22 Feb 2022 02:41:47 -0500
X-MC-Unique: pWddIfonMqq470-iBWs7FQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 u17-20020a63a911000000b0037491401c44so12903pge.17
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 23:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IGrx4EtwRfyNbdr1Hsz29eiLereNmvESiiY5K98iiTU=;
 b=CaqLjlgmLFCE+52vzhSt9deZsPSTSOPh9aVncItux9kiOCkCBDVnb2gqkKiPfwBriO
 a5izcxls9hym365bBh44lchiUD+ERHsGHZVcKqU+dNskyfUNK+dT/NZkLh5gVETg2bWj
 ma4h8m+dLfJ67+juoM0YExwT58bjtSqvelsUSTLpfkdziSl8t0mQnKvrODBALLG6qufH
 bwyYsqFeq8EChoVgtMNhlfsNPRVj/RjHNpOkOiRoi5X1N5+X5wF58q2cSIsRs/lwr1Xm
 etlIsqc5mXCwwImL8h5fOwKqNtfJueMCfBMdWkFoTstXAgitoj0ja4pAdwC6qgBrgbB3
 7ELw==
X-Gm-Message-State: AOAM530YDWZl5jGvLBm+9NFsA/GbdJu87ozqBOuQQxmOclQRxBxuUHsa
 eQrwqEf1/jtVvO79zqyLkWJoMMISY3rLbYOBmrai0T2qjrWpYNbSwrBLcNJ7S8V93bK50KwP+nA
 18xk2To7PMpfgudE=
X-Received: by 2002:a17:902:d508:b0:14f:dd5f:c8b2 with SMTP id
 b8-20020a170902d50800b0014fdd5fc8b2mr1911232plg.17.1645515706014; 
 Mon, 21 Feb 2022 23:41:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2WX9ULvGmnVvPW8y6Y/A9jFQVM47Ch2DLAEyaR5PdCPEif0F457n1g98Ql7HwNUofmpiqBw==
X-Received: by 2002:a17:902:d508:b0:14f:dd5f:c8b2 with SMTP id
 b8-20020a170902d50800b0014fdd5fc8b2mr1911197plg.17.1645515705673; 
 Mon, 21 Feb 2022 23:41:45 -0800 (PST)
Received: from [10.72.13.199] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q8sm14860810pfk.168.2022.02.21.23.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 23:41:45 -0800 (PST)
Message-ID: <0f0204f1-8b7f-a21e-495e-24443a63f026@redhat.com>
Date: Tue, 22 Feb 2022 15:41:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
 <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
 <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
 <9b32f664-56a9-3718-cf48-49003f87d430@redhat.com>
 <CAJaqyWcvWjPas0=xp+U-c-kG+e6k73jg=C4phFD7S-tZY=niSQ@mail.gmail.com>
 <CACGkMEtbd9RsE9f-HLnwmhJEFsK++uBHnqG4N0c6qJG0PxDdzw@mail.gmail.com>
 <CAJaqyWdhHmD+tB_bY_YEMnBU1p7-LW=LP8f+3e_ZXDcOfSRiNA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdhHmD+tB_bY_YEMnBU1p7-LW=LP8f+3e_ZXDcOfSRiNA@mail.gmail.com>
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


在 2022/2/17 下午4:22, Eugenio Perez Martin 写道:
> On Thu, Feb 17, 2022 at 7:02 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Wed, Feb 16, 2022 at 11:54 PM Eugenio Perez Martin
>> <eperezma@redhat.com> wrote:
>>> On Tue, Feb 8, 2022 at 9:25 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>
>>>> 在 2022/2/1 下午7:45, Eugenio Perez Martin 写道:
>>>>> On Sun, Jan 30, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>>>>>> SVQ is able to log the dirty bits by itself, so let's use it to not
>>>>>>> block migration.
>>>>>>>
>>>>>>> Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ is
>>>>>>> enabled. Even if the device supports it, the reports would be nonsense
>>>>>>> because SVQ memory is in the qemu region.
>>>>>>>
>>>>>>> The log region is still allocated. Future changes might skip that, but
>>>>>>> this series is already long enough.
>>>>>>>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> ---
>>>>>>>     hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
>>>>>>>     1 file changed, 20 insertions(+)
>>>>>>>
>>>>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>>>>> index fb0a338baa..75090d65e8 100644
>>>>>>> --- a/hw/virtio/vhost-vdpa.c
>>>>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>>>>> @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev, uint64_t *features)
>>>>>>>         if (ret == 0 && v->shadow_vqs_enabled) {
>>>>>>>             /* Filter only features that SVQ can offer to guest */
>>>>>>>             vhost_svq_valid_guest_features(features);
>>>>>>> +
>>>>>>> +        /* Add SVQ logging capabilities */
>>>>>>> +        *features |= BIT_ULL(VHOST_F_LOG_ALL);
>>>>>>>         }
>>>>>>>
>>>>>>>         return ret;
>>>>>>> @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>>>>>>>
>>>>>>>         if (v->shadow_vqs_enabled) {
>>>>>>>             uint64_t dev_features, svq_features, acked_features;
>>>>>>> +        uint8_t status = 0;
>>>>>>>             bool ok;
>>>>>>>
>>>>>>> +        ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
>>>>>>> +        if (unlikely(ret)) {
>>>>>>> +            return ret;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
>>>>>>> +            /*
>>>>>>> +             * vhost is trying to enable or disable _F_LOG, and the device
>>>>>>> +             * would report wrong dirty pages. SVQ handles it.
>>>>>>> +             */
>>>>>> I fail to understand this comment, I'd think there's no way to disable
>>>>>> dirty page tracking for SVQ.
>>>>>>
>>>>> vhost_log_global_{start,stop} are called at the beginning and end of
>>>>> migration. To inform the device that it should start logging, they set
>>>>> or clean VHOST_F_LOG_ALL at vhost_dev_set_log.
>>>>
>>>> Yes, but for SVQ, we can't disable dirty page tracking, isn't it? The
>>>> only thing is to ignore or filter out the F_LOG_ALL and pretend to be
>>>> enabled and disabled.
>>>>
>>> Yes, that's what this patch does.
>>>
>>>>> While SVQ does not use VHOST_F_LOG_ALL, it exports the feature bit so
>>>>> vhost does not block migration. Maybe we need to look for another way
>>>>> to do this?
>>>>
>>>> I'm fine with filtering since it's much more simpler, but I fail to
>>>> understand why we need to check DRIVER_OK.
>>>>
>>> Ok maybe I can make that part more clear,
>>>
>>> Since both operations use vhost_vdpa_set_features we must just filter
>>> the one that actually sets or removes VHOST_F_LOG_ALL, without
>>> affecting other features.
>>>
>>> In practice, that means to not forward the set features after
>>> DRIVER_OK. The device is not expecting them anymore.
>> I wonder what happens if we don't do this.
>>
> If we simply delete the check vhost_dev_set_features will return an
> error, failing the start of the migration. More on this below.


Ok.


>
>> So kernel had this check:
>>
>>          /*
>>           * It's not allowed to change the features after they have
>>           * been negotiated.
>>           */
>> if (ops->get_status(vdpa) & VIRTIO_CONFIG_S_FEATURES_OK)
>>          return -EBUSY;
>>
>> So is it FEATURES_OK actually?
>>
> Yes, FEATURES_OK seems more appropriate actually so I will switch to
> it for the next version.
>
> But it should be functionally equivalent, since
> vhost.c:vhost_dev_start sets both and the setting of _F_LOG_ALL cannot
> be concurrent with it.


Right.


>
>> For this patch, I wonder if the thing we need to do is to see whether
>> it is a enable/disable F_LOG_ALL and simply return.
>>
> Yes, that's the intention of the patch.
>
> We have 4 cases here:
> a) We're being called from vhost_dev_start, with enable_log = false
> b) We're being called from vhost_dev_start, with enable_log = true


And this case makes us can't simply return without calling vhost-vdpa.


> c) We're being called from vhost_dev_set_log, with enable_log = false
> d) We're being called from vhost_dev_set_log, with enable_log = true
>
> The way to tell the difference between a/b and c/d is to check if
> {FEATURES,DRIVER}_OK is set. And, as you point out in previous mails,
> F_LOG_ALL must be filtered unconditionally since SVQ tracks dirty
> memory through the memory unmapping, so we clear the bit
> unconditionally if we detect that VHOST_SET_FEATURES will be called
> (cases a and b).
>
> Another possibility is to track if features have been set with a bool
> in vhost_vdpa or something like that. But it seems cleaner to me to
> only store that in the actual device.


So I suggest to make sure codes match the comment:

         if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
             /*
              * vhost is trying to enable or disable _F_LOG, and the device
              * would report wrong dirty pages. SVQ handles it.
              */
             return 0;
         }

It would be better to check whether the caller is toggling _F_LOG_ALL in 
this case.

Thanks


>
>> Thanks
>>
>>> Does that make more sense?
>>>
>>> Thanks!
>>>
>>>> Thanks
>>>>
>>>>
>>>>> Thanks!
>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> +            return 0;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        /* We must not ack _F_LOG if SVQ is enabled */
>>>>>>> +        features &= ~BIT_ULL(VHOST_F_LOG_ALL);
>>>>>>> +
>>>>>>>             ret = vhost_vdpa_get_dev_features(dev, &dev_features);
>>>>>>>             if (ret != 0) {
>>>>>>>                 error_report("Can't get vdpa device features, got (%d)", ret);


