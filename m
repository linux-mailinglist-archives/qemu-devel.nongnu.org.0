Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CA16DEE9C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 10:43:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmW4V-0006dZ-DG; Wed, 12 Apr 2023 04:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmW4T-0006dI-IA
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 04:43:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmW4R-0005dG-Bs
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 04:43:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i3so747486wrc.4
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681288993; x=1683880993;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPrU/KgM3eM1WatHJGrTRBPsC6ZPgGVsHdU9Yps2N4s=;
 b=WWOOBE0/IfDV1+gnaPmhtFNKjJ01CDwPrsfUK7GqBYE8IvcYjhMikltPCvlp+pNUWz
 HAEaMp248YYJ36u7kh5r+yevBQpfrZam35e2PUajqrBdqF75EtqPUrT3DU0yRo7wUzOG
 +EhTBX3DzIAzaM/k1dA8HN5JIwyJeuC6lecZxE8V8efkxOil5Rwov/zmxMotfRyiamQm
 8Q1IbAOewEf3Nh/0M3JqIBVgPwF2FPgYqmvm0AUJrI/Pf7z7dkz23EqfkA5wKM66clG8
 ODB3E1qjub0MgY1Ms0OzLKkkGEk0X2E1RkZL+RxayNAkjfzdn92RayXtjDUaXg3q5E+Y
 t8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681288993; x=1683880993;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rPrU/KgM3eM1WatHJGrTRBPsC6ZPgGVsHdU9Yps2N4s=;
 b=DgCA+zzBHwbg1RFn59SVxE1bo5x9MH8UmEr3VlSNpUdMy2wq8NJ2aQEmE0mNUYvl24
 4gawwYuxNtVag8pksV/IX+fA1+TYmYoI2TsVr9oTaC6+6KorZUQO4or4k4EXzRqmoeii
 vI9uYMQXUr/ueM3DlpYywrnqZV2UIKYCK6Cq20B5w7CHX6dtaeeyoCtuYg3qw2lxnNKS
 0b95lv8mUzK+rTqfIpKdWsOcFpKU5lvXHA2yOV8tEt+vbk191p6OIkTtKiR5pEKHtXlZ
 hnBcewduErZTP24nCJrDnvS1tDelTWJsoujmowwaOFrlpwaaeSLmf7N5SI/oqpy50YCY
 Y/NA==
X-Gm-Message-State: AAQBX9fBUlimoVR6mQFinFuMz0PGx8dFzvzfxK5+d01LfxAIgYOm61dw
 wpLpXWQgMtHi98y4Ob4fMeKeUw==
X-Google-Smtp-Source: AKy350aOb1m5InTE2VF5pVqFCake+wfpbzJDcglREelG09VjQEG3ieSZaDX+MtJDzkSXHlPKQGLBGA==
X-Received: by 2002:a05:6000:1241:b0:2ef:3988:2b95 with SMTP id
 j1-20020a056000124100b002ef39882b95mr8812261wrx.56.1681288993123; 
 Wed, 12 Apr 2023 01:43:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a14-20020adfe5ce000000b002f4cf72fce6sm509804wrn.46.2023.04.12.01.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 01:43:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 769B71FFB7;
 Wed, 12 Apr 2023 09:43:12 +0100 (BST)
References: <20230412073510.7158-1-jasowang@redhat.com>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, peterx@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH V2] intel_iommu: refine iotlb hash calculation
Date: Wed, 12 Apr 2023 09:41:56 +0100
In-reply-to: <20230412073510.7158-1-jasowang@redhat.com>
Message-ID: <87bkjtpk2n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

> Commit 1b2b12376c8 ("intel-iommu: PASID support") takes PASID into
> account when calculating iotlb hash like:
>
> static guint vtd_iotlb_hash(gconstpointer v)
> {
>     const struct vtd_iotlb_key *key =3D v;
>
>     return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
>            (key->level) << VTD_IOTLB_LVL_SHIFT |
>            (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> }
>
> This turns out to be problematic since:
>
> - the shift will lose bits if not converting to uint64_t
> - level should be off by one in order to fit into 2 bits
> - VTD_IOTLB_PASID_SHIFT is 30 but PASID is 20 bits which will waste
>   some bits
> - the hash result is uint64_t so we will lose bits when converting to
>   guint
>
> So this patch fixes them by
>
> - converting the keys into uint64_t before doing the shift
> - off level by one to make it fit into two bits
> - change the sid, lvl and pasid shift to 26, 42 and 44 in order to
>   take the full width of uint64_t
> - perform an XOR to the top 32bit with the bottom 32bit for the final
>   result to fit guint
>
> Fixes: Coverity CID 1508100
> Fixes: 1b2b12376c8 ("intel-iommu: PASID support")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
> Changes since V1:
> - perform XOR to avoid losing bits when converting to gint
> ---
>  hw/i386/intel_iommu.c          | 9 +++++----
>  hw/i386/intel_iommu_internal.h | 6 +++---
>  2 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index a62896759c..94d52f4205 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -64,8 +64,8 @@ struct vtd_as_key {
>  struct vtd_iotlb_key {
>      uint64_t gfn;
>      uint32_t pasid;
> -    uint32_t level;
>      uint16_t sid;
> +    uint8_t level;
>  };
>=20=20
>  static void vtd_address_space_refresh_all(IntelIOMMUState *s);
> @@ -221,10 +221,11 @@ static gboolean vtd_iotlb_equal(gconstpointer v1, g=
constpointer v2)
>  static guint vtd_iotlb_hash(gconstpointer v)
>  {
>      const struct vtd_iotlb_key *key =3D v;
> +    uint64_t hash64 =3D key->gfn | ((uint64_t)(key->sid) << VTD_IOTLB_SI=
D_SHIFT) |
> +        (uint64_t)(key->level - 1) << VTD_IOTLB_LVL_SHIFT |
> +        (uint64_t)(key->pasid) << VTD_IOTLB_PASID_SHIFT;
>=20=20
> -    return key->gfn | ((key->sid) << VTD_IOTLB_SID_SHIFT) |
> -           (key->level) << VTD_IOTLB_LVL_SHIFT |
> -           (key->pasid) << VTD_IOTLB_PASID_SHIFT;
> +    return (guint)((hash64 >> 32) ^ (hash64 & 0xffffffffU));

Have you measured the distribution this hash gives you? Otherwise
consider using the qemu_xxhash() functions to return a well distributed
32 bit hash value.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

