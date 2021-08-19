Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799D3F1D4B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:49:30 +0200 (CEST)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGkIL-0001es-D5
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkGE-0000wa-7z
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:47:18 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGkGC-0005Rt-Nb
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:47:17 -0400
Received: by mail-ej1-x631.google.com with SMTP id qk33so13784205ejc.12
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TdbvQM5Dz07TIP4pdEfr1S5/yh4/qhmsZ5I/GZAxevQ=;
 b=CbvWdjFj7o/5GRQIw37OQrtXxkmIMiDTVxCOAt35zSthkqqe1rRczSs8dMM8iEMf08
 360LnLtNLOC+lKWBaqpOKq1NzNiSUNbNAzF3T3bOHuER64YCH3bVx8dooQwXgxleju7h
 XwniS7ZKJ6LJhMxpoXFjY7iA69zbH/Cs0nZ0KON8KSraHrwr5jY+wCmEtQBoY/gvNW+I
 9TH8QBTZzGntDN7x1lREHPsXILuIyAJQLZRun6E1VoUD+DHnI2LYG3wKbI6DKMl/qwpg
 TiTaHe7B4P9anB/WwS3G0Muwdlw7EJEItGGJ9YEC3707wJ9LeQYY5giasPJsZ+A+2Rbc
 HOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TdbvQM5Dz07TIP4pdEfr1S5/yh4/qhmsZ5I/GZAxevQ=;
 b=pEMMeHQLg/F6DtaSP7xOSAPfNll+2AwBbP/hqTn+ENTU8xysvAQVBt1/6Z8u5Txffl
 mrtR0JcmWfgJGiVvrhTDg/XF6mk/vBD4ll8KFhpMG36M0yzZzfoWcNYlwoK9NOuWoGyi
 WqDL5X31qQw91SoWRUnrxHCk6LAgRwd6JV+zmgrOdgt8XOGpIYVSdMcCdAxeTM2RqEBv
 PA+rCbty8IQNlaOc2DJ5LLtEkgUu19pIHdBKLRc2tFCuxfNhzb6NA4MPWIVyETwIi6kf
 t3Cb9497OmVlYpWfpUsg8+7ofMCN+bZrWde/t88nZyblBWUc38u2D8Pw8DrDQSQETusL
 iWEA==
X-Gm-Message-State: AOAM531Fc2weWNYs56sPZ3pfKlW1xerJeDWUvtlysJelUExRcNEOMyBI
 65c9udYU8hlvC0myVEw36Yw5mYiLfBTq4U8u172XNQ==
X-Google-Smtp-Source: ABdhPJwrzrZQXbQG/7o+q0OUGMIr3M8Q4rz1IXyGhW8M7Ou2SVQO6UnqNHvkDajwkPVElNl/NnOwJf0obLfQMG+lelM=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr16678721ejz.250.1629388035024; 
 Thu, 19 Aug 2021 08:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-16-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:46:28 +0100
Message-ID: <CAFEAcA_NWeFVSMoRLKPQKTEbwvTEJiY4YuUna5BO7KJX+RtAVg@mail.gmail.com>
Subject: Re: [PATCH v3 15/66] target/sh4: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 20:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/sh4/cpu_loop.c | 8 ++++++++
>  target/sh4/cpu.c          | 2 +-
>  target/sh4/op_helper.c    | 3 ---
>  3 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
> index 222ed1c670..21d97250a8 100644
> --- a/linux-user/sh4/cpu_loop.c
> +++ b/linux-user/sh4/cpu_loop.c
> @@ -71,6 +71,14 @@ void cpu_loop(CPUSH4State *env)
>              info._sifields._sigfault._addr = env->tea;
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
> +        case 0xe0:
> +        case 0x100:
> +            info.si_signo = TARGET_SIGBUS;
> +            info.si_errno = 0;
> +            info.si_code = TARGET_BUS_ADRALN;
> +            info._sifields._sigfault._addr = env->tea;
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            break;
>          case EXCP_ATOMIC:
>              cpu_exec_step_atomic(cs);
>              arch_interrupt = false;

Doesn't this have to wait until after the later patches in the
series that implement the "actually don't worry about alignment
on most sh4 load/stores" ?

-- PMM

