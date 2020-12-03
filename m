Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78272CD3DE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:41:00 +0100 (CET)
Received: from localhost ([::1]:35788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkm2l-0005Uz-Up
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkly8-0000W5-V1
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:36:13 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkly7-0003oF-1x
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:36:12 -0500
Received: by mail-ej1-x630.google.com with SMTP id m19so2673424ejj.11
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9mI2r2RdN1QSR05rYsKuPrgryt7Ek4UrwqMt3B2tyFY=;
 b=ETs92j3vRMMhP1vP8JfCSkk8FGdp8PYwFRbVcCYhgi2ZgVhSXg7MnkJWvOcgy+Coxm
 hW9rTgiueoY4A6jFPYmKzzY8fuFIL/jQgOzmq/LnHzZO9lGfpQxE8yiGtY91mFuo5Vml
 0OGckFvW5ZH6P37HGiBHUV/zj+o8xwj5Hh/oxFQQJd1jssMvNzDWaAHPRrUpOhzgQDCK
 tGtU+cmkuWct2ik+3gBCpZNieOovwrEOrTixacqyAV7arQQ4VoWOpSTElCC9VcyveSy4
 VZ2dgCCTyeJ+lrLwJkkIZ5WA0BT3wueykU3hO0GvNMMjsOyRwuhMovItX1aWk/i/j5cu
 hd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9mI2r2RdN1QSR05rYsKuPrgryt7Ek4UrwqMt3B2tyFY=;
 b=dirXkeQsahcA8cCdwdLZDFFOv5FOdca+2Cj0I0XptN+axHUd9WnMoTZnnTNUg2ILvi
 i56U7XjTZkj/4evauggs6KA/onw729oGtuN3O6GZYriElbgQ5XD/6xmrrH9p6IzHdG9i
 JbwUmcdKk1ZVIzrSWeTW14xbpPPF19Wr6yMWqAH3LoDSFlHJecxFFBniDjSzrObqgbSc
 cFJRwJv8tbIZMJub88UaBDUypAXsPrD/Mt4wUJmjW9BWRiFG/kxasgWfW09YnmCr1rny
 MT6TbHGNjMqSCddADLCIhoKNjB2NAlc1QI0jl0pGX+WgqUpRTn0DsGq63WZzHEOO/6uq
 T0lg==
X-Gm-Message-State: AOAM530tJ/XIrRjpoWgq6Ody7wiM3l4pZKrwsg8CYW6pHe3p87xKW4mH
 GOQBVDBvpG3ROIPVIz+DpoqgZUWjMWK+yvHfvswTqw==
X-Google-Smtp-Source: ABdhPJxbpAt+jl5WtDPsOx+CkoPE2wv96+Bxsi3tl0lkEGzAvvHGYx7IXbZmC3khOIaIwqVQAq06ViVXJVZASKp6y10=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr1983082eja.250.1606991769405; 
 Thu, 03 Dec 2020 02:36:09 -0800 (PST)
MIME-Version: 1.0
References: <1c1a5ad6-de90-b7af-b285-dfbee52803cc@elloe.vision>
In-Reply-To: <1c1a5ad6-de90-b7af-b285-dfbee52803cc@elloe.vision>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2020 10:35:58 +0000
Message-ID: <CAFEAcA_8w_Gh6tifg9ZZhF9ZxhBM5DRtOjdb07WVnuP1B6s-_A@mail.gmail.com>
Subject: Re: qemu:handle_cpu_signal received signal outside vCPU context
To: "Tj (Elloe Linux)" <ml.linux@elloe.vision>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Dec 2020 at 10:27, Tj (Elloe Linux) <ml.linux@elloe.vision> wrote:
>
> We're seeing this error on Ubuntu 20.04 amd64 host and aarch64
> qemu-aarch64-static chroot when executing 'aptitude':
>
> qemu:handle_cpu_signal received signal outside vCPU context
> qemu:handle_cpu_signal received signal outside vCPU context
>
> Research led us to an identical issue report against qemu-m68k [0] where
> it is reported this issue is resolved in 5.0.0+.
>
> Ubuntu 20.04 LTS currently ships v4.2 so I'm trying to identify the
> commit(s) that resolved this issue so we can test a cherry-pick of the fix.
>
> Do you know which commit(s) addressed this?

You might try commits 365510fb860a91 / 9fcff3a67f2be53de2d / 6bc024e713fd35e.
Otherwise, try a git bisect to see where your test case started working
correctly.

thanks
-- PMM

