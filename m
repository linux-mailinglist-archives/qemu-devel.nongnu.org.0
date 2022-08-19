Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9E599781
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 10:41:51 +0200 (CEST)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOxZe-0003ki-IU
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 04:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOxXd-0002Iq-9L
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 04:39:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oOxXb-0005B2-6Z
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 04:39:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n7so4371210wrv.4
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 01:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=gDLzGOKSmpN3hclf25KxkFjFyfiCD01kRFrSi2oZn8E=;
 b=J44Ltsw4SkjRQH6Vv0Ydpa4EZFTqxW8Y4tgEIr6Fn24ex3nnqnMd0irUB3yjUkJEX8
 7YjIp5qs0LbzHya3WRgM/G+ZLjVvEEiOQzjOgvVBOMQmixmDL6sjNlLBAjib+gcfyw+n
 Tv9cR4GOyKqvxSIOmWjV15YmH74GGTcNW6euMTPjcFdfnKoCxAkXNOSAY6BPFt4wcHIy
 vDx/efyTmvd9597NG6+ISYLsGHS/h9VVQHkadiMTvMN+TTwP9QS1n6DuAP0XQc9OLBLo
 dtx8xOUkBfNdxi/Ske19wOY5OpI+blKfmEXDoiFGIfj82coXQMzWxgzf+b546Q2G9QLq
 EpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=gDLzGOKSmpN3hclf25KxkFjFyfiCD01kRFrSi2oZn8E=;
 b=h9kgsgefoiZ49i5qc5WIXTTPF1MoT/aCP2VD6ERNHh3HnaNPW5Aw0TKN8wqE9TQTD0
 tJ2BHcQ3ILheOH3INpNzCHqDT28EE+yuaGR1OV8Yw2uAHv9R8o83yY5baYF5KWW+R2Ri
 p8P7Oof3KnoqKZraQJPIvquRydVa97zr9ur+LRFgeMOLNHPFWsEkA5+q+c98VQXqvvX/
 3deN6oOAps2QjIZ+zzM7Oig01D0c/ZuSPi6va43UgKn8RYUb0Xu6yueGhAfcV240NGyX
 UP29Qid5OsGksWPUXPvchAX0sWLZkkDeefrl6HRnhIQJdCwlJqoJRcD1zpncpnYZ1tqa
 I5wA==
X-Gm-Message-State: ACgBeo0Q6+lRTTxNNXgk35OwOZUd62jOS8HPQeUE589WXzNcj5OxWwsL
 8vNhUYB/mi+pIf5sZoWdHnFL4A==
X-Google-Smtp-Source: AA6agR45avulrawL4bFXoba7QZP4LlMTH4Z9O06E+eK+dTWqipa2d3BPYVuMcAmvYSLb/KvsATQ34g==
X-Received: by 2002:a5d:6789:0:b0:225:2787:d44f with SMTP id
 v9-20020a5d6789000000b002252787d44fmr3378147wru.343.1660898381021; 
 Fri, 19 Aug 2022 01:39:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4851000000b0021eff2ecb31sm3379884wrs.95.2022.08.19.01.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 01:39:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 808DE1FFB7;
 Fri, 19 Aug 2022 09:39:39 +0100 (BST)
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
 <20220816122621.2066292-2-alex.bennee@linaro.org>
 <3402017d-7088-6902-61b8-4e61cea6db58@linaro.org>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>
Subject: Re: [PULL 1/3] linux-user: un-parent OBJECT(cpu) when closing thread
Date: Fri, 19 Aug 2022 09:37:38 +0100
In-reply-to: <3402017d-7088-6902-61b8-4e61cea6db58@linaro.org>
Message-ID: <87h7284ofo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 8/16/22 05:26, Alex Benn=C3=A9e wrote:
>> While forcing the CPU to unrealize by hand does trigger the clean-up
>> code we never fully free resources because refcount never reaches
>> zero. This is because QOM automatically added objects without an
>> explicit parent to /unattached/, incrementing the refcount.
>> Instead of manually triggering unrealization just unparent the
>> object
>> and let the device machinery deal with that for us.
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> Message-Id: <20220811151413.3350684-2-alex.bennee@linaro.org>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index f409121202..bfdd60136b 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8594,7 +8594,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env=
, int num, abi_long arg1,
>>           if (CPU_NEXT(first_cpu)) {
>>               TaskState *ts =3D cpu->opaque;
>>   -            object_property_set_bool(OBJECT(cpu), "realized",
>> false, NULL);
>> +            if (ts->child_tidptr) {
>> +                put_user_u32(0, ts->child_tidptr);
>> +                do_sys_futex(g2h(cpu, ts->child_tidptr),
>> +                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
>> +            }
>> +
>> +            object_unparent(OBJECT(cpu));
>
> This has caused a regression in arm/aarch64.
>
> We hard-code ARMCPRegInfo pointers into TranslationBlocks, for calling
> into helper_{get,set}cp_reg{,64}.  So we have a race condition between
> whichever cpu thread translates the code first (encoding the pointer),
> and that cpu thread exiting, so that the next execution of the TB
> references a freed data structure.

What is the test case that breaks this? I guess a multi-threaded
sysregs.c would trigger it?

> We shouldn't have N copies of these pointers in the first place.  This
> seems like something that ought to be placed on the ARMCPUClass, so
> that it could be shared by each cpu.
>
> But that's going to be a complex fix, so I'm reverting this for rc4.
>
>
> r~


--=20
Alex Benn=C3=A9e

