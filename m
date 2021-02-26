Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918B325F83
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:56:12 +0100 (CET)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYux-0002pL-GR
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lFYPl-0003R9-RQ
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:23:58 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:32838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lFYPj-0005x4-V9
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:23:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id 7so7724406wrz.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vt4rqWW/cUh0a/p4IZj2bZduLB4ygab86ObvHCIWI5Y=;
 b=zW03pUCI+G9pUBGtu10a1zUkN3H8smjDXjwQD1cMZG6ahjc1Q+pFf9xqNENCZ5kLoB
 GvBt5bILMXT2AuGtFm5NMw+XNhnRo327c0OhhnwwdWLkfxhhbTYZfgYpR8v5xvQvL1Uv
 wRG0eFpRjJEMWLehY98BIEI9qVZinX1BMRgc8QZOv1FOYTQV0ttKs/OA2OOzNNmvxgQZ
 ByDjJ5ZP4orkORCcY31/FYcKYkuH+2NcI1/WYMOPDYmOotG7hyC34eiYp1d3aQ/pw0iX
 0kxhJ3FuI2BrjkzqIKKjnZ8fyWWiXcyzXdiAqjtxAIFTRX8jzOXBcOA62CbLH5y0smKe
 S6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=vt4rqWW/cUh0a/p4IZj2bZduLB4ygab86ObvHCIWI5Y=;
 b=hdt19WUIjqGfvDKwEO5HEcyfOmz6471T0Jwe4rgSxfAq2SajfXA0iJMSXE27MicyPI
 ldr/xuQ1Vttf/Nz6b+pmOuYUA/XR4IPJbde8bAPpklQDmYk8SZi3XcoG/uoNfiQdBrRY
 oJS6YTZIEJybnQXkzQUxqie8v0EtksDaLDiW9i2L9n593nJtQ5+pg3YMw0fEpStFv7Fx
 PFy/T3z6LwECmPoOBA8fjVn19a5cGXKr/d7mrt0yeJFeqtnZBgekRzf0DMO83Nem52cd
 okEZr0OWj/2Hs+GqTHdoH0uSg3sP6LXTRG5gWTXdY3vjA21Bw8HI6gVsWuaH3lgBm/B5
 3zTw==
X-Gm-Message-State: AOAM530udyO2Sc/yDel60iuBii8ahM4FSCkYaR2aCyKqGceBLy41wRI7
 hAiZAJt7csAcjI+xLUdzNINTAQ==
X-Google-Smtp-Source: ABdhPJzE96eqFLu8pn57jfsyX87ADotnNdDhWqXULpiOoHI05X3/mRbDSDYhknF6J1J58y21pqYrmA==
X-Received: by 2002:a5d:570b:: with SMTP id a11mr1884096wrv.281.1614327833186; 
 Fri, 26 Feb 2021 00:23:53 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id z14sm12353434wrt.89.2021.02.26.00.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:23:52 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id c4817dfc;
 Fri, 26 Feb 2021 08:23:50 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
In-Reply-To: <20210225230238.3719051-4-philmd@redhat.com>
References: <20210225230238.3719051-1-philmd@redhat.com>
 <20210225230238.3719051-4-philmd@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Fri, 26 Feb 2021 08:23:50 +0000
Message-ID: <m2im6fb5k9.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::42d;
 envelope-from=dme@dme.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 haibinzhang <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Friday, 2021-02-26 at 00:02:38 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> If the block drive is read-only we will model a "protected" flash
> device. We can thus use memory_region_init_rom_device_from_file()
> which mmap the backing file when creating the MemoryRegion.
> If the same backing file is used by multiple QEMU instances, this
> reduces the memory footprint (this is often the case with the
> CODE flash image from OVMF and AAVMF).
>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi01.c | 20 ++++++++++++++------
>  hw/block/pflash_cfi02.c | 18 ++++++++++++++----
>  2 files changed, 28 insertions(+), 10 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index a5fa8d8b74a..5757391df1c 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -743,11 +743,19 @@ static void pflash_cfi01_realize(DeviceState *dev, =
Error **errp)
>          pfl->ro =3D 0;
>      }
>=20=20
> -    memory_region_init_rom_device(
> -        &pfl->mem, OBJECT(dev),
> -        &pflash_cfi01_ops,
> -        pfl,
> -        pfl->name, total_len, errp);
> +    if (pfl->blk && pfl->ro) {
> +        memory_region_init_rom_device_from_file(&pfl->mem, OBJECT(dev),
> +                                                &pflash_cfi01_ops, pfl,
> +                                                pfl->name, total_len,
> +                                                qemu_real_host_page_size,
> +                                                RAM_SHARED,
> +                                                blk_bs(pfl->blk)->filena=
me,

How will this behave if someone does:

    -drive file=3DOVMF_CODE.fd.qcow2,index=3D0,if=3Dpflash,format=3Dqcow2,r=
eadonly=3Don

Honestly, I'm not sure why they would, but it works today.

> +                                                true, errp);
> +    } else {
> +        memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
> +                                      &pflash_cfi01_ops, pfl,
> +                                      pfl->name, total_len, errp);
> +    }
>      if (*errp) {
>          return;
>      }
> @@ -755,7 +763,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>      pfl->storage =3D memory_region_get_ram_ptr(&pfl->mem);
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
>=20=20
> -    if (pfl->blk) {
> +    if (pfl->blk && !pfl->ro) {
>          if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_l=
en,
>                                           errp)) {
>              vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 4f62ce8917d..d57f64d7732 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -803,16 +803,26 @@ static void pflash_cfi02_realize(DeviceState *dev, =
Error **errp)
>          pfl->ro =3D 0;
>      }
>=20=20
> -    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
> -                                  &pflash_cfi02_ops, pfl, pfl->name,
> -                                  pfl->chip_len, errp);
> +    if (pfl->blk && pfl->ro) {
> +        memory_region_init_rom_device_from_file(&pfl->orig_mem, OBJECT(p=
fl),
> +                                                &pflash_cfi02_ops, pfl,
> +                                                pfl->name, pfl->chip_len,
> +                                                qemu_real_host_page_size,
> +                                                RAM_SHARED,
> +                                                blk_bs(pfl->blk)->filena=
me,
> +                                                true, errp);
> +    } else {
> +        memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
> +                                      &pflash_cfi02_ops, pfl, pfl->name,
> +                                      pfl->chip_len, errp);
> +    }
>      if (*errp) {
>          return;
>      }
>=20=20
>      pfl->storage =3D memory_region_get_ram_ptr(&pfl->orig_mem);
>=20=20
> -    if (pfl->blk) {
> +    if (pfl->blk && !pfl->ro) {
>          if (!blk_check_size_and_read_all(pfl->blk, pfl->storage,
>                                           pfl->chip_len, errp)) {
>              vmstate_unregister_ram(&pfl->orig_mem, DEVICE(pfl));
> --=20
> 2.26.2

dme.
--=20
And you're standing here beside me, I love the passing of time.

