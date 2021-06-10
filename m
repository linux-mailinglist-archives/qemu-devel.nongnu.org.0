Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536D3A29AF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:59:04 +0200 (CEST)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrIOt-0007dk-6C
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrINr-0006Zo-5l
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:57:59 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrINp-0002ty-9S
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:57:58 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w21so32388259edv.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rn766lPQ0fIipGun9ZkiWOP1Xw8apb4bZeB9cJpUiI8=;
 b=eLsLUqAKtIRwRpv1IwKdfkfE5EXCAZFZlSX/kQojZXAtDaSTNWnWpuXdKEVxTWiP2W
 kySZeceI9XRnwVaqnwoAsnvuErn+7uRAKcD3aVQEcdvEw+4iRExSF0EcfyhMK7fzeqph
 yqJqnrnjYprHTLqr0/sdgoLJqoikarFWPlEaVfgjafLKT1TSKhjDJXOB4+sXlXYoWSyq
 68g0Xhb4ryVwLXwIdjw57Ep+FKiLjjndcVWc7Bfc6bKpMA7HPkuBOx7qfeAkdus0aH5K
 nnOZN65phqD3txySCEv0ono9NE0jWj7fZJgWZxCUD9T0pUpqCVYnOlMbn+hzy0qtJVF/
 CEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rn766lPQ0fIipGun9ZkiWOP1Xw8apb4bZeB9cJpUiI8=;
 b=BQ7EFju8yyz5ulZZC2Akd13bJqAituiccarhew+JVzpC/YjZxkRfo3xD5eCuv3XUk2
 UlMXr0qvqyzUOT0ZMBCBNO3uJvlxuPz45BV4TogWeMsnyxa7h4Yo8flYy/lB1TDeO7YA
 9WHtCqCNuVgxDobczKNZbAzU2ZApBvGUCLXlQIu7kIVI/7cRrN+KZC/kHYhIZE3mWelD
 7I025l4J9lrd3Y0NZIKZQyqurFKwBhSnZvcb5Us7AMCrY5Rguh2GegRlU4gy4vP6k9is
 p+Nmo6/blay9DXvr+HyMtfg8FwmhiY6h89uqW5EagyU/q2IZV9CCz3rn5ZMZdHxZ4bsk
 gjEg==
X-Gm-Message-State: AOAM531gdmTlP/LOv6AgHZc78G7g+D7b5jryVmt4TaWztztN/Tuqdbjg
 WYaQwDiHDH393R9q8xWzbG7jM4+0TYrtTTaQmLdfnw==
X-Google-Smtp-Source: ABdhPJyctY+UVbXbXUS8Hj0IdqcAHEUW2X7tROlBaZ4p4skkg9ADhGzXiwSxd8iiP7cM88qUolyFCNLH/xBv6Lr7S+8=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr4164595eds.146.1623322675275; 
 Thu, 10 Jun 2021 03:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210610102617.17281-1-alex.bennee@linaro.org>
In-Reply-To: <20210610102617.17281-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 11:57:21 +0100
Message-ID: <CAFEAcA8O1Cca2BnNp5c=0yYbKExYH1sUYe68C_msG_oBSUGW3g@mail.gmail.com>
Subject: Re: [PATCH v2] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrew Strauss <astrauss11@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Jun 2021 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The previous numbers were a guess at best. While we could extract the
> information from a loaded ELF file via -kernel we could still get
> tripped up by self decompressing or relocating code. Besides sane
> library code like newlib will fall back to known symbols to determine
> of the location of the heap. We can still report the limits though as
> we are reasonably confident that busting out of RAM would be a bad
> thing for either stack or heap.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Andrew Strauss <astrauss11@gmail.com>
> Reviewed-by: Andrew Strauss <astrauss11@gmail.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
> ---
> v2
>   - report some known information (limits)
>   - reword the commit message
> ---
>  semihosting/arm-compat-semi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 1c29146dcf..8873486e8c 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -1202,10 +1202,14 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
>              limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application. =
 */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */
> +            retvals[0] =3D 0; /* Heap Base */
> +            retvals[1] =3D rambase + limit; /* Heap Limit */
> +            retvals[2] =3D 0; /* Stack base */
>              retvals[3] =3D rambase; /* Stack limit.  */

The spec:
https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rs=
t#sys-heapinfo-0x16

doesn't document that 'return 0 for "I don't know"' is valid, so if we're
going to do it we ought to at least note that we're deviating from the
spec here.

-- PMM

