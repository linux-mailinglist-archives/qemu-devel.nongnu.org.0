Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967AC588F93
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 17:42:38 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJGW5-0006aS-Mc
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 11:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJGRx-0002jl-R9
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJGRu-0007NK-PY
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 11:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659541089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u3Qn8TzvMIW+3Z1vBnQ3p2NQYXszvCdsvR3UmpbTyXU=;
 b=HcBq7ZRtQS9rNP4pLEZjdky2oYm7P5OnlB/7Idbnynj9y2FeRbmrHSXaVpyCa2+kX+eh6w
 XG0bsh4ytfzMp1aZ25EXzOviKRH0mn3I/tBeXQq+4BTTMxDRyj5jSaS3hQAzGWuBih/Acc
 j4zwcd3KGDsky0KbMEkeSb2EVyA4fws=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-nORj2swoMta0BI2DcRrCfg-1; Wed, 03 Aug 2022 11:38:08 -0400
X-MC-Unique: nORj2swoMta0BI2DcRrCfg-1
Received: by mail-ed1-f70.google.com with SMTP id
 m22-20020a056402431600b0043d6a88130aso7046701edc.18
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 08:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=u3Qn8TzvMIW+3Z1vBnQ3p2NQYXszvCdsvR3UmpbTyXU=;
 b=SHhDTMv44uEePC1GYaYSafy3hrBPhKulg8xchCjOf3ISo+e4GodmVLXigrthncJr5T
 WCbuBeKAByFamNMoa9GohphLnwY4/oGySHMiKaTRVhDcu0piAjO5GbPXVm6zS1yuQ/fx
 BVcsJYUWNJUsbG4VBOU0oyRCRJXZ+StZDAdF8VWbFDbBt2p8jlmO0H2qNXsGQC5Wpc/r
 83hDdoSxTDhix9xcACso5RVashpdAybS0fTitmiHI1cKN4cdPFRD/sPXY89dX+EPz9ow
 FcfOEKggEybmWLSOSki0Pwq8Vl0cCj5RzUTNvs/JUHt07Ag8LhjozDl6OcluvSIBM6NO
 f36Q==
X-Gm-Message-State: ACgBeo1siToYL/ghYdnQf+ObTgAERXjHS7oUtdPruE2V/j6HQllAFFlj
 0O8UFy7UFij3dxAEP5B/oUfmTPecH8DXNvzEK5Iqdr0WQR38mu3dxwCo5HkLC1ntWRwcqTArV0B
 hLF008jxuRVNmqg8=
X-Received: by 2002:a05:6402:3689:b0:43e:43d6:6039 with SMTP id
 ej9-20020a056402368900b0043e43d66039mr3393232edb.341.1659541086986; 
 Wed, 03 Aug 2022 08:38:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR47lOy4SaZRWap7p+2yVsRJlGUC8bnCMUZEVcXzVMNbaxZNiVLfiLfNOwBYzhDbeWpkR2i7QA==
X-Received: by 2002:a05:6402:3689:b0:43e:43d6:6039 with SMTP id
 ej9-20020a056402368900b0043e43d66039mr3393212edb.341.1659541086722; 
 Wed, 03 Aug 2022 08:38:06 -0700 (PDT)
Received: from redhat.com ([2.54.191.86]) by smtp.gmail.com with ESMTPSA id
 m9-20020aa7c2c9000000b0043bbf79b3ebsm9697589edp.54.2022.08.03.08.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 08:38:05 -0700 (PDT)
Date: Wed, 3 Aug 2022 11:38:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 2/2] virtio: Add shared memory capability
Message-ID: <20220803113741-mutt-send-email-mst@kernel.org>
References: <20220803152135.118298-1-antonio.caggiano@collabora.com>
 <20220803152135.118298-3-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220803152135.118298-3-antonio.caggiano@collabora.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 03, 2022 at 05:21:35PM +0200, Antonio Caggiano wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG'
> and the data structure 'virtio_pci_shm_cap' to go with it.
> They allow defining shared memory regions with sizes and offsets
> of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by a device-specific 'id'.
> 
> v2: Remove virtio_pci_shm_cap as virtio_pci_cap64 is used instead.
> v3: No need for mask32 as cpu_to_le32 truncates the value.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>


looks like the patches are in the reverse order, 1/2 won't
build without 2/2
> ---
>  hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
>  include/hw/virtio/virtio-pci.h |  4 ++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 45327f0b31..50bd230122 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1164,6 +1164,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
>      return offset;
>  }
>  
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id)
> +{
> +    struct virtio_pci_cap64 cap = {
> +        .cap.cap_len = sizeof cap,
> +        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
> +    };
> +
> +    cap.cap.bar = bar;
> +    cap.cap.length = cpu_to_le32(length);
> +    cap.length_hi = cpu_to_le32(length >> 32);
> +    cap.cap.offset = cpu_to_le32(offset);
> +    cap.offset_hi = cpu_to_le32(offset >> 32);
> +    cap.cap.id = id;
> +    return virtio_pci_add_mem_cap(proxy, &cap.cap);
> +}
> +
>  static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>                                         unsigned size)
>  {
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
> index 2446dcd9ae..5e5c4a4c6d 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -252,4 +252,8 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
>   */
>  unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
>  
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id);
> +
>  #endif
> -- 
> 2.34.1


