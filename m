Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0268DE09
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:37:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQx1-0000zA-71; Tue, 07 Feb 2023 11:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPQwy-0000ym-R2
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:36:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPQwu-0000Do-AI
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:36:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675787762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JtOhhuovIHwGiqrxn/PRR7S1vl7BeehJdw6uaOtnVY=;
 b=dAbXEVt9CalDyKFeYPk8JRHEcjsvzuSu56NHSP9+9JKJgtDoEdj2UPVNBoEz/EH8+bDVm7
 U3J3LxtotR7o1Zsxp99WY05tCDhEMhzgEQUxCkQHwbkbg9NI6lno2jK0MS1x8Psr3IiZz5
 w/akeuPNA3ePgPfQidYtzXibyN7zbWc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-xlC5y3bLMBOgpyDK3xRkNw-1; Tue, 07 Feb 2023 11:36:00 -0500
X-MC-Unique: xlC5y3bLMBOgpyDK3xRkNw-1
Received: by mail-qv1-f69.google.com with SMTP id
 gw11-20020a0562140f0b00b0053b81ec39dfso8002966qvb.14
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+JtOhhuovIHwGiqrxn/PRR7S1vl7BeehJdw6uaOtnVY=;
 b=v0Stm2NHLY9zBvtMDaLdjcMpeYgz8mfnJfYaTBOs5PGLWyP1p3ECsK03TY01LSobA9
 P73kkVq8Bm1ho1WBUuE4drAtEp1fgl23nmSO7EFIPhpQseP2Zim9ZH7/WdBrzj0TZN0m
 OfhtxgbZB7Ajn46ZnrhLRRx55TMdSFbs0o4/i1JJET+yq9NgmZxcxUwPKyHWWwZBe8va
 1NxtzvpG1kBxcxD/XiTUpDmjgjz8OQkk8fzHlPgsFhKnE1Zj6ctrMGMhruTATeCoFi6D
 XDUJQtKNg6fMuVqdvXcJxXoX/tE/JihCPEqH26bVBaxUAqulYOYKSRyrGckeIdJTX3zZ
 38/g==
X-Gm-Message-State: AO0yUKWHRuEEuBgfnJ2D2jcCpROuOoT3BRKNo32tCkSVZa5jcWClZ/RC
 rONnuWP2LKw8OAgaZbhAU5uri94gkUAuAb0xmaWGFjzaTwkSF4xIkmbNb4kmwp/muadTsCr6fLx
 JdVinLyQz7oJNDFg=
X-Received: by 2002:a0c:c98d:0:b0:53d:7373:2e8 with SMTP id
 b13-20020a0cc98d000000b0053d737302e8mr4713962qvk.3.1675787758578; 
 Tue, 07 Feb 2023 08:35:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+9HlBe3B5ZiUIZ7XqsQUd8WroVuYcoCDZZxEIRu3QRpaS7MtOnmquiCqJTDDrxKcSvp5z0Ig==
X-Received: by 2002:a0c:c98d:0:b0:53d:7373:2e8 with SMTP id
 b13-20020a0cc98d000000b0053d737302e8mr4713931qvk.3.1675787758249; 
 Tue, 07 Feb 2023 08:35:58 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 g7-20020a05620a278700b006ff8a122a1asm9724612qkp.78.2023.02.07.08.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 08:35:57 -0800 (PST)
Date: Tue, 7 Feb 2023 11:35:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org,
 eric.auger@redhat.com, viktor@daynix.com
Subject: Re: [PATCH 2/3] intel-iommu: fail DEVIOTLB_UNMAP without dt mode
Message-ID: <Y+J97GTPjluoAHe4@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-3-jasowang@redhat.com>
 <185ce2ea-62c3-71e5-7ef1-1e0b4e35d01c@redhat.com>
 <c4df55fe-99ff-ef0f-c006-e70809e8890d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4df55fe-99ff-ef0f-c006-e70809e8890d@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Feb 07, 2023 at 05:17:42PM +0100, Laurent Vivier wrote:
> On 2/3/23 10:08, Laurent Vivier wrote:
> > On 11/29/22 09:10, Jason Wang wrote:
> > > Without dt mode, device IOTLB notifier won't work since guest won't
> > > send device IOTLB invalidation descriptor in this case. Let's fail
> > > early instead of misbehaving silently.
> > > 
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >   hw/i386/intel_iommu.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index 9143376677..d025ef2873 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -3179,6 +3179,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> > >   {
> > >       VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
> > >       IntelIOMMUState *s = vtd_as->iommu_state;
> > > +    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(s);
> > >       /* TODO: add support for VFIO and vhost users */
> > >       if (s->snoop_control) {
> > > @@ -3193,6 +3194,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> > >                            PCI_FUNC(vtd_as->devfn));
> > >           return -ENOTSUP;
> > >       }
> > > +    if (!x86_iommu->dt_supported && (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP)) {
> > > +        error_setg_errno(errp, ENOTSUP,
> > > +                         "device %02x.%02x.%x requires device IOTLB mode",
> > > +                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
> > > +                         PCI_FUNC(vtd_as->devfn));
> > > +        return -ENOTSUP;
> > > +    }
> > >       /* Update per-address-space notifier flags */
> > >       vtd_as->notifier_flags = new;
> > 
> > Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> > Tested-by: Laurent Vivier <lvivier@redhat.com>
> > Buglink: https://bugzilla.redhat.com/2156876
> 
> Is this possible to have this patch merged?
> It fixes a real problem and it is really trivial.

AFAIU Jason will post a new version soon for this whole set.  But I also
agree if Michael has an earlier pull we can add this in even earlier.

Thanks,

-- 
Peter Xu


