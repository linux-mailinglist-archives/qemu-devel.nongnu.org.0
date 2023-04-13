Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82F6E0ADF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:59:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmtjV-0000BJ-3Q; Thu, 13 Apr 2023 05:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmtjU-0000B6-1D
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:59:12 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmtjS-0006md-BP
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:59:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v27so4412014wra.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681379948; x=1683971948;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLd/0LfUHXk3WHZrPADOs9dwbmtNw3ExOeeJ5REstss=;
 b=v1EnYVb0ttMmVPAmnr8OZf16L71MDog7E/Bmj0ceOErLrSAYJbA9PqsbmKWBRYzxNr
 gl2Jiq9sV+mPWzCs954ME5IDuOUvxWJf+p9y4WWVuGrP+FupXQLxJ7w+rVOKu5Nj0UoC
 IHpLUYFu2LS2ycWtA+IOJVc0wAB41q4OMZiwWOFjJSAuXgFO2MkN21wYOmA2YgLXovnf
 t0oFjQb4VXvA2cBGxd7jPLi95jncv/RJ7lHE4LXmWecCgmgWTXfp+dEFgdUnkhSA29pD
 MViYcvkF1SJd/8932WbDIPB6+l64DpkGzHvLJ2Z2/FR+CaeDue9+lY3Yz660xSThARQd
 6W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681379948; x=1683971948;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uLd/0LfUHXk3WHZrPADOs9dwbmtNw3ExOeeJ5REstss=;
 b=f7GbfkdqI8UZNleABZXTKmFxf2kxT1D+D1LKGq4PLAOW75TrFMy2G69ZDsIomo0F5p
 u4FGntnlxMLiEWOGCLKprBh7n/NFKTGd5kxvjSD19S/iDtofQSp0EmftAL0ecvZ7odIy
 yxodvrGdb7yAfS/QkTiKDpokaKs/ikuIn1KgqxONyWq+xd3A4iG0bfURfKXglgzy8Djl
 EMIVPjLTYEETFl5yzZLQrSI3pV3h37pgjdGCp18qU76Z14Zz4jqw4oKLi0oQc61y6qnP
 ULEOLhPuB8O0Wn50wx0nRbR5pDY6Igum8ZzWup0Wo/3nzX2fIJ7dMG8fygVEIwuT1ek3
 cRog==
X-Gm-Message-State: AAQBX9cx6OVf9sC7Z/aAvEhwphh6wfbBSBgW1YuCPYya2e51WLd7pFpo
 E7z7kIbHSHcRfwgvCILmRkE4qA==
X-Google-Smtp-Source: AKy350aO9q0bex7EFSQGkNy62jKhjOfKWAlu8GWq4en2ryz0XruePaGQGlxKAsDtGklED+ZaLnK29Q==
X-Received: by 2002:adf:dd8c:0:b0:2e4:bfa0:8c30 with SMTP id
 x12-20020adfdd8c000000b002e4bfa08c30mr1047174wrl.47.1681379948379; 
 Thu, 13 Apr 2023 02:59:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k16-20020adff290000000b002f53fa16239sm907760wro.103.2023.04.13.02.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 02:59:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B54441FFB7;
 Thu, 13 Apr 2023 10:59:07 +0100 (BST)
References: <20230412073510.7158-1-jasowang@redhat.com>
 <87bkjtpk2n.fsf@linaro.org>
 <CACGkMEsVswiJAR+2oHBeKXMAZpDFkFEZjBh37YiEVWPfdnT1pQ@mail.gmail.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, peterx@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] intel_iommu: refine iotlb hash calculation
Date: Thu, 13 Apr 2023 10:58:40 +0100
In-reply-to: <CACGkMEsVswiJAR+2oHBeKXMAZpDFkFEZjBh37YiEVWPfdnT1pQ@mail.gmail.com>
Message-ID: <874jpkcdck.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Jason Wang <jasowang@redhat.com> writes:

> On Wed, Apr 12, 2023 at 4:43=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org> wrote:
>>
>>
>> Jason Wang <jasowang@redhat.com> writes:
>>
>> > Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
>> > account when calculating iotlb hash like:
>> >
>> > static guint vtd_iotlb_hash(gconstpointer v)
>> > {
>> >     const struct vtd_iotlb_key *key =3D v;
>> >
>> >     return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>> >            (key->level) << VTD_IOTLB_LVL_SHIFT |
>> >            (key->pasid) << VTD_IOTLB_PASID_SHIFT;
>> > }
>> >
>> > This turns out to be problematic since:
>> >
>> > - the shift will lose bits if not converting to uint64_t
>> > - level should be off by one in order to fit into 2 bits
>> > - VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
>> >   some bits
>> > - the hash result is uint64_t so we will lose bits when converting to
>> >   guint
>> >
>> > So this patch fixes them by
>> >
>> > - converting the keys into uint64_t before doing the shift
>> > - off level by one to make it fit into two bits
>> > - change the sid, lvl and pasid shift to 26, 42 and 44 in order to
>> >   take the full width of uint64_t
>> > - perform an XOR to the top 32bit with the bottom 32bit for the final
>> >   result to fit guint
>> >
>> > Fixes: Coverity CID 1508100
>> > Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
>> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>> > ---
>> > Changes since V1:
>> > - perform XOR to avoid losing bits when converting to gint
>> > ---
>> >  hw/i386/intel_iommu.c          | 9 +++++----
>> >  hw/i386/intel_iommu_internal.h | 6 +++---
>> >  2 files changed, 8 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> > index a62896759c..94d52f4205 100644
>> > --- a/hw/i386/intel_iommu.c
>> > +++ b/hw/i386/intel_iommu.c
>> > @@ -64,8 +64,8 @@ struct vtd_as_key {
>> >  struct vtd_iotlb_key {
>> >      uint64_t gfn;
>> >      uint32_t pasid;
>> > -    uint32_t level;
>> >      uint16_t sid;
>> > +    uint8_t level;
>> >  };
>> >
>> >  static void vtd_address_space_refresh_all(IntelIOMMUState *s);
>> > @@ -221,10 +221,11 @@ static gboolean vtd_iotlb_equal(gconstpointer v1=
, gconstpointer v2)
>> >  static guint vtd_iotlb_hash(gconstpointer v)
>> >  {
>> >      const struct vtd_iotlb_key *key =3D v;
>> > +    uint64_t hash64 =3D key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB=
_SID_SHIFT) |
>> > +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
>> > +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
>> >
>> > -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>> > -           (key->level) << VTD_IOTLB_LVL_SHIFT |
>> > -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
>> > +    return (guint)((hash64 >> 32) ^ (hash64 & 0xffffffffU));
>>
>> Have you measured the distribution this hash gives you? Otherwise
>> consider using the qemu_xxhash() functions to return a well distributed
>> 32 bit hash value.
>
> It depends on a lot of factors and so it won't be even because the
> individuals keys are not evenly distributed:
>
> - gfn depends on guest DMA subsystems
> - level depends on when huge pages are used
> - pasid depends on whether PASID is being used
>
> I'm ok to switch to use qemu_xxhash() if everyone agree. Or if as
> Peter said, if it has been dealt with glibc, maybe it's not worth to
> bother.

Yeah I missed that glibs default hash functions where pretty basic. I
think you can ignore my suggestion.

>
> Thanks
>
>>
>> --
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro
>>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

