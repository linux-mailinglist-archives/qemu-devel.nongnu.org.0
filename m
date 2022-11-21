Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197E632C32
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 19:40:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxBhX-0007Dh-R9; Mon, 21 Nov 2022 13:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxBhU-0007DD-Ic
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 13:39:24 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxBhS-0001au-Jk
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 13:39:24 -0500
Received: by mail-pg1-x534.google.com with SMTP id b62so11979796pgc.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 10:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RP0McoYCXViQ6T2SF0FhxG/IFeLC9h7vuc5AbqcWDIo=;
 b=M5YGUTLSb+OD97ck1rZCSUILlMnc4JoTV62jcjx/v878yfLN80Hz49ahJVdoPW8Ezj
 G2kfoubbpZKcGdsvc0yA0le9xozDjrVZ6UvYp9FXfoNH1DsS/UIunrkc4zWtQbTCni5t
 qf+eE6oPpXemufkxwKgdMepVwAa+ElzDZqfPIubzKzepHRbQ8xSlaBr5+gmfWOHg3FSh
 F9DSgo1LI4roH/Obo1VnLDKvqY9N6Ijx3j0YKtyFNv092TJKa4nOTtb03yCqo+YnQuhe
 gkPrs6OSzZUqiHD2k1suAp9GB+x3KzuR5QwaohgeesfSU2I0HuhJu70iEtNWb5sfWPq4
 /iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RP0McoYCXViQ6T2SF0FhxG/IFeLC9h7vuc5AbqcWDIo=;
 b=lHSFqIEJYtr8xLUhfwuyPJ6poaRg3nB+A2xY6CcPxsdjvUgawh5aKUIpE37sRkWxVR
 j6PUAezL/YZnLGoMUHTVAF4vO0cS8ZqvrPGPaL74m67DF1wI75fpkN2hgKPopBxgNTJi
 KnoEmyQFndf2bsYmkggcjgglycIwokCakGayCh6OdbWM2hFtq8o4D1wpHf/GJDnZrXmW
 iuMHIxBR/H6wbrISbYi2Lj1gSbsEaXIQ741nswX/Bi9d7YFUZEnWpbUoi2rkstJmTh38
 8X1rQPCjiWwogOVEKMbE5omXomiSEs0B8vvgpkn4n7BcaVS3554mAEzWtowBKwMFLWga
 1qOw==
X-Gm-Message-State: ANoB5pkdhgCBMSHS2MJSB93GR25G8yBfnnnyyaPvJXu4tMn4JLP5TR/u
 r5mAgVE4Zs/9qSWOtECbE8L/j/WocNT4UypbNFARzg==
X-Google-Smtp-Source: AA0mqf4wpncd1sTXe/N73ApW4T7rn5tyAsIumPoBz7ghbhCldfqyXwWkjXqytMVOJo77tO+eI60nuEeRMiLgzqLQZ9k=
X-Received: by 2002:a63:5fd0:0:b0:476:f69d:9f with SMTP id
 t199-20020a635fd0000000b00476f69d009fmr18681867pgb.105.1669055960949; 
 Mon, 21 Nov 2022 10:39:20 -0800 (PST)
MIME-Version: 1.0
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-15-alex.bennee@linaro.org>
In-Reply-To: <20221111182535.64844-15-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 18:39:09 +0000
Message-ID: <CAFEAcA9bYVODgATKULZTgnBoHtivGwOP37hxraeqWw2-NrT4Ag@mail.gmail.com>
Subject: Re: [PATCH v5 14/20] hw/audio: explicitly set .requester_type for
 intel-hda
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Fri, 11 Nov 2022 at 18:35, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is simulating a bus master writing data back into system memory.
> Mark it as such.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/audio/intel-hda.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index f38117057b..95c28b315c 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
>
>  static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint=
32_t response)
>  {
> -    const MemTxAttrs attrs =3D { .memory =3D true };
> +    const MemTxAttrs attrs =3D { .requester_type =3D MTRT_PCI, .memory =
=3D true };

This doesn't look right -- it says "the requester_id field
is a PCI requester ID" but it doesn't fill in requester_id.


>      HDACodecBus *bus =3D HDA_BUS(dev->qdev.parent_bus);
>      IntelHDAState *d =3D container_of(bus, IntelHDAState, codecs);
>      hwaddr addr;

What breaks if we don't set this? Put another way, why do
we need to change this but not all the other PCI device models that
do DMA writes, most of which use MEMTXATTRS_UNSPECIFIED ?

I wonder if stl_le_pci_dma() and friends should set the
requester_id on the attrs that they are passed ?

-- PMM

