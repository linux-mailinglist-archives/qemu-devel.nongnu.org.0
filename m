Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6336EEDCA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 07:55:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prY73-0005DT-0Y; Wed, 26 Apr 2023 01:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1prY70-0005DB-V4
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1prY6z-0002B9-Ak
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 01:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682488480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYOV1ICayOgG5jPTXPYEG/O/boYNqEjYH36xqf3Ll1E=;
 b=E0v0huC92E929g1mA7BGTjhGhVjKPnSTNo8yjCpeW8ER5hARxRaKDRkzm9piFfMENKDrPE
 93KT34yPw81juHrz5X3WRCCQnEJ3IWZZgW9gzVoBuQ3ByBqWlf7yZdM1DxjJc9QwWjmibe
 RZ6InwOyOfoTsj3a4Eh3QzRDzQlZSHE=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-GmwJj8LyOxmBVos-WQ571Q-1; Wed, 26 Apr 2023 01:54:39 -0400
X-MC-Unique: GmwJj8LyOxmBVos-WQ571Q-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-63b41df6c5aso4561938b3a.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 22:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682488478; x=1685080478;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zYOV1ICayOgG5jPTXPYEG/O/boYNqEjYH36xqf3Ll1E=;
 b=FA/Dzay9TQSaI+7eSPTJnFx+LggXkATDcOivOudwvqj2t3649I0YITIcwXnjxX40wJ
 u2vTmb1J09ru+KXCcX7EHuBAjWJpRCUCTvHoKH3GsszKk7XaVcNS5nETwdNV4SPAVc+b
 AIydJZERqqoZhaE7i3BB7hmLy+/EbFndpPbBrzjagENth0ArvPubVKRLQkWRI5n7Nbl+
 JeQAM/AJOGbQtQOgea1cNlEfadeJFaVy2yHeDR+vPGzyrz0CF4fG2xCOcnhBoZSMSrk+
 CN3Fhwu3YJNngmUySYxZgRth+FrzRFOzcCJLlfYSasS/HVxDPeb5dqoaSKMlofXFfePj
 4UxQ==
X-Gm-Message-State: AAQBX9erLNmLrHkBvH78QZP99VPf/oCTqi1wFTIu3siL2v7B/GVHrkp/
 wkfD/LrDsYfA87j39K2lj/AQEwMeMKf5peUtYqHgagSaGGBUtEjv9tJHLqFtxeWw0jowupmX79p
 iVRTThbicjJQGaVo=
X-Received: by 2002:a05:6a20:5487:b0:f5:cf7d:fcbf with SMTP id
 i7-20020a056a20548700b000f5cf7dfcbfmr8128823pzk.41.1682488477992; 
 Tue, 25 Apr 2023 22:54:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y/0hpz88xec8B9OcPO+nAxacdDtEtP9VBMmWk4hilPSOD+O7OVI6hn4n93VNcDL0fuhCkr0g==
X-Received: by 2002:a05:6a20:5487:b0:f5:cf7d:fcbf with SMTP id
 i7-20020a056a20548700b000f5cf7dfcbfmr8128801pzk.41.1682488477671; 
 Tue, 25 Apr 2023 22:54:37 -0700 (PDT)
Received: from [10.72.12.241] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm10315301pfi.112.2023.04.25.22.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 22:54:37 -0700 (PDT)
Message-ID: <aa44c585-82b4-f0f2-e2d1-a3536acda7d2@redhat.com>
Date: Wed, 26 Apr 2023 13:54:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 4/4] vhost: register and change IOMMU flag depending
 on ATS state
Content-Language: en-US
To: Viktor Prutyanov <viktor@daynix.com>, mst@redhat.com,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, peterx@redhat.com,
 david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com
References: <20230424112147.17083-1-viktor@daynix.com>
 <20230424112147.17083-5-viktor@daynix.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230424112147.17083-5-viktor@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2023/4/24 19:21, Viktor Prutyanov 写道:
> The guest can disable or never enable ATS. In these cases, Device-TLB
> can't be used even if enabled in QEMU. So, check ATS state before
> registering IOMMU notifier and select flag depending on that. Also,
> change IOMMU notifier flag if ATS state is changed.
>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>   hw/virtio/vhost.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index eb8c4c378c..1b14937020 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -796,7 +796,9 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>       iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
>                                                      MEMTXATTRS_UNSPECIFIED);
>       iommu_notifier_init(&iommu->n, vhost_iommu_unmap_notify,
> -                        IOMMU_NOTIFIER_DEVIOTLB_UNMAP,
> +                        dev->vdev->ats_enabled ?
> +                            IOMMU_NOTIFIER_DEVIOTLB_UNMAP :
> +                            IOMMU_NOTIFIER_UNMAP,
>                           section->offset_within_region,
>                           int128_get64(end),
>                           iommu_idx);
> @@ -804,7 +806,8 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>       iommu->iommu_offset = section->offset_within_address_space -
>                             section->offset_within_region;
>       iommu->hdev = dev;
> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n,
> +            dev->vdev->ats_enabled ? NULL : &error_fatal);
>       if (ret) {
>           /*
>            * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
> @@ -818,6 +821,19 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>       /* TODO: can replay help performance here? */
>   }
>   
> +static void vhost_deviotlb_ctrl_trigger(bool enable, struct VirtIODevice *vdev)
> +{
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> +    struct vhost_dev *hdev = vdc->get_vhost(vdev);
> +    struct vhost_iommu *iommu;
> +
> +    QLIST_FOREACH(iommu, &hdev->iommu_list, iommu_next) {
> +        iommu->n.notifier_flags = enable ?
> +            IOMMU_NOTIFIER_DEVIOTLB_UNMAP : IOMMU_NOTIFIER_UNMAP;
> +        memory_region_iommu_notify_flags_changed(iommu->mr);
> +    }
> +}
> +
>   static void vhost_iommu_region_del(MemoryListener *listener,
>                                      MemoryRegionSection *section)
>   {
> @@ -2000,6 +2016,8 @@ int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
>               struct vhost_virtqueue *vq = hdev->vqs + i;
>               vhost_device_iotlb_miss(hdev, vq->used_phys, true);
>           }
> +
> +        vdev->ats_ctrl_trigger = vhost_deviotlb_ctrl_trigger;


Changing virtio method in the vhost seems a layer violation.

I wonder if the following is better

1) have a virtio-net method in VirtioDeviceClass as ats trigger

2) call vhost_ops to enable/disable device IOTLB in this ats trigger 
(and do nothing if there's no vhost attached)

Thanks


>       }
>       vhost_start_config_intr(hdev);
>       return 0;
> @@ -2055,6 +2073,7 @@ void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev, bool vrings)
>               hdev->vhost_ops->vhost_set_iotlb_callback(hdev, false);
>           }
>           memory_listener_unregister(&hdev->iommu_listener);
> +        vdev->ats_ctrl_trigger = NULL;
>       }
>       vhost_stop_config_intr(hdev);
>       vhost_log_put(hdev, true);


