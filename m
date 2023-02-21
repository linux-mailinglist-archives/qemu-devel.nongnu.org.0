Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3F69DA62
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 06:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pULC9-0001ja-7f; Tue, 21 Feb 2023 00:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULBy-0001ic-8Y
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pULBw-0000KC-Ho
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 00:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676957271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYckSckbKHBwH8kfTD9dVCbY9JEcejpIIfa4s8CYo70=;
 b=NNUrVMURuS0nbDHsKPZdP83DNPuA4x4tGpHrEbf231/pGSPzVMs4GgQhD99rJX5pcULdYp
 3l169dH+z415d0UXoCSwkoM5FxuuBNpHQnjzAXAIkmoq+JhUCFT9pS5rDjP2ji98NiaYVQ
 ZdQKKqR8Urn48G0CjEwbKDbT0LH7ULk=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-BKORIR-tNTS23m9Ce7YBmw-1; Tue, 21 Feb 2023 00:27:22 -0500
X-MC-Unique: BKORIR-tNTS23m9Ce7YBmw-1
Received: by mail-pf1-f198.google.com with SMTP id
 x30-20020a056a00189e00b005a8e8833e93so1432749pfh.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 21:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jYckSckbKHBwH8kfTD9dVCbY9JEcejpIIfa4s8CYo70=;
 b=bryOshWG4wI3QrjB/NkBt2YuyK/nTVSEyBthaTwGxTOa/JMz+wyapZ28dzOlTmAbLh
 CAMieH20sDkbAJfAMIwDOJjEM4SIOOrJvlmgFMhz5lFfqTaQhr/NW3mJNv3O4hTdqtQW
 BG7QoTjCQtU5eZqtnFQxX/8nitUc/2CYVIug5A+JBrSTsMnW8qBCY9suthETmZob+b/R
 TZ28Af3fz/1QufPUdwa/uMEJ8Nlhkk+WbG69+9NK0qRoadTlwm+IU2SakTXgFzXfTbiM
 X7Z9ccDGuGotvw4Mft8qDksEU+QPl0BOuWIoIPP1wTUhgQ5f5mzFW1HkHhI+cummaJQH
 M+4w==
X-Gm-Message-State: AO0yUKU4Bu0d60SXQY2TP21EZ75HZD3w6H5losrGITkpaRWSniMQ4jbr
 FPpITf0tDJ8cOvJjKFod8zmx5UgRChNiioKV6GFnXMukC0MGvRDeuIksa1nfR5I33nXSCejQKHZ
 QqGW8ivcroqQ8VSU=
X-Received: by 2002:a62:52d7:0:b0:5a8:4bf8:1752 with SMTP id
 g206-20020a6252d7000000b005a84bf81752mr3205424pfb.32.1676957236869; 
 Mon, 20 Feb 2023 21:27:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/B+GHiyc6TxOq5UNQpcp6YODyPrndi8qcbM+x67bp+rNuHxroo+CQTFroZlOLYTl/y7hL8tg==
X-Received: by 2002:a62:52d7:0:b0:5a8:4bf8:1752 with SMTP id
 g206-20020a6252d7000000b005a84bf81752mr3205390pfb.32.1676957236538; 
 Mon, 20 Feb 2023 21:27:16 -0800 (PST)
Received: from [10.72.12.235] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a62b519000000b005a8bc11d259sm8814823pfe.141.2023.02.20.21.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 21:27:16 -0800 (PST)
Message-ID: <5a4749e4-4cd4-4f07-a4db-665772003058@redhat.com>
Date: Tue, 21 Feb 2023 13:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 03/13] vdpa: add vhost_vdpa_suspend
Content-Language: en-US
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
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208094253.702672-4-eperezma@redhat.com>
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


在 2023/2/8 17:42, Eugenio Pérez 写道:
> The function vhost.c:vhost_dev_stop fetches the vring base so the vq
> state can be migrated to other devices.  However, this is unreliable in
> vdpa, since we didn't signal the device to suspend the queues, making
> the value fetched useless.
>
> Suspend the device if possible before fetching first and subsequent
> vring bases.
>
> Moreover, vdpa totally reset and wipes the device at the last device
> before fetch its vrings base, making that operation useless in the last
> device. This will be fixed in later patches of this series.


It would be better not introduce a bug first and fix it in the following 
patch.


>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 19 +++++++++++++++++++
>   hw/virtio/trace-events |  1 +
>   2 files changed, 20 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 2e79fbe4b2..cbbe92ffe8 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1108,6 +1108,24 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>       }
>   }
>   
> +static void vhost_vdpa_suspend(struct vhost_dev *dev)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    int r;
> +
> +    if (!vhost_vdpa_first_dev(dev) ||


Any reason we need to use vhost_vdpa_first_dev() instead of replacing the

if (started) {
} else {
     vhost_vdpa_reset_device(dev);
     ....
}


We check

if (dev->vq_index + dev->nvqs != dev->vq_index_end) in 
vhost_vdpa_dev_start() but vhost_vdpa_first_dev() inside 
vhost_vdpa_suspend(). This will result code that is hard to maintain.

Thanks


> +        !(dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
> +        return;
> +    }
> +
> +    trace_vhost_vdpa_suspend(dev);
> +    r = ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> +    if (unlikely(r)) {
> +        error_report("Cannot suspend: %s(%d)", g_strerror(errno), errno);
> +        /* Not aborting since we're called from stop context */
> +    }
> +}
> +
>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> @@ -1122,6 +1140,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           }
>           vhost_vdpa_set_vring_ready(dev);
>       } else {
> +        vhost_vdpa_suspend(dev);
>           vhost_vdpa_svqs_stop(dev);
>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>       }
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index a87c5f39a2..8f8d05cf9b 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -50,6 +50,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
>   vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
>   vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
> +vhost_vdpa_suspend(void *dev) "dev: %p"
>   vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
>   vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
>   vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64


