Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595E86A3C52
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:22:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWXvE-0005eM-CJ; Mon, 27 Feb 2023 02:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXvB-0005eE-Pl
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:27:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXv9-00076c-Ei
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677482852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7Kw5/DWzTjaMGafWr+GDqIh5bOIBWiaaDRv7vmWjG8=;
 b=UwhyYkNcStR0MnwOtQ79RgQ6jVAZe3Baq5vROusgPSybWLUspsdyW1AfAU3EAOo1TCDIrt
 5nW31xjUvxRBDiknAKz9r0Lf4DRHrGi4WA+s90e2ba1O5jNb3y+pgt9W6CBKsMKWnBw/fR
 0vsaHvjq3ObVrTtto7K9BCy18Hy8o2w=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-399-HHx6GCh1OFmRi1QglphFsA-1; Mon, 27 Feb 2023 02:27:30 -0500
X-MC-Unique: HHx6GCh1OFmRi1QglphFsA-1
Received: by mail-pj1-f72.google.com with SMTP id
 o8-20020a17090a5b0800b0023740160d09so1211353pji.6
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d7Kw5/DWzTjaMGafWr+GDqIh5bOIBWiaaDRv7vmWjG8=;
 b=kTj0m1nRMnfTR+L2asqLR5x43hk9PfPNrGrTmBGSysB2MI/0dxeIuR+JHRzEwXJe82
 8zgcXIlY8U1fLRlNfBmuZqBKNGSLJ5dzKldTe1OwSD9biHyIGHcGgCt3+5QDzrVc3Z2b
 F87BrFC1OhCt12fCdJBZIJKa+Zh6HvjGDf+CgGWDjQ7pCqgSMXa9uyQV4VVixcFrM2/U
 wMBQvVvh8RAz3rMgvC1D+aMor/M9vfk6QLu5o0zn/WG9/UNPpuFu9jwILC7Ddo5j2qHK
 2U01k9XhAqkS5QGgnv5FNYyeg6ZHLJpnB9oMQJ3LYG4ay7JsZsum8M7szVT6uu0acjud
 0gzw==
X-Gm-Message-State: AO0yUKW1r9x8FDqpXG/hXuzant/q08gZ8XAJ6Rb+DJBxQIjD7jPGJ475
 ByHOPmJ7GvC0vjbCn2AIKxJp6Li6+KvDqZkRWENhwFjXeVrmrf/ASz+rGCPKUN/Erv915tKZziw
 MOVr+R9JOYu1F4RU=
X-Received: by 2002:a05:6a20:7f8b:b0:c7:5e7a:d536 with SMTP id
 d11-20020a056a207f8b00b000c75e7ad536mr7824679pzj.17.1677482849218; 
 Sun, 26 Feb 2023 23:27:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+4H/fFIu6ScwPUUSfUghZ+LmmB3oEqyCzuO1U4PHxsDGGTSnJBaFExkNqKGt5pmDxyj/I3/w==
X-Received: by 2002:a05:6a20:7f8b:b0:c7:5e7a:d536 with SMTP id
 d11-20020a056a207f8b00b000c75e7ad536mr7824668pzj.17.1677482848915; 
 Sun, 26 Feb 2023 23:27:28 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a62b509000000b005a851e6d2b5sm3523206pfe.161.2023.02.26.23.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:27:28 -0800 (PST)
Message-ID: <da8a880b-8b5b-8a41-a0ef-13adcc742821@redhat.com>
Date: Mon, 27 Feb 2023 15:27:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 07/15] vdpa: add vhost_vdpa_suspend
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-8-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-8-eperezma@redhat.com>
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


在 2023/2/24 23:54, Eugenio Pérez 写道:
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
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


I suggest to squash this into patch 5 (or even squash patch 6 into this) 
since it's not good to introduce a bug in 5 and fix in 7.


> ---
> v4:
> * Look for _F_SUSPEND at vhost_dev->backend_cap, not backend_features
> * Fall back on reset & fetch used idx from guest's memory


A hint to squash patch 6.

Thanks


> ---
>   hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++++++++
>   hw/virtio/trace-events |  1 +
>   2 files changed, 26 insertions(+)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 228677895a..f542960a64 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -712,6 +712,7 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>   
>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>       trace_vhost_vdpa_reset_device(dev, status);
> +    v->suspended = false;
>       return ret;
>   }
>   
> @@ -1109,6 +1110,29 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>       }
>   }
>   
> +static void vhost_vdpa_suspend(struct vhost_dev *dev)
> +{
> +    struct vhost_vdpa *v = dev->opaque;
> +    int r;
> +
> +    if (!vhost_vdpa_first_dev(dev)) {
> +        return;
> +    }
> +
> +    if (!(dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
> +        trace_vhost_vdpa_suspend(dev);
> +        r = ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> +        if (unlikely(r)) {
> +            error_report("Cannot suspend: %s(%d)", g_strerror(errno), errno);
> +        } else {
> +            v->suspended = true;
> +            return;
> +        }
> +    }
> +
> +    vhost_vdpa_reset_device(dev);
> +}
> +
>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>   {
>       struct vhost_vdpa *v = dev->opaque;
> @@ -1123,6 +1147,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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


