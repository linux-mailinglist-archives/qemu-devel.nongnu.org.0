Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DFC4EE5E8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:13:04 +0200 (CEST)
Received: from localhost ([::1]:41886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na6md-0006YR-PR
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:13:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na6kx-0005Qk-2d
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na6ku-00028W-JP
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:11:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648779072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UXOhPU8+tmubp+ae2wbRP5IAn7kKGvEqla5/dx4inMM=;
 b=Y+4OQ2m0U3UZ7himeTvzrVG3GnK1a2VsEjn7Fo9t1vJZo7ZHjjFREtKw2qu7ZmsHZ3L2Zq
 yYbcndwNXkdiT1Fnpwrke4YJfNuftnGV8Yu03/mR87RCDQqdSSDZEmsMY3JkK6hSWFHoy5
 9TJgdbMZ13Zmkn8kIJ8Us0rMOGDLARY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-BfgnbxkFN1uEYB5vvs8tiA-1; Thu, 31 Mar 2022 22:11:10 -0400
X-MC-Unique: BfgnbxkFN1uEYB5vvs8tiA-1
Received: by mail-lf1-f70.google.com with SMTP id
 i25-20020ac25239000000b0044a3f56e059so563846lfl.15
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXOhPU8+tmubp+ae2wbRP5IAn7kKGvEqla5/dx4inMM=;
 b=w82moZ+GinQ9l/3gxY5Qh20RCviqxieAXJUjO8iqCSFmGq0VJmZPCQ4HiI3aWD9VTl
 HCXRLkwDzVmEAVeVq4XvifBzIX6fzCpuAMHe6I5ja58uNOnrxTsqhsb3aUlJlnY2faQD
 U55qPKvNayj+bAvh5cRgJHCpqCsGXR/+o/qAoC2eWbJHL6M0D3z8Q9Kn0QDtQGuHjXBq
 blswtmxgSyHFGQHNHNceAzQzVx7riwa9NmxuV+WqB08fKpsR70R6umngMjNiTs7dI79l
 hmUpPO6OBoYsZ0g+6px7uVxLwSfNabEybdaX+mUvgaMZ5Mayx7m4PfutLCF+TSBd2nuU
 l6Mw==
X-Gm-Message-State: AOAM533eej90+iWMiwdOg3ALglJPV+92V7bOjndWF5MGHC9qiuXPOgkT
 PuMxUPEdOnJAZz1ht+ihvWgsJVEGz2c06O2Zt4I6q7BaYazCx/NN+dKE5qwzjnf6K8XSMq0vLpD
 YNd+H1QGPHXuRCzkjviCTkSiGU25r++E=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr12236691lfa.210.1648779069281; 
 Thu, 31 Mar 2022 19:11:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo/YE1uPz/SLhqYd/xkHNISrsrycjHujb4WvAwjZJKD4Kaazqgt8Dtv5KyGI8QZogqXF3NRN4U4rleDu0eEFk=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr12236682lfa.210.1648779069091; Thu, 31
 Mar 2022 19:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220307224357.682101-1-mst@redhat.com>
 <20220307224357.682101-16-mst@redhat.com>
 <CAFEAcA-zjv1dqkUo=rt549wO-D9=J-MFfRCm4nMQthh_Gh_eog@mail.gmail.com>
In-Reply-To: <CAFEAcA-zjv1dqkUo=rt549wO-D9=J-MFfRCm4nMQthh_Gh_eog@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Apr 2022 10:10:58 +0800
Message-ID: <CACGkMEu0geF7y_JSaSkvNc86iMUCFVuZe961s_ebVHuP9q6sjg@mail.gmail.com>
Subject: Re: [PULL v4 15/47] intel_iommu: support snoop control
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 5:51 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 7 Mar 2022 at 22:45, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Jason Wang <jasowang@redhat.com>
> >
> > SC is required for some kernel features like vhost-vDPA. So this patch
> > implements basic SC feature. The idea is pretty simple, for software
> > emulated DMA it would be always coherent. In this case we can simple
> > advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
> > complicated, so this patch simply fail the IOMMU notifier
> > registration.
> >
> > In the future, we may want to have a dedicated notifiers flag or
> > similar mechanism to demonstrate the coherency so VFIO could advertise
> > that if it has VFIO_DMA_CC_IOMMU, for vhost kernel backend we don't
> > need that since it's a software backend.
>
> Hi; Coverity points out (CID 1487174) an error in this change:
>
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3030,6 +3030,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> >      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
> >      IntelIOMMUState *s = vtd_as->iommu_state;
> >
> > +    /* TODO: add support for VFIO and vhost users */
> > +    if (s->snoop_control) {
> > +        error_setg_errno(errp, -ENOTSUP,
> > +                         "Snoop Control with vhost or VFIO is not supported");
> > +        return -ENOTSUP;
> > +    }
>
> error_setg_errno() expects a normal errno value, not a negated
> one, so we should be passing it "ENOTSUP" here, not "-ENOTSUP".

Will post a fix soon.

Thanks

>
> thanks
> -- PMM
>


