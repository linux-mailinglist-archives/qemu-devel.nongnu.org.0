Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68829403B24
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 16:03:18 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNyAW-0000Lf-Uh
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 10:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNy8y-0007np-BT
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:01:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNy8s-0008Dy-R8
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 10:01:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id u9so3460850wrg.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1Y9EHlxdo93vespS72aM8ACjkhjxDen3Yn/XMgqdu+g=;
 b=Tl/2Uiepu1/XiwHEZH/mBAXy3aE/F0pzfZvmUUikmYbscf/ugm26qyTgcPxR6r5d2D
 celWuhIJlTyg3jXcN0JP6VGyMbOWqMhESho0CdUokYuRTp2YnT6sgl0EKds9ByEGxuhm
 dIrH3d/ec+LQjXTbCm4Vc/AubR217dV3ZI6vW85DSLw9y+k7Cd+1Im/U9Id6uY3B0TAg
 7gW6PqpHDkBgZ6zh3anh+9P07J+MhrIxMFmIylPCH8mc3NNRuhAjanGqgaV6GIQ8opfq
 PdzEMimvAlrvaJtV5+r1tns6hX0BbeqjjxoRdIBp3ejxST2AM32+grN3GUWxKYM6yH9U
 TM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1Y9EHlxdo93vespS72aM8ACjkhjxDen3Yn/XMgqdu+g=;
 b=6giqletivhK9FAG8g0EgFHbxh0AQJuZZk/DVQ3j8DONd2yms3OYFwpiXRqmRc3861/
 Kd0DLvUUu8gxfiBav+F6pRjGIQLGr9R9edqyty5C4+1xP1kNdIQoaUK2d88saZyS/0x7
 dkTDe3oYe1SzYIKH8ZtrGvMGc5ScBI9Mlia3shIv2tnyAWmNngzsE29c5kAyRMz9YPDN
 oxIwow7tzbajXg7LR62YcXWB8ZN0w09PrYqrxU23qW9xYhMSkP+KqfymN07RMyrSKntv
 XW1do3z1LPtfRsrAF8NDOmdTVg2nxsNP5Uyb2TVqcR4M7A5flSp/3qHY7Y4rEpH3IvG6
 BBAw==
X-Gm-Message-State: AOAM5320bbchXwizKiJWcbpNp6DHCclexLu/q6ad8TZtwAqVbqEG87DN
 YYZ+FFTHguE8RPZpSIQoI12aksTzewn6jdZEtSRfrg==
X-Google-Smtp-Source: ABdhPJzglUxOpwqmlm/Faq0x7O52AzQ8then1urz6+4zADaLTKKGiGOioCXQ1VbyhlIzAhswl79OAUjqV8F3//SwDrA=
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr4380559wra.275.1631109693224; 
 Wed, 08 Sep 2021 07:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-11-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-11-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Sep 2021 15:00:43 +0100
Message-ID: <CAFEAcA8qFB_+N5pMWn2KpXzXQHY8KYfXdByZ29gJh-oMvE8f7A@mail.gmail.com>
Subject: Re: [RFC v3 10/32] build-sys: add --with-rust{-target} & basic build
 infrastructure
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 13:41, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Add the build-sys infrastructure to optionally build Rust code.
> Introduce a top-level workspace, so various sub-projects (libraries,
> executables etc) can be developed together, sharing the dependencies and
> output directory.
>
> If not Tier 1 (aarch64 and x86), all of the host architecture QEMU
> supports should be Tier 2:
> https://doc.rust-lang.org/nightly/rustc/platform-support.html

I don't think this is quite true -- for instance the riscv
TCG backend supports 32-bit, but the riscv 32 bit linux rust
port is down in Tier 3. But the major stuff seems to be in Tier
1 or 2.


> +if with_rust
> +  rust_target_triple =3D get_option('with_rust_target')
> +  if meson.is_cross_build()
> +    # more default target mappings may be added over time
> +    if rust_target_triple =3D=3D '' and targetos =3D=3D 'windows'
> +      rust_target_triple =3D host_machine.cpu() + '-pc-windows-gnu'
> +    endif
> +    if rust_target_triple =3D=3D ''
> +      error('cross-compiling, but no Rust target-triple defined.')
> +    endif
> +  endif
> +endif

Not a huge fan of this... I think we would be better to always
require the user to specify the rust target triple explicitly.


> diff --git a/.gitignore b/.gitignore
> index eb2553026c..78715bc7c4 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,5 +1,6 @@
>  /GNUmakefile
>  /build/
> +/target/

What's this for ?

>  *.pyc
>  .sdk
>  .stgit-*

thanks
-- PMM

