Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF9A5B8F7B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 22:09:03 +0200 (CEST)
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYYgv-0000VK-5v
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 16:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYYbf-00063r-NV
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 16:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYYbc-0003aO-Aa
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 16:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663185811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86z2ppLo9xkVF3Rhcu3WdL0c64obJCDxfGfdrd0iEz0=;
 b=MEylZijiBMUfXPN1qI406q3P86ETljoqlv3ti1+QgIUf7ubxMzO2I9jN9vJnhXqrJv1evU
 poCrvVE//HrL3AG1QFLlFTeDRRE46a/hiCMz/PmQqw1DQetRVA/rUcJqEG7L/8HvRA+65W
 1Ln2lfk8nL5wn5IeVHGqlJ5BlazniPg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-dPVj_Mr3MfSsybcVzCUDAA-1; Wed, 14 Sep 2022 16:03:27 -0400
X-MC-Unique: dPVj_Mr3MfSsybcVzCUDAA-1
Received: by mail-io1-f70.google.com with SMTP id
 v20-20020a6b5b14000000b0069fee36308eso9272594ioh.10
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 13:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=86z2ppLo9xkVF3Rhcu3WdL0c64obJCDxfGfdrd0iEz0=;
 b=C3V3MZ7z8PkCVqUuWH2N30RyE3YnaQqLASbGnOEOw0PKarOv+gqoXN7FBjASQcXQhg
 nOTmtq17sG6wRekFDxL3NgycBdjW2NRYFe9WLyRtfQc0xftWGBTaWA0voYwvrB1BDZSG
 lZ7rezlz7+sLiaeDdRAiDAZi7FFzW3BYisIaECeTJizDfJIjVOe9JwQlEtst1P0mg/Of
 SLS0RZcZz8wRqRbX7Vc5cQwglfeWbyumN7WWR0k+Oxd9kkesteciTS4YuGHOFiBEBf2t
 hwQnjp9PW5UPCT52bx4TKD8fWEw2v2v+Wsc38pocv+nLEv7lUNq8WrMrOX1iHgQcSgq2
 PDig==
X-Gm-Message-State: ACgBeo00yDzc/WaW5I01Ohzxf8EOD2BmdzQSvIrceyGeHd3yhjh2iqVM
 pSkue0CZO9EUZDocNFl2CGbvY7Sly1gmBeb8ZhNL72mOnjUxz4rK/GDjWVmHiizb6sypiSb8dB4
 BGVXlQ/TXCtKBEnY=
X-Received: by 2002:a92:6912:0:b0:2ea:fa2e:462d with SMTP id
 e18-20020a926912000000b002eafa2e462dmr15318485ilc.155.1663185806954; 
 Wed, 14 Sep 2022 13:03:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5B4F88fAvVKUgB9zfz612AW7MVwTZJhVZVO7hDuFxDHESU1fWgTH6QUyUhM0tuJgf7VQG5Vg==
X-Received: by 2002:a92:6912:0:b0:2ea:fa2e:462d with SMTP id
 e18-20020a926912000000b002eafa2e462dmr15318477ilc.155.1663185806710; 
 Wed, 14 Sep 2022 13:03:26 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 v14-20020a056e0213ce00b002f13f7fef56sm7014146ilj.50.2022.09.14.13.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 13:03:26 -0700 (PDT)
Date: Wed, 14 Sep 2022 14:03:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>,
 <kwankhede@nvidia.com>, <avihaih@nvidia.com>, <shayd@nvidia.com>,
 <jgg@nvidia.com>
Subject: Re: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
Message-ID: <20220914140325.41bd470d.alex.williamson@redhat.com>
In-Reply-To: <20220914135339.665b90b1.alex.williamson@redhat.com>
References: <20220910004245.2878-1-nicolinc@nvidia.com>
 <8735cwu5r7.fsf@redhat.com> <Yx+b0t20wtneTry+@Asurada-Nvidia>
 <20220914121029.1a693e5d.alex.williamson@redhat.com>
 <YyIlYK6TKmBRmUqI@Asurada-Nvidia>
 <20220914135339.665b90b1.alex.williamson@redhat.com>
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

