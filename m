Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CABDD5B8EF0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 20:36:30 +0200 (CEST)
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYXFN-0005B9-SS
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 14:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYX9k-0000dO-PX
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 14:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYX9g-0005Jr-BB
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 14:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663180235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0E6UPhPVAJOqCkjdHtOurmctsy9GzvOSwPZbfLW5+4s=;
 b=iA4nURX/cETFVPsVEq9AqJ7K8KtaX1BOvUldoFqaGLsp1NJMcZe0xDlCrBX9Z9tGdACNO/
 KawdPr6foiJ+1J6T4o3HQU345046fitgznE0ke2dL1M8QnHpRP1QRSQYuhKjeVXfh8UJKB
 zwNMCHo+T9/iBZWuFhBZ+/6r+LYZ7Gw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-hgWa9tAHPaeBHWQnQ6jJ_g-1; Wed, 14 Sep 2022 14:30:33 -0400
X-MC-Unique: hgWa9tAHPaeBHWQnQ6jJ_g-1
Received: by mail-il1-f200.google.com with SMTP id
 h5-20020a056e021d8500b002eb09a4f7e6so11035852ila.14
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 11:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=0E6UPhPVAJOqCkjdHtOurmctsy9GzvOSwPZbfLW5+4s=;
 b=5xV2nxR5+WbSM8tIUjphPEHIAJLA52ZPAw0Y6aI4TRkntT8APxbPogOkLtLYfwyQA9
 VaVLS7k07OFqxKkHP9vmHa/yEoR4nP4dzcZdrePPLAm/CjyamWiXLnVrMRYoYJD6ZNrX
 qg+IINihPrFTCuhSTk+X6SXWkFbEDVCcROdzPU7Ax96tgFoepxDPlHCRkJ3uUeOVF0O/
 c7CUbl41fi2GEunMh2qJYsGDAeEKUzSkidadotUtQR8oVpM4Ik6/zEc9kUaryy9eQ+dy
 dSsx2x7Bp8omsmD/juD0DdkATrF7s+L/gEYLx0x2K/GmL6rcsqLaC8IsEdLt9NZ/xr08
 4USA==
X-Gm-Message-State: ACgBeo0cJ0YY8WiauGRs0neK3DMVDrS+bwe1pj9vkQ30XuZ9ME/R0sdT
 C36scXvz0jGx4wAxVwxihBFl1sjM92EUxJt/3ydWybVXBjCP7dpbBNgoKqks87C6sWc5jQtkp+p
 N7MPP88s6szqtbDc=
X-Received: by 2002:a05:6638:d48:b0:351:497c:89a9 with SMTP id
 d8-20020a0566380d4800b00351497c89a9mr19972252jak.278.1663180233162; 
 Wed, 14 Sep 2022 11:30:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR70Se/XKQ+JS6FnOqd/s/ySh1j/iWHrs+9pE2vkR2RTYPPzD4x5vIKaPo4fTejtOM9uITGt5A==
X-Received: by 2002:a05:6638:d48:b0:351:497c:89a9 with SMTP id
 d8-20020a0566380d4800b00351497c89a9mr19972233jak.278.1663180232870; 
 Wed, 14 Sep 2022 11:30:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f2-20020a056602088200b006a134d3b378sm6051747ioz.11.2022.09.14.11.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 11:30:32 -0700 (PDT)
Date: Wed, 14 Sep 2022 12:30:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>,
 <kwankhede@nvidia.com>, <avihaih@nvidia.com>, <shayd@nvidia.com>,
 <jgg@nvidia.com>
Subject: Re: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
Message-ID: <20220914123031.04fb8bfc.alex.williamson@redhat.com>
In-Reply-To: <20220914121029.1a693e5d.alex.williamson@redhat.com>
References: <20220910004245.2878-1-nicolinc@nvidia.com>
 <8735cwu5r7.fsf@redhat.com> <Yx+b0t20wtneTry+@Asurada-Nvidia>
 <20220914121029.1a693e5d.alex.williamson@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, 14 Sep 2022 12:10:29 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Mon, 12 Sep 2022 13:51:30 -0700
