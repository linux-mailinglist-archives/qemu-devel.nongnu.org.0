Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F743DCE0
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 10:18:29 +0200 (CEST)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg0cG-0006a1-9p
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 04:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mg0as-0005q1-Jt
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:17:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mg0ap-0004zH-99
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635409018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w3qhBlzA5H7kjVfR3J7u6LWHU6iCJs03IXfZCHpc/7E=;
 b=QInUZpuT6QL2EG/sIwu0ZdjrV91GYJjHAORM7uNabKv6wQngsrCCWXk6D8HuPR1WVamL1z
 tmtuMdVPG9Ap+pb9d2NZ9U4/TWtFOkE40nJIHcufyHShPe0WU0pyi92ppHxnB7ST71MclO
 4Ho+B3jN/xun5WKG4zbgKN+fYqCEx8s=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-_MMK4V6iNLitmYcTmqXf4Q-1; Thu, 28 Oct 2021 04:16:54 -0400
X-MC-Unique: _MMK4V6iNLitmYcTmqXf4Q-1
Received: by mail-pl1-f197.google.com with SMTP id
 u17-20020a170902e5d100b0014169fd3334so2041151plf.5
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 01:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w3qhBlzA5H7kjVfR3J7u6LWHU6iCJs03IXfZCHpc/7E=;
 b=bnshkgJHDmTtxOwzgnhe4q+bWXZQh57u1kpC3bAL8GjkPGW+NP5D0qB1OB3PIVaANe
 ajtBOLGbQ3tzYnUCjVABL3dHC2ZBHp7AYtlcocBQfmZZYWSVeQNzIlY4DKiOKdIOj7VY
 yoZPvG7NbCjpby+UsVrJaVpLGXfKAi4GKUs5zKoM/S0N6SvG4p4kld1FlzzBQ6xv6yz7
 4Fi9Woe/aCc3c/6TRGuP5wWBFoJ576Rd2acEd304Ixrlneg/qGcg8e9wkrrXGeXHHdAr
 SFuGsG3QihIBJr/x3+zRD9Yo8nhouVXCM2lOaPNcSh1i5mbdTyxGFN7Hw1PbU8HNsVkR
 qbxg==
X-Gm-Message-State: AOAM533ksR/uv1B2054+7QpyBgS1AoBleQpNhPouiZgAMcLVVfpUxCZu
 tUKpwwzUyITQqRiSxA+1ysXSzQO8igFaP9dod1vDR4viNEmnlQoBnyyuq5Kr0I5UOm7di2YZWY3
 rzIN8DnP8Nq5+zv4=
X-Received: by 2002:a17:90b:388f:: with SMTP id
 mu15mr2949344pjb.28.1635409013659; 
 Thu, 28 Oct 2021 01:16:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb3aZFz+wOVByzLow+RzmYmyOK25hQqxFJBb/kvhkjAahcuj6NuBB/oUI/Xcu99iQJorhbHA==
X-Received: by 2002:a17:90b:388f:: with SMTP id
 mu15mr2949311pjb.28.1635409013357; 
 Thu, 28 Oct 2021 01:16:53 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id h3sm2568102pfi.207.2021.10.28.01.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 01:16:52 -0700 (PDT)
Date: Thu, 28 Oct 2021 16:16:46 +0800
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 5/5] pc/q35: Add pre-plug hook for x86-iommu
Message-ID: <YXpcYQmEYT95v9A5@xz-m1.local>
References: <20211028043129.38871-1-peterx@redhat.com>
 <20211028043129.38871-6-peterx@redhat.com>
 <191ca1fc-06fa-8114-0620-f3edc4aa95e4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <191ca1fc-06fa-8114-0620-f3edc4aa95e4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 09:17:35AM +0200, David Hildenbrand wrote:
> On 28.10.21 06:31, Peter Xu wrote:
> > Add a pre-plug hook for x86-iommu, so that we can detect vfio-pci devices
> > before realizing the vIOMMU device.
> > 
> > When the guest contains both the x86 vIOMMU and vfio-pci devices, the user
> > needs to specify the x86 vIOMMU before the vfio-pci devices.  The reason is,
> > vfio_realize() calls pci_device_iommu_address_space() to fetch the correct dma
> > address space for the device, while that API can only work right after the
> > vIOMMU device initialized first.
> > 
> > For example, the iommu_fn() that is used in pci_device_iommu_address_space() is
> > only setup in realize() of the vIOMMU devices.
> > 
> > For a long time we have had libvirt making sure that the ordering is correct,
> > however from qemu side we never fail a guest from booting even if the ordering
> > is specified wrongly.  When the order is wrong, the guest will encounter
> > misterious error when operating on the vfio-pci device because in QEMU we'll
> > still assume the vfio-pci devices are put into the default DMA domain (which is
> > normally the direct GPA mapping), so e.g. the DMAs will never go right.
> > 
> > This patch fails the guest from booting when we detected such errornous cmdline
> > specified, then the guest at least won't encounter weird device behavior after
> > booted.  The error message will also help the user to know how to fix the issue.
> > 
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> I think that's a big improvement. I ran into this issue myself and found
> the documentation at https://wiki.qemu.org/Features/VT-d at one time
> ("Meanwhile, the intel-iommu device must be specified as the first
> device in the parameter list (before all the rest of the devices). ").
> 
> So feel free to add my
> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks, will do.

> > @@ -172,4 +172,12 @@ void x86_iommu_iec_notify_all(X86IOMMUState *iommu, bool global,
> >   * @out: Output MSI message
> >   */
> >  void x86_iommu_irq_to_msi_message(X86IOMMUIrq *irq, MSIMessage *out);
> > +
> > +/**
> > + * x86_iommu_pre_plug: called before plugging the iommu device
> > + * @X86IOMMUState: the pointer to x86 iommu state
> > + * @errp: the double pointer to Error, set if we want to fail the plug
> > + */
> 
> I'd drop that documentation because it's essentially just how any other
> pre_plug handlers works. But maybe it's just me that knows how the whole
> hotplug machinery works, so ...

Yes the documentation is not very helpful because it shouldn't be called
randomly but only in the machine pre-plug hook of x86.  It's just trying to not
be the 1st one exported function in the header that does not have a comment.

Thanks,

-- 
Peter Xu


