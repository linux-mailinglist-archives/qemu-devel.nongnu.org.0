Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B206DC2D3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 04:56:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plhgl-0004YP-JT; Sun, 09 Apr 2023 22:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1plhgk-0004YB-CQ
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 22:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1plhgh-0006y9-El
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 22:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681095322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx5ws7VjVAkhuDDx9HvOe35g5IAlvcurAxe6CwJSEaw=;
 b=caHU0Eo7lypt3sWwVBe0Zg/9tyDfhqjVMexkTnqbE52pLBfYLkbetIXnvsOsg4XbC3qYgb
 XTDSqB4Xqf0L+UKnawAGZi0bPkLBaA7lKYjqTBEQm6ABNTIdc4rm+N7BMIf2u4FzPRk7E8
 LUy3bkXy8RuooZVKVRHs9UR6FwpqmTU=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-AG3aiv5uMv25-916LZ59bA-1; Sun, 09 Apr 2023 22:55:20 -0400
X-MC-Unique: AG3aiv5uMv25-916LZ59bA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1842e8a9b8bso2504554fac.16
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 19:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681095320; x=1683687320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vx5ws7VjVAkhuDDx9HvOe35g5IAlvcurAxe6CwJSEaw=;
 b=nL2qffl8+q+hg8JMG/hP0LB8wX79/pPCYQvmuE4RATDNNOQGnx/TKvC7auEn0xwFuO
 0H1xmXjat5ZBfJCsFSYnHT9LPNkDWSAIJ5csOLmXSFPcGFD+fErRyFtkwo4XLnFaXBbB
 jAmPdBZzcJ51JAjs4yr8wsFIgWXAr8V17D0Llg3Fdwfl0c0NSeLRGpnF1U9lGFVoiFuQ
 FEEoS0f1e48A7/4pi24/Mqf7KJgBHpW3zj+6MuIbfud/4CkYxNeR4qVAIbL8+YeFkSPO
 0KK/3re2X9sWrmmTW634ymIR7vHoEzaBpEG6O2ysmzVLHcU9MqXxTJkN6FtKC0xeOKz1
 F+EQ==
X-Gm-Message-State: AAQBX9eDFBsrS9K+aO722TY9+45eTB7EiSzJ9VI9EkUjCOuv4S1BcEoS
 oAXLYLDeA7Rq+aMoFgzRS47etAqoF2MrkAov6BF86FuXVoMoEF3hU1FpzQ9l893Y9ip+syaZPeN
 OovRU5PirvGeDs8OFl3ON+r88OGGjSKA=
X-Received: by 2002:a05:6870:6587:b0:17f:1723:fc82 with SMTP id
 fp7-20020a056870658700b0017f1723fc82mr4600507oab.9.1681095319856; 
 Sun, 09 Apr 2023 19:55:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZsnCQS6xfCTT9Y7b8ciryeerJLDGPtsjZnhZqZeGpvMHbVzNXPLnMDhpghTSNRcMkzT7GyDIplcvemMsH8gFo=
X-Received: by 2002:a05:6870:6587:b0:17f:1723:fc82 with SMTP id
 fp7-20020a056870658700b0017f1723fc82mr4600501oab.9.1681095319560; Sun, 09 Apr
 2023 19:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-75-mst@redhat.com>
 <CAFEAcA9-wRruE7Qf9d_AcD+yQiwmf1yQMnUJgOeEiC1FvOa+gg@mail.gmail.com>
In-Reply-To: <CAFEAcA9-wRruE7Qf9d_AcD+yQiwmf1yQMnUJgOeEiC1FvOa+gg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 10 Apr 2023 10:55:08 +0800
Message-ID: <CACGkMEtDM=_eQYswGOmETBJQNX+QwijtWPrEzvWNZ0Hca_X1gA@mail.gmail.com>
Subject: Re: [PULL v4 74/83] intel-iommu: PASID support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
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

On Fri, Apr 7, 2023 at 12:22=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 7 Nov 2022 at 22:53, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Jason Wang <jasowang@redhat.com>
> >
> > This patch introduce ECAP_PASID via "x-pasid-mode".
>
> Hi; Coverity points out an issue with this code (CID 1508100):
>
> > -static guint vtd_uint64_hash(gconstpointer v)
> > +static guint vtd_iotlb_hash(gconstpointer v)
> >  {
> > -    return (guint)*(const uint64_t *)v;
> > +    const struct vtd_iotlb_key *key =3D v;
> > +
> > +    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>
> key->sid is a uint16_t, and VTD_IOTLB_SID_SHIFT is 20. That
> means that the shift will be done as a signed 32 bit operation,
> losing the top 4 bits of key->sid; then it will get sign
> extended to 64 bits, so if bit 11 of key->sid is 1 then
> we will end up with 1 bits in 63..32 of the output hash value.
> This seems unlikely to be what was intended.

Right.

>
> > +           (key->level) << VTD_IOTLB_LVL_SHIFT |
> > +           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> >  }
>
> Also, VTD_IOTLB_LVL_SHIFT is only 28, so either the
> shift values are wrong or the type of key->sid is wrong:
> can there be 8 bits here, or 16 ?

It should be 16.

>
> Since PASID_SHIFT is 30, if key->pasid can be more than
> 2 bits wide we'll lose most of it.
>
> If key->level will fit into 2 bits as the SHIFT values
> suggest, vtd_iotlb_key could probably use a uint8_t for it,

Right.

> which would let that struct fit into 16 bytes rather than 18.

Ok, So to summarize:

1) key->gfn could be full 64bit
2) key->sid is at most 16bit
3) key->level is at most 2bit
4) key->pasid is at most 20bit

So we will lose some bits for sure.

Since the current VTD_IOTLB_PASID_SHIFT is 30, we might waste 14bits
there, then I tend to change

VTD_IOTLB_SID_SHIFT to 26 (42-16)
VTD_IOTLB_LVL_SHIFT to 42 (44-2)
VTD_IOTLB_PASID_SHIFT to 44 (64-20)

>
> > @@ -302,13 +321,6 @@ static void vtd_reset_caches(IntelIOMMUState *s)
> >      vtd_iommu_unlock(s);
> >  }
> >
> > -static uint64_t vtd_get_iotlb_key(uint64_t gfn, uint16_t source_id,
> > -                                  uint32_t level)
> > -{
> > -    return gfn | ((uint64_t)(source_id) << VTD_IOTLB_SID_SHIFT) |
> > -           ((uint64_t)(level) << VTD_IOTLB_LVL_SHIFT);
> > -}
>
> In the old code you can see that we did casts to uint64_t in order
> to ensure that all the arithmetic was done as unsigned 64 bits.

Right, I will post a fix.

Thanks

>
> thanks
> -- PMM
>


