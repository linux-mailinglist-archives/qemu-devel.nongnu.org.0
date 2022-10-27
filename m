Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1548A60F1E9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:10:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxuv-0004XD-La; Thu, 27 Oct 2022 04:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onxuB-0002D8-9u
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:06:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onxtv-0001ju-Kj
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:06:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso540477wmb.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1uurC34g6Qf9FWFyk2KxYKzqdHfrq68bhaSqBXYo5I=;
 b=voqhycX7azc3qkNmoaEI47DED1JheWSB5FvAWFHrw81a6fImlbnNBRSDIcvG9BExml
 26iN6aGZtpUIqliBs2HcdUXiCK9sCNgqejR09ardAtqfe1ldJOqYwTYhsy66h6AT59DR
 2e9VtXnRyyT2pb8OfQeq7gsEohoR/Vuh4xOVtgr4vsfmd6t55TrG2HE8urDAq/rk8hgy
 wnI0sfFjkvjadU1fAiW6KhI9kYv2eZsWFxUr9poXziE8F1XELnifCJiNpvsWne4sR0td
 2jDP3QSSJUfIwV5Wy0IznPBzh+7wPiFSIaFSWUWKoMtV23j+WIeqoVnVlMVQHW6rGVUI
 yRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=z1uurC34g6Qf9FWFyk2KxYKzqdHfrq68bhaSqBXYo5I=;
 b=xYWqWhKK7sylVRn0Ri3FutPhJjxmVnqoVsUUN77dkt5wNL9pPhhZk+SgOiZFTdhl8R
 yqui+XH3uJWHrgcK6yky4vjZ6bZQeFUy90w6ogCjDlccaYDycxj8fXfUyJiRYYG0PGWB
 0CwvAh5Np51cBd45QvHX5KKpQDfGV0b2ZXbITdoCbNu0/+/M3pBorto55YJrWcLHXlja
 Mvs9Aq7yv+59IeSwCSYNovYDIVUcQaBrxTQrDd9+WyM4FT1tcZloC9QQFz3VKEcFox3m
 RMLy6Kmsx2KFAE5/P6vRen/XsqNzOPFhe2+YJW5iqfmcrcf6/cJ4gpfXjr0bv+mtM/Pw
 5Keg==
X-Gm-Message-State: ACrzQf1DpotPTfdtHAItOuVDQh3t8RUP8G9UEUtqlesuTDamoZAa+gck
 ENVDhr3hYh3Zom+7G1vGZwxcxQ==
X-Google-Smtp-Source: AMsMyM5GL4qb1MFYnFCbiDZDc7xYJjB+hmZlm/UCDT+/BW/Bb1iQZ3miWz9BLFpOIdi8TqX2va0aTw==
X-Received: by 2002:a1c:25c1:0:b0:3cf:4dc4:5a97 with SMTP id
 l184-20020a1c25c1000000b003cf4dc45a97mr3556803wml.147.1666857961556; 
 Thu, 27 Oct 2022 01:06:01 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c42d500b003b492753826sm739610wme.43.2022.10.27.01.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:06:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 919ED1FFB7;
 Thu, 27 Oct 2022 09:06:00 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-11-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 10/12] hw/arm: introduce xenpv machine
Date: Thu, 27 Oct 2022 09:02:54 +0100
In-reply-to: <20221015050750.4185-11-vikram.garhwal@amd.com>
Message-ID: <87wn8l3d3r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

<snip>
> Optional: When CONFIG_TPM is enabled, it also creates a tpm-tis-device, a=
dds a
> TPM emulator and connects to swtpm running on host machine via chardev so=
cket
> and support TPM functionalities for a guest domain.
>
> Extra command line for aarch64 xenpv QEMU to connect to swtpm:
>     -chardev socket,id=3Dchrtpm,path=3D/tmp/myvtpm2/swtpm-sock \
>     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
>
> swtpm implements a TPM software emulator(TPM 1.2 & TPM 2) built on libtpm=
s and
> provides access to TPM functionality over socket, chardev and CUSE interf=
ace.
> Github repo: https://github.com/stefanberger/swtpm
> Example for starting swtpm on host machine:
>     mkdir /tmp/vtpm2
>     swtpm socket --tpmstate dir=3D/tmp/vtpm2 \
>     --ctrl type=3Dunixio,path=3D/tmp/vtpm2/swtpm-sock &

<snip>
> +static void xen_enable_tpm(void)
> +{
> +/* qemu_find_tpm_be is only available when CONFIG_TPM is enabled. */
> +#ifdef CONFIG_TPM
> +    Error *errp =3D NULL;
> +    DeviceState *dev;
> +    SysBusDevice *busdev;
> +
> +    TPMBackend *be =3D qemu_find_tpm_be("tpm0");
> +    if (be =3D=3D NULL) {
> +        DPRINTF("Couldn't fine the backend for tpm0\n");
> +        return;
> +    }
> +    dev =3D qdev_new(TYPE_TPM_TIS_SYSBUS);
> +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    sysbus_realize_and_unref(busdev, &error_fatal);
> +    sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);

I'm not sure what has gone wrong here but I'm getting:

  ../../hw/arm/xen_arm.c: In function =E2=80=98xen_enable_tpm=E2=80=99:
  ../../hw/arm/xen_arm.c:120:32: error: =E2=80=98GUEST_TPM_BASE=E2=80=99 un=
declared (first use in this function); did you mean =E2=80=98GUEST_RAM_BASE=
=E2=80=99?
    120 |     sysbus_mmio_map(busdev, 0, GUEST_TPM_BASE);
        |                                ^~~~~~~~~~~~~~
        |                                GUEST_RAM_BASE
  ../../hw/arm/xen_arm.c:120:32: note: each undeclared identifier is report=
ed only once for each function it appears in

In my cross build:

  # Configured with: '../../configure' '--disable-docs' '--target-list=3Daa=
rch64-softmmu' '--disable-kvm' '--enable-xen' '--disable-opengl' '--disable=
-libudev' '--enable-tpm' '--disable-xen-pci-passthrough' '--cross-prefix=3D=
aarch64-linux-gnu-' '--skip-meson'

which makes me wonder if this is a configure failure or a confusion
about being able to have host swtpm implementations during emulation but
needing target tpm for Xen?

--=20
Alex Benn=C3=A9e

