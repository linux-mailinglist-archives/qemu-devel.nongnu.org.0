Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E7E3CC5F2
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:51:05 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4qL2-0007QF-Pr
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4qJQ-0006hE-Jc
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:49:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m4qJP-0002bL-4U
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:49:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so7878565wms.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=guWHz8tPlHg8Byx6kpCK6t83koXYgTVRnjbC7FqfSj4=;
 b=pFRmdTAAca01pd67LQ5K87gQM2nDMoT+8MYW95wMXwBiW1JGGrUxCcm3uFdJnBfhiw
 ey6nxg5bUQS8QfrH/G5wJzCY6DFkmIpo5BP4A/cXe/2vaNPa94NG16n9mpr0Sqzbbt+o
 JA/BEWg1mu+a30NanUUMB8ducsLf0LMmCIi7gGcgoxuiEP/OnvoXyDyllKZPFsUk8ZCW
 0yocX4Ma4QY/SAS87JSPnr8NDYp6hJk2vefvJRZwopF3j4/QASWRDjirSKZu5JQrq4DW
 0fgHP9dskF8RyrTD670ApdvbgUrMwOP6aZEKAOAWs6JAoE/SnR35xYtYqQDEAit+cYB6
 Mh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=guWHz8tPlHg8Byx6kpCK6t83koXYgTVRnjbC7FqfSj4=;
 b=NyZdE+hTGiBJN7DDg56THaI0QhM7NHhZwiEbrYvANLT58ACYQVIkkSO3o+1JTAjqFv
 hNytKhd/XEvlIdt670rZEiceIIauSC019Asvf/ZA9e/bxTti1bE8cspweDgQ3vUyM3KA
 /YD6e8k7ii9GhqK07KbCtnmWbjdzNtWPfdPZ/DglL4eWhIjL7ZXzDPQXULXdwgVqK+6k
 VWkUqWfiZq2Sw5L+MrYDw6ZOlCALcMLTp0r8RfSou4mda9KEeno2yU764a4X6lq1cyNK
 5gNNYELyB89uCWey6svNsRhYS2ni3etN10RxZG/Fq0s9k3yhrquco/gHLR0+1dAwK7n3
 aWMw==
X-Gm-Message-State: AOAM532zaT38YyuyDmkhstSMeVYy040AKnUC+b3gC6EBrGLmJF4P9Ux1
 EjjqzlD8bUAwppNm+AQCcapNwg==
X-Google-Smtp-Source: ABdhPJzFS/Ke3Cu4a8R+jWzJphE3yTrwgrbAmrRM4knyDoUXcvqkMbpfU9iNcMxEoYndnLQkjZ7P6g==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr24475849wmc.136.1626551361025; 
 Sat, 17 Jul 2021 12:49:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e11sm18092312wrt.0.2021.07.17.12.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 12:49:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F95B1FF7E;
 Sat, 17 Jul 2021 20:49:19 +0100 (BST)
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-5-richard.henderson@linaro.org>
 <87czrg3kkh.fsf@linaro.org>
 <4e0422d3-5606-c560-dfb9-7a621f12600d@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/10] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
Date: Sat, 17 Jul 2021 20:48:25 +0100
In-reply-to: <4e0422d3-5606-c560-dfb9-7a621f12600d@linaro.org>
Message-ID: <871r7w3em8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/17/21 10:39 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> The purpose of suppressing goto_ptr from -d nochain had been
>>> to return to the main loop so that -d cpu would be recognized.
>> Hmm is it though? I've always treated it as ensuring we always come
>> out
>> into the main loop (which is helpful for debugging).
>
> What's helpful for debugging wrt the main loop beyond logging?

Usually if I rr a bug I reverse continue to the top of the loop for my
re-run. I guess we can put breakpoints elsewhere it's just another place
to remember.

>
>
> r~
>
>>=20
>>> But we now include -d cpu logging in helper_lookup_tb_ptr so
>>> there is no need to exclude goto_ptr.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   accel/tcg/cpu-exec.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>> index d3232d5764..70ea3c7d68 100644
>>> --- a/accel/tcg/cpu-exec.c
>>> +++ b/accel/tcg/cpu-exec.c
>>> @@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
>>>       uint32_t cflags =3D cpu->tcg_cflags;
>>>         if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>>> -        cflags |=3D CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
>>> +        cflags |=3D CF_NO_GOTO_TB;
>>>       }
>>>         return cflags;
>>=20


--=20
Alex Benn=C3=A9e

