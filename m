Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784064AF9CD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:19:24 +0100 (CET)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrYo-0004Re-WB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHqja-0006eU-22
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:26:26 -0500
Received: from [2a00:1450:4864:20::535] (port=36534
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHqjL-0005VV-TE
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 12:26:17 -0500
Received: by mail-ed1-x535.google.com with SMTP id s7so6623890edd.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 09:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=QrCvOPJBae9ZSw/VJNreR+8X19sstr4u+5JbC7+gzN0=;
 b=wE9mCbl5mPsD9Tp89ILfdkcdI+/JunrOJotzCpAuDmBW1JTG7//ESOC+ANVngM4Ry4
 pVp1RkBlZAK+BLwFa+49m3ViSImxmjthE+JkIxVbPZsgq+X+ilBBqTYAVoUT1R8yRtut
 8wVJsX4Br6eGIyfkTQ28zEaXlugJgOvcqFY08r5j5JEtmCC0tTVJIFA7H41t+Qi6I9Sc
 /FsBtHgxL9yCviiDW9N6naWN5GfYQK3phjQMSY46j3w9G5bmESiTnnf8rUXb70Q1T5VK
 Gbt9+VsG81yUFG6YCEDcLe3pfuMbgaq7QFsU1cX6umVjWjvJl7HYxsuL5TUEKXqVHKIq
 F1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=QrCvOPJBae9ZSw/VJNreR+8X19sstr4u+5JbC7+gzN0=;
 b=b7t2imH05S150ekYc4z4EkasN3nev8pMdcsTdoXz/jSNPmupgW2L6y3QZN47iCLW5Q
 SN1ztkngQW1KPPHncd6KKQLML+5+/IBZf+OkOWF9PTt4bWdVIgmLQrQp3JJo+qFnBydE
 6CKsGwUDQ0GGxslbca/SOaX8aLTGS7+Z3hg4yJoYkk+crszNdAxafLZnYl515m3GUIDn
 00gQfjSRJrli7XRFhTMT3Mm78fti7zCeHS4qNhZzhyqqMlqnZzFOmpcxeaSOLx0VHVxJ
 GmzT0agmSbBMba6XxRKv0ZI52sdNBEIyj0XJ7ajszhPyV4X4iNrq2Vln9BtRXAguxIsE
 Dt6Q==
X-Gm-Message-State: AOAM530oBr8JFWXnItn9hJYutjce5377bXkWi+4mN572dHgVpHDirX1e
 RvtS/Eqw0+fn9njFssTthIBIcw==
X-Google-Smtp-Source: ABdhPJwu7vifxIYVUOntELBCbuva+vB+bzfD+BFwU5ULx1pQPCrJMCrLGPHxeu4xQxxwYHvB4i+ORg==
X-Received: by 2002:a05:6402:22c1:: with SMTP id
 dm1mr3705725edb.383.1644427569830; 
 Wed, 09 Feb 2022 09:26:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u4sm5414462ejn.216.2022.02.09.09.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:26:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E88CC1FFB7;
 Wed,  9 Feb 2022 17:26:06 +0000 (GMT)
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org>
 <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Wed, 09 Feb 2022 17:25:29 +0000
In-reply-to: <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
Message-ID: <87o83gdk9d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This allows us to check our new SYS_HEAPINFO implementation generates
>> sane values.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
>>
>> diff --git a/tests/tcg/aarch64/system/semiheap.c b/tests/tcg/aarch64/sys=
tem/semiheap.c
>> new file mode 100644
>> index 0000000000..d5613dca59
>> --- /dev/null
>> +++ b/tests/tcg/aarch64/system/semiheap.c
>> @@ -0,0 +1,74 @@
>> +/*
>> + * Semihosting System HEAPINFO Test
>> + *
>> + * Copyright (c) 2021 Linaro Ltd
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include <inttypes.h>
>> +#include <stddef.h>
>> +#include <minilib.h>
>> +
>> +#define SYS_HEAPINFO    0x16
>> +
>> +uintptr_t __semi_call(uintptr_t type, uintptr_t arg0)
>> +{
>> +    register uintptr_t t asm("x0") =3D type;
>> +    register uintptr_t a0 asm("x1") =3D arg0;
>> +    asm("hlt 0xf000"
>> +        : "=3Dr" (t)
>> +        : "r" (t), "r" (a0));
>
> You should include "memory" in the clobbers list here, or the compiler
> has license to assume that the semihosting call doesn't actually
> write to the struct info.
>
>> +
>> +    return t;
>> +}
>> +
>> +int main(int argc, char *argv[argc])
>> +{
>> +    struct {
>> +        void *heap_base;
>> +        void *heap_limit;
>> +        void *stack_base;
>> +        void *stack_limit;
>> +    } info;
>> +    void *ptr_to_info =3D (void *) &info;
>> +
>> +    ml_printf("Semihosting Heap Info Test\n");
>> +
>> +    /* memset(&info, 0, sizeof(info)); */
>
> Why is this here but commented out ? (If you want to zero initialize
> the struct, using "=3D { }" when you define it above is simpler.)
>
>> +    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
>> +
>> +    if (info.heap_base =3D=3D NULL || info.heap_limit =3D=3D NULL) {
>> +        ml_printf("null heap: %p -> %p\n", info.heap_base, info.heap_li=
mit);
>> +        return -1;
>> +    }
>> +
>> +    /* Error if heap base is above limit */
>> +    if ((uintptr_t) info.heap_base >=3D (uintptr_t) info.heap_limit) {
>> +        ml_printf("heap base %p >=3D heap_limit %p\n",
>> +               info.heap_base, info.heap_limit);
>> +        return -2;
>> +    }
>> +
>> +    if (info.stack_base =3D=3D NULL) {
>> +        ml_printf("null stack: %p -> %p\n", info.stack_base, info.stack=
_limit);
>> +        return -3;
>> +    }
>> +
>> +    /*
>> +     * We don't check our local variables are inside the reported
>> +     * stack because the runtime may select a different stack area (as
>> +     * our boot.S code does). However we can check we don't clash with
>> +     * the heap.
>> +     */
>> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
>> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n",
>> +               ptr_to_info, info.heap_base, info.heap_limit);
>
> I'm not sure this test is valid -- the 'struct info' is on our stack,
> so it could be anywhere in RAM, including possibly in the big
> range we got back from SYS_HEAPINFO.

It should be in this case because boot.S sets stack to be inside out
data segment.

>
> You could if you liked check that for instance the address of 'main'
> is not inside the heap (assuming that you load this test case with
> the ELF loader, it should be in a rom blob and thus excluded from
> the heap range.)
>
>> +        return -4;
>> +    }
>> +
>> +    ml_printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
>> +    ml_printf("stack: %p <- %p\n", info.stack_limit, info.stack_base);
>> +    ml_printf("Passed HeapInfo checks\n");
>> +    return 0;
>> +}
>
> It would also be useful to check that you can write to the memory and
> read back the value written (ie that we have not been given
> back a range that's read-only or which is not backed by anything).
> (You might need to jump through a hoop or two to check where your
> current stack is before potentially stomping on it...)
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

