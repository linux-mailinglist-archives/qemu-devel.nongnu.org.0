Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1E34AF9CE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 19:19:27 +0100 (CET)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHrYs-0004Ux-KZ
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 13:19:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHrVV-0001uX-Ha
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:15:57 -0500
Received: from [2a00:1450:4864:20::634] (port=36571
 helo=mail-ej1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHrVS-0005EL-Rs
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:15:57 -0500
Received: by mail-ej1-x634.google.com with SMTP id u20so5441441ejx.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DZXh8GZipxZ1oyfE4ZB7mNEy4YfMxiRiuOmoV2N6ugI=;
 b=xz3xwa2oGFHwiRkaCxAcvQKhfa82n3CR3MKg5XBh3ve6u4hbNv247oXNkwCaN0GoYw
 aDQr83Hfj1J5e8n9wS9JQaeOGMpol/1bioyA0NXp1bmGXV1g1bwT2LDM2L0314o3CjYm
 ggst8WX0G3o54Zv15D2kpPXACYPNe80KPqgkso/ng5/69RvqrSNqRtEejQJVti8BXbV2
 V4VW3W1APWTolS7d22eQ/WgD11ALIF0oT+wCqcKcdPDi/BFWzYPA8J1fPnGHY2eiU/4d
 sX4pImKlZxsle1iBtSmsXj+b7oCs9WPuc3G+z4O0wDlsGLCQ/zQrUOUJi5pragyZ2Nv5
 GLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DZXh8GZipxZ1oyfE4ZB7mNEy4YfMxiRiuOmoV2N6ugI=;
 b=KTBUl26r3o6ZG44LUGhtA5eRW8QfPPLYHENwz0b3DOm6/JwOk0HBh26D20Bduurvro
 E+JFxD+RHe2yUf/YzJJrzlBi0rUg2LuZzOGZXG+vIgL9Jy5Zin/BfLz77+TXt+L6y/Ek
 JuJ1qxto4WQg+w2tJccitjMgIro3/fmKwEBxVT7nmkfhQ3zrc/t/cKlfhVk0bqnNLSd/
 3MR7VeuMSrpe1ZpQEBcBk/II8iqx7mXuBLTWFUv1XTlOl/3hejsWkiXYXnGzrtZnyYkd
 efA4InRgk2iFAo9UhJmFiFI9QA8yku6y9E/uE1+dg69rbGSoaK8QE3x0b30rXymYpnHe
 e4Ug==
X-Gm-Message-State: AOAM532tBtcvYDnhOFD8xHeIMrZR55vwq36xIEv0/3rtAD8YFJtn5qh/
 NaqRoTWM9JfkWoVGywKW1WmC3w==
X-Google-Smtp-Source: ABdhPJxdE79urPdDDbtjxRJoQmQSqfS0kOYzAZnTaUc4KCiQMqtkVeHJLXWjCKWFqwdK0KxnkyBD0g==
X-Received: by 2002:a17:906:edc5:: with SMTP id
 sb5mr3100918ejb.83.1644430533420; 
 Wed, 09 Feb 2022 10:15:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id qw28sm5064900ejb.0.2022.02.09.10.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 10:15:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 49F3B1FFB7;
 Wed,  9 Feb 2022 18:15:31 +0000 (GMT)
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-3-alex.bennee@linaro.org>
 <CAFEAcA-UPE5+moyVM-1pJ_gi9fj3t1nWtWfZaZ13hkd6-=L5nw@mail.gmail.com>
 <87o83gdk9d.fsf@linaro.org>
 <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 2/2] tests/tcg: port SYS_HEAPINFO to a system test
Date: Wed, 09 Feb 2022 18:14:41 +0000
In-reply-to: <CAFEAcA_-xv-_Y9TD5J44Vbf+SKzuEdFuP3_nQnJKMAbNYecSUg@mail.gmail.com>
Message-ID: <87k0e3ewjg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::634
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

> On Wed, 9 Feb 2022 at 17:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Wed, 23 Jun 2021 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> This allows us to check our new SYS_HEAPINFO implementation generates
>> >> sane values.
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> ---
>> >>  tests/tcg/aarch64/system/semiheap.c | 74 +++++++++++++++++++++++++++=
++
>> >>  1 file changed, 74 insertions(+)
>> >>  create mode 100644 tests/tcg/aarch64/system/semiheap.c
>> >> +    /*
>> >> +     * We don't check our local variables are inside the reported
>> >> +     * stack because the runtime may select a different stack area (=
as
>> >> +     * our boot.S code does). However we can check we don't clash wi=
th
>> >> +     * the heap.
>> >> +     */
>> >> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limi=
t) {
>> >> +        ml_printf("info appears to be inside the heap: %p in %p:%p\n=
",
>> >> +               ptr_to_info, info.heap_base, info.heap_limit);
>> >
>> > I'm not sure this test is valid -- the 'struct info' is on our stack,
>> > so it could be anywhere in RAM, including possibly in the big
>> > range we got back from SYS_HEAPINFO.
>>
>> It should be in this case because boot.S sets stack to be inside out
>> data segment.
>
> So what you mean is
>
>  /*
>   * boot.S put our stack somewhere inside the text segment of the
>   * ELF file, and we know that SYS_HEAPINFO won't pick a range
>   * that overlaps with part of a loaded ELF file. So the info
>   * struct (on the stack) should not be inside the reported heap.
>   */
>
> ?

Well the data segment (but not the bss). So as long as the ELF loader
includes that in the calculation (which it should I think) then we are
ok.

>
> -- PMM


--=20
Alex Benn=C3=A9e

