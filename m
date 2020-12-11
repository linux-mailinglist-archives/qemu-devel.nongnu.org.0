Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337F92D79FF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:55:41 +0100 (CET)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knklg-0003xF-7I
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkVS-00031R-VJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:38:54 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkVR-0002Lx-Ed
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:38:54 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so12891363ejb.13
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oivjYVYvWdY+M/moriQxwH0endCbnYVTjzrzI2+lYEs=;
 b=lSGHU1dTMHTqEu5J6K92FvoQ8GipbWlg67gpHuu8jSm1s7+lCmcnExHtXmYtKsbpyJ
 DcqJwwsthse5jJdRpZy1OURusNxFp/hhU1nluQofpKsqcPks2yrKUpinhwACWVFg6yFQ
 AN5wLzSDagkQaqQJaRlXcHhow0FzII6ZpGeFg9QXCwF+2QYBhDSCwhEp4DRO99x72ZLl
 Jm14gBIQPBsUOlaDwXits9hC1tOJ73YkKe93pyw2K6zp0mghNUH2lq55l6SG2663PZgZ
 3gPWZ9wKviYih2Z3jAkf1UlXXOy9+ID06mHHIEFeoXth2SI7/kAoqko0T9uBNEyYfFsV
 y6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oivjYVYvWdY+M/moriQxwH0endCbnYVTjzrzI2+lYEs=;
 b=KUjLqUMNOHcBCWwgrZElyRD+ZMkSM2aRxGWQ3l3sp40GFJg3VwqL9iwWYJ7VOCCdEH
 ku4UGg7g8MfMPVxbAjTRQ+k9ZVBROjQ1J3hX8mt2ZUsJURjRrNk/bu/CNUl1LeTURuMk
 Cv2jAik6i3pPpK+F0fs2GcFDeawrAxCqWPH8caBXhwaJPgfyYWmTIRByC3Fi3ByOY4Pr
 cwW4Byfz3CYRhsiMD+agPsEw1Ubm1UF2q+sl/1Q4DjFlaaJF3bAUMn+BAhIak0nccZgR
 pJFHhrHVp5cl5Hm7VQYTCaXEg5qPVLanHpi1vK+kQSGNeDbjBaAVeYLtDI1xkI54lJSz
 ejMg==
X-Gm-Message-State: AOAM531k9KxebCeyE06FHE27kN1Fc/YxEdLy11PgW9u3/BBt47XU3CtT
 NCFE0iH+ey8m4HPtkgKFPpeTf2v0H5zurye+IVepng==
X-Google-Smtp-Source: ABdhPJw3SJXMSzJz80oOieJdz0OJkU2aL7B5DQ908r98TC7VGMnvMbOWsWdF5bVbuV/dTTv7X5noWoUpOqC0qTlft7M=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr11453175ejc.85.1607701131519; 
 Fri, 11 Dec 2020 07:38:51 -0800 (PST)
MIME-Version: 1.0
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-5-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-5-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:38:40 +0000
Message-ID: <CAFEAcA8BAdXL=N-OF8AxUGJMjY0zyDPotAWqT3+xQZgwz6swVA@mail.gmail.com>
Subject: Re: [PATCH 04/12] hw/timer/renesas_tmr: silence the compiler warnings
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 15:24, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Chen Qun <kuhn.chenqun@huawei.com>
>
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warn=
ing:
> ../hw/timer/renesas_tmr.c: In function =E2=80=98tmr_read=E2=80=99:
> ../hw/timer/renesas_tmr.c:221:19: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
>   221 |         } else if (ch =3D=3D 0) {i
>       |                   ^
> ../hw/timer/renesas_tmr.c:224:5: note: here
>   224 |     case A_TCORB:
>       |     ^~~~
>
> Add the corresponding "fall through" comment to fix it.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Message-Id: <20201028041819.2169003-10-kuhn.chenqun@huawei.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/timer/renesas_tmr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> index 446f2eacdd..e03a8155b2 100644
> --- a/hw/timer/renesas_tmr.c
> +++ b/hw/timer/renesas_tmr.c
> @@ -221,6 +221,7 @@ static uint64_t tmr_read(void *opaque, hwaddr addr, u=
nsigned size)
>          } else if (ch =3D=3D 0) {
>              return concat_reg(tmr->tcora);
>          }
> +        /* fall through */
>      case A_TCORB:
>          if (size =3D=3D 1) {
>              return tmr->tcorb[ch];

Yes, but maybe we should just get the patch that
refactors this code in instead ?

thanks
-- PMM

