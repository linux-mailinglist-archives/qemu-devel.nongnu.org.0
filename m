Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EB74EDC2D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 16:55:50 +0200 (CEST)
Received: from localhost ([::1]:39470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwDF-0003KG-Fk
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 10:55:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZw4X-00025s-Uh; Thu, 31 Mar 2022 10:46:49 -0400
Received: from [187.72.171.209] (port=51535 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZw4W-0003gT-2b; Thu, 31 Mar 2022 10:46:49 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 31 Mar 2022 11:27:59 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 9539B800013;
 Thu, 31 Mar 2022 11:27:59 -0300 (-03)
Message-ID: <b6266fd9-65b0-5b6a-9824-0dad9926d99a@eldorado.org.br>
Date: Thu, 31 Mar 2022 11:27:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: Re: [RFC PATCH 4/6] tests/tcg: add support for ppc64le softmmu tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220324190854.156898-1-leandro.lupori@eldorado.org.br>
 <20220324190854.156898-5-leandro.lupori@eldorado.org.br>
 <87k0cj2imn.fsf@linaro.org>
 <50ab5422-d294-dc8f-44bc-ece42473141d@eldorado.org.br>
 <87bkxu2vsg.fsf@linaro.org>
Content-Language: en-US
In-Reply-To: <87bkxu2vsg.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Mar 2022 14:28:00.0012 (UTC)
 FILETIME=[85DB2CC0:01D8450B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/22 06:50, Alex Bennée wrote:

> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
> 
>> On 24/03/2022 17:34, Alex Bennée wrote:
>>> Leandro Lupori <leandro.lupori@eldorado.org.br> writes:
>>>
>>>> Adding a new, "virtual" TCG test target, ppc64le-softmmu, seems to
>>>> be the cleanest way to support both BE and LE tests for
>>>> ppc64-softmmu.
>>>>
>>>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>>>> ---
>>>>    tests/Makefile.include                    |  7 ++++---
>>>>    tests/tcg/configure.sh                    | 11 ++++++++++-
>>>>    tests/tcg/ppc64/Makefile.softmmu-target   |  2 ++
>>>>    tests/tcg/ppc64le/Makefile.softmmu-target |  7 +++++++
> 
> Don't forget to add new files to MAINTAINERS by the way ;-)

Right.

> 
>>>>    4 files changed, 23 insertions(+), 4 deletions(-)
>>>>    create mode 100644 tests/tcg/ppc64le/Makefile.softmmu-target
>>>>
>>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>>> index e7153c8e91..4001fedbc3 100644
>>>> --- a/tests/Makefile.include
>>>> +++ b/tests/Makefile.include
>>>> @@ -40,9 +40,10 @@ SPEED = quick
>>>>    TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
>>>>
>>>>    # Per guest TCG tests
>>>> -BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
>>>> -CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
>>>> -RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
>>>> +TCG_TARGETS=$(patsubst tests/tcg/config-%.mak, %, $(wildcard tests/tcg/config-*.mak))
>>>> +BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TARGETS))
>>>> +CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TARGETS))
>>>> +RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TCG_TARGETS))
>>> I'm not following what is going on here. Are we creating a new
>>> target
>>> type? Is this just to avoid duplication in tests/tcg subdirs?
>>>
>> Yes, together with the change in test/tcg/configure.sh, a new
>> ppc64le-softmmu target is created, in the context of TCG tests only.
>> But it isn't just to avoid duplication in tests/tcg subdirs.
>>
>> Without a ppc64le-softmmu target, the tcg tests' makefiles will only
>> include tests/tcg/ppc64/Makefile.softmmu-target file. They won't try
>> to include tests/tcg/ppc64le/Makefile.softmmu-target, because there is
>> no ppc64le-softmmu target.
> 
> So according to IRC this is because the ppc64-softmmu target can support
> dynamically switching between BE/LE modes so there is only needs to be
> one 64 bit ppc system binary.
> 
>> I've actually tried to do everything in
>> tests/tcg/ppc64/Makefile.softmmu-target. But when it is included,
>> everything is already setup to build for ppc64 (BE), such as CC,
>> EXTRA_CFLAGS and other variables. So it seems that, to be able to also
>> build and run the same tests for ppc64le, I would need to somehow
>> change CC, EXTRA_CFLAGS, etc, to setup them for a ppc64le build and
>> write another set of rules for the LE tests. Then I would also need to
>> handle output file conflicts, to be able have both BE and LE binaries
>> coexisting in the same ppc64-softmmu output directory.
> 
> There is another approach you can take which is to generate alternative
> binaries from the same sources in the build. For example we build the
> sha512 test with a couple of different compiler options and run with
> slightly different QEMU_OPTS:
> 
>    sha512-vector: CFLAGS +=-mcpu=power10 -O3
>    sha512-vector: sha512.c
>            $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> 
>    run-sha512-vector: QEMU_OPTS+=-cpu POWER10
>    run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
> 
>    PPC64LE_TESTS += sha512-vector
> 
> So you could do something similar for le versions of the tests.
> > I'm ambivalent to which makes the best approach. I only worry the
> "pseudo target" approach might break something else down the line.
> However as long as the ppc maintainers are happy with the tests you can
> have my:
> 
> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> 
> for the check-tcg plumbing changes.
> 

Ok, this approach worked too. It ended up being a bit more complex, 
mainly because LE versions of CRT and MINILIB objects must be used, but 
it should be ok, if it helps to avoid breaking something else.
I'll send a V2 with this new approach.

Thanks,
Leandro

