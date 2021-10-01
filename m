Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C412C41E914
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 10:27:00 +0200 (CEST)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWDsh-0005IE-Ql
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 04:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mWDqo-0004Jl-BW
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:25:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mWDql-0007Cr-1b
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 04:25:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso6192466wme.0
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 01:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=L2oxLFMCxOyelMhwrRt5wsccDEaP//qwO6zUli8OrkY=;
 b=nf85Vw+1IQCJvifWprLPsQeREJ8VCN8MjTgxqI+BcTqZZ81rfLMh8UTe/c2Q4X4UUF
 t7TWXdPh1WQueJS7RwQM7IvJG9ae83HIcNnPXQtdMFG3wq90Pw7H9nEI8A5QoV9aRRzO
 +qvzlxFhJuT+HQaXNq71K3tWf3chklxNEKfUGQtX3JnBdTwm+2/k1UkbZpJnl6SFyHtd
 u4RtwoTA4jKErAmeeAPa2H32humsPEaT7ptejA9LVvD1uoL4V95bdisU+/+27N20J2Kf
 fW9wY9M2P+jWKhfJ4Zv352AYGYP1wF5PhB54VhIZOxvRjo6d2V5EqT0X028P9A6hY6Ao
 CvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=L2oxLFMCxOyelMhwrRt5wsccDEaP//qwO6zUli8OrkY=;
 b=m/VN0DyCfy7F5gIJQQtk7D8u24ZtaN1sYw981bMa3PQKqf5tgMoZbJWki+uaZYKnCx
 vDpcOys7TiAi4XJn7wTPXlsV92b30yHN2z8i4gnFt5QW4V/JAcRZJ9Q4uWRhBzAE7YOE
 DY0KmtuMji5ENHaK5WAi06ZqCTCKEusWldMuX9OTB+sqTetDN6NQ2rWczODf4wYmM7NK
 pPUC3hMvU+mRI+EqJPf0w8ZA9k/V1V+vRqSc1DqqCKND/Ca/66gWwnHqneJpJHyR91T4
 k7RWpsNj0JEbd0WDVIEWrXHe9vQ3WIjDxfCVL7isV/oEL35cUZ5I8dZ9m5T/Hwe8I6cK
 C93Q==
X-Gm-Message-State: AOAM530MR1oug4hoHP0wrXtUkV3y1fMQ48QXyT0VQiCFsADfY9ZkIBow
 BGy64M2ji6i1rRVYrdJERaklOQ==
X-Google-Smtp-Source: ABdhPJzNj7eI5qFODZOtn3VDnnYv5OZFGIzbcju3+KvOks4sDw4r4Zr9WXUmLpYJvk7xiANwMbomsw==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr3194705wml.136.1633076696404; 
 Fri, 01 Oct 2021 01:24:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l18sm5094786wrp.56.2021.10.01.01.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 01:24:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC23C1FF96;
 Fri,  1 Oct 2021 09:24:54 +0100 (BST)
References: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
 <87bl4a768t.fsf@linaro.org>
 <CADc=-s5wJ0cBv9r0rXaOk0Ys77Far7mgXq5B+y4KoNr937cC7A@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matt <mborgerson@gmail.com>
Subject: Re: TCG Floating Point Support (Work in Progress)
Date: Fri, 01 Oct 2021 09:03:41 +0100
In-reply-to: <CADc=-s5wJ0cBv9r0rXaOk0Ys77Far7mgXq5B+y4KoNr937cC7A@mail.gmail.com>
Message-ID: <87y27d5ezt.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Matt <mborgerson@gmail.com> writes:

> Thank you Alex, for your quick and thoughtful response.
>
>> I've not reviewed the code as it is a rather large diff. For your proper
>> submission could you please ensure that your patch series is broken up
>> into discreet commits to aid review.
>
> Of course.
>
>> The phrase "if the user discovers some issues" is a bit of a red flag.
>> We should always be striving for correct emulation of floating point.
>
> I agree. This is an option that I added for use during feature
> development. Ultimately I would like not to have such an option, and
> for it to always *just work*.

The closest I can think of is the --accel thread=3Dsingle|multi option
which allowed for verifying if an issue was related to MTTCG. However
the default would always do the right thing.

>
>> Indeed we have recently got the code base to the point we pass all of
>> the Berkey softfloat test suite. This can be checked by running:
>>
>>   make check-softfloat
>>
>> However the test code links directly to the softfloat code so won't work
>> with direct code execution.
>
> I had planned to leverage the existing soft float test suite, and I
> think this can be done with the right harnessing. It would be nice to
> have a mechanism to test translation of individual TCG ops, e.g. be
> able to run translated blocks from test code and evaluate their
> output. I'm not sure if any such op level testing like that is being
> done.

Not at the moment but it would certainly be a useful addition for the
unit tests if we could test arbitrary sequences of TCG ops. I'm not sure
how much test harness would be needed to exercise that though.

> There are also guest tests in tests/tcg, which could also be
> expanded to include more FP tests.

We have a number of multiarch tcg tests for fused multiply-add and the
various fconv operations. There is also quite an exhaustive set of i386
specific tests (test-i386-fprem) but it doesn't get run by default as
the "reference" output is too big to include in the tree and has to be
generated in-situ. You get it by adding SPEED=3Dslow to your make
invocation.

