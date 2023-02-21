Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD069DA68
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 06:34:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pULHZ-00044b-Nl; Tue, 21 Feb 2023 00:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULHP-00042A-1L
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:33:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULHK-0001Az-28
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:33:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676957604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYDl9vHml7hogYo9zOeHzxGqhCLpoCJSpQhVKgAXXoQ=;
 b=TvYpwLbzP5b+litrU/G2S0aK8FjCbg1mAVZESPqZtsCansW7Nzyuob6jZiquZM53PIMqTn
 4qRdadlkseJ89+4phj4vOiN+nA/cG33XL/9198BRPG3c/UBVfYYOzWWuqbuKUNwXu9qU7T
 D+9Jpo/VZPAwwgoy7ShdDeJTEI3Ev6g=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-104-ncuxCZpxOz24j8TwgfsVLQ-1; Tue, 21 Feb 2023 00:33:22 -0500
X-MC-Unique: ncuxCZpxOz24j8TwgfsVLQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 x30-20020a056a00189e00b005a8e8833e93so1440489pfh.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 21:33:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BYDl9vHml7hogYo9zOeHzxGqhCLpoCJSpQhVKgAXXoQ=;
 b=qnKkvPC0poL33UFiFpihfKmLy6QQbkGu4Y9yXIIVd2vsI23Pq0/xwnjL0t1AoF+fGe
 61LiigmQHfh4uhgCiwaW6j+G87qOTxUQGGIIUNnPonDN4dI9v72KThM/RjtUPDqDYMdE
 M7cdPt01nggaoOpQ/4ZEQdMsUjLtbFALCBoEn3F55rUUv5Zvu3nm+RNaAVIEBhfjC9R0
 3OnJpM1R15mDlFmj296cIUyUoWPdWfAzXGyUrLqQa5A086ej/aGNxYBXmrtrK7B7O/BF
 5Q68RNetnICBM+LR94ed0hhjFuQnSlt5YzyOeZi9JjXxgu0nKMUlxlLJxPEDCr3vNmOx
 wQHA==
X-Gm-Message-State: AO0yUKWTPx32ZAmIaTYhpr5g8CO27SOEhB3RUL11QW+ldAo8IkImREZ5
 eldlp6+QO/ro1wLhiK8PiNa/P7tdBrXSg9ZjkjtNnTrm/3IkV4SvwVuYRiKGOF1VkvE38uQ6n+7
 TiiuiWn64EnYe6w8=
X-Received: by 2002:a62:844e:0:b0:5a8:a56c:6144 with SMTP id
 k75-20020a62844e000000b005a8a56c6144mr3715694pfd.19.1676957601468; 
 Mon, 20 Feb 2023 21:33:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9hZv6z/cN1tcpGGFx5Ks94rmBykzu5W1/iXc5r2Xg/l+0hUInxaxFX9a1zFCDkxaQhpKVf/A==
X-Received: by 2002:a62:844e:0:b0:5a8:a56c:6144 with SMTP id
 k75-20020a62844e000000b005a8a56c6144mr3715679pfd.19.1676957601165; 
 Mon, 20 Feb 2023 21:33:21 -0800 (PST)
Received: from [10.72.12.235] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 v18-20020aa78512000000b005a8ba6e1464sm7104116pfn.38.2023.02.20.21.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 21:33:20 -0800 (PST)
Message-ID: <3c994402-9c09-bbf2-31a1-c8e785674b6b@redhat.com>
Date: Tue, 21 Feb 2023 13:33:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/13] vdpa: add vhost_vdpa_suspend
Content-Language: en-US
From: Jason Wang <jasowang@redhat.com>
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-4-eperezma@redhat.com>
 <5a4749e4-4cd4-4f07-a4db-665772003058@redhat.com>
In-Reply-To: <5a4749e4-4cd4-4f07-a4db-665772003058@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


在 2023/2/21 13:27, Jason Wang 写道:
>
> 在 2023/2/8 17:42, Eugenio Pérez 写道:
>> The function vhost.c:vhost_dev_stop fetches the vring base so the vq
>> state can be migrated to other devices.  However, this is unreliable in
>> vdpa, since we didn't signal the device to suspend the queues, making
>> the value fetched useless.
>>
>> Suspend the device if possible before fetching first and subsequent
>> vring bases.
>>
>> Moreover, vdpa totally reset and wipes the device at the last device
>> before fetch its vrings base, making that operation useless in the last
>> device. This will be fixed in later patches of this series.
>
>
> It would be better not introduce a bug first and fix it in the 
> following patch.
>
>
>>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> ---
>>   hw/virtio/vhost-vdpa.c | 19 +++++++++++++++++++
>>   hw/virtio/trace-events |  1 +
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index 2e79fbe4b2..cbbe92ffe8 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -1108,6 +1108,24 @@ static void vhost_vdpa_svqs_stop(struct 
>> vhost_dev *dev)
>>       }
>>   }
>>   +static void vhost_vdpa_suspend(struct vhost_dev *dev)
>> +{
>> +    struct vhost_vdpa *v = dev->opaque;
>> +    int r;
>> +
>> +    if (!vhost_vdpa_first_dev(dev) ||
>
>
> Any reason we need to use vhost_vdpa_first_dev() instead of replacing the
>
> if (started) {
> } else {
>     vhost_vdpa_reset_device(dev);
>     ....
> }


Ok, I think I kind of understand, so I think we need re-order the 
patches, at least patch 4 should come before this patch?

Thanks


>
>
> We check
>
> if (dev->vq_index + dev->nvqs != dev->vq_index_end) in 
> vhost_vdpa_dev_start() but vhost_vdpa_first_dev() inside 
> vhost_vdpa_suspend(). This will result code that is hard to maintain.
>
> Thanks
>
>
>> +        !(dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
>> +        return;
>> +    }
>> +
>> +    trace_vhost_vdpa_suspend(dev);
>> +    r = ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
>> +    if (unlikely(r)) {
>> +        error_report("Cannot suspend: %s(%d)", g_strerror(errno), 
>> errno);
>> +        /* Not aborting since we're called from stop context */
>> +    }
>> +}
>> +
>>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>   {
>>       struct vhost_vdpa *v = dev->opaque;
>> @@ -1122,6 +1140,7 @@ static int vhost_vdpa_dev_start(struct 
>> vhost_dev *dev, bool started)
>>           }
>>           vhost_vdpa_set_vring_ready(dev);
>>       } else {
>> +        vhost_vdpa_suspend(dev);
>>           vhost_vdpa_svqs_stop(dev);
>>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>       }
>> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
>> index a87c5f39a2..8f8d05cf9b 100644
>> --- a/hw/virtio/trace-events
>> +++ b/hw/virtio/trace-events
>> @@ -50,6 +50,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
>>   vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
>>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, 
>> uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 
>> 0x%"PRIx32
>>   vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) 
>> "dev: %p config: %p config_len: %"PRIu32
>> +vhost_vdpa_suspend(void *dev) "dev: %p"
>>   vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
>>   vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long 
>> long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" 
>> size: %llu refcnt: %d fd: %d log: %p"
>>   vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned 
>> int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t 
>> avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 
>> 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" 
>> avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64


