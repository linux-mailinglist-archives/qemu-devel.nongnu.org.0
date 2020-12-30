Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C72E7B0F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 17:30:38 +0100 (CET)
Received: from localhost ([::1]:47910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kueMt-00062X-Qn
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 11:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kueLF-0005ZG-Dp
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 11:28:53 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kueLD-00089b-PV
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 11:28:52 -0500
Received: by mail-ej1-x62b.google.com with SMTP id x16so22526970ejj.7
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 08:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OL1gDXaUL94xAFvFqeyz5h7saOREKl+cmP/wEvLz8M0=;
 b=q/KpaEeit/1G67lcTxKRkHMO+CDKqeSgTtjnFVmQ4nP3YAbHBY0K+xuq1v4i/0Rh77
 cF0z5/2+Spn5HIL5nTYJdn/kPWnL0hSmXWxKEfz6zoD5qJctFZUfJ0bR0vGNeLS0EftR
 qoiTKMWsWa+AjtoszrExVmYt+NMWch7hAf6XY8dgJJq3kr9jO7DJZZ4+9hngWIxu/EoV
 zVDvqOg8PqPAPWvjKPdZo9ktkk9YUl1fOin7cHMjo7PMJYDMgeZ73KqNJ9nk1ue2i5SB
 gkk0w5aeX+u6ngG7wy9K+mxNQ8vK/+AWzo97MSjg1NZxWvac88Mpc3fIm0dFGO0A1LMN
 0PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OL1gDXaUL94xAFvFqeyz5h7saOREKl+cmP/wEvLz8M0=;
 b=fq+cDnUPXt5aa2JYCb7ccLjaJx+s2ElvLUfez0V6c8bn2wQKYnZezUkl2xZgbYOQZf
 ixuUCAc7Qi/iKvWsAb67amYtUd/PN7ScN3EKLiIpgjXCIqeAPa4XXEsYu0+9jU2XQIzp
 gXnMjDJP2PIP2OUTicSBmWUtMWozq8/ZVKwADpQGXr3pY0oUo2DM+fA06mDi3x3Z+owd
 LID8glBU06goTaSbXCz3z4343UCtLJffox7tVDZScUXrf9uCFI9TWsNhdjdhstNe1hDI
 UKK5PHGG5qREK7/wuqnmJoNga6donJ4m6rQZyU55r8sfekQP52/tvssdT60oBCmrBkoq
 rI+w==
X-Gm-Message-State: AOAM532UoDXEhmcldxlqBSwvG7csF5xdPpk69dqtstb6PNzzjCT254zQ
 aQpINaWUknhHczedCsbuei9bg84ZsviIpvCcaiUqvA==
X-Google-Smtp-Source: ABdhPJyvzJFiK6R4F7ayzrD2usWFwaFRBBU8ox8sXv7UsW4Z5nOuf8HKJDUTe+6V/xfHrM8dYTaAoGU/r4jNGVvfE1k=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr49801478ejf.407.1609345729370; 
 Wed, 30 Dec 2020 08:28:49 -0800 (PST)
MIME-Version: 1.0
References: <20201228151652.235542-1-chris@hofstaedtler.name>
In-Reply-To: <20201228151652.235542-1-chris@hofstaedtler.name>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Dec 2020 16:28:38 +0000
Message-ID: <CAFEAcA-2V2W+WuewsY1a0bd_AEbotkzwy7-Qz2eVt-Jzq=6tUw@mail.gmail.com>
Subject: Re: [PATCH] meson: fix ncurses detection on macOS
To: Chris Hofstaedtler <chris@hofstaedtler.name>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Dec 2020 at 15:52, Chris Hofstaedtler
<chris@hofstaedtler.name> wrote:
>
> Without this, meson fails with "curses package not usable"
> when using ncurses 6.2. Apparently the wide functions
> (addwstr, etc) are hidden behind the extra define, and
> meson does not define it at that detection stage.
>
> Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 9c152a85bd..7b9d92c14a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -510,7 +510,7 @@ if have_system and not get_option('curses').disabled()
>    endforeach
>    msg = get_option('curses').enabled() ? 'curses library not found' : ''
>    if curses.found()
> -    if cc.links(curses_test, dependencies: [curses])
> +    if cc.links(curses_test, args: '-DNCURSES_WIDECHAR', dependencies: [curses])
>        curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
>      else
>        msg = 'curses package not usable'
> --

This sounds like the Meson conversion regressed the fix made
in commit b01a4fd3bd7d6f2 in 2017 to the configure version of
this test...

thanks
-- PMM