>> The existing 32/64 bit hardfloat
>> optimisations work within the helpers. While generating direct code is
>> appealing to avoid the cost of helper calls it's fairly well cached and
>> predicted code. Experience with the initial hardfloat code showed the
>> was still a performance win even with the cost of the helper call.
>
> Unfortunately, even with the existing hardfloat support, the overhead
> of the helper calls is still too costly for my particular application.

Once you start dealing with flag generation you might find that equation
changes somewhat if you have to mess around with bit masking and checks
using TCG ops. However providing benchmark results with your patch would
be required to argue the point. You can run tests/fp/fp-bench -t host
under translation to exercise that.

>
>> I don't think you'll see the same behaviour emulating an x87 on anything
>> that isn't an x87 because the boundaries for things like inexact
>> calculation will be different. Indeed if you look at the existing
>> hardfloat code function can_use_fpu() you will see we only call the host
>> processor function if the inexact bit is already set. Other wrappers
>> have even more checks for normal numbers. Anything that needs NaN
>> handling will fallback to the correct softfloat code.
>
> Fair points. Bit-perfect x87 emulation with this approach may be
> ultimately unachievable; and I'm still evaluating the cases when this
> will not work. This has been a learning experience for me, and I
> gladly welcome expert input in this matter.
>
> Personally, I would accept minor accuracy differences in trade for
> significant performance advantage in emulation of game code, but not
> for scientific applications, which I understand may diminish upstream
> appeal of this x87 translation work.

Out of interest what game code still uses x87? I know the classic Doom
and Quake benchmarks showed a performance regression when we switched to
softfloat:

  https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b

however I kinda assumed more modern games would be taking advantaged of
SSE and later features. There is however some missing gaps in the x86
emulation that might mean code falls back to the x87. Maybe that would
be another area to look at.

>> I think there will be a wariness to merge anything that only works for a
>> single frontend/backend combination. Running translated x86 on x86 is
>> not the common case for TCG ;-)
>
> Understood; initially this works on a single frontend/backend
> combination, with eventual translation to other guests and hosts. It
> will be a long road, but my plan next is to produce a translation for
> AArch64 systems.
>
>> These are the things that make correct handling of floating point hard.
>
> Agreed!
>
>> I'll happily review patches on the list that provide for an accelerated
>> FPU experience as long as the correctness is maintained.
>
> Thank you!
>
> Matt
>
> On Thu, Sep 30, 2021 at 2:38 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> Matt <mborgerson@gmail.com> writes:
>>
>> > Hello--
>> >
>> > I'm excited to share that I have been developing support for TCG
>> > floating point operations; specifically, to accelerate emulation of
>> > x86 guest code which heavily exercises the x87 FPU for a game console
>> > emulator project based on QEMU. So far, this work has shown great
>> > promise, demonstrating some dramatic performance improvements in
>> > emulation of x87 heavy code.
>>
>> I've not reviewed the code as it is a rather large diff. For your proper
>> submission could you please ensure that your patch series is broken up
>> into discreet commits to aid review. It also aids bisection if
>> regressions are identified.
>>
>> > The feature works in concert with unaccelerated x87 FPU helpers, and
>> > also allows total soft float helper fallback if the user discovers
>> > some issue with the hard float implementation.
>>
>> The phrase "if the user discovers some issues" is a bit of a red flag.
>> We should always be striving for correct emulation of floating point.
>> Indeed we have recently got the code base to the point we pass all of
>> the Berkey softfloat test suite. This can be checked by running:
>>
>>   make check-softfloat
>>
>> However the test code links directly to the softfloat code so won't work
>> with direct code execution. The existing 32/64 bit hardfloat
>> optimisations work within the helpers. While generating direct code is
>> appealing to avoid the cost of helper calls it's fairly well cached and
>> predicted code. Experience with the initial hardfloat code showed the
>> was still a performance win even with the cost of the helper call.
>>
>> > For the TCG target,
>> > I've opted to implement it for x86-64 hosts using SSE2, although this
>> > could be extended to support full 80b double extended precision with
>> > host x87 support. I'm also in early development of an implementation
>> > for AArch64 hosts.
>>
>> I don't think you'll see the same behaviour emulating an x87 on anything
>> that isn't an x87 because the boundaries for things like inexact
>> calculation will be different. Indeed if you look at the existing
>> hardfloat code function can_use_fpu() you will see we only call the host
>> processor function if the inexact bit is already set. Other wrappers
>> have even more checks for normal numbers. Anything that needs NaN
>> handling will fallback to the correct softfloat code.
>>
>> I think there will be a wariness to merge anything that only works for a
>> single frontend/backend combination. Running translated x86 on x86 is
>> not the common case for TCG ;-)
>>
>> > There are still some significant tasks to be done, like proper
>> > handling of exception flags, edge cases, and testing, to name a few.
>>
>> These are the things that make correct handling of floating point hard.
>>
>> > Once in a slightly more mature state, I do think this feature would
>> > make a natural addition to upstream QEMU and plan to submit it for
>> > consideration.
>> >
>> > I'm writing to the mailing list now to inform FPU maintainers and any
>> > other interested parties that this work is happening, to solicit any
>> > early feedback, and to extend an invitation to anyone interested in
>> > collaborating to expedite its upstreaming.
>>
>> I'll happily review patches on the list that provide for an accelerated
>> FPU experience as long as the correctness is maintained.
>>
>> > My initial TCG FP work can be found here:
>> > https://github.com/mborgerson/xemu/pull/464/commits
>> >
>> > Thanks,
>> > Matt
>>
>>
>> --
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

