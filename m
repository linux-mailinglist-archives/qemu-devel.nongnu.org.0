Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C1460C26
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 02:20:22 +0100 (CET)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrVLB-0001t8-0F
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 20:20:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mrVKF-0001Dl-5F
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 20:19:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mrVKB-0003Md-GU
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 20:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638148757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WKudVW2HMOvirJfTiATxjjis1HU2IO/PlLZS3QZpUL4=;
 b=FwkaKmYreUl/dWs/DuauVpmBWB9azqUGxEc734ShzdsmU2pezV7LeI9fkUBJTKIyHjrJdv
 0xoD6Wm/HYDmA2Wnu7znFNKi7gi/6rvLWgYl5SlZjU73NTIYgM6B5vHAAJ3mfvTk/062mP
 d237rOR72ooPYGRVxGBcjT6WjnYVxbM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-iHCzYT0nMWKZ2m5ML_mJjQ-1; Sun, 28 Nov 2021 20:19:16 -0500
X-MC-Unique: iHCzYT0nMWKZ2m5ML_mJjQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 w2-20020a627b02000000b0049fa951281fso9767009pfc.9
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 17:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WKudVW2HMOvirJfTiATxjjis1HU2IO/PlLZS3QZpUL4=;
 b=efyj37MfXlxqnMkqU7r5JmCvI6Ge7uTszezx5dN+DH8gdxsz7l8r1//akaw+ZL5fOC
 7QMbegplMLXbbDEMRpTrA1dRy46TrwTIiCpNgCfl/ffJbHZ1NH6nJUWE6ISOd7DRglwt
 yewhw/uQyBuh3rSVaf/aZPbpebdYEHFYHqgG+I981QZivlau2dGUMbnW4yKuUz1XUY0u
 w0VEc3j5LcsBPPNXyvhwJKIZ+Klko30Cl2RHjJreh5reUsggasFNMPrL1q+IYgCHsY+I
 N1MJnSd8Ycx0rIXrMJAneyuNnYgq6q8JklvB6sUCsNXJ0tcSfIxqTVKEhOnNQEQBpCJY
 +Fbw==
X-Gm-Message-State: AOAM532PUyyZ3OALWR0AImqNCPo/p21/icgEd2VMDxGWSbTZAB9ZvpiL
 0eTLoxFr8Zzaovhopy8zF2qDAhT1jwYmdmfHTT4nztjKuFJro9sGzfgp+bT38/UR5Ib5qTrjt5c
 tLjXfBgrqx56g0bI=
X-Received: by 2002:a05:6a00:2391:b0:4a2:cb64:2e01 with SMTP id
 f17-20020a056a00239100b004a2cb642e01mr36193139pfc.45.1638148755305; 
 Sun, 28 Nov 2021 17:19:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHcnMyYAU+X3FRjS9XANjl6PokJdGc/+urJhBYP+ceWP5SLSPqCoy3ZgIvavj1XMoJqIaCqQ==
X-Received: by 2002:a05:6a00:2391:b0:4a2:cb64:2e01 with SMTP id
 f17-20020a056a00239100b004a2cb642e01mr36193105pfc.45.1638148754892; 
 Sun, 28 Nov 2021 17:19:14 -0800 (PST)
Received: from xz-m1.local ([94.177.118.150])
 by smtp.gmail.com with ESMTPSA id a10sm10435269pgw.25.2021.11.28.17.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 17:19:14 -0800 (PST)
Date: Mon, 29 Nov 2021 09:19:08 +0800
From: Peter Xu <peterx@redhat.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>
Subject: Re: [PATCH] intel-iommu: ignore SNP bit in scalable mode
Message-ID: <YaQqjEwDVUGurPD7@xz-m1.local>
References: <20211124060309.6872-1-jasowang@redhat.com>
 <YZ3wXo5XueDtuk8c@xz-m1.local>
 <PH0PR11MB56583B1E05F83EB56C28730BC3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8RfrbwXEB2fcJv@xz-m1.local>
 <PH0PR11MB5658E15F420BCBAD2AA58E23C3629@PH0PR11MB5658.namprd11.prod.outlook.com>
 <YZ8pi2ty2Z8wjt9u@xz-m1.local>
 <PH0PR11MB5658CC570A4E5B88CA3464A9C3659@PH0PR11MB5658.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB5658CC570A4E5B88CA3464A9C3659@PH0PR11MB5658.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 28, 2021 at 07:06:18AM +0000, Liu, Yi L wrote:
