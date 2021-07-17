Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804193CC4F4
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:41:55 +0200 (CEST)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oK2-0001ZQ-Cu
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oIJ-0000fU-Cv
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:40:07 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oIH-0000lh-Jf
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:40:07 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gb6so20386082ejc.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3AktmZTcADIO4aOGauzZENJY9jXAjIlmrwq+pM64KI=;
 b=IyLkusOyheUeA4y8zuBWK9RJ9Whp4z/QefPD0qVLwrlYBorYj/UsAsvs9skWQ19deI
 Udk6nGeq19YyDGtbmZZv5yR6EGVPqludBAlOsLwUP1FGSf1jvlBi60BnlXrSvG8ryZCB
 tHDu1DWRyX4OSET68y1SLHZ/ROMkvFBikJnLoUmSUicPMxoFE3fSR1p+IS/mVZixiUmO
 dX9QrtpUimx1Xgpk3Ej87KWBq9DmrItAkPIjdLIIMQivSa2HwB0GWd9TpnSLNIr4QVOE
 ksjTkTVnl+rWXN9/xvlh4vGzirQJS08lq1jD91Ud2YmwPD/1KlgWX7Z7LrUnBO5SnN2/
 WCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3AktmZTcADIO4aOGauzZENJY9jXAjIlmrwq+pM64KI=;
 b=gBFcByIeHiMNTaiwXBPPUf2Ser5bFSIYEgPbAEtFPhvxSxy9/Ypk6MONA3L2h2rRVi
 LMLjCA2HPfLhhWvv91NbAeDrgfO92lvge48ZD3GGElctI5QBaWBh94aiuoN8HFgu7Z3R
 2ec8ITSensxpVsk0ubqbdaU/3tuPqCJTumKK6CPuTxVWJu/lrfiwtD5xg8L6sH2F1FJv
 /dj98ppojZaxEBtxrvAyN/Tys5uOmC4j5d9821dSBKDimyhuZnvj1lsadFgtReCH5jVa
 4UDO5TuUsKswkLXxEB6PIzHUyjgYnrHeOXzua0YDot9hQlw8KNJnU6Bb4VKfz837XoNE
 JUcQ==
X-Gm-Message-State: AOAM533PH1KfE1+lgJdPo3QGBShqaSvIwquLB/E+9TMN2cZmLR8m0PTw
 4olSGm5VBl4SxZASnCOFUbXDUa+aqZx+tW8CtztIvQ==
X-Google-Smtp-Source: ABdhPJyfUPa7LenZJlgoEa449O0sc3fxS8McFba7vXOmurgxRWtlgnRR97fJDdMooXPgpEbvaaVVI9U8QJIDx0Dl7ak=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr18325552ejc.4.1626543603830; 
 Sat, 17 Jul 2021 10:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-5-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:39:23 +0100
Message-ID: <CAFEAcA8P=q7dHUSGcA9jbfWHuzz1jjeoL3wdQd4qFJCnH2PwxA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The purpose of suppressing goto_ptr from -d nochain had been
> to return to the main loop so that -d cpu would be recognized.
> But we now include -d cpu logging in helper_lookup_tb_ptr so
> there is no need to exclude goto_ptr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index d3232d5764..70ea3c7d68 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
>      uint32_t cflags = cpu->tcg_cflags;
>
>      if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
> -        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
> +        cflags |= CF_NO_GOTO_TB;
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

