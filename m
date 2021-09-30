Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9841341D686
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:41:06 +0200 (CEST)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsYr-0002wd-1v
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mVsWf-0001sC-1r
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:38:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mVsWd-0005Jj-3z
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:38:48 -0400
Received: by mail-wm1-x32a.google.com with SMTP id j27so4152533wms.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 02:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sO+0pt3IBaQBk1MQ/AKhUymotGM0OEsKl4r0U1W2Q3M=;
 b=BOnNAZo3QGM1Ji2xqmQ/NZirnOxBEw91b9GMNQIMFfCWXeVOxL3T+t+ZV3TEcQ3RQj
 /D9HqgWKpo8QfvGMHxMSx8WNKMek00UIPr6VfkdmSFJoFJId5zwV7TDBhkRl13L/hlqc
 CL8gJrWp182HCltBilkY/cYceQ1ZG/1dbdClg3l6J2RbfQt2W/bS9EhYduUPaB+ssteV
 O/wveQatYlojf2TKzledwbeZ8RtdfApb36NGn4zKkgfcPzpNVIHUJb8z/I7ZxFpGeaF/
 GlM+DpWCdyHUfV86AvskotXHgp1hR/rcuxbe/M1Nl5YaGf81GKcVeHAYr5Yste09MOND
 5tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sO+0pt3IBaQBk1MQ/AKhUymotGM0OEsKl4r0U1W2Q3M=;
 b=xJi8emUODEPjzCVd0ydWa5xirMO9GKnWuGJMl6SKuHb5pE4A+c3RFkYvILxwQx2WDL
 URkRPTAJA+sV5tVIBLZMlTv8/UBxnSyW+W/AU96C5RaShMHFygfD6X9hJdsKwa35kVEx
 G7QHnHGSOjJQgXa4D2Pb4q/OEU48+uBCJSftQQcFi+BWG4SwmPVYwOcASleSvdEP9nCL
 3YtrnjLsxf/01eNn3OwV78I49LwciBo1I7ngSjk/+8JQ/zVbjvm9F2KaWtrQC9JgLo2/
 bGVw7PReA8ge4SJG4IbKnesM51YQBZ+SvYscR3tAztY7rjTlm2aC7+hIph2VDqGYIy4+
 Tk6A==
X-Gm-Message-State: AOAM531zHk/lpmuZqY3oNBJ1VIl9/vBDJxxWIaMq/39lIPGl3c5QUuPI
 d4tK4pFggywl54R5BjygRJnUCw==
X-Google-Smtp-Source: ABdhPJxNkJjsKGNTwRz4lJB8AX2uvEUk0ndrdQ5ToFNG5q3Qm13+deMQfQbHNA67aPQ+t/8gMiHzLg==
X-Received: by 2002:a05:600c:2904:: with SMTP id
 i4mr4414072wmd.118.1632994724296; 
 Thu, 30 Sep 2021 02:38:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm2388194wrn.47.2021.09.30.02.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 02:38:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C69C1FF96;
 Thu, 30 Sep 2021 10:38:42 +0100 (BST)
References: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matt <mborgerson@gmail.com>
Subject: Re: TCG Floating Point Support (Work in Progress)
Date: Thu, 30 Sep 2021 10:13:52 +0100
In-reply-to: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
Message-ID: <87bl4a768t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Matt <mborgerson@gmail.com> writes:

> Hello--
>
> I'm excited to share that I have been developing support for TCG
> floating point operations; specifically, to accelerate emulation of
> x86 guest code which heavily exercises the x87 FPU for a game console
> emulator project based on QEMU. So far, this work has shown great
> promise, demonstrating some dramatic performance improvements in
> emulation of x87 heavy code.

I've not reviewed the code as it is a rather large diff. For your proper
submission could you please ensure that your patch series is broken up
into discreet commits to aid review. It also aids bisection if
regressions are identified.

> The feature works in concert with unaccelerated x87 FPU helpers, and
> also allows total soft float helper fallback if the user discovers
> some issue with the hard float implementation.

The phrase "if the user discovers some issues" is a bit of a red flag.
We should always be striving for correct emulation of floating point.
Indeed we have recently got the code base to the point we pass all of
the Berkey softfloat test suite. This can be checked by running:

  make check-softfloat

However the test code links directly to the softfloat code so won't work
with direct code execution. The existing 32/64 bit hardfloat
optimisations work within the helpers. While generating direct code is
appealing to avoid the cost of helper calls it's fairly well cached and
predicted code. Experience with the initial hardfloat code showed the
was still a performance win even with the cost of the helper call.

> For the TCG target,
> I've opted to implement it for x86-64 hosts using SSE2, although this
> could be extended to support full 80b double extended precision with
> host x87 support. I'm also in early development of an implementation
> for AArch64 hosts.

I don't think you'll see the same behaviour emulating an x87 on anything
that isn't an x87 because the boundaries for things like inexact
calculation will be different. Indeed if you look at the existing
hardfloat code function can_use_fpu() you will see we only call the host
processor function if the inexact bit is already set. Other wrappers
have even more checks for normal numbers. Anything that needs NaN
handling will fallback to the correct softfloat code.

I think there will be a wariness to merge anything that only works for a
single frontend/backend combination. Running translated x86 on x86 is
not the common case for TCG ;-)

> There are still some significant tasks to be done, like proper
> handling of exception flags, edge cases, and testing, to name a few.

These are the things that make correct handling of floating point hard.=20

> Once in a slightly more mature state, I do think this feature would
> make a natural addition to upstream QEMU and plan to submit it for
> consideration.
>
> I'm writing to the mailing list now to inform FPU maintainers and any
> other interested parties that this work is happening, to solicit any
> early feedback, and to extend an invitation to anyone interested in
> collaborating to expedite its upstreaming.

I'll happily review patches on the list that provide for an accelerated
FPU experience as long as the correctness is maintained.

> My initial TCG FP work can be found here:
> https://github.com/mborgerson/xemu/pull/464/commits
>
> Thanks,
> Matt


--=20
Alex Benn=C3=A9e

