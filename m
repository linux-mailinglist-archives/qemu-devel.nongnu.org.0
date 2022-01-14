Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0339448E664
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 09:26:59 +0100 (CET)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HvD-00055y-O8
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 03:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8HGz-0001AO-At
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n8HGw-0006AB-7T
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 02:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642146316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ro3ALW41mNPk2tlc0zN6SpFn2JA1txz1LcXPYTI8TVs=;
 b=RBAbfXkYQcxHZycLrJbXasB4xelhERfIp1nRrTkwa95Ngl4/9dOYvplJozFXLKnQc68tBB
 x1EFrZfeJsfGizS0rjGYDePW/E9fH0ugahxynvzmy8lxU0/blEm3l6/Fdu+bhX5ik6NWam
 b1QdgM2QOdatw6naYlZc6tczrkUKvjY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-f6PEesnOOxiwc4n5xAseIg-1; Fri, 14 Jan 2022 02:45:15 -0500
X-MC-Unique: f6PEesnOOxiwc4n5xAseIg-1
Received: by mail-pj1-f71.google.com with SMTP id
 p1-20020a17090a680100b001b1ea621b81so8040940pjj.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 23:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ro3ALW41mNPk2tlc0zN6SpFn2JA1txz1LcXPYTI8TVs=;
 b=brvRC0sgrdNndRZJVvP0M85Cko/NHaPqmXGRI8jrLkCBY/xSVBPDZOzx0cDHd5Y6pu
 ayvhjLpfxV3uGgNiKBryjvpbOqnjbBbA0JpL/DoafRQSBuPhjpr1GpHdgmYUUHiCIiU3
 Wc1+ODtKFuerxA4C6H/gPDeCFKzj2SI6H37N/rykuAh0sApA605Y+PWFb+Z1xtMTQtIE
 OLAYycduRKh4dBVhuk1EzWY4TLxaR5wj2djboZENNRT3SXbP/n1HA/exyzyvImcHG6zf
 Mm5dRWGATNFYam7zgosLUyRkSdlx3p35SX/Xb3465+3zmhvQcjhkhfyOV08FQDY90rqE
 qK0A==
X-Gm-Message-State: AOAM532JIBZYIjXlL2ShZgYi0ZZttyDrwYGenQlA8R9GVELYAz6c8GCN
 Ls5dgCGmJRaz5cxHF6sKHRkVZEg0tArxF/odmy5wCvRXNqatA5hDjKxnnTPCSwcPjnfe4pGjTlM
 qWP+cTj48lTJekWc=
X-Received: by 2002:a17:90b:3503:: with SMTP id
 ls3mr581325pjb.186.1642146314769; 
 Thu, 13 Jan 2022 23:45:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvMyxtCEQj66Bin9tXEj/RJyN6uTC43VUQHDd/7XcxVmLzh0gVGMYo35PLoSgEnXUTAthVpg==
X-Received: by 2002:a17:90b:3503:: with SMTP id
 ls3mr581310pjb.186.1642146314479; 
 Thu, 13 Jan 2022 23:45:14 -0800 (PST)
Received: from xz-m1.local ([191.101.132.59])
 by smtp.gmail.com with ESMTPSA id 34sm3872156pgl.72.2022.01.13.23.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 23:45:13 -0800 (PST)
Date: Fri, 14 Jan 2022 15:45:08 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/3] intel-iommu: PASID support
Message-ID: <YeEqBADUtQmIa5Pc@xz-m1.local>
References: <20220105041945.13459-1-jasowang@redhat.com>
 <20220105041945.13459-5-jasowang@redhat.com>
 <Yd+zQRouwsB/jnV3@xz-m1.local>
 <8beffd3d-5eff-6462-ce23-faf44c6653f1@redhat.com>
 <YeDumkj9ZgPKGgoN@xz-m1.local>
 <CACGkMEun7WEhXy_ApxfgYmbVofjjKgGuA0ezPZG4ypRK+HtSfA@mail.gmail.com>
 <YeEifFCR6Rc5ObGg@xz-m1.local>
 <CACGkMEtGhBC2LDvzsLr+ZS+5mo_r09BOk-qp0suOP+YBUdFG+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtGhBC2LDvzsLr+ZS+5mo_r09BOk-qp0suOP+YBUdFG+g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>, yi.y.sun@linux.intel.com,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 03:22:16PM +0800, Jason Wang wrote:
> On Fri, Jan 14, 2022 at 3:13 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Jan 14, 2022 at 01:58:07PM +0800, Jason Wang wrote:
> > > > > Right, but I think you meant to do this only when scalable mode is disabled.
> > > >
> > > > Yes IMHO it will definitely suite for !scalable case since that's exactly what
> > > > we did before.  What I'm also wondering is even if scalable is enabled but no
> > > > "real" pasid is used, so if all the translations go through the default pasid
> > > > that stored in the device context entry, then maybe we can ignore checking it.
> > > > The latter is the "hacky" part mentioned above.
> > >
> > > The problem I see is that we can't know what PASID is used as default
> > > without reading the context entry?
> >
> > Can the default NO_PASID being used in mixture of !NO_PASID use case on the
> > same device?  If that's possible, then I agree..
> 
> My understanding is that it is possible.

OK.

> 
> >
> > My previous idea should be based on the fact that if NO_PASID is used on one
> > device, then all translations will be based on NO_PASID, but now I'm not sure
> > of it.
> 
> Actually, what I meant is:
> 
> device 1 using transactions without PASID with RID2PASID 1
> device 2 using transactions without PASID with RID2PASID 2
> 
> Then we can't assume a default pasid here.

This seems fine, because "device N" is still part of the equation when looking
up, so we won't lookup wrong.

But yeah.. it could not really work anyway.

> 
> >
> > >
> > > >
> > > > The other thing to mention is, if we postpone the iotlb lookup to be after
> > > > context entry, then logically we can have per-device iotlb, that means we can
> > > > replace IntelIOMMUState.iotlb with VTDAddressSpace.iotlb in the future, too,
> > > > which can also be more efficient.
> > >
> > > Right but we still need to limit the total slots and ATS is a better
> > > way to deal with the IOTLB bottleneck actually.
> >
> > I think it depends on how the iotlb ghash is implemented.  Logically I think if
> > we can split the cache to per-device it'll be slightly better because we don't
> > need to iterate over iotlbs of other devices when lookup anymore; meanwhile
> > each iotlb takes less space too (no devfn needed anymore).
> 
> So we've already used sid in the IOTLB hash, I wonder how much we can
> gain form this.

I think at least we can shrink iotlb structures, e.g.:

struct vtd_iotlb_key {
    uint16_t sid;               <------ not needed
    uint32_t pasid;             <------ not needed
    uint64_t gfn;
    uint32_t level;
};

struct VTDIOTLBEntry {
    uint64_t gfn;
    uint16_t domain_id;
    uint32_t pasid;             <------ not needed
    uint64_t slpte;
    uint64_t mask;
    uint8_t access_flags;
};

Thanks,

-- 
Peter Xu


