Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C29E3611E2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 20:16:17 +0200 (CEST)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX6XH-0005y4-Vl
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 14:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lX6UK-0005UG-Pc
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:13:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lX6UI-0004I4-NW
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:13:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so765928wmi.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 11:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zxtudlES+i8xNRL82BzzwS0BgYaKa0oQAhzjnpbgVnE=;
 b=X6+ilHjITRPBqnI17h1hx9Vwq3HETMQToJ1oKOFddp5wWvU8GVNPJtutAOt+Q7z6qO
 o067Fw5/0htx9tZDI0BOQWVnS4eV0f2ikVkeXMvLxO4piowTs5bX0XY8zfP3Cq7e/Mf4
 LZDhpL419kZEyncAezX7F7rFwjrBmG4ObcKyiyTNCH49cqgvjuHBuAO+/7V2516SsXaP
 3YPk4KnAlmvMDXF+z1kEGwjMDpi8K9HKEB8hA1iHwsGC+/m11H8mNWvZHpg0Z8QkrAjv
 SdytdaMQfMgDqUgZBVhUvcxadMg+g3zGcwSr0MrzMrljJh7rguEsQWQqrsFWoBW9zK17
 JQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zxtudlES+i8xNRL82BzzwS0BgYaKa0oQAhzjnpbgVnE=;
 b=GM1QXSAwavPO+eX6vZ/86g2iz3nofSU77hf1yFF+eIoQWoLXL/+FZZsA0ZklIToV0A
 rXIUE4XXODKjHHgOh0vtTZpR+JL4nw6BTobY/Z3Gmv6PjAZ0lBRw4gihA8l/a81ykJCK
 HanrwV0sC0BlyxoC8c3r2W4MpJdqmCyfA/pP+pa8KIQxZ2F6fKPb26HMAVbD2g9PUpJt
 6Mg4A/iytejh5pxGsSV1VsXL6oL5NbuPcK2X6knavVG2zR4Xy0CNSPIv3Ht2XBkaaPJS
 iOdieX6UFf0f0cPeNYSop3hJVJ93myr0ID/zEQom4x21mNnXwq/K62/UMHkJxR0mc5MX
 XYZw==
X-Gm-Message-State: AOAM532c1j7dKFZ6LOb9yq3hvghDlvav04e3mUuQlPpU5UsoQzB5ju0v
 3fAJCnnaVspoXT3bpSHaEaUu3w==
X-Google-Smtp-Source: ABdhPJw//32HBNeuPymykTfSzFWoQjfDbXVtApwtm1fPFt2jJMOc1hIrzJb1eUokzGFsLex5k9VBJw==
X-Received: by 2002:a1c:1d14:: with SMTP id d20mr4513579wmd.49.1618510388908; 
 Thu, 15 Apr 2021 11:13:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b16sm4307917wmb.39.2021.04.15.11.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 11:13:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38DDA1FF7E;
 Thu, 15 Apr 2021 19:13:07 +0100 (BST)
References: <20210415162454.22056-1-alex.bennee@linaro.org>
 <CAFEAcA9vizqToQKBkMBfsk2SEKrgDo6F1KqET5vpntWUBY0Yrg@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
Date: Thu, 15 Apr 2021 19:12:50 +0100
In-reply-to: <CAFEAcA9vizqToQKBkMBfsk2SEKrgDo6F1KqET5vpntWUBY0Yrg@mail.gmail.com>
Message-ID: <875z0nl8lo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 15 Apr 2021 at 17:25, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> By definition a single instruction is capable of being an IO
>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>> a non-recorded translation which then fails because it expects
>> tcg_tb_lookup() to succeed unconditionally. The normal use case
>> requires a TB to be able to resolve machine state.
>>
>> The other users of tcg_tb_lookup() are able to tolerate a missing TB
>> if the machine state has been resolved by other means - which in the
>> single-shot case is always true because machine state is synced at the
>> start of a block.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  accel/tcg/translate-all.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index ba6ab09790..b12d0898d0 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>
>>      if (phys_pc =3D=3D -1) {
>>          /* Generate a one-shot TB with 1 insn in it */
>> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
>> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>      }
>>
>>      max_insns =3D cflags & CF_COUNT_MASK;
>> --
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Are you going to apply this directly or do you want it through a tree?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

