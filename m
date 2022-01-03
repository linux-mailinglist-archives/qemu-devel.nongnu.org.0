Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB50483402
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 16:13:45 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4P1s-0001Hy-CS
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 10:13:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4OzV-0008CF-Of
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 10:11:17 -0500
Received: from [2a00:1450:4864:20::435] (port=39768
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4OzT-0007r1-4L
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 10:11:17 -0500
Received: by mail-wr1-x435.google.com with SMTP id s1so70477841wra.6
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 07:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Mt4fsaOkaYqvMZ9EnP19och+kgFZTNlfada0ghpisUY=;
 b=Nln1OiB+GvKefRDeO23JKn4mKgUZoi8a5E0HhivRemt3bAVExIZyLwOybU/sQwDfpD
 6O5CxAznmE/tIyv5JtTxnAn+BRR4YE3hTKpgS/vWsuDSSLOw2udnAh2dv4IOUlcw7qpU
 j/1+Rb0L1IwJl0Xa15FQcSjvON2Ez6dgF672EcX6hOg9cGmmp4NLHKEri5qqGvCC5p1l
 o697D6A5dyOWOurq5Id+8qjFpz0WagafVZBSMpQ69wrQlYrJKZ2NuwvU9W36EtSFBboT
 byEi0GWJZ4bUq6eiK/KbwoyiMiTbSV/LlosZDoh2EYNTHdZo+KSNeMY2KG4nrn+80Dk+
 kYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Mt4fsaOkaYqvMZ9EnP19och+kgFZTNlfada0ghpisUY=;
 b=jaHyNCC1nBXNw722qoUAdjSZW4MY2s0otQzFkamRAA8cbBNDdvS7mLwJyjNh9YLYJ/
 9pGl4yim/0YhdPXnFh8J3PUwZ0RPh/Hd4rsrelZ7rwiPvjW3wGGrQ+B65vuVdTJ/1kXJ
 0PuTSSi/jr2jwYCoTl/YV7WuWdxQQgVn/fI+qOQtrjSiEfcwygTBj1kN74zFzgX/XX2i
 n1ctS7xVhzPLnYUtgHYYQ4CZSIg5sBkQ7IcOR0U4h4mbFO78NSMocXkpTmplPUI/9ENL
 T6dMuMZ6S9zFavuBB6BWQbMjYQvzMmTdtWec35NQuwtr2UXA0qLWh60PIEOHUafYbwbm
 3CUw==
X-Gm-Message-State: AOAM531SjzJThhmfAOGqpzqmDSWWw3GfBFlHYuSpazSH15AvNX72LZtT
 J9Ny8yP6WSAo0weBTy6pRJVLmQ==
X-Google-Smtp-Source: ABdhPJwHrAE3M5cVWgeiFcvyWAGNmhfD8AZLkyvIhliDazvf4B2nxRxfXF9ObxEQivD2+/Y425vGlw==
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr40129914wrd.492.1641222669000; 
 Mon, 03 Jan 2022 07:11:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm37158407wmq.34.2022.01.03.07.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 07:11:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D48D1FFB7;
 Mon,  3 Jan 2022 15:11:07 +0000 (GMT)
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Date: Mon, 03 Jan 2022 15:07:13 +0000
In-reply-to: <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
Message-ID: <87fsq4dfck.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

> On 12/23/21 00:01, Richard Henderson wrote:
>> In contrast to Daniel's version, the code stays in power8-pmu.c,
>> but is better organized to not take so much overhead.
>> Before:
>>      32.97%  qemu-system-ppc  qemu-system-ppc64   [.] pmc_get_event
>>      20.22%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>       4.52%  qemu-system-ppc  qemu-system-ppc64   [.] hreg_compute_hflag=
s_value
>>       3.30%  qemu-system-ppc  qemu-system-ppc64   [.] helper_lookup_tb_p=
tr
>>       2.68%  qemu-system-ppc  qemu-system-ppc64   [.] tcg_gen_code
>>       2.28%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>       1.84%  qemu-system-ppc  qemu-system-ppc64   [.] pmu_insn_cnt_enabl=
ed
>> After:
>>       8.42%  qemu-system-ppc  qemu-system-ppc64   [.]
>> hreg_compute_hflags_value
>>       6.65%  qemu-system-ppc  qemu-system-ppc64   [.] cpu_exec
>>       6.63%  qemu-system-ppc  qemu-system-ppc64   [.] helper_insns_inc
>>=20
>
> Thanks for looking this up. I had no idea the original C code was that sl=
ow.
>
<snip>
>
> With that in mind I decided to post a new version of my TCG rework, with =
less repetition and
> a bit more concise, to have an alternative that can be used upstream to f=
ix the Avocado tests.
> Meanwhile I'll see if I can get your reorg working with all EBB tests we =
need. All things
> equal - similar performance, all EBB tests passing - I'd rather stay with=
 your C code than my
> TCG rework since yours doesn't rely on TCG Ops knowledge to maintain
> it.

Reading this series did make me wonder if we need a more generic service
from the TCG for helping with "internal" instrumentation needed for
things like decent PMU emulation. We haven't gone as much for it in ARM
yet but it would be nice to. It would be even nicer if such a facility
could be used by stuff like icount as well so we don't end up doing the
same thing twice.

>
>
> Thanks,
>
>
> Daniel
>
>
> [1] https://github.com/torvalds/linux/tree/master/tools/testing/selftests=
/powerpc/pmu/ebb
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00073.html
>
>> r~
>> Richard Henderson (3):
>>    target/ppc: Cache per-pmc insn and cycle count settings
>>    target/ppc: Rewrite pmu_increment_insns
>>    target/ppc: Use env->pnc_cyc_cnt
>>   target/ppc/cpu.h         |   3 +
>>   target/ppc/power8-pmu.h  |  14 +--
>>   target/ppc/cpu_init.c    |   1 +
>>   target/ppc/helper_regs.c |   2 +-
>>   target/ppc/machine.c     |   2 +
>>   target/ppc/power8-pmu.c  | 230 ++++++++++++++++-----------------------
>>   6 files changed, 108 insertions(+), 144 deletions(-)
>>=20


--=20
Alex Benn=C3=A9e

