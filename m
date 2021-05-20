Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965F38B55C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:41:17 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmfb-0000Sj-KX
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljmdr-0008BW-Jc
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:39:27 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljmdo-00078u-Mh
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:39:27 -0400
Received: by mail-ed1-x536.google.com with SMTP id b17so20408503ede.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 10:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N3MGvdRzgR1LtJ7Az3ZPPkmgQc4FSkvvpKBdGKvOLvM=;
 b=jE73w8HjnsDWz+mkVdLn/JyklyUnWGN9gjrtP28vIM7lY7lH/fo+TZPYUW/o8SGXfF
 acWzd/mj35CiMPM5VvVTDkL06CSslkcbswDvxE70zQ4aBWU01BXKizVk4P+u8nLt8K2v
 rWSIUO2ZHT+Yexj7vW4LLI5kMtX4sExoa3k/Arf2qlxb4nX8RgfBEi99TScueS79ej2c
 rP1NkDIZSx1jzsgd+PgPkYxOVkdXMTz3L7KCwM68fkk2t+ut/DQ5AuWG9QK/of2pJNrz
 6snq9UwroQiWpBEiibaTqXATWngYRLbzTAjIa1rjQd0xyyJvVuRWru1ZbF60LcbJoEz4
 IWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N3MGvdRzgR1LtJ7Az3ZPPkmgQc4FSkvvpKBdGKvOLvM=;
 b=obOEb8xHDwpvMz2EUnL1lTkLR9d8PML4srEunIMTedvi1LaQNVu1op1JADh+8PlIjD
 FekgJOYpfyQtzVVk/8PT84G/iB7XOx07kC10reHgGc7Z6CxQyEKLImGbHKiBaofiu05Y
 RquwrHmM4uZP8agtPeamp3xjQe6C3C67pA8iJk0CCOSXoco/i+q6BF2+OOy01EgTih4K
 +V1F45vNUKgd8SpGgcv0Qx83LjH+uECWD0321La0QKrJJ4La3ufGH0GlAme3Hqjg8QK+
 l3sxoFNv2nVZUFGeheTsvkdgXIOaZZp9oySBKzSyh200ktSf1lgnSyo0zx+/x7tDCtu7
 j19Q==
X-Gm-Message-State: AOAM530oqJpGr6E1mjMCNJpYrCn58ioOnzk6zVjoVDCUebD9f6K+ULY1
 245IufsZ18tLjY1P5gHsVxAwxNcRTS/zvEGWG2rqRA==
X-Google-Smtp-Source: ABdhPJwsFFo5NWmQ87KfiO124b2/uwyVZnPzAlgl6WVAd04AEWi+mYpGQuJLH+6AClrF/FqUy1Xvq9+xtvJkHYLjMng=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr6133661edv.44.1621532357246; 
 Thu, 20 May 2021 10:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2005152117400.3469@digraph.polyomino.org.uk>
 <alpine.DEB.2.21.2005152120280.3469@digraph.polyomino.org.uk>
In-Reply-To: <alpine.DEB.2.21.2005152120280.3469@digraph.polyomino.org.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 18:38:58 +0100
Message-ID: <CAFEAcA9tbvj47UMM=8yqgsRYu3mia9wzmVTQ8zsBYJey9U42Pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/i386: fix IEEE x87 floating-point exception
 raising
To: Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 May 2020 at 22:23, Joseph Myers <joseph@codesourcery.com> wrote:
>
> Most x87 instruction implementations fail to raise the expected IEEE
> floating-point exceptions because they do nothing to convert the
> exception state from the softfloat machinery into the exception flags
> in the x87 status word.  There is special-case handling of division to
> raise the divide-by-zero exception, but that handling is itself buggy:
> it raises the exception in inappropriate cases (inf / 0 and nan / 0,
> which should not raise any exceptions, and 0 / 0, which should raise
> "invalid" instead).

> Signed-off-by: Joseph Myers <joseph@codesourcery.com>
> ---
>  target/i386/fpu_helper.c                 | 126 +++-
>  tests/tcg/i386/test-i386-fp-exceptions.c | 831 +++++++++++++++++++++++
>  2 files changed, 926 insertions(+), 31 deletions(-)
>  create mode 100644 tests/tcg/i386/test-i386-fp-exceptions.c

I've just noticed that the new test program here provokes compiler
warnings when 'make check-tcg' builds it:

make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
auto cc --cc gcc -i qemu/fedora-i386-cross -s
/home/petmay01/linaro/qemu-for-merges --   -Wall -Werror -O0 -g
-fno-strict-aliasing -m32
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c
-o test-i386-fp-exceptions  -static
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:
Assembler messages:
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:426:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fistp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:433:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fistp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:440:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fistp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:447:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fistp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:454:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fistp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:541:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fisttp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:548:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fisttp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:555:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fisttp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:562:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fisttp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:569:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fisttp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:576:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fisttp'
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-fp-exceptions.c:583:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fisttp'


There's a similar warning also in test-i386.c:

/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
auto cc --cc gcc -i qemu/fedora-i386-cross -s
/home/petmay01/linaro/qemu-for-merges --   -Wall -Werror -O0 -g
-fno-strict-aliasing -fno-pie  -static -m32 -o test-i386 \
   /home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386.c
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-code16.S
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-vm86.S
-lm
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386.c:
Assembler messages:
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386.c:869:
Warning: no instruction mnemonic suffix given and no register
operands; using default for `fist'

They don't make the build fail but it would be nice if we could
make them go away...

thanks
-- PMM

