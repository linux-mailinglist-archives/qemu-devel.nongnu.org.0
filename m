Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695667E670
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:19:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLOcH-0004BL-Um; Fri, 27 Jan 2023 08:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOc4-0003yS-2F
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:18:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLOc1-0003eX-Hc
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674825468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O5V9YwCDsVUtm2newnzP6i5UOR8lxGGix6zCnANyRYA=;
 b=EKfWjSLYO0J2CaZB912rg5Q7/evhbse8cpzljuPYevQlC0Ga6Omp8lxKyshahBcQZ0G7Y3
 GgmovDs3QYLhlx9Ntac6/ZjTOZ/KQqiKsaYlyfJ2ECpBvr+0F/HS2YvYMHKdMFK2PLX28u
 +y/4FZvdMzB0EsfNTrXwFJ3nMUtjvoY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-175-DlmSvOWuOViHj-HNwcCRyQ-1; Fri, 27 Jan 2023 08:17:44 -0500
X-MC-Unique: DlmSvOWuOViHj-HNwcCRyQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 u10-20020a5d6daa000000b002bfc2f61048so803913wrs.23
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O5V9YwCDsVUtm2newnzP6i5UOR8lxGGix6zCnANyRYA=;
 b=M7y0wH7TBRVFhmQ1wQgigSFGznwN3mk3ZBmxjTCAcO9Tgds0kYXQJOL9mpPWMcsreo
 /+XU8MN0kN9NuufHZ5k5BXZWlnlIOwvEsLM7i9FT0zMKc1VLK3QAJCxipgiza2hpRkVL
 sGUYleUnJr/Yr+P74Fix6g251z+/waLbazX09Tkx2J29LTw8uNMQWFfw9PXd3r6p2LVM
 AuOV06KdTYkcBY5GfyvhfPE4LyKo65jPblmCm3WBHBC+BDb7cxEygd+f5t+y4hIw93sE
 FwME4oFF5Z00CwHOzpXbbxqKgTCAkPDiRmGVcfUAAL31JYPzuyE8rGwgX7CiEP5TY0+z
 Ap0g==
X-Gm-Message-State: AO0yUKW9JfyjUezDvSiQFu2x7bz9funF+dLT3rmQcTbNfHIVRq+KdpHX
 7vlBPCqvZ6vWCbJNV88RyQoEQ+JWsIURiFLzNCJciMkbNlfMeUBmf2MwdJo30+Ve/LtDM+4jKpj
 Pp8gm9JzxZQ7ctaE=
X-Received: by 2002:a05:600c:a42:b0:3dc:1050:5553 with SMTP id
 c2-20020a05600c0a4200b003dc10505553mr13970937wmq.23.1674825463333; 
 Fri, 27 Jan 2023 05:17:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+mKwedQIE341Oo+WL5jdgbsH7wYxXAb5p3plGnLca4gUhkWBcz7RGyYglOTRKb338j5HsXww==
X-Received: by 2002:a05:600c:a42:b0:3dc:1050:5553 with SMTP id
 c2-20020a05600c0a4200b003dc10505553mr13970918wmq.23.1674825463136; 
 Fri, 27 Jan 2023 05:17:43 -0800 (PST)
Received: from redhat.com ([2.52.137.69]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c26d200b003da28dfdedcsm5069231wmv.5.2023.01.27.05.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:17:42 -0800 (PST)
Date: Fri, 27 Jan 2023 08:17:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Viktor Prutyanov <viktor@daynix.com>, peterx@redhat.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com,
 Yan Vugenfirer <yvugenfi@redhat.com>
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
Message-ID: <20230127081719-mutt-send-email-mst@kernel.org>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <CAPv0NP74wPer5uqrWYh8EeFO_YSATNuo5UpADD2QrE34=FwkrQ@mail.gmail.com>
 <CACGkMEvREZQGT=bbpbGAW4UmPreMJ=SriYp3d5L0_FCECQ6yvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEvREZQGT=bbpbGAW4UmPreMJ=SriYp3d5L0_FCECQ6yvg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 16, 2023 at 03:06:44PM +0800, Jason Wang wrote:
> On Mon, Jan 16, 2023 at 7:30 AM Viktor Prutyanov <viktor@daynix.com> wrote:
> >
> > On Tue, Nov 29, 2022 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > Hi All:
> > >
> > > According to ATS, device should work if ATS is disabled. This is not
> > > correctly implemented in the current intel-iommu since it doesn't
> > > handle the UNMAP notifier correctly. This breaks the vhost-net +
> > > vIOMMU without dt.
> > >
> > > The root casue is that the when there's a device IOTLB miss (note that
> > > it's not specific to PCI so it can work without ATS), Qemu doesn't
> > > build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> > > won't trigger the UNMAP notifier.
> > >
> > > Fixing by build IOVA tree during IOMMU translsation.
> > >
> > > Thanks
> > >
> > > Jason Wang (3):
> > >   intel-iommu: fail MAP notifier without caching mode
> > >   intel-iommu: fail DEVIOTLB_UNMAP without dt mode
> > >   intel-iommu: build iova tree during IOMMU translation
> > >
> > >  hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
> > >  1 file changed, 33 insertions(+), 25 deletions(-)
> > >
> > > --
> > > 2.25.1
> > >
> >
> > Hi Jason,
> >
> > I've tried the series with Windows Server 2022 guest with vhost and
> > intel-iommu (device-iotlb=off) and now networking on this system has
> > become working.
> > So, as we discussed, I'm waiting for the series to be accepted in some
> > form to continue my work about supporting guests who refuse Device-TLB
> > on systems with device-iotlb=on.
> >
> > Tested-by: Viktor Prutyanov <viktor@daynix.com>
> 
> Great, Peter has some comments on this series, so I will probably send
> a new version (probably after the chinese new year).
> 
> Thanks

Were you going to post a new version?

> >
> > Best regards,
> > Viktor Prutyanov
> >


