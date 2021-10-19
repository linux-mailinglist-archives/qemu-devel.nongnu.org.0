Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FD0433C03
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:23:17 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrtU-0001BT-GB
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcr1t-0001cZ-Q0
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:27:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcr1r-0001jd-BR
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:27:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso3592733wmb.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QU5Pt9yX7GErzaOYMLx6zrnJjJYRCAd22NuMBxYlxkE=;
 b=maTEdVnpkfjM47KjsnSfMk0sU7Oy1JHivZjjQWhR52uRTniTKuvYIinwCop36NnBqr
 ACuml4PS7OSd95R0lmKm4xQODkm0FIMg4mJXZZk7AMI4zPRWmAeVtNeLFveRDa2X9Uhq
 Sy/siGHpwN+Wq+Iaw1XVRlVuuJ72wWnPEdHqvcDz34keFHY8emxTG9M1/bYPgsUMR5yZ
 4XKTGLvwIiQc4z6lPW6EvULHxcjv2p28kj9i2caP15c08UR93H/xi4IGnjIRXJUwzuDW
 saK66UMApsWDAa8jp60r0DRjwYGBDcFlk6JRE0B2Us/QMEwCn9+YGGGI9cuoGtyVPayR
 pH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QU5Pt9yX7GErzaOYMLx6zrnJjJYRCAd22NuMBxYlxkE=;
 b=nfdi+N8fJ3gvTn196PRR2o+s6Nm6RAEq3KtcZa3EzIoLZ8bbEM9Khl72xltOJeDZ3m
 Gv7t8I1Of1o+cxjZ/GHk0arE6RlTgLEznQgu2vTWJ+M0ZSAAsgbOX/qvtEcSP+I46s++
 oSkf4BmDhCCtMXvMBLmrklGF8Gduw2KOwo3mlC4Ezne+t/Nqg4weF6Urc+nC4wFPp3n3
 st6fG//m+ZGByEufcS+bQitbj7vVefSd6G95Klo9BJ6vN4fBSlHhQyR05c4w9+imTVZ0
 fM0UTzWXqY6V6aOlxYEfpA7QFnmlDE72UzziRN/b/w9uMmOwswJMahzNYuqJBiG+GESx
 PTEg==
X-Gm-Message-State: AOAM533Uu6SRewOk5HEAS3M+g9bord92yCE3TSQNZBe6QHz6983jE2+w
 1ugOgCb2gvg6n+WL0NlDyVJ1Aw==
X-Google-Smtp-Source: ABdhPJwXhmkzcHdrJmgixVDv1DThnMwHyz+LaB/jGsudjIzcB7aa5GDeufUD//x5UH79z40VwqkIfg==
X-Received: by 2002:a05:6000:188d:: with SMTP id
 a13mr44705947wri.243.1634657269481; 
 Tue, 19 Oct 2021 08:27:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n68sm2437840wmn.13.2021.10.19.08.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 08:27:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1EB41FF96;
 Tue, 19 Oct 2021 16:27:47 +0100 (BST)
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 02/48] tcg/optimize: Split out OptContext
Date: Tue, 19 Oct 2021 16:25:18 +0100
In-reply-to: <20211007195456.1168070-3-richard.henderson@linaro.org>
Message-ID: <87tuhdxcek.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Provide what will become a larger context for splitting
> the very large tcg_optimize function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 77 ++++++++++++++++++++++++++------------------------
>  1 file changed, 40 insertions(+), 37 deletions(-)
>
> diff --git a/tcg/optimize.c b/tcg/optimize.c
> index 148e360fc6..b76991215e 100644
> --- a/tcg/optimize.c
> +++ b/tcg/optimize.c
> @@ -44,6 +44,10 @@ typedef struct TempOptInfo {
>      uint64_t z_mask;  /* mask bit is 0 if and only if value bit is 0 */
>  } TempOptInfo;
>=20=20
> +typedef struct OptContext {
> +    TCGTempSet temps_used;
> +} OptContext;
> +
>  static inline TempOptInfo *ts_info(TCGTemp *ts)
>  {
>      return ts->state_ptr;
> @@ -90,15 +94,15 @@ static void reset_temp(TCGArg arg)
>  }
>=20=20
<snip>
> @@ -605,7 +609,7 @@ void tcg_optimize(TCGContext *s)
>  {
>      int nb_temps, nb_globals, i;
>      TCGOp *op, *op_next, *prev_mb =3D NULL;
> -    TCGTempSet temps_used;
> +    OptContext ctx =3D {};
>=20=20
>      /* Array VALS has an element for each temp.
>         If this temp holds a constant then its value is kept in VALS' ele=
ment.
> @@ -615,7 +619,6 @@ void tcg_optimize(TCGContext *s)
>      nb_temps =3D s->nb_temps;
>      nb_globals =3D s->nb_globals;
>=20=20
> -    memset(&temps_used, 0, sizeof(temps_used));

Did you mean to drop this memset entirely given I see it being done
later on?

<snip>
> @@ -1302,7 +1305,7 @@ void tcg_optimize(TCGContext *s)
>                                             op->args[1], op->args[2]);
>              if (tmp !=3D 2) {
>                  if (tmp) {
> -                    memset(&temps_used, 0, sizeof(temps_used));
> +                    memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
>                      op->opc =3D INDEX_op_br;
>                      op->args[0] =3D op->args[3];
>                  } else {

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

