Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D763C3F0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:39:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02hS-0002Ob-JO; Tue, 29 Nov 2022 10:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p02hK-0002Nu-Sb
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p02hJ-0002n6-E4
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669736340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4K4itBrEfZCKK5ZI3lKCZb9vRtlhOJbGdR+VTlRz+HM=;
 b=YPXXc6XLF+AWLq6mnFhQzBTonUqUpDQNex9PDo6jo5TRiS5jYlJbx4ja3VLbFmf2doqC7a
 +80J+iA0ktWnApb6bKoeGIxhI7J5kO9X8zuLYE0I5tYquiedZu27W8JuBFl4Oa1C3grudd
 NHEykwggqgnI7v5QvxVZEpTN/9XV878=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-HZD_AU2wOpi13DTDANXHZg-1; Tue, 29 Nov 2022 10:38:53 -0500
X-MC-Unique: HZD_AU2wOpi13DTDANXHZg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bs7-20020a05620a470700b006fac7447b1cso29813968qkb.17
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4K4itBrEfZCKK5ZI3lKCZb9vRtlhOJbGdR+VTlRz+HM=;
 b=YXPGSbhW/FOdHE87w1eezOBQItiGFlei976kORFljLtq55aJsINtYKVwS1cr/hW+RE
 xv9+qmueca6C3oDIpdr31BstgpMP48xkbnc/orY1BgmPHSDdMWLIHRUTGbjTDEVl+NDA
 jC3Q/mjtUqgPtfz5ANYFlV4PM5duUEOwY6norn1Y/Q9I132T/UifzKz8fv02k51+g0Ci
 u7V2LIottk/Y9HWIXRoWFG8hTsk+wvYcsqZKygbKxB5E5Bn4bR8jKspzI173lz3+Vnna
 k/bH459cHGZ43pGWYCNxoZZ1Pzp6/vdtcvA2OFrpbJIhyL2c7HnsCqhwYlYthNRYabqG
 6hww==
X-Gm-Message-State: ANoB5pmjyWWhrtwuXgB+ADNJ3VsHnQNnLydCshvEQKagvw/18UhcpO36
 Fa5JSW9DXaGPYes/Qs+rjKssRgShcB+1nLhYL2yGMqqOCyocHga1q+Xv826ZXMLQOqhpFpHf97W
 Ft36Ls1Sudi5HEV8=
X-Received: by 2002:a05:622a:5c8b:b0:3a5:b02:a3b7 with SMTP id
 ge11-20020a05622a5c8b00b003a50b02a3b7mr37046572qtb.277.1669736332422; 
 Tue, 29 Nov 2022 07:38:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Brtvfykasrhi39odgutjjiwTFTZuat07zKkg75Rcp0C/sswvJGjaQ1qJutBWhr8PBr1BaNA==
X-Received: by 2002:a05:622a:5c8b:b0:3a5:b02:a3b7 with SMTP id
 ge11-20020a05622a5c8b00b003a50b02a3b7mr37046554qtb.277.1669736332165; 
 Tue, 29 Nov 2022 07:38:52 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05620a244900b006fa617ac616sm10820669qkn.49.2022.11.29.07.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 07:38:51 -0800 (PST)
Date: Tue, 29 Nov 2022 10:38:50 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Message-ID: <Y4YnihBw2DBi/7wz@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-3-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221129081037.12099-3-jasowang@redhat.com>
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

On Tue, Nov 29, 2022 at 04:10:36PM +0800, Jason Wang wrote:
> Without dt mode, device IOTLB notifier won't work since guest won't
> send device IOTLB invalidation descriptor in this case. Let's fail
> early instead of misbehaving silently.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 9143376677..d025ef2873 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>  {
>      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
>      IntelIOMMUState *s = vtd_as->iommu_state;
> +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
>  
>      /* TODO: add support for VFIO and vhost users */
>      if (s->snoop_control) {
> @@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>                           PCI_FUNC(vtd_as->devfn));
>          return -ENOTSUP;
>      }
> +    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
> +        error_setg_errno(errp, ENOTSUP,
> +                         "device %02x.%02x.%x requires device IOTLB mode",
> +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> +                         PCI_FUNC(vtd_as->devfn));
> +        return -ENOTSUP;
> +    }

Hmm I thought we have had this already, so we don't?... :-(

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


