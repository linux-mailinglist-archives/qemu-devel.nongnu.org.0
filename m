Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F155B8EB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:17:17 +0200 (CEST)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5krs-0003GI-IQ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kj3-0003VJ-6A
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:08:09 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5kj0-0008Lo-9U
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:08:08 -0400
Received: by mail-ej1-x636.google.com with SMTP id pk21so17768145ejb.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=m83E5tPuUuoDDINTz5Yfz67vP4ZN8+WmfLGO0oqpwpQ=;
 b=wn3zbGVomr/bAvkyCfHBYAFJKBiHbejrLQ2g/2VHvIDdtYrG6nWWak9e+N8ctAghC+
 gNKi7ONEDiv/MZEkqntFeXPGrhKbW4guflUZ2w2zIoIlyUmd2+0zSXRMUJ/CSWWi1hBE
 iNjQabGwTkV27hVkKdei2yhhVKpP5M172XJap+smzfl39S/Ehgqr6cKiKctYjTtmixX4
 WC56CtcGe9XJGrXeayl3Ema/wY9I+BH6tSEGB8mA5Mptj51dIfKmx0unpt5//MhE4Pn+
 gDuVNPYLHSSK4ep/YI+zVo1hjaa8qlMabhb5cd0vhIm7yMz1a4qDQk3Z/BiGND7ocEFV
 mLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=m83E5tPuUuoDDINTz5Yfz67vP4ZN8+WmfLGO0oqpwpQ=;
 b=EPYIIJ3Zn1SeZNOnUFiP1PVXUQGUfwN8xJgQkVX2h/C8aRzMgsYKb3kbKV+3EjuyER
 OTZU7rGoFz4XB51GNZ8FIGMSZser0nEcn3Eqm02QKkg6EQDWwc8v4ZSEHbWSL20151vy
 TVkTJpLV9cmMooBUsD3b9qt3UjRWktNhPofemfVklUaZ+Aaon1LNTtO8H4nFZquWw/hy
 4rsioJW5mOshwktehzaWhklMUFfYA46jaCC+nwO8SUA3jN+kawrK6mzSJ9Hr8tMThYxF
 LPHwx3LMIRFyejo3tQtjw/uloi8WEyk3kZvD4bmmAEyBaUq4Wip4l04gFZm/aOfErZsT
 KNeA==
X-Gm-Message-State: AJIora/l+H+ZaHQW8YKukWQz/NAIlOqd67BQKSJ1GlZgO8WmC0JIzq+d
 bpYo8lxm1c6/i1lKByROq1dukg==
X-Google-Smtp-Source: AGRyM1t0WLCAHo9UcUcHrA1fmhetAVtiy5JpYLx2UcIrbqsz3ALkHhK0Jga2IF8l6rBkxNn7eLttyA==
X-Received: by 2002:a17:906:c041:b0:718:c984:d9ee with SMTP id
 bm1-20020a170906c04100b00718c984d9eemr11751183ejb.722.1656320883990; 
 Mon, 27 Jun 2022 02:08:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h26-20020aa7c61a000000b00435cfa7c6f5sm6996348edq.46.2022.06.27.02.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:08:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CEE71FFB7;
 Mon, 27 Jun 2022 10:08:02 +0100 (BST)
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-49-richard.henderson@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 48/53] semihosting: Use console_in_gf for SYS_READC
Date: Mon, 27 Jun 2022 10:07:41 +0100
In-reply-to: <20220607204557.658541-49-richard.henderson@linaro.org>
Message-ID: <87bkuelbil.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 20e99cdcc0..4c8932ad54 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -302,6 +302,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret=
, int err)
>      common_semi_cb(cs, ret, err);
>  }
>=20=20
> +static void
> +common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
> +{
> +    if (!err) {
> +        CPUArchState *env G_GNUC_UNUSED =3D cs->env_ptr;

Why do you even both extracting env here if it's not being used?

> +        uint8_t ch;
> +
> +        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {
> +            ret =3D -1, err =3D EFAULT;
> +        } else {
> +            ret =3D ch;
> +        }
> +    }
> +    common_semi_cb(cs, ret, err);
> +}
> +
>  #define SHFB_MAGIC_0 0x53
>  #define SHFB_MAGIC_1 0x48
>  #define SHFB_MAGIC_2 0x46
> @@ -427,15 +443,8 @@ void do_common_semihosting(CPUState *cs)
>          break;
>=20=20
>      case TARGET_SYS_READC:
> -        {
> -            uint8_t ch;
> -            int ret =3D qemu_semihosting_console_read(cs, &ch, 1);
> -            if (ret =3D=3D 1) {
> -                common_semi_cb(cs, ch, 0);
> -            } else {
> -                common_semi_cb(cs, -1, EIO);
> -            }
> -        }
> +        semihost_sys_read_gf(cs, common_semi_readc_cb, &console_in_gf,
> +                             common_semi_stack_bottom(cs) - 1, 1);
>          break;
>=20=20
>      case TARGET_SYS_ISERROR:


--=20
Alex Benn=C3=A9e

