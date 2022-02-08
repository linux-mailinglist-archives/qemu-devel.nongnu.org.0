Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B1A4AD40B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:53:47 +0100 (CET)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMFu-0007tL-HC
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:53:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLov-0000zd-Ok
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:25:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLot-0002iJ-FT
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644308750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvZ3skWvcjwQCHC15ak56nu4PuC+lnsPOhP5C4s3ZEQ=;
 b=PReXTkLpVrVLe/dSd0tGNz+z5vUUR31zJwM2Kq1YMoVand/kQY/guBblefeVYnZ+oYkRFH
 C4yiApaijkGoFD0+86jQuicvb9iNshcRHaVbWkwg709t67EvtOJWeaDdqak2ua9j/YyBrk
 GfmlHTxXzmbGzB/8ahAXXJGLeMJWEsA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-Vi0XtJijMveh8pXPMtvHFA-1; Tue, 08 Feb 2022 03:25:49 -0500
X-MC-Unique: Vi0XtJijMveh8pXPMtvHFA-1
Received: by mail-pl1-f197.google.com with SMTP id
 y3-20020a1709029b8300b0014c8bcb70a1so7045681plp.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:25:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OvZ3skWvcjwQCHC15ak56nu4PuC+lnsPOhP5C4s3ZEQ=;
 b=tMxQWrp3NYflD+UGsqdrUbeMSnvQSZCDMsrdeI5gWMgHc/DddVdnKfQAC95xi3/afS
 ZcJHGB09rHAgdjpN5S4LQyPGcY7ExOAkfCOhrPMW0esPluqDpbm7d5yw+eMcgSgFsowD
 SkUjGKMhiL8BiOA0yQxC/DzJsj2xEWpyKqzUzCsQozE/NlPSQih/Al95J26heuH+jSkf
 gG73vg43qWjZ5nftZ6o9OUV+FZBcDE2xYpgDesKyxgrEg5Xrh7eYhBRsM/yk2EIKve/2
 KacuGQWLndA8J9pTgHMia6QqGQ0TxYmcoERuyovd9O5CzzkvKCCoIKznLD5IKe3Yuo7g
 fhNg==
X-Gm-Message-State: AOAM531P75C5/bMB5XvYbTp4+Lfsq/OPCnFEWk0q8U1TjXEy/N8MuREP
 OCPf2eNJk3g9iScuFSbZFVASOUcJ2BJnIovAvZAIqORK8Vw4eDJRgKnLKn+S1sODT5KEOaimvVd
 cTHtxWH6518LHKsw=
X-Received: by 2002:a05:6a00:b50:: with SMTP id
 p16mr2791039pfo.22.1644308748565; 
 Tue, 08 Feb 2022 00:25:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNJH3HAOFTtxMQIz2wdXElKxle89R+EYAzwlYVtcwK6gFzJuV3MpgT0r+gpjqe4DAUryDZVw==
X-Received: by 2002:a05:6a00:b50:: with SMTP id
 p16mr2790999pfo.22.1644308748233; 
 Tue, 08 Feb 2022 00:25:48 -0800 (PST)
Received: from [10.72.13.12] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z22sm14828788pfe.42.2022.02.08.00.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:25:47 -0800 (PST)
Message-ID: <9b32f664-56a9-3718-cf48-49003f87d430@redhat.com>
Date: Tue, 8 Feb 2022 16:25:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 28/31] vdpa: Expose VHOST_F_LOG_ALL on SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-29-eperezma@redhat.com>
 <42664143-6d0c-b107-ec90-8e6336bae29b@redhat.com>
 <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdBLU+maEhByepzeH7iwLmqUba0rRb8PM4VwBy2P8Vtow@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/2/1 下午7:45, Eugenio Perez Martin 写道:
> On Sun, Jan 30, 2022 at 7:50 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> SVQ is able to log the dirty bits by itself, so let's use it to not
>>> block migration.
>>>
>>> Also, ignore set and clear of VHOST_F_LOG_ALL on set_features if SVQ is
>>> enabled. Even if the device supports it, the reports would be nonsense
>>> because SVQ memory is in the qemu region.
>>>
>>> The log region is still allocated. Future changes might skip that, but
>>> this series is already long enough.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    hw/virtio/vhost-vdpa.c | 20 ++++++++++++++++++++
>>>    1 file changed, 20 insertions(+)
>>>
>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>> index fb0a338baa..75090d65e8 100644
>>> --- a/hw/virtio/vhost-vdpa.c
>>> +++ b/hw/virtio/vhost-vdpa.c
>>> @@ -1022,6 +1022,9 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev, uint64_t *features)
>>>        if (ret == 0 && v->shadow_vqs_enabled) {
>>>            /* Filter only features that SVQ can offer to guest */
>>>            vhost_svq_valid_guest_features(features);
>>> +
>>> +        /* Add SVQ logging capabilities */
>>> +        *features |= BIT_ULL(VHOST_F_LOG_ALL);
>>>        }
>>>
>>>        return ret;
>>> @@ -1039,8 +1042,25 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
>>>
>>>        if (v->shadow_vqs_enabled) {
>>>            uint64_t dev_features, svq_features, acked_features;
>>> +        uint8_t status = 0;
>>>            bool ok;
>>>
>>> +        ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
>>> +        if (unlikely(ret)) {
>>> +            return ret;
>>> +        }
>>> +
>>> +        if (status & VIRTIO_CONFIG_S_DRIVER_OK) {
>>> +            /*
>>> +             * vhost is trying to enable or disable _F_LOG, and the device
>>> +             * would report wrong dirty pages. SVQ handles it.
>>> +             */
>>
>> I fail to understand this comment, I'd think there's no way to disable
>> dirty page tracking for SVQ.
>>
> vhost_log_global_{start,stop} are called at the beginning and end of
> migration. To inform the device that it should start logging, they set
> or clean VHOST_F_LOG_ALL at vhost_dev_set_log.


Yes, but for SVQ, we can't disable dirty page tracking, isn't it? The 
only thing is to ignore or filter out the F_LOG_ALL and pretend to be 
enabled and disabled.


>
> While SVQ does not use VHOST_F_LOG_ALL, it exports the feature bit so
> vhost does not block migration. Maybe we need to look for another way
> to do this?


I'm fine with filtering since it's much more simpler, but I fail to 
understand why we need to check DRIVER_OK.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>> +            return 0;
>>> +        }
>>> +
>>> +        /* We must not ack _F_LOG if SVQ is enabled */
>>> +        features &= ~BIT_ULL(VHOST_F_LOG_ALL);
>>> +
>>>            ret = vhost_vdpa_get_dev_features(dev, &dev_features);
>>>            if (ret != 0) {
>>>                error_report("Can't get vdpa device features, got (%d)", ret);


