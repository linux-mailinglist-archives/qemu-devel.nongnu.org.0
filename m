Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57A48402D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 11:54:13 +0100 (CET)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4hSG-0008Kt-9Z
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 05:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4hR1-0007WQ-W4
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:52:56 -0500
Received: from [2a00:1450:4864:20::332] (port=37520
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4hR0-0000nL-4x
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 05:52:55 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 a203-20020a1c7fd4000000b003457874263aso22482685wmd.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 02:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7aQll3SEqob5yxnCdeLvuddHbnieO8WwXAcfaxO2gqc=;
 b=zG6Ip773ytUn+uA5w8Rj4Hc+i4gZNH52j/MDVzTcpt10LbKEThI/9J754DmKFm8ilJ
 9GBA1rbZrmj6BcWn6V1WtxlbJ9AedQHO3DhkbhIp3EeBboqwmgU4TtgySpAAejqk+qcD
 BIkk+szw7ivIg6pCRAAkQzqw5D/72K9dNrWlqGPhqgiFgX5nRDD4MrHuj2axJ/DsTYiL
 8r0zIlArQZexJ0VnhUVzgUTPkD0AF00grLtHofESFtTlLkV4GjL8ga0nyCMTjPXHh0Zt
 6dLDuECdEsRWQMdcPHt4ZCcRLlJ57/Qemr1l/rU3ip2Jc36iGE11nvPu2VdByhK+m0kB
 JmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7aQll3SEqob5yxnCdeLvuddHbnieO8WwXAcfaxO2gqc=;
 b=Glg2TbC8SeIfg9VWf161PbBcTWk6MGTiAVHh4P9BkNTEw1CgknQwwojIFUocrkCT/V
 JxFtPv4+D4QNOGA6NO4v0edHoKI1Afkg9UpanjEmA0IuG3uT4vEHHiqLPYw0Bv2Df3dW
 Ld9PDoIqyvdoTjBiqCTlJukdSll8cDUSlAoIE5BF5F9+VSEZHnStFvt0OluzpmcCgLGF
 Hol0tkgPFr1aD9f37V9AEuw4xZX28AO73SmdJp+IYNNmc5zFGmdRfN9H8dhc1xoqrqs3
 0/4uy/eJ6CXRxj7hbU+D9iDMn19A6i1zyJW+2Y19GQ8/EqsTTW7/HI5zXPEnk1dhR2QZ
 rH2A==
X-Gm-Message-State: AOAM532wfmXQW00NjsY73ekACJ8DztnsV/kni72/D2/Ahj2iuBBR0LC3
 dEg2tSrexZ4kdOVQQtXLBJEXZw==
X-Google-Smtp-Source: ABdhPJwWcJrvqFFWm4RNtlcTulg8eQl7gbCa76X9jLGkF/VS7UXKgubI5+980M7SVTvetNSzB3An9Q==
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr42150177wmq.91.1641293572488; 
 Tue, 04 Jan 2022 02:52:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w9sm6843841wrq.70.2022.01.04.02.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 02:52:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 890D31FFB7;
 Tue,  4 Jan 2022 10:52:50 +0000 (GMT)
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
 <87fsq4dfck.fsf@linaro.org>
 <328302bb-b916-8d13-70e6-e6f88b0745db@gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Date: Tue, 04 Jan 2022 10:32:01 +0000
In-reply-to: <328302bb-b916-8d13-70e6-e6f88b0745db@gmail.com>
Message-ID: <875yqzn56l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 1/3/22 12:07, Alex Benn=C3=A9e wrote:
>> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
>>=20
>>> On 12/23/21 00:01, Richard Henderson wrote:
>>>> In contrast to Daniel's version, the code stays in power8-pmu.c,
>>>> but is better organized to not take so much overhead.
>>>> Before:
>>>>       32.97%  qemu-system-ppc  qemu-system-ppc64   [.] pmc_get_event
>>>>       20.22%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>>>        4.52%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hf=
lags_value
>>>>        3.30%  qemu-system-ppc  qemu-system-ppc64   [.] helper_lookup_t=
b_ptr
>>>>        2.68%  qemu-system-ppc  qemu-system-ppc64   [.] tcg_gen_code
>>>>        2.28%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>>>        1.84%  qemu-system-ppc  qemu-system-ppc64   [.] pmu_insn_cnt_en=
abled
>>>> After:
>>>>        8.42%  qemu-system-ppc  qemu-system-ppc64   [.]
>>>> hreg_compute_hflags_value
>>>>        6.65%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>>>        6.63%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>>>
>>>
>>> Thanks for looking this up. I had no idea the original C code was that =
slow.
>>>
>> <snip>
>>>
>>> With that in mind I decided to post a new version of my TCG rework, wit=
h less repetition and
>>> a bit more concise, to have an alternative that can be used upstream to=
 fix the Avocado tests.
>>> Meanwhile I'll see if I can get your reorg working with all EBB tests w=
e need. All things
>>> equal - similar performance, all EBB tests passing - I'd rather stay wi=
th your C code than my
>>> TCG rework since yours doesn't rely on TCG Ops knowledge to maintain
>>> it.
>> Reading this series did make me wonder if we need a more generic
>> service
>> from the TCG for helping with "internal" instrumentation needed for
>> things like decent PMU emulation. We haven't gone as much for it in ARM
>> yet but it would be nice to. It would be even nicer if such a facility
>> could be used by stuff like icount as well so we don't end up doing the
>> same thing twice.
>
> Back in May 2021 when I first starting working on this code I tried to ba=
se myself in the
> ARM PMU code. In fact, the cycle and insn calculation done in the very fi=
rst version of
> this work was based on what ARM does in target/arm/helper.c, cycles_get_c=
ount() and
> instructions_get_count(). The cycle calculation got simplified because ou=
r PPC64 CPU
> has a 1Ghz clock so it's easier to just consider 1ns =3D 1 cycle.
>
> For instruction count, aside from my 2-3 weeks of spectacular failures tr=
ying to count
> instructions inside translate.c, I also looked into how TCG plugins work =
and tried to do
> something similar to what plugin_gen_tb_end() does at the end of the tran=
slator_loop()
> in accel/tcg/translator.c. For some reason I wasn't able to replicate the=
 same behavior
> that I would have if I used the TCG plugin framework in the
> 'canonical' way.

plugin_gen_tb_end is probably overkill because we should already know
how many instructions there are in a translated block on account of the
insn_start and insn_end ops that mark them. In fact see gen_tb_end()
which is where icount updates the value used in the decrement at the
start of each block. Assuming no synchronous exceptions occur you could
just increment a counter at the end of the block as no async IRQs will
occur until we have executed all of those instructions.

Of course it's never quite so simple and when running in full icount
mode we have to take into account exceptions that can be triggered by IO
accesses. This involves doing a re-translation to ensures the IO
instruction is always the last we execute.

I'm guessing for PMU counters to be somewhat correct we would want to
ensure updates throughout the block (before each memory op and helper
call). This would hopefully avoid the cost of "full" icount support
which is only single threaded. However this is the opposite to icount's
budget and pre-decrement approach which feels messier than it could be.

> I ended up doing something similar to what instructions_get_count() from =
ARM does, which
> relies on icount. Richard then aided me in figuring out that I could coun=
t instructions
> directly by tapping into the end of each TB.

instructions_get_count will also work without icount but is affected by
wall clock time distortions in that case.

> So, for a generic service of sorts I believe it would be nice to re-use t=
he TCG plugins
> API in the internal instrumentation (I tried it once, failed, not sure if=
 I messed up
> or it's not possible ATM). That would be a good start to try to get all t=
his logic in a
> generic code for internal translate code to use.

Agreed - although the plugin specific stuff is really just focused on
our limited visibility API. Unless you are referring to
accel/tcg/plugin-gen.c which are just helpers for manipulating the TCG
ops after the initial translation.

--=20
Alex Benn=C3=A9e

