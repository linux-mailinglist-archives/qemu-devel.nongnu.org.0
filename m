Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FFC45D3F0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 05:32:15 +0100 (CET)
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq6Qg-0000rZ-Ce
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 23:32:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mq6Pf-00004u-6j
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 23:31:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mq6Pa-0001R9-9U
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 23:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637814663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TlyYAAkcq7PtAxp3Cxfbkow9wYhl/dog8bKRddqpN7Q=;
 b=itg2Jc3M80OiNCnbgttAuGL1at8muIWHzmzIDnf9cck11trgsnhaU49doUZArGd7RgVa5A
 Ym6eKAWxnRcTWVLbZoNl2PpqdKlqfeZThyFJvndpTvZTTiMV9oqh+DW3TWKaA0hYeybRoq
 pAVtaHp2V5qGHur0atnMi3bdTqgwmZ8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-HKN8QuTbMoyhd6ruY4e9aA-1; Wed, 24 Nov 2021 23:31:01 -0500
X-MC-Unique: HKN8QuTbMoyhd6ruY4e9aA-1
Received: by mail-pl1-f200.google.com with SMTP id
 f16-20020a170902ce9000b001436ba39b2bso1576593plg.3
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 20:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TlyYAAkcq7PtAxp3Cxfbkow9wYhl/dog8bKRddqpN7Q=;
 b=10Zh6Yz6AKwgxLVK4sMvlO85Le1nuxj/SvFhCmaMwi6wNPNrn8gUF1Xnj29h4sS1r/
 p0PoUcT9jU+bfwYw6UIJ5NMaKD+xq6z2XNZ3kijbtTx3f8XG8EByfw4IDK9bjXLVo5xr
 9ulrxGgL4yV+vUTLmf0y7jbDs0eCKfUo3W2ifjt55G3DnO+amRs499zVkdcdaZgXlINY
 AEN7ys5C5Nd8RliSvq1VGCiaIxweR27d5gZyj605zoBHZMxJzqpFmv9xd8JmeaBqpxYa
 8ExEfHpXc/1cPAVBg9WSbqXcl9SIEpayslOn+0aqumdZt1dmkonP2DcfiddV5n0ZHdyF
 /gkQ==
X-Gm-Message-State: AOAM533hF1qxqAAmbb4jP16TCkm2NqaOYuiqxZpyTVjreXDSo8CpHXV+
 xL3ZbTMiHzKjGprBLKWVNb0XiJCAlBwTCyB/zXmvA0Cny4ki0JRQEtAVb5sJ3tHiiV10sf2bkYb
 v3hcmTdmiQz9djB8=
X-Received: by 2002:a05:6a00:124a:b0:4a4:cfd2:b40f with SMTP id
 u10-20020a056a00124a00b004a4cfd2b40fmr11902897pfi.57.1637814660688; 
 Wed, 24 Nov 2021 20:31:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO3jAaY2n0GmQfnZzjtctBv5MQ1pPR5ko5TLDOAE2BsfbAYg4mZZdhkkOWDBN5pSKbZOuPXA==
X-Received: by 2002:a05:6a00:124a:b0:4a4:cfd2:b40f with SMTP id
 u10-20020a056a00124a00b004a4cfd2b40fmr11902877pfi.57.1637814660397; 
 Wed, 24 Nov 2021 20:31:00 -0800 (PST)
Received: from xz-m1.local ([94.177.118.150])
 by smtp.gmail.com with ESMTPSA id o6sm1300894pfh.70.2021.11.24.20.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 20:30:59 -0800 (PST)
Date: Thu, 25 Nov 2021 12:30:54 +0800
From: Peter Xu <peterx@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Message-ID: <YZ8RfrbwXEB2fcJv@xz-m1.local>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 04:03:34AM +0000, Liu, Yi L wrote:
> > From: Peter Xu <peterx@redhat.com>
> > Sent: Wednesday, November 24, 2021 3:57 PM
> > 
> > On Wed, Nov 24, 2021 at 02:03:09PM +0800, Jason Wang wrote:
> > > When booting with scalable mode, I hit this error:
> > >
> > > qemu-system-x86_64: vtd_iova_to_slpte: detected splte reserve non-
> > zero iova=0xfffff002, level=0x1slpte=0x102681803)
> > > qemu-system-x86_64: vtd_iommu_translate: detected translation failure
> > (dev=01:00:00, iova=0xfffff002)
> > > qemu-system-x86_64: New fault is not recorded due to compression of
> > faults
> > >
> > > This is because the SNP bit is set since Linux kernel commit
> > > 6c00612d0cba1 ("iommu/vt-d: Report right snoop capability when using
> > > FL for IOVA") where SNP bit is set if scalable mode is on though this
> > > seems to be an violation on the spec which said the SNP bit is
> > > considered to be reserved if SC is not supported.
> > 
> > When I was reading that commit, I was actually confused by this change:
> > 
> > ---8<---
> > diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> > index 956a02eb40b4..0ee5f1bd8af2 100644
> > --- a/drivers/iommu/intel/iommu.c
> > +++ b/drivers/iommu/intel/iommu.c
> > @@ -658,7 +658,14 @@ static int domain_update_iommu_snooping(struct
> > intel_iommu *skip)
> >         rcu_read_lock();
> >         for_each_active_iommu(iommu, drhd) {
> >                 if (iommu != skip) {
> > -                       if (!ecap_sc_support(iommu->ecap)) {
> > +                       /*
> > +                        * If the hardware is operating in the scalable mode,
> > +                        * the snooping control is always supported since we
> > +                        * always set PASID-table-entry.PGSNP bit if the domain
> > +                        * is managed outside (UNMANAGED).
> > +                        */
> > +                       if (!sm_supported(iommu) &&
> > +                           !ecap_sc_support(iommu->ecap)) {
> >                                 ret = 0;
> >                                 break;
> >                         }
> > ---8<---
> > 
> > Does it mean that for some hardwares that has sm_supported()==true, it'll
> > have  SC bit cleared in ecap register?  That sounds odd, and not sure why.  Maybe
> > Yi Liu or Yi Sun may know?
> 
> scalable mode has no dependency on SC, so it's possible.

I see; thanks, Yi.

However then OTOH I don't understand above comment 

  "If the hardware is operating in the scalable mode, the snooping control is
   always supported since... "

Because the current qemu vt-d emulation should fall into the case that Yi
mentioned - we support initial scalable mode but no SC yet..

Cc Baolu too.

-- 
Peter Xu


