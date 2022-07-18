Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655D5782D4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:55:28 +0200 (CEST)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDQHW-0001Nv-Qm
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDQDe-0004NF-R2
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:51:26 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:41549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDQDd-000846-2U
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 08:51:26 -0400
Received: by mail-yb1-xb36.google.com with SMTP id 6so20542732ybc.8
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+ZGsKKKq6eUSmkhrkmcBY4aFhAiBmbAgxhylRDVWUJI=;
 b=AsMjHbtZu1je4dQCUkcD3pmjd9hDwCN6/70wqVSpziHPsI3JbfQjlIXSkQIBcfzKb4
 TfAXfPiNuOVAIi2rsac2DtzPwrKBJF65onkgEgTnIWBd09OFeVTydhafGs04y0oDI1zD
 wUEUVhG9QYokM2zDgKcF0zTiNVTn4qLfDNa1yqSJPkiT8Iryw85G/PGFfPnEYHErZX6F
 rM/VsR45VHGOKjxuT7352ndl8ibmToMQPBh2Pk75ep2wm3e2sVhjmrA3xvmgss8SmDSK
 dILzwrZJugLfg7OqoguHqfy8IPfx3uGOysZXEYFu3/yyqOhPfFceNYQXRl/u8IztCSvs
 srOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+ZGsKKKq6eUSmkhrkmcBY4aFhAiBmbAgxhylRDVWUJI=;
 b=7LHyfmrCXJIj+yan/2SoKYGIx5sAKK40KsNjzyi6CCOAmFylfveuqe+ZDNenMJvERZ
 N/n34jjhSU/P1uLxSHt/5K/IN4e8ELuY+bmVf7JooKBS0XarM5GtwcPDRftRkvW3tebz
 MnDNMhHcl9Qf7Io3ArbF/0LMXKtaV1EsFWhwp3VwPVjRjarm2qCkS/d4uwS5wcLXlb2y
 ej5u83A5yMfmoMhEz+pjmi/+2OeyZoYyBHJqJWJI30JDZEgay9QbQoZD+eTdnwZurzJm
 bEpXsBCmldkycKMztnl6RhhC97HSzMeelJhKoVr3GMME6LP/Gb3/cnzGsdSOA0sgo0MK
 R4Ug==
X-Gm-Message-State: AJIora8T46Qs/xlL2wS1WKptRKGJ8eR/iCF70XUouUt9L+Vyi88kwjrX
 LgcELARsygtU1/vvhuH1YcGw1muDokHFfgy8zLBe0A==
X-Google-Smtp-Source: AGRyM1vayhF/7ORfVihzTrUGwQ54QxZjpXny/tirjxOhSlefpUz+TjYPLPJJpmpEsuPtMhgMXAOVXW7l/Zf00fz8lDM=
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr26082127ybf.67.1658148683825; Mon, 18
 Jul 2022 05:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <YtQzMUuBOfBiMNlY@p100>
In-Reply-To: <YtQzMUuBOfBiMNlY@p100>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 13:51:12 +0100
Message-ID: <CAFEAcA9GzSJw4GpCkdOQPx7j24chp3WDq5tD=8FVkyYYtdrHuQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix pipe() vs. pipe2() usage for ALPHA, MIPS, 
 SH4 and SPARC
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Sun, 17 Jul 2022 at 17:10, Helge Deller <deller@gmx.de> wrote:
>
> In 2010, the commit b41a66edd0c added a thrird parameter "is_pipe2" to the

typo in commit hash (lost the first letter). Should be
fb41a66edd0c7bd6 ("alpha-linux-user: Fix pipe return mechanism."
I think ?

> internal do_pipe() function, but missed to actually use this parameter to
> decide if the pipe() or pipe2() syscall should be used.
> Instead it just continued to check the flags parameter and used pipe2()
> unconditionally if flags is non-zero.
>
> This change should make a difference for the ALPHA, MIPS, SH4 and SPARC
> targets if the emulated code calls pipe2() with a flags value of 0.
>
> Fixes: fb41a66edd0c ("alpha-linux-user: Fix pipe return mechanism.")
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 991b85e6b4..1e6e814871 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1600,7 +1600,7 @@ static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
>  {
>      int host_pipe[2];
>      abi_long ret;
> -    ret = flags ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
> +    ret = is_pipe2 ? do_pipe2(host_pipe, flags) : pipe(host_pipe);

Why do we need to do this? If the flags argument is 0,
then pipe2() is the same as pipe(), so we can safely
emulate it with the host pipe() call. It is, or at
least was, worth doing that, so that guests that use
pipe2(fds, 0) can still run on hosts that don't implement
the pipe2 syscall.

There's probably a reasonable argument to be made that we don't
care any more about hosts so old they don't have pipe2 and that
we could just dump do_pipe2() and the CONFIG_PIPE2 check, and
have do_pipe() unconditionally call pipe2(). Would just need
somebody to check what kernel/glibc versions pipe2() came in.

The architecture specific bit of target behaviour that
we need the is_pipe2 flag for is purely for handling the
weird return code that only the pipe syscall has, and
for that we are correctly looking at the is_pipe2 argument.
(The bug that fb41a66edd0c7bd6 fixes is that we used to
incorrectly give the pipe syscall return argument behaviour
for pipe2-with-flags-zero.)

thanks
-- PMM

