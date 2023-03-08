Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE2D6AFE3A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 06:21:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZmCz-0006Kq-Or; Wed, 08 Mar 2023 00:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZmCw-0006KH-Mu
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 00:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZmCv-0002SS-1U
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 00:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678252759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6WfZbZFqvHVDBY60jeN5HPAUn6RKnlgSw0ahdoYpRA=;
 b=P+KWVGucdy30zKpszeT7I6Iwi4FTwVFQOJ2OywnuFE96SXVD0FplhjwSVQq+QmQZrIUFBS
 ct5jv7r8Q8ujWqFccun//OFuJNTpBpE8PRDFXJyXzAJChEYLM6Ue7IXRSzh7fkgalsfgV0
 J+qYkAPlSLm8rk4oCmaCI+8SG72amkY=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-ZWtFs1szOpW9NF2332OqyA-1; Wed, 08 Mar 2023 00:19:18 -0500
X-MC-Unique: ZWtFs1szOpW9NF2332OqyA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1768b61f430so7655936fac.14
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 21:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678252758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6WfZbZFqvHVDBY60jeN5HPAUn6RKnlgSw0ahdoYpRA=;
 b=ZxZQikadQg/ZjQ9IEms4PLpFoB5rN7tLm7A07Q4nT2w1EpjJB0bkAFl+Bv6lmFnwd1
 0Xap/Ny96kM1rMWaJgAXCRyxGnk7nr4gt7T6QI2mN+rSWA8WC0xCE5YIK8LN9JcnoTFs
 5m7ZxXpGZ5oNNmLPWXEckhUKODbwNVVbIfOm35Gt9wmxZJYdJFynD5L/SWDO45MaIDSK
 oSSynxRWwO/63qWcG0+HlxqqGCB3AwzpJZmshaIDbK5PK4woA1x1a/m7GYFwokac/lFY
 7GBs8CKLFwcuRGHxZWivnq3Bp9UWIRaXRw+alW1OI33DpYskN4/xnUyFpTUvXLI+e6zW
 KvzQ==
X-Gm-Message-State: AO0yUKUXLrqgTm0okOamBonN0ZkNwVve7TY1K7M/CVKr55iVBNnoyuoy
 T6ocMXau9Ls2H0Ouk6T2LDf2/BfTGUafCGcb9rZb1I4zjblglZvTbgoQrlCXAnd2ooG0LHP7UyV
 ZPOSoAUD4ou2AyT3ScwfRXOrAJL5Id+w=
X-Received: by 2002:a05:6870:a2c2:b0:176:4a71:6fdc with SMTP id
 w2-20020a056870a2c200b001764a716fdcmr6016470oak.9.1678252758022; 
 Tue, 07 Mar 2023 21:19:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/XdOsqNI+5fcxpeMCAwcrFBtJ6/dclsQkRx/F8LUC2QBrBI7YYVjaZT70Y51wjKbtOeUKWWzyNHuupUIFI7mg=
X-Received: by 2002:a05:6870:a2c2:b0:176:4a71:6fdc with SMTP id
 w2-20020a056870a2c200b001764a716fdcmr6016466oak.9.1678252757808; Tue, 07 Mar
 2023 21:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20230223065924.42503-1-jasowang@redhat.com>
 <20230223065924.42503-4-jasowang@redhat.com>
 <20230307200208-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230307200208-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Mar 2023 13:19:06 +0800
Message-ID: <CACGkMEs-AtJidy-W5AC_gX=SjJ9g2DRbDf6N6oR36NFdziM10Q@mail.gmail.com>
Subject: Re: [PATCH V2 3/5] memory: introduce
 memory_region_unmap_iommu_notifier_range()
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Wed, Mar 8, 2023 at 9:02=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Thu, Feb 23, 2023 at 02:59:22PM +0800, Jason Wang wrote:
> > This patch introduces a new helper to unmap the range of a specific
> > IOMMU notifier.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  include/exec/memory.h | 10 ++++++++++
> >  softmmu/memory.c      | 13 +++++++++++++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > index 2e602a2fad..6fa0b071f0 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -1731,6 +1731,16 @@ void memory_region_notify_iommu(IOMMUMemoryRegio=
n *iommu_mr,
> >  void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
> >                                      IOMMUTLBEvent *event);
> >
> > +/**
> > + * memory_region_unmap_iommu_notifier_range: notify a unmap for an IOM=
MU
> > + *                                           translation that covers t=
he
> > + *                                           range of a notifier
> > + *
> > + * @notifier: the notifier to be notified
> > + */
> > +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
> > +
> > +
> >  /**
> >   * memory_region_register_iommu_notifier: register a notifier for chan=
ges to
> >   * IOMMU translation entries.
>
> This causes doc warnings:
>
> /scm/qemu/docs/../include/exec/memory.h:1741: warning: Function parameter=
 or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
> /scm/qemu/docs/../include/exec/memory.h:1741: warning: Excess function pa=
rameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range=
'
>
>
> please fix.

Will do.

Thanks

>
>
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 9d64efca26..ba43b4474e 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -1996,6 +1996,19 @@ void memory_region_notify_iommu_one(IOMMUNotifie=
r *notifier,
> >      }
> >  }
> >
> > +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n)
> > +{
> > +    IOMMUTLBEvent event;
> > +
> > +    event.type =3D IOMMU_NOTIFIER_UNMAP;
> > +    event.entry.target_as =3D &address_space_memory;
> > +    event.entry.iova =3D n->start;
> > +    event.entry.perm =3D IOMMU_NONE;
> > +    event.entry.addr_mask =3D n->end - n->start;
> > +
> > +    memory_region_notify_iommu_one(n, &event);
> > +}
> > +
> >  void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
> >                                  int iommu_idx,
> >                                  IOMMUTLBEvent event)
> > --
> > 2.25.1
>