> Nicolin Chen <nicolinc@nvidia.com> wrote:
> 
> > On Mon, Sep 12, 2022 at 02:38:52PM +0200, Cornelia Huck wrote:  
> > > External email: Use caution opening links or attachments
> > > 
> > > 
> > > On Fri, Sep 09 2022, Nicolin Chen <nicolinc@nvidia.com> wrote:
> > >     
> > > > Its caller vfio_connect_container() assigns a default value
> > > > to info->iova_pgsizes, even if vfio_get_iommu_info() fails.
> > > > This would result in a "Segmentation fault" error, when the
> > > > VFIO_IOMMU_GET_INFO ioctl errors out.
> > > >
> > > > Since the caller has g_free already, drop the g_free in its
> > > > rollback routine and add a line of comments to highlight it.    
> > > 
> > > There's basically two ways to fix this:
> > > 
> > > - return *info in any case, even on error
> > > - free *info on error, and make sure that the caller doesn't try to
> > >   access *info if the function returned !0
> > > 
> > > The problem with the first option is that the caller will access invalid
> > > information if it neglects to check the return code, and that might lead
> > > to not-that-obvious errors; in the second case, a broken caller would at
> > > least fail quickly with a segfault. The current code is easier to fix
> > > with the first option.
> > > 
> > > I think I'd prefer the second option; but obviously maintainer's choice.    
> > 
> > The caller does check rc all the time. So I made a smaller fix
> > (the first option). Attaching the git-diff for the second one.
> > 
> > Alex, please let me know which one you prefer. Thanks!
> > 
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index 51b2e05c76..74431411ab 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c  
> [snip]
> 
> I think we can do better than that, I don't think we need to maintain
> the existing grouping, and that FIXME comment is outdated and has
> drifted from the relevant line of code.  What about:
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9ba1..8d8c54d59083 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -2111,29 +2111,31 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      {
>          struct vfio_iommu_type1_info *info;
>  
> -        /*
> -         * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
> -         * IOVA whatsoever.  That's not actually true, but the current
> -         * kernel interface doesn't tell us what it can map, and the
> -         * existing Type1 IOMMUs generally support any IOVA we're
> -         * going to actually try in practice.
> +	/*
> +         * Setup defaults for container pgsizes and dma_max_mappings if not
> +         * provided by kernel below.
>           */
> -        ret = vfio_get_iommu_info(container, &info);
> -
> -        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
> -            /* Assume 4k IOVA page size */
> -            info->iova_pgsizes = 4096;
> -        }
> -        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
> -        container->pgsizes = info->iova_pgsizes;
> -
> -        /* The default in the kernel ("dma_entry_limit") is 65535. */
> +        container->pgsizes = 4096;
>          container->dma_max_mappings = 65535;
> +
> +        ret = vfio_get_iommu_info(container, &info);
>          if (!ret) {

Or better still:

            if (!vfio_get_iommu_info(container, &info)) {

> +            if (info->flags & VFIO_IOMMU_INFO_PGSIZES) {
> +                container->pgsizes = info->iova_pgsizes;
> +            }
> +
>              vfio_get_info_dma_avail(info, &container->dma_max_mappings);
>              vfio_get_iommu_info_migration(container, info);
> +            g_free(info);
>          }
> -        g_free(info);
> +
> +        /*
> +         * FIXME: We should parse VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
> +         * information to get the actual window extent rather than assume
> +         * a 64-bit IOVA address space.
> +         */
> +        vfio_host_win_add(container, 0, (hwaddr)-1, container->pgsizes);
> +
>          break;
>      }
>      case VFIO_SPAPR_TCE_v2_IOMMU:
> 


