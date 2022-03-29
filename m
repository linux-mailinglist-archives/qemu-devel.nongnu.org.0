Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505FE4EA6B1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 06:48:29 +0200 (CEST)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ3mO-0001l4-Dh
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 00:48:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ3kt-0000y7-Pr
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZ3kq-0007ID-2p
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 00:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648529210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SBXDZ4fI/yy0Mb+caxztByH8H9mDOPS73xUpeybJxCk=;
 b=esN9W5ka0/nfiXJ/WzpW57Ulod3Kaulx68mNUmDkJvQEkn7BQ7UDRC1XJEHLNFOGUzVA37
 GTEILeh4xhdsk2bdpUwfuLIRH6/YP3VmTMdLNpEeWFvT+OJoCzmSdHLjvvVk+C4qCSqp3O
 csVcPyF+6UCo+YDrmcwkyYmu+FO6nJ4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-PVs22e-cMCWASdCIzDkrRg-1; Tue, 29 Mar 2022 00:46:47 -0400
X-MC-Unique: PVs22e-cMCWASdCIzDkrRg-1
Received: by mail-lj1-f199.google.com with SMTP id
 11-20020a2e154b000000b0024967cd6752so6971597ljv.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 21:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SBXDZ4fI/yy0Mb+caxztByH8H9mDOPS73xUpeybJxCk=;
 b=PlMzfrRemCRIOrstE1SvkHF5J1e6yMu5kUnJEkboBWyo3NvFiRWhaFK5m/zhDukDAe
 n0B6IDP4Yf/OzsSZNpi8hu1muYLSJKbEvx79fyxt08+LRsBp9lrizenfrhCrfev42sPp
 oaA/OIp/YX0VJ0YMrWqkkE8r+aM5tXUVtVQdSkVwlsEFDCXANT4eNTQRWkMQgAE9IQ/c
 nvtOmsJbsGfMNtkdroBHB4zYCf30O8/iTNMJDnHyNqOgl/EpFzn6ddc7KCtEUf8pcM+W
 +N20yG6oFsbYqn4htHm3S6cxYw++sjJ9AQfEFfWN7yt8jxQvbec7mOPelr72FN/Jr1aJ
 BOtA==
X-Gm-Message-State: AOAM531aUQmjFWDCf0N3zXcOjanarki751pKnBhnQXgAKNUROW9CkjV2
 P2WRHHFSvueH0d9b+dH7g9UiG8r/ZiyMEPzLR2rvPpBxyV+GFXaIAgT1K+Sr0mOPl+V306+Qabs
 vibJtzfmF1UMFJjPQep6IXZZHAqs/JEs=
X-Received: by 2002:a2e:824e:0:b0:249:7e3d:c862 with SMTP id
 j14-20020a2e824e000000b002497e3dc862mr929775ljh.97.1648529205927; 
 Mon, 28 Mar 2022 21:46:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9ihs80yUwGiuOln4pvxjmAjgoB2T4BOK6LPSLcytLywGE10IZqUd/OmSneSNsNvAwssswbpQmftUe2OuJu4o=
X-Received: by 2002:a2e:824e:0:b0:249:7e3d:c862 with SMTP id
 j14-20020a2e824e000000b002497e3dc862mr929757ljh.97.1648529205623; Mon, 28 Mar
 2022 21:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB52762D1CDE8F5417370762CE8C199@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEtr5byTaRFQT-ut6=ziyOTKBgne_Xa2qu4Nu9Z7sDDmBg@mail.gmail.com>
 <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB52767EA8BF5EA39488D149408C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 29 Mar 2022 12:46:34 +0800
Message-ID: <CACGkMEtCAra8SbubYbqMVO8E6MUwNUaJLM5bVJ32rA31uemVAA@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
To: "Tian, Kevin" <kevin.tian@intel.com>
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28, 2022 at 2:47 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, March 28, 2022 10:31 AM
> >
> > On Thu, Mar 24, 2022 at 4:54 PM Tian, Kevin <kevin.tian@intel.com> wrote:
> > >
> > > > From: Jason Wang
> > > > Sent: Monday, March 21, 2022 1:54 PM
> > > >
> > > > This patch introduce ECAP_PASID via "x-pasid-mode". Based on the
> > > > existing support for scalable mode, we need to implement the following
> > > > missing parts:
> > > >
> > > > 1) tag VTDAddressSpace with PASID and support IOMMU/DMA
> > translation
> > > >    with PASID
> > > > 2) tag IOTLB with PASID
> > >
> > > and invalidate desc to flush PASID iotlb, which seems missing in this patch.
> >
> > It existed in the previous version, but it looks like it will be used
> > only for the first level page table which is not supported right now.
> > So I deleted the codes.
>
> You are right. But there is also PASID-based device TLB invalidate descriptor
> which is orthogonal to 1st vs. 2nd level thing. If we don't want to break the
> spec with this series then there will need a way to prevent the user from
> setting both "device-iotlb" and "x-pasid-mode" together.

Right, let me do it in the next version.


>
> >
> > >
> > > > 3) PASID cache and its flush
> > > > 4) Fault recording with PASID
> > > >
> > > > For simplicity:
> > > >
> > > > 1) PASID cache is not implemented so we can simply implement the PASID
> > > > cache flush as a nop.
> > > > 2) Fault recording with PASID is not supported, NFR is not changed.
> > > >
> > > > All of the above is not mandatory and could be implemented in the
> > > > future.
> > >
> > > PASID cache is optional, but fault recording with PASID is required.
> >
> > Any pointer in the spec to say something like this? I think sticking
> > to the NFR would be sufficient.
>
> I didn't remember any place in spec saying that fault recording with PASID is
> not required when PASID capability is exposed.

Ok, but as a spec it needs to clarify what is required for each capability.

> If there is certain fault
> triggered by a request with PASID, we do want to report this information
> upward.

I tend to do it increasingly on top of this series (anyhow at least
RID2PASID is introduced before this series)

>
> btw can you elaborate why NFR matters to PASID? It is just about the
> number of fault recording register...

I might be wrong, but I thought without increasing NFR we may lack
sufficient room for reporting PASID.

>
> >
> > > I'm fine with adding it incrementally but want to clarify the concept first.
> >
> > Yes, that's the plan.
> >
>
> I have one open which requires your input.
>
> While incrementally enabling things does be a common practice, one worry
> is whether we want to create too many control knobs in the staging process
> to cause confusion to the end user.

It should be fine as long as we use the "x-" prefix which will be
finally removed.

>
> Earlier when Yi proposed Qemu changes for guest SVA [1] he aimed for a
> coarse-grained knob design:
> --
>   Intel VT-d 3.0 introduces scalable mode, and it has a bunch of capabilities
>   related to scalable mode translation, thus there are multiple combinations.
>   While this vIOMMU implementation wants simplify it for user by providing
>   typical combinations. User could config it by "x-scalable-mode" option. The
>   usage is as below:
>     "-device intel-iommu,x-scalable-mode=["legacy"|"modern"]"
>
>     - "legacy": gives support for SL page table
>     - "modern": gives support for FL page table, pasid, virtual command
>     -  if not configured, means no scalable mode support, if not proper
>        configured, will throw error
> --
>
> Which way do you prefer to?
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-02/msg02805.html

My understanding is that, if we want to deploy Qemu in a production
environment, we can't use the "x-" prefix. We need a full
implementation of each cap.

E.g
-device intel-iommu,first-level=on,scalable-mode=on etc.

Thanks

>
> Thanks
> Kevin


