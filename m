Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E964B9C9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:32:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58C5-00053B-IU; Tue, 13 Dec 2022 11:31:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p58Bw-000532-Fq
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p58Bu-00027r-LI
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670949097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wMR5flWdFQbFOsC/rrruMBoYjRpZQklKkx+hzxiobX4=;
 b=i6HmuijgoOrre8iCLmsshPhyVrRoZXCsvzhkl1o8ksPNnGv/L4Bp29wRDvfoChIp5oTxSK
 FOjVBZkzH64ETe5YwnJ0NZMETppTCHI6dsVmAh0ZbZdMo0zhwj2bUQqLnBZI2wTV41ZKLh
 vEDZDbAhGzPc5d0xH4aQ5g6BfBeTiYw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-Pilf-N1YNlyjnr3fIGT58g-1; Tue, 13 Dec 2022 11:31:35 -0500
X-MC-Unique: Pilf-N1YNlyjnr3fIGT58g-1
Received: by mail-qt1-f199.google.com with SMTP id
 cj6-20020a05622a258600b003a519d02f59so179179qtb.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMR5flWdFQbFOsC/rrruMBoYjRpZQklKkx+hzxiobX4=;
 b=KjybmbgbrpqkeYzve8tDS055m0HFe7SuDZKFQCx7J5CLwhEMweyHFq8BNtC/QfZgPE
 cgJxkmj+VtvOo7VkrcGgl2NBaWTGxDRnYa+Atapl4C7eJb3JgRpbn83CDKD/4qmelIdm
 iN+QJnzoRIdc6lBXwmQeTpNakXF54Rvyrw5UMsZHVCMeE5MUuN4pPxew7uEbegZHM/OX
 2uASHV4TwrSaGXg81z2/Z70ZockOwEIDQkshN8E+WjqelDRWo0cVT3/7IGwPZE8tjHDU
 XhKca1eejfVHjov/xlvqsGqn9QMIc+SG8CnY5eHsV4Av4FdOO1VEGrWZTfE5yOEmY0Md
 vMcw==
X-Gm-Message-State: ANoB5pnmtJFt9mUJIhtMuw8+QJXBRVGFeckFpvYQZuBQIEMPTMlEc9OA
 W1qgC/4qCfoUfHrxlZ+kULfEXqybbOaKeT3K6zZbLi/Qxb7n88E6t/BKNlNH3sibhsUWWVEqWEo
 uzAjNyVXAJl7wXhQ=
X-Received: by 2002:a05:622a:4d89:b0:3a5:c024:7ed4 with SMTP id
 ff9-20020a05622a4d8900b003a5c0247ed4mr5409494qtb.17.1670949094248; 
 Tue, 13 Dec 2022 08:31:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4hd9+bdTOe/CZWNDHhvdPTNfUyBtoQJdYOtoSzX0g/6EL2UhiAJpXAdc7Ndn5Oj3JHLFqGwQ==
X-Received: by 2002:a05:622a:4d89:b0:3a5:c024:7ed4 with SMTP id
 ff9-20020a05622a4d8900b003a5c0247ed4mr5409471qtb.17.1670949093924; 
 Tue, 13 Dec 2022 08:31:33 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 b22-20020ac87fd6000000b003a6a4744432sm111027qtk.87.2022.12.13.08.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 08:31:33 -0800 (PST)
Date: Tue, 13 Dec 2022 11:31:32 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, f4bug@amsat.org,
 mst@redhat.com, zhouyibo@bytedance.com
Subject: Re: [RFC v3 2/3] virtio: support delay of checks in virtio_load()
Message-ID: <Y5io5AfRWCluAk3P@x1n>
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-3-xuchuangxclwt@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221213133510.1279488-3-xuchuangxclwt@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Dec 13, 2022 at 09:35:09PM +0800, Chuang Xu wrote:
> Delay checks in virtio_load() to avoid possible address_space_to_flatview() call
> during memory region's begin/commit.

I didn't notice virtio has the vm change handler already, looks good to
reuse it. :) A few more comments though (before some real virtio developers
chim im).

> 
> Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
> ---
>  hw/virtio/virtio.c         | 37 +++++++++++++++++++++++++++----------
>  include/hw/virtio/virtio.h |  2 ++
>  2 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index eb6347ab5d..f556e565c6 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -3642,8 +3642,26 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
>          vdev->start_on_kick = true;
>      }
>  
> +    vdev->delay_check = true;
> +
> +    if (vdc->post_load) {
> +        ret = vdc->post_load(vdev);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static void virtio_load_check_delay(VirtIODevice *vdev)
> +{
>      RCU_READ_LOCK_GUARD();
> -    for (i = 0; i < num; i++) {
> +    for (int i = 0; i < VIRTIO_QUEUE_MAX; i++) {
> +        if (vdev->vq[i].vring.num == 0) {
> +            break;
> +        }
> +
>          if (vdev->vq[i].vring.desc) {
>              uint16_t nheads;
>  
> @@ -3696,19 +3714,12 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
>                               i, vdev->vq[i].vring.num,
>                               vdev->vq[i].last_avail_idx,
>                               vdev->vq[i].used_idx);
> -                return -1;
> +                abort();

This is when the switchover finished.  I'm not sure how severe this is and
whether there can be something to remedy - abort() is probably the least we
want to do here, since the admin may not want to crash the whole VM due to
one vring failure on one device.

>              }
>          }
>      }
>  
> -    if (vdc->post_load) {
> -        ret = vdc->post_load(vdev);
> -        if (ret) {
> -            return ret;
> -        }
> -    }
> -
> -    return 0;
> +    return;
>  }
>  
>  void virtio_cleanup(VirtIODevice *vdev)
> @@ -3722,6 +3733,11 @@ static void virtio_vmstate_change(void *opaque, bool running, RunState state)
>      BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
>      VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>      bool backend_run = running && virtio_device_started(vdev, vdev->status);
> +
> +    if (vdev->delay_check) {
> +        virtio_load_check_delay(vdev);
> +        vdev->delay_check = false;
> +    }
>      vdev->vm_running = running;
>  
>      if (backend_run) {
> @@ -3789,6 +3805,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_id, size_t config_size)
>              virtio_vmstate_change, vdev);
>      vdev->device_endian = virtio_default_endian();
>      vdev->use_guest_notifier_mask = true;
> +    vdev->delay_check = false;
>  }
>  
>  /*
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index acfd4df125..269e80d04a 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -135,6 +135,8 @@ struct VirtIODevice
>      AddressSpace *dma_as;
>      QLIST_HEAD(, VirtQueue) *vector_queues;
>      QTAILQ_ENTRY(VirtIODevice) next;
> +    /* @delay_check: delay checks in virtio_load */
> +    bool delay_check;

I think it covers more than the check?  It also initializes variables like
used_idx and shadow_avail_idx.  I'm not sure how vital they are, but I'd
just avoid using the word "check" if not sure (e.g. "load_delay", or
"load_finalize"?).

>  };
>  
>  struct VirtioDeviceClass {
> -- 
> 2.20.1
> 

-- 
Peter Xu


