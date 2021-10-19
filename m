Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F1433CDC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:58:48 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsRr-0005do-Bg
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrAU-0006cK-IL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:36:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcrAR-0008AO-Ir
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:36:46 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so3378400wmq.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LXWuWJIoag0Nkl8X9JCh0oqKWsXsUDTjPd/AlJB4moY=;
 b=eOGG3yi3por9QNiTMmWhZfinPd82Z2ZpuaqYJqXrtRe4At0cOpr/8OBxaALG+bwiCL
 NpGSBEveuOHPO67+fsWARSE2HYft1vjIVg62DSuGPaRUDhZJITvOGHLwqK1vutLf7Jsx
 RS3M5teJZQpA/KYxas4pnSU8G8owCXwcd8Vq5ca8yMqdVIJwLRNwmL3/xDfi1BmCEfkS
 K0+bpd79e0h8a36oBUyfCO6+fOR0KCqS/yDhpcktey0WODpBHlwY0MH+nFeI1LN+lhtq
 MvGoSHPOdi+rFN0HO6Mqh48615e5tlgLoxWWFJxFM9S0zy2bI0EvJ9qFQlbDsKUnheHh
 h3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LXWuWJIoag0Nkl8X9JCh0oqKWsXsUDTjPd/AlJB4moY=;
 b=ZUdf/YJ8UuHbqlkHuqSrUuYU1Trd8K67AIyLrg88xeBRdTZryiY+lgsNRNwIh5thhQ
 rV/t8R42H2ZnPYiwTJBUQFkfEZ1VxRE9R+YC2ypifRIq1xB2A577WNZFPphT+e8D7Fdi
 xWleiLS669+07UUC+5f7W0KI0esNj5rnieqKwq25dvMEEPnKAdxtVqSs4QkFzdkWwgB5
 9ZlR8wxcfIrB1f2gJ2qiy9tI86Nw3AtuJO4yP4yueIzI89gFnfz8eosa/YGwxprneOBD
 q/pJHumBVyzge6Bj7UrKDcCBh3qNeHaJilpL4Y+kjj8IkfLoD0RcENauWg0AIyMwMn8R
 PAvw==
X-Gm-Message-State: AOAM5326TpnnNrvvvp+JYwpF6vyqC0iM8BS2qLmr4ykIpvFTBPJ9UH6a
 A1cT0KzonbR7z+Ev4AhjzA4DaA==
X-Google-Smtp-Source: ABdhPJwz2YbdbrthDEEQ27UY+uNfqWV535oZjJcphl9opQf7jAOEAEchsr811XUxjdt+5p855RLg/A==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr44016929wry.382.1634657800356; 
 Tue, 19 Oct 2021 08:36:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r9sm15057754wrn.95.2021.10.19.08.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:36:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4232B1FF96;
 Tue, 19 Oct 2021 16:36:38 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-41-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 40/48] tcg/optimize: Expand fold_addsub2_i32 to
 64-bit ops
Date: Tue, 19 Oct 2021 16:34:18 +0100
In-reply-to: <20211007195456.1168070-41-richard.henderson@linaro.org>
Message-ID: <87mtn5xbzt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to fold_addsub2.
> Use Int128 to implement the wider operation.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 64 +++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 21 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 0011ac31ec..5e662ad8f7 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -838,37 +838,59 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
>      return false;
>  }
>=20=20
> -static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
> +static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
>  {
>      if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
>          arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
> -        uint32_t al =3D arg_info(op->args[2])->val;
> -        uint32_t ah =3D arg_info(op->args[3])->val;
> -        uint32_t bl =3D arg_info(op->args[4])->val;
> -        uint32_t bh =3D arg_info(op->args[5])->val;
> -        uint64_t a =3D ((uint64_t)ah << 32) | al;
> -        uint64_t b =3D ((uint64_t)bh << 32) | bl;
> +        uint64_t al =3D arg_info(op->args[2])->val;
> +        uint64_t ah =3D arg_info(op->args[3])->val;
> +        uint64_t bl =3D arg_info(op->args[4])->val;
> +        uint64_t bh =3D arg_info(op->args[5])->val;
>          TCGArg rl, rh;
> -        TCGOp *op2 =3D tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i=
32);
> +        TCGOp *op2;
>=20=20
> -        if (add) {
> -            a +=3D b;
> +        if (ctx->type =3D=3D TCG_TYPE_I32) {
> +            uint64_t a =3D deposit64(al, 32, 32, ah);
> +            uint64_t b =3D deposit64(bl, 32, 32, bh);
> +
> +            if (add) {
> +                a +=3D b;
> +            } else {
> +                a -=3D b;
> +            }
> +
> +            al =3D sextract64(a, 0, 32);
> +            ah =3D sextract64(a, 32, 32);
>          } else {
> -            a -=3D b;
> +            Int128 a =3D int128_make128(al, ah);
> +            Int128 b =3D int128_make128(bl, bh);

This didn't find the Int128 support:

  FAILED: libqemu-arm-linux-user.fa.p/tcg_optimize.c.o=20
  cc -m64 -mcx16 -Ilibqemu-arm-linux-user.fa.p -I. -I../.. -Itarget/arm -I.=
./../target/arm -I../../linux-user/host/x86_64 -Ilinux-user -I../../linux-u=
ser -Ilinux-user/arm -I../../linux-user/arm -Itrace -Iqapi -Iui -Iui/shader=
 -I/usr/include/capstone -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gn=
u/glib-2.0/include -fdiagnostics-color=3Dauto -Wall -Winvalid-pch -Werror -=
std=3Dgnu11 -O2 -g -isystem /home/alex/lsrc/qemu.git/linux-headers -isystem=
 linux-headers -iquote . -iquote /home/alex/lsrc/qemu.git -iquote /home/ale=
x/lsrc/qemu.git/include -iquote /home/alex/lsrc/qemu.git/disas/libvixl -iqu=
ote /home/alex/lsrc/qemu.git/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY=
_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wst=
rict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototy=
pes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-=
style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -=
Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansio=
n-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shif=
t-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../../li=
nux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"arm-linu=
x-user-config-target.h"' '-DCONFIG_DEVICES=3D"arm-linux-user-config-devices=
.h"' -MD -MQ libqemu-arm-linux-user.fa.p/tcg_optimize.c.o -MF libqemu-arm-l=
inux-user.fa.p/tcg_optimize.c.o.d -o libqemu-arm-linux-user.fa.p/tcg_optimi=
ze.c.o -c ../../tcg/optimize.c
  ../../tcg/optimize.c: In function =E2=80=98fold_addsub2=E2=80=99:
  ../../tcg/optimize.c:865:13: error: unknown type name =E2=80=98Int128=E2=
=80=99
    865 |             Int128 a =3D int128_make128(al, ah);
        |             ^~~~~~
  ../../tcg/optimize.c:865:24: error: implicit declaration of function =E2=
=80=98int128_make128=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    865 |             Int128 a =3D int128_make128(al, ah);


possibly we are just missing:

#include "qemu/int128.h"

?

--=20
Alex Benn=C3=A9e

