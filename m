Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77776DEC1F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 08:53:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmUL6-000848-3w; Wed, 12 Apr 2023 02:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmUL3-00083P-DC
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:52:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pmUL1-0005gQ-6r
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 02:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681282333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSeL+PaqNg3lsEXZwzBLE7lOoU4NjYxJ47tovohaNnM=;
 b=JMxR7+2L/YZLgxuPnLvcnnzhr71EFgUpfwh14lXWAtHm8rLzyBoV96rdtIlg4d83Y+iWTP
 H/CB7y0Cn1GV1DxCU57nWzphSHDv7qxGNl/th6BBtLSQ3skqTzBuVMb+FkBrAL8i7INunX
 yJWn7rZnvRxX3FBIQTwOl2AQAJb/lVE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-z-4TbeqgN9-yfijD0GGUNQ-1; Wed, 12 Apr 2023 02:52:12 -0400
X-MC-Unique: z-4TbeqgN9-yfijD0GGUNQ-1
Received: by mail-ot1-f72.google.com with SMTP id
 t23-20020a9d66d7000000b0069f913914d8so2768736otm.5
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 23:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681282331; x=1683874331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xSeL+PaqNg3lsEXZwzBLE7lOoU4NjYxJ47tovohaNnM=;
 b=Oru1wP77Sv6fH4aQHdLVCYi083V81UAwr5C/8CuMaTfNWm7AMp+3iyrqaSZomAv6t3
 SMEp4IXXSOWk1FLCmIkIVOATgzvJ94AVQMf8ETsbLK/nv9M3M1mW7uRZjfFXWbMbEAKk
 7rTF5h8L1kxip7hEHcmUoDmQ51HxfHoawNLmkm5xeXNK1G8vTlwy2ebD8Y+GFudr0gYq
 GgJBcY0bk+8Wfw+/Vjku+wuMX2e7MT8n2OY+t0rQIfIeECu8HamjMdIreCbXI/tbJ853
 VRVsvoOUDYh8tHq65jdursTGnT8aeYXdZPiHYBsZTQbbnYel2LtN8plDxnmbaf57KZAh
 YvlQ==
X-Gm-Message-State: AAQBX9ee3bUFUW4O+oJtpMGr7eWy+dC6xiIMNOe1/Ykury8V+q7QSEKB
 SScNJrYlAHEuyw870G0+ZM+tE5hPB56/naOojI8eSwR9wzzrWJTNOT6sl0pWGlW3nrfVO0xS/M9
 6y6kJMh9hOY7U+LaA1jm15Bvbszh/+vI=
X-Received: by 2002:a05:6870:2495:b0:177:b9c0:bcba with SMTP id
 s21-20020a056870249500b00177b9c0bcbamr865592oaq.3.1681282331331; 
 Tue, 11 Apr 2023 23:52:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZovvLSRUbXaQVgVZwITCDcPihAXxb7d2RclJsl8GmVgMHA0n/Atyr7EYSt0yBqoXFf/1nWJG6Lj1vFV4OPr0A=
X-Received: by 2002:a05:6870:2495:b0:177:b9c0:bcba with SMTP id
 s21-20020a056870249500b00177b9c0bcbamr865587oaq.3.1681282331127; Tue, 11 Apr
 2023 23:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230410033208.54663-1-jasowang@redhat.com> <ZDVrSVW0FoEuq6+2@x1n>
 <CAFEAcA9jbuR72u=o6tUvpiA+SYFiASnoYRocKWVurscvdUJJAg@mail.gmail.com>
 <ZDVyQaEiDyEXNiOH@x1n>
In-Reply-To: <ZDVyQaEiDyEXNiOH@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 14:52:00 +0800
Message-ID: <CACGkMEuvug6pphJbDh4op4HhhcYKN28aJFAd2iX+2FJhuXbWVA@mail.gmail.com>
Subject: Re: [PATCH for 8.1] intel_iommu: refine iotlb hash calculation
To: Peter Xu <peterx@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, mst@redhat.com,
 qemu-devel@nongnu.org
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

On Tue, Apr 11, 2023 at 10:44=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:
>
> On Tue, Apr 11, 2023 at 03:30:08PM +0100, Peter Maydell wrote:
> > On Tue, 11 Apr 2023 at 15:14, Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Mon, Apr 10, 2023 at 11:32:08AM +0800, Jason Wang wrote:
> > > > @@ -222,9 +222,9 @@ static guint vtd_iotlb_hash(gconstpointer v)
> > > >  {
> > > >      const struct vtd_iotlb_key *key =3D v;
> > > >
> > > > -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
> > > > -           (key->level) << VTD_IOTLB_LVL_SHIFT |
> > > > -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> > > > +    return key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SID_SHIFT=
) |
> > > > +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
> > > > +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
> > > >  }
> >
> > > >  /* The shift of source_id in the key of IOTLB hash table */
> > > > -#define VTD_IOTLB_SID_SHIFT         20
> > > > -#define VTD_IOTLB_LVL_SHIFT         28
> > > > -#define VTD_IOTLB_PASID_SHIFT       30
> > > > +#define VTD_IOTLB_SID_SHIFT         26
> > > > +#define VTD_IOTLB_LVL_SHIFT         42
> > > > +#define VTD_IOTLB_PASID_SHIFT       44
> > >
> > > This is for the hash function only, IIUC it means anything over
> > > sizeof(guint) will be ignored and not contributing anything to the ha=
sh
> > > value being generated due to the uint64->guint conversion.
> > >
> > > IOW, I think "level" and "pasid" will just be ignored.
> >
> > Whoops, hadn't noticed that guint type... (glib's
> > g_int64_hash()'s approach to this is to XOR the top
> > 32 bits with the bottom 32 bits to produce the 32-bit
> > hash value.)
> >

I will do this in next version.

> > Also, does anybody know what the requirements are on
> > consistency between the hash_func and the key_equal_func
> > for a GHashTable ? Is the hash_func supposed to return the
> > same hash for every key that compares equal under key_equal_func ?
>
> I quickly checked up a local (but old) glib code (v2.71.0), and it seems
> this is the major place where key_equal_func() is used (also see the
> comment above the comparison):
>
> g_hash_table_lookup_node()
> {
> ...
>       /* We first check if our full hash values
>        * are equal so we can avoid calling the full-blown
>        * key equality function in most cases.
>        */
>       if (node_hash =3D=3D hash_value)
>         {
>           gpointer node_key =3D g_hash_table_fetch_key_or_value (hash_tab=
le->keys, node_index, hash_table->have_big_keys);
>
>           if (hash_table->key_equal_func)
>             {
>               if (hash_table->key_equal_func (node_key, key))
>                 return node_index;
>             }
>           else if (node_key =3D=3D key)
>             {
>               return node_index;
>             }
>         }
> ...
> }
>
> I would guess hash_func() is only the fast version but if key_equal_func(=
)
> is provided it'll be the final / most accurate way to tell whether two
> nodes are the same.
>
> I assume from that POV the hash function should return the same value if
> key_equal_func() tells they're the same node.

I think so.

Thanks

>
> Thanks,
>
> --
> Peter Xu
>


