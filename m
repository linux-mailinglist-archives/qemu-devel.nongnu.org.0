Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3787F320BAF
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 17:24:51 +0100 (CET)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDrXN-0002UT-L6
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 11:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDrVg-0001c2-31
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:23:04 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDrVc-0000T9-Rc
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 11:23:03 -0500
Received: by mail-ej1-x630.google.com with SMTP id d8so25325318ejc.4
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 08:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2cKYusg1kskNcgRFtVlCVDKwQtmlvPXYWbHDqhOp2w=;
 b=fD4F5wviUyYrhc9WTDzSrZa0jM4XN6e6KNZvhr5krlaSP6XAWCwf6oNf20ZY23yjp/
 cs++gbznV6LTjf8VoiQB+uFVnM279RsYexDbZqKozfkQdlM0Z3FOQKs1V6DGPBQ2HOkQ
 CYG3wTdMXJ/ZJM8qrg5zMBYLy33tnwoC/cntQjnMo84lzwEg1EaSwahnXcfgLtWj2UDR
 +HuYl5v5P5ozhFBQwFOgZmCKijTXFAgcgYNUIfyjZj7+2XalRuR3octB3yvw9vZWpaVc
 q6Yr0ozkowSv9oO3waNQ9ITyjWOH72DpPRRRbKI8z/DjPRokSBV1C2imeWP/RC6g6S6E
 UCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2cKYusg1kskNcgRFtVlCVDKwQtmlvPXYWbHDqhOp2w=;
 b=OLei7YJ1/ugYUQAdcPwPuxfQ5ZjZYc/JpavBeygY4aVHM8zYUMyOmaIvCccX60E15d
 AeEyOzEtwyG/qnA+L/AryHoM6GW2Do8Qmnkk/pCg/A8ohOz+I2sCLCLKxLi/6kdMMKlQ
 BZP1dkVpEKO/M4wamUmXzOD1N1JkJy3XI/Uwj6BfQQhK3TcqK47va/8NI1yGDOx2veMM
 ATQjQJOO9y8vS2NmhrDYc0fc9EM6Oj0KCp33zNJt/jIxglyivdp7vQqL2/zrUsRI/TL9
 hvQEDBjbbla1eN0BXlWnOQYlSgGxCn1XzJJ1ipl+7tvDX36BevJ7WQIsAuH0kITsCX73
 BRMg==
X-Gm-Message-State: AOAM533iwgar9T87QbIlx8SzATC/p65NOupzaawQgJ2teqbggdRc0nVa
 5Nj00A+FADnnLYAWs41Py+4xqPB+jVP8DXW3LHbBgA==
X-Google-Smtp-Source: ABdhPJwrHERMsB74sllZOHOlIYe2zJgVHIjykemR/dOGpJbOw6t4w1c5tBsda8ZHgj8GkIPsz+Mj+wnZPhyh61jyHgQ=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr17762894eje.56.1613924579248; 
 Sun, 21 Feb 2021 08:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20210221160044.28581-1-alxndr@bu.edu>
In-Reply-To: <20210221160044.28581-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 16:22:48 +0000
Message-ID: <CAFEAcA__DGB0T==xLwUNmizHznnzoYVMUOSOG8wB43LFJWLcqg@mail.gmail.com>
Subject: Re: [PATCH] configure: fix --enable-fuzzing linker failures
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 16:03, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=fuzzer-no-link.
> This should allow us to build non-fuzzer binaries using objects
> instrumented for fuzzing. However, to do that, we also need to link with
> -fsanitize=fuzzer-no-link. We were not doing that.
>
> Reported-by: Li Qiang <liq3ea@163.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configure b/configure
> index a79b3746d4..02aaea31c8 100755
> --- a/configure
> +++ b/configure
> @@ -6097,6 +6097,7 @@ if test "$fuzzing" = "yes" ; then
>    # needed CFLAGS have already been provided
>    if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
>      QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
> +    QEMU_LDFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"

Did you mean  ="$QEMU_LDFLAGS ... ?

>      FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"

-- PMM

