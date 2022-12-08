Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630606469D2
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:44:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BYJ-0002mD-Si; Thu, 08 Dec 2022 02:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p3BYI-0002m5-2b
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:42:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p3BYG-00088f-97
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670485359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VxUrTRK80Iy91dhQVLTdrfAKZWIn9tsSAOybZ1TkslI=;
 b=YpgjESTHnIqkAFoZ2MPWACAWhvLIWjciGT3DLVSPUDH9sdUdzUNW06MdENBSfqx1ul9pDg
 i1CsRHd4uncL2cj6qhjzOd+iAPVtwC2lPtxbGYjwOajupbefOrh3Aib+U2MCSjz6WD0K3T
 Sl1c+bDbwtEogq3+kfPjghjiJ7lzumo=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-t3INDEl4Of2NCF3U_3xzWQ-1; Thu, 08 Dec 2022 02:42:37 -0500
X-MC-Unique: t3INDEl4Of2NCF3U_3xzWQ-1
Received: by mail-oi1-f198.google.com with SMTP id
 k26-20020a54469a000000b0035ac1417866so291832oic.18
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 23:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VxUrTRK80Iy91dhQVLTdrfAKZWIn9tsSAOybZ1TkslI=;
 b=mjKDoMrWSlmF0iEtDV8CJbQAf2QAjTql4uS3yJl9sOinXtAdtYHNXK6GWhdon9c7ne
 sFYFWnIOOztwWAeenG5/3UJLQ32JXGOPso8QuBL5DDvBoR+QAZnn+gEvRpQapIkkFE0R
 k0VFbHaA8VeLDR/+e/icMZI4VC3p8nvQ/qSEfIH9yc3pHofUPf2A6r88ZuNFC+AOQ3TG
 AR+IITGX4Q8X54YisizeFkkEQ6UkQBdWM5sXS8cBJRoVreMLW8yrY1j5MWj0FlwBkyWQ
 BxSi0358BUn5HE4dME65sS2522HgxbrMSTtrYYN0Jm13tzXcu8Zsjwani9HKksKfWjMB
 BBDA==
X-Gm-Message-State: ANoB5pkzmJuR00BUdtIPsw+Y97UU3V3Uidhq2eszOvZbOuzT/of0gKat
 BMTlPirfgLtmycxcV89HbQXgCM53ZViptIj5eDs+Ira4piExyVn2a54yXu79NEsnU74kiO6LX1b
 wjMQDQZ0p+iQEVqUwHpVQKkUG0Bu2Sos=
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id
 k38-20020a4a94a9000000b004808f4a7062mr30320362ooi.57.1670485357046; 
 Wed, 07 Dec 2022 23:42:37 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6AghclD96fyuwDbXfQ7DS1LmLOdphZg5haiYYVvysyv02DWyurtOQnNqHDOmOztC5NnHFVyHBCm4Gv1USv3B8=
X-Received: by 2002:a4a:94a9:0:b0:480:8f4a:7062 with SMTP id
 k38-20020a4a94a9000000b004808f4a7062mr30320357ooi.57.1670485356839; Wed, 07
 Dec 2022 23:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20221130053251.2606831-1-lulu@redhat.com>
 <20221130053251.2606831-2-lulu@redhat.com>
In-Reply-To: <20221130053251.2606831-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 8 Dec 2022 15:42:26 +0800
Message-ID: <CACGkMEvhg1gpF73XaNTYn_qRa9oOsye7rhkXHMSJ425M=f3cBw@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] vhost-vdpa: Skip the range check while MR is IOMMU
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Nov 30, 2022 at 1:33 PM Cindy Lu <lulu@redhat.com> wrote:
>
> Skip the check in vhost_vdpa_listener_skipped_section() while
> MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3ff9ce3501..f0e9963d19 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -60,15 +60,22 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>                       iova_min, section->offset_within_address_space);
>          return true;
>      }
> +    /*
> +     * While using vIOMMU, Sometimes the section will be larger than iova_max
> +     * but the memory that  actually mapping is smaller, So skip the check
> +     * here. Will add the check in vhost_vdpa_iommu_map_notify,
> +     *There is the real size that maps to the kernel
> +     */
>

I suggest squashing this into the next patch since we haven't
implemented vhost_vdpa_iommu_map_notify() yet.

Thanks

> -    llend = vhost_vdpa_section_end(section);
> -    if (int128_gt(llend, int128_make64(iova_max))) {
> -        error_report("RAM section out of device range (max=0x%" PRIx64
> -                     ", end addr=0x%" PRIx64 ")",
> -                     iova_max, int128_get64(llend));
> -        return true;
> +    if (!memory_region_is_iommu(section->mr)) {
> +        llend = vhost_vdpa_section_end(section);
> +        if (int128_gt(llend, int128_make64(iova_max))) {
> +            error_report("RAM section out of device range (max=0x%" PRIx64
> +                         ", end addr=0x%" PRIx64 ")",
> +                         iova_max, int128_get64(llend));
> +            return true;
> +        }
>      }
> -
>      return false;
>  }
>
> --
> 2.34.3
>


