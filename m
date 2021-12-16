Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB576477D73
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:23:22 +0100 (CET)
Received: from localhost ([::1]:41706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxHd-0007lp-Av
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxxFn-0006TI-Io
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:21:27 -0500
Received: from [2a00:1450:4864:20::434] (port=40527
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxxFm-0005nr-4K
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 15:21:27 -0500
Received: by mail-wr1-x434.google.com with SMTP id q16so139686wrg.7
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 12:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ieq9EUBE5XMyU7or/TU0iN0xepuITx8+wHEFB88jEik=;
 b=CAISfMMdncYFS9dqpqu2yLN/OK0WDYyjro5xpLxwmm3IPXTLzgGwtJrWv/KqpjAKqm
 OdKpvKRYOxVZcLzsjOSH4Jyk9fT6b43oy4BPMtkIWYQr8+LkXvmYowR/LpA3YMOfm9ZU
 mr19VBJzP8+PxQWVmR/qy+yuTbVPw9hPXb6JsDWa3SiumOcLjHlWtJv6W+t2h8uTo9Ig
 +gbsu66kjNlJjwFgiS/OL93TwclYHeNmFIRYft0Hdb0uPdRGBWfX38hQNWSMrrELJh0+
 DFbWioH1pHr3mtTWaJEryer5a370QP3aYUWEstFxUAJp9HjvZgJ98Gcs/eQ5MmPNjcy/
 skLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ieq9EUBE5XMyU7or/TU0iN0xepuITx8+wHEFB88jEik=;
 b=BJR2HyoOOLtVsE7WCmxF+qM1AfYDk/k5X9cfM75sEuYMk6wgYOgLMCpba5a3z/fF1a
 SN/FN2pyENEoV8mPXahir+EMpvttcimL7VJXldNKIzqqc8nETDyHUXXtgUTkbbjHMoww
 SXJmMRkYRVSJ9iOCSPbtPKZ4qd+9+xFGxpqdvuM9W5h5s8puaY8oSElZs5uFIOVit4ks
 eSKTqpFTq871pZ7p7b820eNxOcxD6e69hg26yQFmD7JZNY0+A0g9R3B5rssmpT0BCEy1
 mPvN8D52H8FB97VqrCi3Leine5PQUbD+nsaG10lHssBpWFT3tL2WHr3u91CWshJptSQc
 oi9A==
X-Gm-Message-State: AOAM5314MDqVRXRMK6i1tnq3vCs9BUmXhUVibwlT5wW7D26kU4xe4mx1
 h33atM+q9pFAFFubNC9ndCYsNUCdeShk44x3Box32g==
X-Google-Smtp-Source: ABdhPJwomWQq+Dt2ooBQ7crIBJnnJLlhCCEVJDas8FLyPe4Rd9Et6P7nwkQ4n5u7CxZTvAAuJWiKQ+zgXsfEeMD6zhg=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr825038wri.295.1639686081477;
 Thu, 16 Dec 2021 12:21:21 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT1x=9z9jwRxUg-J_nyGQKiga=xcDddWzG5a9HCkiC2Tog@mail.gmail.com>
 <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
 <CAFEAcA9v6JQD3OR1tKL7yJaY+=-ohhvMCzF4xpSRAATXAB59vA@mail.gmail.com>
 <CAP4GjT1dhNPhHgNWJFH1CJg4zkZU0zkGr-rAqTZE1-HzqG=ahw@mail.gmail.com>
 <CAP4GjT3uOQgqc6pGDEKJjALSgjpHKYUaiZEHMtnYKWxV9oxfZQ@mail.gmail.com>
In-Reply-To: <CAP4GjT3uOQgqc6pGDEKJjALSgjpHKYUaiZEHMtnYKWxV9oxfZQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Dec 2021 20:21:10 +0000
Message-ID: <CAFEAcA-OEKx9OKPK97Tx0=RuVV8KPGnA1OimKj47y5EcDDVseA@mail.gmail.com>
Subject: Re: Exception return
To: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Dec 2021 at 20:07, abhijeet inamdar
<abhijeetinamdar3005@gmail.com> wrote:
>
> If I won't make that change it gives me immediate error as follows:
>
> Taking exception 18 [v7M INVSTATE UsageFault]
> ...BusFault with BFSR.STKERR
> ...taking pending nonsecure exception 3
> qemu: fatal: Lockup: can't take terminal derived exception (original exception priority -1)

We've been round this one before. I told you the right way to
set the reset VTOR value if your SoC has something different
from the default, and it isn't by changing that bit of code.

Regardless, that doesn't seem related to the problem you're
having at the moment.

-- PMM

