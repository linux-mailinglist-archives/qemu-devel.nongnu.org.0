Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DC5323D71
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:14:53 +0100 (CET)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEu0C-0002iC-Ef
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEtxb-0001Lf-V8
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:12:11 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEtxW-0004Sf-5k
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:12:11 -0500
Received: by mail-ej1-x62e.google.com with SMTP id jt13so2998569ejb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tzoa8C+Zlvv75pkQYDqXV0W8pQmKCJwDIVjozxFOjow=;
 b=sD/FR7WFlEl0v5zJLf4geRYmCc5qL5atTxrbPEG0Gn1hUl76fSP6u9gwY25JvWeOfh
 /yEmA3X0QlPueMPADvpcgtnOkOhyeIRMVACsLUmpudsICTzLuUkr3dCy77/xADHjFBwc
 xq6Sj/hZftl8oOO0tN4GtF6AFihrV+1wN4sj4JJFBl+qVB+lY/L44v0N7V44GOz/boxC
 xJhT9iyKReUp/Bbr6oNN2AzXMkikx3u653yXT9yAyNv/Lkm0dZOfnHoSw7fGVlMIZjwT
 RhambfrU59jM3KIp6dxi8p4Zh3PhEVtG4V3k3A25jI5YJOaROAopIiO8d0Rn+4vW9Fso
 JUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tzoa8C+Zlvv75pkQYDqXV0W8pQmKCJwDIVjozxFOjow=;
 b=uDeejucZcRokBOx/oIZSEqjl5YHfDgLdSys8jeL/5dVD3jxKSjsL/SyrvcUfrG1wER
 ILWAV4AMLR9ESvF9AY/SznqHmTuQM+kAXE6G3JAwTEeneee7bcu4lC96ArHP0ws/podJ
 jrSLAWLzfIRF0Eqft5mVRH5VpXIa/01d64XPePeOdRge6+d1ThJf6dhaCbqyOGUj9GSR
 7kBSN6YI/2TTKTZekAG4Y5xJaRhoCM86BnrnKVIZTMmjvhfxaEpukCo8DTGpJ3vt8s7Z
 E7hEoNol1YA7/fp0AFKNPfsI98GF2eNR8huePc2Evj0zFbC7Vn45RI0Tw/m1EMHsT17d
 dOQg==
X-Gm-Message-State: AOAM533wvE9i5I/CLJoFdsWQnH7ag/XE0F6v53D/PLR9vkp+b6WByofs
 cbfXu08QX1RyxAK/EJ8j1A8m4mDBCxHqPHI0x5yV0g==
X-Google-Smtp-Source: ABdhPJxEF7BcR4+g1MWO5/LkP0n5ec4u9iDGQ85GqcezlAgjbrT0DBRL3CKxitMyhsu5sghKEHt2yVoOL5SP5CB4g4w=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr12042016ejj.4.1614172323275; 
 Wed, 24 Feb 2021 05:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20210224120923.3154325-1-philmd@redhat.com>
In-Reply-To: <20210224120923.3154325-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2021 13:11:52 +0000
Message-ID: <CAFEAcA8OxLPeOb0TEAKSU-qJYntFPhmPeqooW5=C_55B8X+d_A@mail.gmail.com>
Subject: Re: [PATCH] meson: Only generate trace files for selected targets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 at 12:11, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> We don't need to generate trace files for targets we
> are not building. Restrict the the ones selected.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  meson.build | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 05a67c20d93..c9b0433667d 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1826,15 +1826,6 @@
>    trace_events_subdirs +=3D [
>      'accel/tcg',
>      'hw/core',
> -    'target/arm',
> -    'target/hppa',
> -    'target/i386',
> -    'target/i386/kvm',
> -    'target/mips',
> -    'target/ppc',
> -    'target/riscv',
> -    'target/s390x',
> -    'target/sparc',
>    ]
>  endif
>
> @@ -2166,6 +2157,7 @@
>    t =3D target_arch[arch].apply(config_target, strict: false)
>    arch_srcs +=3D t.sources()
>    arch_deps +=3D t.dependencies()
> +  trace_events_subdirs +=3D ['target' / arch]

This will catch all the 'target/foo' entries deleted above,
but what about 'target/i386/kvm' ?

thanks
-- PMM

