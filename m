Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4DF5E780E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 12:16:29 +0200 (CEST)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfjP-0002qu-WF
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 06:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obfev-0007sI-NZ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:11:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obfet-0003uJ-Mu
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 06:11:49 -0400
Received: by mail-wr1-x431.google.com with SMTP id n10so19611157wrw.12
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=LNo63zoY5ZRU3ECIsvMCl7Tb0z+OKeJFoV2evblLs7c=;
 b=sYMQx1UppvU90J5zPwXGQDRbEnwJ7XF0iIY3MeeHgCYwJ0p3vC2HmJQxt2WdQlEeEd
 xaPIuFhtdEVFKuxahkm7Si/HRUOXOo14RvR9Fdhfj8b1+U8ZlgUej1xNM9UspJKvZZQ1
 BomCDNL2nup8lNO17dcr+BahtpYxsM/ZS08h8Yst1TC1bIL1hZx4MgQD+O4cd64FC7Cg
 /u+EOukzpcztUu6HmUvP9acfcR3OyQHXQbJ3++lDnZgFYbCabt18ugFh0vego66SlPW2
 xZyh2PQEtHuD/sS4UMsfzosIp/3+RGoQrIwKGdkmRz7wgcprbT3wcyM74HdvQpxcFfad
 XE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=LNo63zoY5ZRU3ECIsvMCl7Tb0z+OKeJFoV2evblLs7c=;
 b=f0Ki5V60YFn78cCyQDnHg7+WfHkB21H3KD42Jv3bf9nXwVyfXKxkmR/RyIYektbH97
 94tIIxQ5BGpfA1EBs99HYHziJHMkH1xq9TaGFHdUlzwfDKs8hMGrG0ntF3phjqngPulw
 v8m0+sM6Ny2UAsGIQMlFwhdE8W3TLV5vT2euptyd3GobfQ/LnWgFFlWru+Ig9tIxGUL/
 GW1V07fMe2tAt1Hbv1B4sydaWZL71JuDe+iHezbOgTXs7CqSkmNURyAkwkf4hnFewUj7
 dosq7esnnYY/FBRkUmkH3t/DocNpbJM1Y0jdblTix2CLpJi/tggAzjqa18BZr0rdh7VY
 bXNA==
X-Gm-Message-State: ACrzQf1BVrax1xn2q3s+rSZ+z4mUx5icyUO58C2EWIKt6QEL2y586ezn
 x3jKWmhRB/rZWih+1woIXs+DGA==
X-Google-Smtp-Source: AMsMyM4umuam93Xr6HTsKpc78qgX9ouSGbLjgpmsNXGbIoVzBZivI1bab902Xx8Ou1cKoqQ0cQcpNQ==
X-Received: by 2002:a05:6000:1b90:b0:22a:c3a9:6567 with SMTP id
 r16-20020a0560001b9000b0022ac3a96567mr4620207wru.118.1663927906030; 
 Fri, 23 Sep 2022 03:11:46 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a5d4a44000000b002238ea5750csm7989467wrs.72.2022.09.23.03.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 03:11:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD3C01FFB7;
 Fri, 23 Sep 2022 11:11:44 +0100 (BST)
References: <YyyxrNp+5XrmLi1Y@fedora> <Yy1gB1KB3YSIUcoC@redhat.com>
 <6a52db60-0ec8-ca7c-795a-b62743b1383f@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Cleber
 Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
Date: Fri, 23 Sep 2022 11:08:00 +0100
In-reply-to: <6a52db60-0ec8-ca7c-795a-b62743b1383f@redhat.com>
Message-ID: <87sfkiwgbj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 23/09/2022 09.28, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, Sep 22, 2022 at 03:04:12PM -0400, Stefan Hajnoczi wrote:
>>> QEMU's avocado and Travis s390x check-tcg CI jobs fail often and I don't
>>> know why. I think it's due to timeouts but maybe there is something
>>> buried in the logs that I missed.
>>>
>>> I waste time skimming through logs when merging qemu.git pull requests
>>> and electricity is wasted on tests that don't produce useful pass/fail
>>> output.
>>>
>>> Here are two recent examples:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3070754718
>>> https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/583629583
>>>
>>> If there are real test failures then the test output needs to be
>>> improved so people can identify failures.
>>>
>>> If the tests are timing out then they need to be split up and/or reduced
>>> in duration. BTW, if it's a timeout, why are we using an internal
>>> timeout instead of letting CI mark the job as timed out?
>>>
>>> Any other ideas for improving these CI jobs?
>> The avocado job there does show the errors, but the summary at the
>> end leaves something to be desired. At first glance it looked like
>> everything passed because it says "ERROR 0" and that's what caught
>> my eye. Took a long time to notice the 'INTERRUPT 5' bit is actually
>> just an error state too.  I don't understand why it has to have so
>> many different ways of saying the same thing:
>>    RESULTS    : PASS 14 | ERROR 0 | FAIL 0 | SKIP 37 | WARN 0 |
>> INTERRUPT 5 | CANCEL 136
>>    "ERROR", "FAIL" and "INTERRUPT" are all just the same thing
>>    "SKIP" and "CANCEL" are just the same thing
>> I'm sure there was some reason for these different terms, but IMHO
>> they
>> are actively unhelpful.
>> For example I see no justiable reason for the choice of SKIP vs
>> CANCEL
>> in these two messages:
>>   (173/192)
>> tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_launc=
h_set_up:
>> SKIP: sudo -n required, but "sudo -n true" failed: [Errno 2] No such
>> file or directory: 'sudo'
>>   (183/192)
>> tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alia=
s:
>> CANCEL: No QEMU binary defined or found in the build tree (0.00 s)
>> It would be clearer to understand the summary as:
>>   RESULTS: PASS 14 | ERROR 5 | SKIP 173 | WARN 0
>> I'd also like to see it repeat the error messages for the failed
>> tests at the end, so you don't have to search back up through the
>> huge log to find them.
>> On the TCG tests we see
>> imeout --foreground 90
>> /home/travis/build/qemu-project/qemu/build/qemu-s390x  noexec >
>> noexec.out
>> make[1]: *** [../Makefile.target:158: run-noexec] Error 1
>> make[1]: Leaving directory
>> '/home/travis/build/qemu-project/qemu/build/tests/tcg/s390x-linux-user'
>> make: ***
>> [/home/travis/build/qemu-project/qemu/tests/Makefile.include:60:
>> run-tcg-tests-s390x-linux-user] Error 2
>> I presume that indicates the 'noexec' test failed, but we have zero
>> info.
>
> I think this is the bug that will be fixed by Ilya's patch here:
>
>  https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg02756.html
>
> But I agree, it is unfortunate that the output is not available.
> Looking at this on my s390x box:
>
> $ cat tests/tcg/s390x-linux-user/noexec.out
> [ RUN      ] fallthrough
> [       OK ]
> [ RUN      ] jump
> [  FAILED  ] unexpected SEGV
>
> so there is an indication of what's going wrong in there indeed.
>
> Alex, would it be possible to change the tcg test harness to dump the
> .out file of failing tests?

Yes I think so, either by tweaking the run-% rules in
tests/tcg/Makefile.target to handle a failed call or possibly expanding
the run-test macro itself.

>
>  Thomas


--=20
Alex Benn=C3=A9e

