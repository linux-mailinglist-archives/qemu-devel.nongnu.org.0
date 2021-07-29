Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A043DA4C5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:54:45 +0200 (CEST)
Received: from localhost ([::1]:56984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96Um-0006ud-6g
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m96T8-0004gT-BE
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:53:02 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m96T6-0002Pv-J6
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:53:01 -0400
Received: by mail-ed1-x530.google.com with SMTP id y12so8323774edo.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YUCmAGAcqSEx4pALU8eSQdoJuKfD1EgKhv+t7vaYhvI=;
 b=jpNaywI9SKCPTxBSZhv2hkwpljxmHx1rcYRTevMU3D1IHW4lnjCWF4WxCjog6ijbQu
 9NhFiL+sHZNBrZR+Jd5s/p0qqltme9KMY4RufmQRN6nNGpREw7RS4nrkzaiU+LUzHP3H
 mMV4CpOnhlKakmxs0ql881gNg1evIf6TSsQ33dazd3igF0I+L/85mWXauaPKFAiRIGMy
 3jQSlUPf6djx77M7NspnKRwI90N4AbTJSpSFsYZGlJBFW0drieADJcCoM1fjcR87Jvgg
 Krhmb92peIHtd8eLTM5eCtIkp6hXYe5wwaAMN4LHDYAkYIDH2+tyVSDqErTr0y/hzFsd
 U98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YUCmAGAcqSEx4pALU8eSQdoJuKfD1EgKhv+t7vaYhvI=;
 b=lcZIs5Vpnu3DaxUQGpXlwEsCEHHZ4EfPQxL0HbihJCLeDQpVkvi1iOY/H96OAIeh00
 Bq3Z2RceSoQVrkJfxsvPWAmHr9Vd+LTGcqNai07UgdNk+VcDvCAu0p4eIG5qr7MIiHgG
 OeYTELoq5YnP5u1fp5M6rehbGcfu0r0r3iUzenze+HtogoWXPSxaCgQj8mUu8ZZiwMfy
 kN3IjDQYzmzBTnJOfsCxjowk9jIo/u6OlR1em0TFPA6F9FNS3gymRT7HvK2EumOGZ1W7
 QxdBoHH0FjjrOmLSI8pcvM8WcL7rJqLAvurMuUMPiLvo6IJpGJLOEDvP72ZOa2u5XGZe
 44OA==
X-Gm-Message-State: AOAM531j4xbXMUPVFW4V+Nsw7yPZqWGnfXv5kgtt/3VmoyvyQrSnCLmb
 PzJprBKohbvGDH1jSqNyRcue3zb5I4ey28H1t2JDfA==
X-Google-Smtp-Source: ABdhPJxHiHL+RD0ZCSxmsmXSUKPtMQbrtsQeeMWlrvGv0IneVrOZ89i6xEBA40munN3qY0U04duPV/QFbbwNKruOulU=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr6127733edt.100.1627566778999; 
 Thu, 29 Jul 2021 06:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-13-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 14:52:16 +0100
Message-ID: <CAFEAcA9yrj7OZPkeZ2jUqAV4+ULVYm4++y6kXeK2_MC8gR3-bg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 12/43] target/sh4: Implement do_unaligned_access
 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Thu, 29 Jul 2021 at 02:01, Richard Henderson
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

sh4 kernel default for unaligned accesses seems to be "warn and fixup",
not SIGBUS, unless the user changes that by writing to /proc/cpu/alignment
or the process changes it via prctl().

-- PMM

