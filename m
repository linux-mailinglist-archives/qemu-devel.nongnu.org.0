Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89646E0557
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 05:35:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmniy-0006lm-7Y; Wed, 12 Apr 2023 23:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmniw-0006lc-6J
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 23:34:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmniu-0004Jq-2L
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 23:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681356850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Qemwlq+5dUezls7aFtg84IPopzEerOuq/DqA8uo82w=;
 b=USBZ1JWeoL+5sinZx1BQO5wFEtZ9OxmPZaLbKjYzn6nAkmqxNj4pSlk5hUuiZRl7i7oZeE
 /Fkqe2lzTR8pUvwSNYAR3S9/fKGWi6N1xbauBkd13FIukK9NjihX6UX24qXPwOkqhm3A7o
 p0jd2sF7Mlsdks4OwD8XpLx0ZkfX+dk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-WNGEX0pqN4G9VvCOrK_SOQ-1; Wed, 12 Apr 2023 23:34:08 -0400
X-MC-Unique: WNGEX0pqN4G9VvCOrK_SOQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 fc10-20020a0568082a8a00b003894ce81c46so1704222oib.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 20:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681356847; x=1683948847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Qemwlq+5dUezls7aFtg84IPopzEerOuq/DqA8uo82w=;
 b=kZdFDgBC5v8Uk+8Mp8ucf5mzcUwkMxjza3wqj2cQQ3Qlm/bIJylcOQpPCOJpl+QLMo
 oUIPS1kOjxq0m0kkwbidjUviKZRqLXM6CN46JXav3Cjoo6eTS/I2S2ZY5yK0ATyrbNV+
 uEo6XGw/knLj5nsgvvciN4PWIg1YeZ35PjA/HWGYoo2HFT5sBuP2wDd+nQL4ok/zoOpl
 M5tVngZmd/AuEqTDZ5/ZihUPTSJWIi/kLu5wqZkgnBwCjIR/DZVlmhJDki3jv3icVcKj
 iu1Q16uhlrLNg3KyMPdBRa4FuSVxJLftKck3bx97hSAM/RJzgOyN6+Cx4VztNuiFb+4y
 8JVQ==
X-Gm-Message-State: AAQBX9dgNEdSWB4Ym/+1wvqVP7EC8Mce5dWSlobz2lF8do+01omv3sLH
 jp6y5riW5mRmmZDE0yX/ClkQggWqJVP9XwAw3nOoAHM1SWWAx3/G9G8Y0KSBAJfSdwOTXhWVKfP
 3tC2eyv7xxDPx4l5/xz8N7tr5Ztyka+8=
X-Received: by 2002:a05:6830:1119:b0:6a4:2f1f:cc62 with SMTP id
 w25-20020a056830111900b006a42f1fcc62mr156202otq.2.1681356847536; 
 Wed, 12 Apr 2023 20:34:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350a8sSB5tjhJ/58UduPnEgvrQdN2H6M/SvSTXYaTBMZrfHgzfXwROGWpelYDbyRRWUre70l35FbrWEl7eOnaZmg=
X-Received: by 2002:a05:6830:1119:b0:6a4:2f1f:cc62 with SMTP id
 w25-20020a056830111900b006a42f1fcc62mr156195otq.2.1681356847246; Wed, 12 Apr
 2023 20:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230412073510.7158-1-jasowang@redhat.com>
 <87bkjtpk2n.fsf@linaro.org>
In-Reply-To: <87bkjtpk2n.fsf@linaro.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 13 Apr 2023 11:33:56 +0800
Message-ID: <CACGkMEsVswiJAR+2oHBeKXMAZpDFkFEZjBh37YiEVWPfdnT1pQ@mail.gmail.com>
Subject: Re: [PATCH V2] intel_iommu: refine iotlb hash calculation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: mst@redhat.com, peterx@redhat.com, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Wed, Apr 12, 2023 at 4:43=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
>
> Jason Wang <jasowang@redhat.com> writes:
>
> > Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
> > account when calculating iotlb hash like:
> >
> > static guint vtd_iotlb_hash(gconstpointer v)
> > {
> >     const struct vtd_iotlb_key *key =3D v;
> >
> >     return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
> >            (key->level) << VTD_IOTLB_LVL_SHIFT |
> >            (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> > }
> >
> > This turns out to be problematic since:
> >
> > - the shift will lose bits if not converting to uint64_t
> > - level should be off by one in order to fit into 2 bits
> > - VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
> >   some bits
> > - the hash result is uint64_t so we will lose bits when converting to
> >   guint
> >
> > So this patch fixes them by
> >
> > - converting the keys into uint64_t before doing the shift
> > - off level by one to make it fit into two bits
> > - change the sid, lvl and pasid shift to 26, 42 and 44 in order to
> >   take the full width of uint64_t
> > - perform an XOR to the top 32bit with the bottom 32bit for the final
> >   result to fit guint
> >
> > Fixes: Coverity CID 1508100
> > Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> > Changes since V1:
> > - perform XOR to avoid losing bits when converting to gint
> > ---
> >  hw/i386/intel_iommu.c          | 9 +++++----
> >  hw/i386/intel_iommu_internal.h | 6 +++---
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index a62896759c..94d52f4205 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -64,8 +64,8 @@ struct vtd_as_key {
> >  struct vtd_iotlb_key {
> >      uint64_t gfn;
> >      uint32_t pasid;
> > -    uint32_t level;
> >      uint16_t sid;
> > +    uint8_t level;
> >  };
> >
> >  static void vtd_address_space_refresh_all(IntelIOMMUState *s);
> > @@ -221,10 +221,11 @@ static gboolean vtd_iotlb_equal(gconstpointer v1,=
 gconstpointer v2)
> >  static guint vtd_iotlb_hash(gconstpointer v)
> >  {
> >      const struct vtd_iotlb_key *key =3D v;
> > +    uint64_t hash64 =3D key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_=
SID_SHIFT) |
> > +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
> > +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
> >
> > -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
> > -           (key->level) << VTD_IOTLB_LVL_SHIFT |
> > -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> > +    return (guint)((hash64 >> 32) ^ (hash64 & 0xffffffffU));
>
> Have you measured the distribution this hash gives you? Otherwise
> consider using the qemu_xxhash() functions to return a well distributed
> 32 bit hash value.

It depends on a lot of factors and so it won't be even because the
individuals keys are not evenly distributed:

- gfn depends on guest DMA subsystems
- level depends on when huge pages are used
- pasid depends on whether PASID is being used

I'm ok to switch to use qemu_xxhash() if everyone agree. Or if as
Peter said, if it has been dealt with glibc, maybe it's not worth to
bother.

Thanks

>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>


