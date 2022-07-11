Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88056FB1E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:25:43 +0200 (CEST)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApfi-0004U3-8K
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApd6-0002rg-AE
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApd4-0006VV-4r
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657531377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJi4cmFi3Q+/bzy5TM9wpYzXNP+j00JSfYAWMaa98XM=;
 b=L/T9qSytEViGpS4izRTI6qjn2nc8Ce7a76vZdFz29OMo7RuP8XFBb789dOqGRL+2vHGECs
 ucEBt22ugGM0nEMGtP9x7FLF9GiUEM3rYGJ2YPcHs0wa2w8c0E8DPNLTvuw1s9hjpwIO7a
 HJ807IsX37ihwrvrW/3gW8u7yCU4Mro=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-0JzjXua1Myy5oGpSaWi4wQ-1; Mon, 11 Jul 2022 05:22:55 -0400
X-MC-Unique: 0JzjXua1Myy5oGpSaWi4wQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 mi13-20020a17090b4b4d00b001ef9759d26aso2664074pjb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HJi4cmFi3Q+/bzy5TM9wpYzXNP+j00JSfYAWMaa98XM=;
 b=Euvs7wkwbLvGen9nZXwmHiP32ec6ZreILEdd7ylvfCvvdpbK9AA0dc2LPQ37vuJJ6v
 zZ5gyzzglH7hTuIj5XgwGu48diHktaSuoTVoVqH0hiQ0LNUWapm1MpXZD9NHV07i/uxc
 bNwr18UDWTAemb99nZx7auTuhgS8i7Xm3z+isAK5vhYgDXSu2I0ilJOooBJ10w53s+WA
 F3PNe8PVxSkeP6JYYbIZzSBuBlruEHfSP1SLkH7fqzOxTJG2nkB8Q9ECt+ngHtC89XaY
 e+I2CASB5aY3hUbfUAUGh8mQNOcKSrllEJfyi/RIaipQAmeG5JWAqHiC5/vY2sLe2Yx+
 uhgA==
X-Gm-Message-State: AJIora96OH5Ksg1JpEawXAD7aNu4iwsfdMnvjDTMYSkvnAuquieaAH/b
 VVwTk/psN0TewycdrDn3NQWgNfXjYYww0FdscC07zDZP0PWF0U9fFtSsThfdYupgS3vXY3bctMW
 8icFEEjjQ2Gg89C8=
X-Received: by 2002:a05:6a00:ad0:b0:4f7:a357:6899 with SMTP id
 c16-20020a056a000ad000b004f7a3576899mr17484988pfl.80.1657531374776; 
 Mon, 11 Jul 2022 02:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5rJOXeHFcomwy87d8GFd+g4+snXnpy4VlOo1mb+PUSkiRe2tJCWqUT6IJtA3vtobbR2rDCg==
X-Received: by 2002:a05:6a00:ad0:b0:4f7:a357:6899 with SMTP id
 c16-20020a056a000ad000b004f7a3576899mr17484954pfl.80.1657531374473; 
 Mon, 11 Jul 2022 02:22:54 -0700 (PDT)
Received: from [10.72.13.128] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7998a000000b0052ab0a7375fsm4230305pfh.209.2022.07.11.02.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:22:53 -0700 (PDT)
Message-ID: <124393c2-ac9f-24eb-6a4c-6a0af43498be@redhat.com>
Date: Mon, 11 Jul 2022 17:22:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 18/23] vdpa: Export vhost_vdpa_dma_map and unmap
 calls
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-19-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-19-eperezma@redhat.com>
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


在 2022/7/7 02:40, Eugenio Pérez 写道:
> Shadow CVQ will copy buffers on qemu VA, so we avoid TOCTOU attacks that
> can set a different state in qemu device model and vdpa device.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   include/hw/virtio/vhost-vdpa.h | 4 ++++
>   hw/virtio/vhost-vdpa.c         | 7 +++----
>   2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index a29dbb3f53..7214eb47dc 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -39,4 +39,8 @@ typedef struct vhost_vdpa {
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
>   
> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> +                       void *vaddr, bool readonly);
> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> +
>   #endif
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 69cfaf05d6..613c3483b0 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -71,8 +71,8 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>       return false;
>   }
>   
> -static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> -                              void *vaddr, bool readonly)
> +int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> +                       void *vaddr, bool readonly)
>   {
>       struct vhost_msg_v2 msg = {};
>       int fd = v->device_fd;
> @@ -97,8 +97,7 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
>       return ret;
>   }
>   
> -static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
> -                                hwaddr size)
> +int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size)
>   {
>       struct vhost_msg_v2 msg = {};
>       int fd = v->device_fd;