On Wed, 14 Sep 2022 13:53:39 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Wed, 14 Sep 2022 12:02:56 -0700
> Nicolin Chen <nicolinc@nvidia.com> wrote:
> 
> > Hi Alex,
> > 
> > On Wed, Sep 14, 2022 at 12:10:29PM -0600, Alex Williamson wrote:
> >   
> > > > > > Its caller vfio_connect_container() assigns a default value
> > > > > > to info->iova_pgsizes, even if vfio_get_iommu_info() fails.
> > > > > > This would result in a "Segmentation fault" error, when the
> > > > > > VFIO_IOMMU_GET_INFO ioctl errors out.
> > > > > >
> > > > > > Since the caller has g_free already, drop the g_free in its
> > > > > > rollback routine and add a line of comments to highlight it.    
> > > > >
> > > > > There's basically two ways to fix this:
> > > > >
> > > > > - return *info in any case, even on error
> > > > > - free *info on error, and make sure that the caller doesn't try to
> > > > >   access *info if the function returned !0
> > > > >
> > > > > The problem with the first option is that the caller will access invalid
> > > > > information if it neglects to check the return code, and that might lead
> > > > > to not-that-obvious errors; in the second case, a broken caller would at
> > > > > least fail quickly with a segfault. The current code is easier to fix
> > > > > with the first option.
> > > > >
> > > > > I think I'd prefer the second option; but obviously maintainer's choice.    
> > > >
> > > > The caller does check rc all the time. So I made a smaller fix
> > > > (the first option). Attaching the git-diff for the second one.
> > > >
> > > > Alex, please let me know which one you prefer. Thanks!    
> >   
> > > I think we can do better than that, I don't think we need to maintain
> > > the existing grouping, and that FIXME comment is outdated and has
> > > drifted from the relevant line of code.  What about:    
> > 
> > Your patch looks good and clean to me (some nits inline).
> > 
> > Would you please send and merge it, replacing mine?
> >   
> > > +       /*
> > > +         * Setup defaults for container pgsizes and dma_max_mappings if not
> > > +         * provided by kernel below.
> > >           */    
> > 
> > Indentation is misaligned at the first line.  
> 
> Oops, will run through checkpatch.
> 
> >   
> > > +        container->pgsizes = 4096;    
> > 
> > This might be a separate question/issue: I wonder if we should use
> > "sysconf(_SC_PAGE_SIZE)" here instead of 4096.
> > 
> > With a kernel using a larger page size, e.g. CONFIG_ARM64_64K_PAGES,
> > the IO page size is likely to be 64K too. If the ioctl fails, this
> > default 4K setup won't work.  
> 
> Perhaps, but IIRC this solution came about because we originally forgot
> to expose the IOMMU_INFO flag to indicate the pgsize field was valid.
> At the time we only supported 4K systems, so it made sense to provide
> this default, though it is indeed dated.
> 
> TBH, I don't really see why we should try to continue if the ioctl
> itself fails, so maybe this should be:
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index ace9562a9ba1..ad188b7649e6 100644
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
> -         */
>          ret = vfio_get_iommu_info(container, &info);
> +        if (ret) {

Clearly untested,

               ret = -errno;

> +            error_setg_errno(errp, -ret, "Failed to get VFIO IOMMU info");
> +            goto enable_discards_exit:;
> +        }
>  
> -        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
> -            /* Assume 4k IOVA page size */
> -            info->iova_pgsizes = 4096;
> +        if (info->flags & VFIO_IOMMU_INFO_PGSIZES) {
> +            container->pgsizes = info->iova_pgsizes;
> +        } else {
> +            container->pgsizes = qemu_real_host_page_size();
>          }
> -        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
> -        container->pgsizes = info->iova_pgsizes;
>  
> -        /* The default in the kernel ("dma_entry_limit") is 65535. */
> -        container->dma_max_mappings = 65535;
> -        if (!ret) {
> -            vfio_get_info_dma_avail(info, &container->dma_max_mappings);
> -            vfio_get_iommu_info_migration(container, info);
> +        if (!vfio_get_info_dma_avail(info, &container->dma_max_mappings)) {
> +            container->dma_max_mappings = 65535;
>          }
> +        vfio_get_iommu_info_migration(container, info);
>          g_free(info);
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


