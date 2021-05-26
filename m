Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CAA390DD5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 03:12:00 +0200 (CEST)
Received: from localhost ([::1]:59442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lli5W-0005lW-TS
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 21:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lli4H-00053M-Mb
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:10:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lli4F-0007Xh-6Q
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621991438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KzC2CKBPK975eq6q132gtNtHNlTGt5fuCv74AVDmyA=;
 b=ctQjNjuiTfBW1tVRPN0K1x5oBDsDhexdqaRyYfLGzO2A+++MdDr3GcbDuC5vKnsNAZpxaZ
 sLJV5JCe/yJFPA0BLK7E6/dz3k6mmLGq0F8AMprZrxbL33sdD8ISXOAl6/GWyCZeereXB4
 fce+7aCe/uV3xIQi+d9a95J5uZ0wlg8=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-1zUSTmtyOrehX8a-5dOtZw-1; Tue, 25 May 2021 21:10:34 -0400
X-MC-Unique: 1zUSTmtyOrehX8a-5dOtZw-1
Received: by mail-pf1-f197.google.com with SMTP id
 x4-20020aa794040000b02902e382051004so11833186pfo.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 18:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1KzC2CKBPK975eq6q132gtNtHNlTGt5fuCv74AVDmyA=;
 b=SORA9YzvmCa9j/PyKMxsteRC5Oy3U/TKVE5oHExU46XqNjCfALX28OduIbF7l8V0NH
 FqaYOC2VBOEmEzUlguafItJLPk+KiOKAPKxTZa1C/uVscy+Hd98WkCCRNbfYaxtxzPRH
 Q7lkSN0sne2s8MBjNsOOGqpbsowXRbVD16LosryVADLIqCUVm9OcpnnaGSj1wDaFa/LX
 9cz7SihZ9/XDt4YmQzsrGkPgQjzBwEtxG8hR3RuO3wVMbIuKZvlmlZsljspZ8kPC0SGe
 5EExNWmTgdbI7FGm96IHWdWjkybY5E34RmehKBQDXYnMBcbVUjXmrMB1iboYXiOlL7cF
 ikIw==
X-Gm-Message-State: AOAM532bWRX/vu7rWlKRzvGpU6SegPv6ojWAO+fv37yIBolKM8yruKEW
 Xsl+3J1qg7+CVGMX0lmagUoCaYZrPKmkEG6I+6CgdYvEdqoGNGY70X+zBjuzW87f9LLVenm/vNR
 5lOvx26HdXbzkqDI=
X-Received: by 2002:a17:90b:88f:: with SMTP id
 bj15mr1197082pjb.46.1621991433231; 
 Tue, 25 May 2021 18:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfIURnNz5xynGV72WQBQLr7VHqkPZS3HYnoN69JL+cPCVdyCs+Wsg+rlGczLW6tqrbJEBBMg==
X-Received: by 2002:a17:90b:88f:: with SMTP id
 bj15mr1197046pjb.46.1621991432976; 
 Tue, 25 May 2021 18:10:32 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 11sm14105812pfh.182.2021.05.25.18.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 18:10:32 -0700 (PDT)
Subject: Re: [RFC v3 06/29] virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
From: Jason Wang <jasowang@redhat.com>
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-7-eperezma@redhat.com>
 <e64b9813-66e5-2417-3feb-65f0376db7e0@redhat.com>
Message-ID: <4146c924-e871-5a94-253e-e9e09456f74b@redhat.com>
Date: Wed, 26 May 2021 09:10:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <e64b9813-66e5-2417-3feb-65f0376db7e0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/26 上午9:06, Jason Wang 写道:
>
> 在 2021/5/20 上午12:28, Eugenio Pérez 写道:
>> So the guest can stop and start net device. It implements the RFC
>> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html 
>>
>>
>> To stop (as "pause") the device is required to migrate status and vring
>> addresses between device and SVQ.
>>
>> This is a WIP commit: as with VIRTIO_F_QUEUE_STATE, is introduced in
>> virtio_config.h before of even proposing for the kernel, with no feature
>> flag, and, with no checking in the device. It also needs a modified
>> vp_vdpa driver that supports to set and retrieve status.
>>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> ---
>>   include/standard-headers/linux/virtio_config.h | 2 ++
>>   hw/net/virtio-net.c                            | 4 +++-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/standard-headers/linux/virtio_config.h 
>> b/include/standard-headers/linux/virtio_config.h
>> index 59fad3eb45..b3f6b1365d 100644
>> --- a/include/standard-headers/linux/virtio_config.h
>> +++ b/include/standard-headers/linux/virtio_config.h
>> @@ -40,6 +40,8 @@
>>   #define VIRTIO_CONFIG_S_DRIVER_OK    4
>>   /* Driver has finished configuring features */
>>   #define VIRTIO_CONFIG_S_FEATURES_OK    8
>> +/* Device is stopped */
>> +#define VIRTIO_CONFIG_S_DEVICE_STOPPED 32
>>   /* Device entered invalid state, driver must reset it */
>>   #define VIRTIO_CONFIG_S_NEEDS_RESET    0x40
>>   /* We've given up on this device. */
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 96a3cc8357..2d3caea289 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -198,7 +198,9 @@ static bool virtio_net_started(VirtIONet *n, 
>> uint8_t status)
>>   {
>>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>       return (status & VIRTIO_CONFIG_S_DRIVER_OK) &&
>> -        (n->status & VIRTIO_NET_S_LINK_UP) && vdev->vm_running;
>> +        (!(n->status & VIRTIO_CONFIG_S_DEVICE_STOPPED)) &&
>> +        (n->status & VIRTIO_NET_S_LINK_UP) &&
>> +        vdev->vm_running;
>>   }
>>     static void virtio_net_announce_notify(VirtIONet *net)
>
>
> It looks to me this is only the part of pause. 


And even for pause, I don't see anything that prevents rx/tx from being 
executed? (E.g virtio_net_handle_tx_bh or virtio_net_handle_rx).

Thanks


> We still need the resume?
>
> Thanks
>
>


