Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA266C7B1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSQ0-0006ZR-OU; Mon, 16 Jan 2023 11:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHSPw-0006ZG-4W
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:33:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHSPu-0002Zy-9o
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:33:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id b7so2015945wrt.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gtuBDse40xCUPcqq9KP1TavtsWGNvXk/F5v5SPFfmo=;
 b=ZEULLM8Ja8sGwss30rVebmqkrupBiQYe+Bo6dP1pbZ8cn6frNKIzhWw8yhKcS6QkmS
 9umg/xQdraqHd66SehIIQAAVsMVVZ5cVoP1KYU05IoRs6734agWIe62LTl8V8XB/vnzm
 Ni9HQ2j9M5MgKKHAnZHQ7uisUTRi31nC03Z40BCb9VWZ3r6lo5laInO/6yP561NXxHog
 77mVP9XdTVLKF2i1uU4L+4+9fUWW3F0oJT+5DIitNKuNwBMlrwTNCKgP/sgg0lGTmGJP
 LQ6Pu1v8+CqrMH6i1LtjNGUw9FtbOEA0m874xDfvENv0qdz+PXeS/yYZnzvZWByQtP9D
 b39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4gtuBDse40xCUPcqq9KP1TavtsWGNvXk/F5v5SPFfmo=;
 b=FJkOkg0Rtd0hEG3pTZv82Tu1JznVV+Xcatttlrc/68My4Eo4ugqe2/GbFpmW8OOxOF
 1HS66Sizp3m5q5KyUzd/JRMgSREjtp2Z3sSeSeKE7Xf86CyoV3kR7Kn4ROGYchAtVd5P
 RhT9wEw78RstFNLBnGl6WIkMgp3ZCmIRjquICBnBIxudq9MdXpdlYrpRQCmNjH8Uc1kF
 2xxwpk0b+zWCCrLPrCCAi3plmZQqiWhGkfB/DjPtbe4ULB8POjGJXJ8c0vkvwZ2gfMsX
 gf06Mw0r5Acpwrmu1dz0c9xxgiJ3iSJ/a9dRT7agEjEnEeeL5ZNLdNa6eeJUq0FcmOuV
 HmAQ==
X-Gm-Message-State: AFqh2kp7SXsyFr8JJ/FkEAC+H13YsMhVc5CeqFfjrDSlKXlpo6g5ljhP
 TCvyS7r0Vkt91HwKo2QbMQhOEQ==
X-Google-Smtp-Source: AMrXdXv8uf6pnSnXW2XUXFCbtOQ6zgxtT6THwErFXQtXD90LOqm7kvrSNTBpCdkPGgWRBzjjUQ53uw==
X-Received: by 2002:adf:e287:0:b0:2bd:c173:cde3 with SMTP id
 v7-20020adfe287000000b002bdc173cde3mr149165wri.8.1673886780338; 
 Mon, 16 Jan 2023 08:33:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b002bdc19f8e8asm14788356wru.79.2023.01.16.08.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 08:32:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8602F1FFB7;
 Mon, 16 Jan 2023 16:32:58 +0000 (GMT)
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
 <87pmbil5rn.fsf@linaro.org>
 <a2ebe5dd-29a2-4c94-f3da-9c7f5dc7979f@linaro.org>
 <CAFEAcA_sZ7QbkhOHYJt-DPxh-NS6XnBg8MNJh=oe8X6KmuAYjg@mail.gmail.com>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson
 <richard.henderson@linaro.org>, iii@linux.ibm.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
Date: Mon, 16 Jan 2023 16:27:23 +0000
In-reply-to: <CAFEAcA_sZ7QbkhOHYJt-DPxh-NS6XnBg8MNJh=oe8X6KmuAYjg@mail.gmail.com>
Message-ID: <87bkmye8xx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 16 Jan 2023 at 12:40, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
>>
>> On 13/1/23 18:10, Alex Benn=C3=A9e wrote:
>> >
>> > Peter Maydell <peter.maydell@linaro.org> writes:
>> >
>> >> On Sat, 24 Dec 2022 at 15:19, Richard Henderson
>> >> <richard.henderson@linaro.org> wrote:
>> >>>
>> >>> From: Ilya Leoshkevich <iii@linux.ibm.com>
>> >>>
>> >>> Add a test that locklessly changes and exercises page protection bits
>> >>> from various threads. This helps catch race conditions in the VMA
>> >>> handling.
>> >>>
>> >>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>> >>> Message-Id: <20221223120252.513319-1-iii@linux.ibm.com>
>> >>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> >>
>> >> I've noticed that this newly added vma-pthread test seems to
>> >> be flaky. Here's an example from a clang-user job:
>> >> https://gitlab.com/qemu-project/qemu/-/jobs/3600385176
>> >>
>> >> TEST vma-pthread-with-libbb.so on aarch64
>> >> fail indirect write 0x5500b1eff0 (Bad address)
>> >> timeout: the monitored command dumped core
>> >> Aborted
>> >> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libbb.so] Err=
or 134
>> >>
>> >> and another from a few days earlier:
>> >> https://gitlab.com/qemu-project/qemu/-/jobs/3572970612
>> >>
>> >> TEST vma-pthread-with-libsyscall.so on s390x
>> >> fail indirect read 0x4000999000 (Bad address)
>> >> timeout: the monitored command dumped core
>> >> Aborted
>> >> make[1]: *** [Makefile:173: run-plugin-vma-pthread-with-libsyscall.so=
] Error 134
>>
>> Yet again:
>> https://gitlab.com/qemu-project/qemu/-/jobs/3608436731
>
> Yep. Could somebody write a patch to disable this test while
> we figure out why it's flaky, please?

I don't think the test is flaky - I think it is triggering a race in
QEMU code. I have not however been able to replicate it in anything other
than CI.

Although looking at the test I'm beginning to wonder what the sync point
is between the mutator and the read/write threads?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