> > From: Peter Xu <peterx@redhat.com>
> > Sent: Thursday, November 25, 2021 2:14 PM
> > 
> > On Thu, Nov 25, 2021 at 05:49:38AM +0000, Liu, Yi L wrote:
> > > > From: Peter Xu <peterx@redhat.com>
> > > > Sent: Thursday, November 25, 2021 12:31 PM
> > > >
> > > > On Thu, Nov 25, 2021 at 04:03:34AM +0000, Liu, Yi L wrote:
> > > > > > From: Peter Xu <peterx@redhat.com>
> > > > > > Sent: Wednesday, November 24, 2021 3:57 PM
> > > > > >
> > > > > > On Wed, Nov 24, 2021 at 02:03:09PM +0800, Jason Wang wrote:
> > > > > > > When booting with scalable mode, I hit this error:
> > > > > > >
> > > > > > > qemu-system-x86_64: vtd_iova_to_slpte: detected splte reserve
> > non-
> > > > > > zero iova=0xfffff002, level=0x1slpte=0x102681803)
> > > > > > > qemu-system-x86_64: vtd_iommu_translate: detected translation
> > > > failure
> > > > > > (dev=01:00:00, iova=0xfffff002)
> > > > > > > qemu-system-x86_64: New fault is not recorded due to
> > compression
> > > > of
> > > > > > faults
> > > > > > >
> > > > > > > This is because the SNP bit is set since Linux kernel commit
> > > > > > > 6c00612d0cba1 ("iommu/vt-d: Report right snoop capability when
> > > > using
> > > > > > > FL for IOVA") where SNP bit is set if scalable mode is on though this
> > > > > > > seems to be an violation on the spec which said the SNP bit is
> > > > > > > considered to be reserved if SC is not supported.
> > > > > >
> > > > > > When I was reading that commit, I was actually confused by this
> > change:
> > > > > >
> > > > > > ---8<---
> > > > > > diff --git a/drivers/iommu/intel/iommu.c
> > > > b/drivers/iommu/intel/iommu.c
> > > > > > index 956a02eb40b4..0ee5f1bd8af2 100644
> > > > > > --- a/drivers/iommu/intel/iommu.c
> > > > > > +++ b/drivers/iommu/intel/iommu.c
> > > > > > @@ -658,7 +658,14 @@ static int
> > > > domain_update_iommu_snooping(struct
> > > > > > intel_iommu *skip)
> > > > > >         rcu_read_lock();
> > > > > >         for_each_active_iommu(iommu, drhd) {
> > > > > >                 if (iommu != skip) {
> > > > > > -                       if (!ecap_sc_support(iommu->ecap)) {
> > > > > > +                       /*
> > > > > > +                        * If the hardware is operating in the scalable mode,
> > > > > > +                        * the snooping control is always supported since we
> > > > > > +                        * always set PASID-table-entry.PGSNP bit if the domain
> > > > > > +                        * is managed outside (UNMANAGED).
> > > > > > +                        */
> > > > > > +                       if (!sm_supported(iommu) &&
> > > > > > +                           !ecap_sc_support(iommu->ecap)) {
> > > > > >                                 ret = 0;
> > > > > >                                 break;
> > > > > >                         }
> > > > > > ---8<---
> > > > > >
> > > > > > Does it mean that for some hardwares that has
> > sm_supported()==true,
> > > > it'll
> > > > > > have  SC bit cleared in ecap register?  That sounds odd, and not sure
> > why.
> > > > Maybe
> > > > > > Yi Liu or Yi Sun may know?
> > > > >
> > > > > scalable mode has no dependency on SC, so it's possible.
> > > >
> > > > I see; thanks, Yi.
> > > >
> > > > However then OTOH I don't understand above comment
> > > >
> > > >   "If the hardware is operating in the scalable mode, the snooping control
> > is
> > > >    always supported since... "
> > > >
> > > > Because the current qemu vt-d emulation should fall into the case that Yi
> > > > mentioned - we support initial scalable mode but no SC yet..
> > >
> > > chapter 3.9 of 3.2 spec says below.
> > >
> > > “If the remapping hardware is setup in scalable-mode
> > (RTADDR_REG.TTM=01b)
> > > and the Page Snoop (PGSNP) field in PASID-table entry is Set, access to
> > the
> > > final page is snooped.”
> > >
> > > It means the PGSNP field is available under scalable mode. And spec also
> > > says below in chapter 96. of 3.2 spec.
> > >
> > > "Requests snoop processor caches irrespective of, other attributes in the
> > > request or other fields in paging structure entries used to translate the
> > > request."
> > >
> > > It means the PGSNP field of PASID table entry is the first class control
> > > of the snoop behaviour. Also it means the scalable mode has the snoop
> > > control by default. ^_^. So the comment in the above commit is correct
> > > since the policy of intel iommu driver is always setting the PGSNP bit.
> > 
> > I see.  Setting PGSNP bit in the pasid entry looks fine to me.
> > 
> > However IIUC what's triggering the crash (that Jason is fixing) is the guest
> > iommu driver "thinks" SC is supported since scalable is enabled (even if
> > qemu vIOMMU has declared ECAP.SC==0 there), then it'll update
> > iommu_snooping bit, then it'll try to attach the SNP bit in the 2nd level
> > pgtable (intel_iommu_map):
> > 
> > 	if ((iommu_prot & IOMMU_CACHE) && dmar_domain->iommu_snooping)
> > 		prot |= DMA_PTE_SNP;
> > 
> 
> Above is the fact today.
> 
> > So what I'm wondering is: whether the kernel should _not_ set SNP bit in
> > the 2nd level pgtable, even if we set PGSNP in the pasid entry.. because
> > as you mentioned, the hardware (here the emulated vIOMMU) is allowed to have
> > both scalable==1 but sc==0 so it may recognize PGSNP in pasid entry but not
> > the SNP bit in pgtables.
> 
> This is a weird configuration. :( let's fix it in spec. e.g. PGSNP bit is
> supported only when scalable==1 and sc==1. this makes more sense. right?
> Then SNP bit will always depend on sc bit, it won't have any relationship
> with scalable bit.

Sounds reasonable.

> 
> > 
> > If we'll skip pgtable SNP bit anyway for scalable mode, it looks weird to
> > explicitly set it too.
> > 
> > I think it's fine for Jason's solution to just skip checking SNP bit so we
> > ignore it in qemu, however just to double check we're on the same page.
> 
> If we have above fix in spec, the iommu driver would also update its
> behavior on the SNP bit. then the problem encountered by Jason will
> go away. right?

Looks right to me.

I think we can still have Jason's patch continued because the kernel commit to
apply SNP bit is merged in v5.13, so we may need the qemu change to let it
still work with v5.13-v5.15+ guest kernels.  We'll loose the resv bit check a
bit, but looks worthwhile.  Jason?

Thanks,

-- 
Peter Xu


