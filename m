Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBC93B696E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:03:38 +0200 (CEST)
Received: from localhost ([::1]:60210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxxTk-0003Lf-TW
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxxSU-0002Kt-G0
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:02:18 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxxSQ-0002iO-HR
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:02:18 -0400
Received: by mail-ed1-x535.google.com with SMTP id h2so27792790edt.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SJGXWSQqZqpp78kNZXI1pjCnN4IFLVvgnZNfWDe9g+8=;
 b=uUbc12sC5H8QxpgmHay1oM/EJglgmL2ipkNUMxNWLPJ/umMNcGU5foZmp22oiBHtVS
 33oZQUYOFcaodFWuVyxJrV6SGxT+VvJBqdeVfi47fESrWRmUny1SFvQsqZTdAcmx4Hdc
 oDb92TUP6r955N8DPtw+G1GdJszVgOXcn6N/n7837o1gJIs8/fCiL098JGgOijP6ugJH
 lMMnzdDyyD4CfXXdAfmT9Dg8TcnBYRJINwVAdnFWtNGVZ2vDYqy8xwVIB4gJ6wLpzRJp
 TcZDDQ7sXGwDgnfoxC3yjtDQw8O0Qho2wcx8DwiJHlTWAgCFzWf7tTf69L83/dWAl6lx
 6Oiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SJGXWSQqZqpp78kNZXI1pjCnN4IFLVvgnZNfWDe9g+8=;
 b=uRKUuKtFI7bacuNANM4AHTYTimJHhowvdKtL2a7OhJlPIUo/y3CaqxWjBQ7MQLGpk+
 yZkQdkrYPhD8mn8/QIUKeP0qzRE+q56j6fSrbsfV25LI1KDLu/AXU7aofZSJQn89KDAa
 3OQl/nvTuMg56FWWo0m62IZwjS/EKD3/CSqPxrXxfAZLvvemqRVRgqqt33CV3/0ZhWb4
 IQ29EATC49ryjAYVcGN08XLCCjbnTOC1oTrpgH/x1C/smaO72Z8rRaFsIc73urCvhBQY
 g+dWCa9f46zzaxXDjhDpSq8ubKUc3vy3va/42A3xDPR7eHL3/7b/AVZEyX8rW85/8l7F
 nK2A==
X-Gm-Message-State: AOAM533e9N+5BYzg/hPQS0cNsMEiTVP1uIG1+zCRHVtPRy6iRa8CxxLe
 Gl6h4KjwJBze/fYXdd7Rlola3WgE8dntEOuscYfKWg==
X-Google-Smtp-Source: ABdhPJydp+Xl452A5QRMgDvVJUgZTGlq67WeKkDRI0BlQbnhhZSR0awtyMLd8J3uSgiai/6oUSzLDzfgA+8XOs1WUEs=
X-Received: by 2002:aa7:c644:: with SMTP id z4mr34760822edr.204.1624910532099; 
 Mon, 28 Jun 2021 13:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org>
In-Reply-To: <20210623134756.30930-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 21:01:35 +0100
Message-ID: <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This allows us to check our new SYS_HEAPINFO implementation generates
> sane values.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
>
> diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/syst=
em/semiheap.c
> new file mode 100644
> index 0000000000..d5613dca59
> --- /dev/null
> +++ b/tests/tcg/aarch64/system/semiheap.c
> @@ -0,0 +1,74 @@
> +/*
> + * Semihosting System HEAPINFO Test
> + *
> + * Copyright (c) 2021 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include <inttypes.h>
> +#include <stddef.h>
> +#include <minilib.h>
> +
> +#define SYS_HEAPINFO    0x16
> +
> +uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
> +{
> +    register uintptr_t t asm("x0") =3D type;
> +    register uintptr_t a0 asm("x1") =3D arg0;
> +    asm("hlt 0xf000"
> +        : "=3Dr" (t)
> +        : "r" (t), "r" (a0));

You should include "memory" in the clobbers list here, or the compiler
has license to assume that the semihosting call doesn't actually
write to the struct info.

> +
> +    return t;
> +}
> +
> +int main(int argc, char *argv[argc])
> +{
> +    struct {
> +        void *heap_base;
> +        void *heap_limit;
> +        void *stack_base;
> +        void *stack_limit;
> +    } info;
> +    void *ptr_to_info =3D (void *) &info;
> +
> +    ml_printf("Semihosting Heap Info Test\n");
> +
> +    /* memset(&info, 0, sizeof(info)); */

Why is this here but commented out ? (If you want to zero initialize
the struct, using "=3D { }" when you define it above is simpler.)

> +    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
> +
> +    if (info.heap_base =3D=3D NULL || info.heap_limit =3D=3D NULL) {
> +        ml_printf("null heap: %p -> %p\n", info.heap_base, info.heap_lim=
it);
> +        return -1;
> +    }
> +
> +    /* Error if heap base is above limit */
> +    if ((uintptr_t) info.heap_base >=3D (uintptr_t) info.heap_limit) {
> +        ml_printf("heap base %p >=3D heap_limit %p\n",
> +               info.heap_base, info.heap_limit);
> +        return -2;
> +    }
> +
> +    if (info.stack_base =3D=3D NULL) {
> +        ml_printf("null stack: %p -> %p\n", info.stack_base, info.stack_=
limit);
> +        return -3;
> +    }
> +
> +    /*
> +     * We don't check our local variables are inside the reported
> +     * stack because the runtime may select a different stack area (as
> +     * our boot.S code does). However we can check we don't clash with
> +     * the heap.
> +     */
> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
> +               ptr_to_info, info.heap_base, info.heap_limit);

I'm not sure this test is valid -- the 'struct info' is on our stack,
so it could be anywhere in RAM, including possibly in the big
range we got back from SYS_HEAPINFO.

You could if you liked check that for instance the address of 'main'
is not inside the heap (assuming that you load this test case with
the ELF loader, it should be in a rom blob and thus excluded from
the heap range.)

> +        return -4;
> +    }
> +
> +    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
> +    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
> +    ml_printf("Passed HeapInfo checks\n");
> +    return 0;
> +}

It would also be useful to check that you can write to the memory and
read back the value written (ie that we have not been given
back a range that's read-only or which is not backed by anything).
(You might need to jump through a hoop or two to check where your
current stack is before potentially stomping on it...)

thanks
-- PMM

