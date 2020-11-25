Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4312A2C466A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 18:06:19 +0100 (CET)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khyFF-0007oF-Qz
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 12:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khyBo-00041x-EZ
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 12:02:44 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1khyBl-0005AS-Ag
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 12:02:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 64so2590857wra.11
 for <qemu-devel@nongnu.org>; Wed, 25 Nov 2020 09:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=4tlYFFtmbvGOQbMUfYwBCAsChVL5o/1sr5d7vegIV68=;
 b=DZLu21kexBIJ3Vv5+dpJfz6grMcyV2L3XgjggXDNbpGnnMzkjBmAo6i1Vuf/FchSd0
 pmrxeU1RVxKZn0UmiUN+3HVwgSalAZYQhHlX2VhvmzHWdbYPGCtuj7ogTHIevYB25x1H
 5Car2HQTKqyK5J50oYkXM6otsOd2frEac3ry9DfL3Rs8Nd8n/dyX91gyMS9xHgMz8D7C
 rTuQa46ROWfOfxH3iw1y43kzTp1W3nrYYsVcdEWql4IO8uiwcdYwo9h4Hew9k/p0GRK5
 UpmcpxXdHeDlwti1NZNIPUoE41wHxyjOV2LFcKWkDlTqu9ilBK1QRcBgcT2YiuMbPlB0
 hI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=4tlYFFtmbvGOQbMUfYwBCAsChVL5o/1sr5d7vegIV68=;
 b=JMw1wkr4InyBMoeAbH1rom4YL9+J6Io6KPVjnwQFAM/nGBOpLlz3fh08DHBZIBnGNT
 8cmNeUU5G5mhwIqqJ+xvKEKFjTJHCpBJhOWtplZZfAYOykcZpFYKHOFdaA2tuWrF19eB
 YBbG61j2XZZVMHsoXFPr3SgtYLMWorqsnPntRq1IeWCl+05yiiHzr85+UeiHjtZV4GkN
 Dqqb0+8harNRWNP3M7FoZsu9espKb8lWM4Mzq2PvywVOoWNMeJWJEuzI+kKqaXnvJlXw
 i69pAqwJ7W9LG/WM3Q5AypIeRLrFRE9KdznELWs0XZ9nWXH7ibD/Rn6zkCokcq6k0XmR
 VFxg==
X-Gm-Message-State: AOAM530OkRGdrEtFzc/ewOJ9Bq4HqVE4a0/gZAIfw+y1SctEYLDtt02W
 Yrg7C/sRjdrLpe20sXjcXDXstg==
X-Google-Smtp-Source: ABdhPJxefxPDHjnAPTzzaqdeqC2UuaPEEpTX35z31yitSjLOa5whrxUnWEzJi5LL2EU36ekB2vJSYQ==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr5154467wrn.263.1606323759524; 
 Wed, 25 Nov 2020 09:02:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w186sm5436442wmb.26.2020.11.25.09.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 09:02:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D11041FF7E;
 Wed, 25 Nov 2020 17:02:36 +0000 (GMT)
References: <19955b4e-f33a-a672-e9c6-3efdd640906a@suse.de>
 <48353514-8dde-0f4b-193d-fa71737d7c80@amsat.org>
 <871rghixhb.fsf@linaro.org> <6efbff12-a10b-8e55-908b-f2233fc8001e@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: help with a build-user and build-user-plugin failure
In-reply-to: <6efbff12-a10b-8e55-908b-f2233fc8001e@suse.de>
Date: Wed, 25 Nov 2020 17:02:36 +0000
Message-ID: <87sg8xgyj7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> Hi Alex,
>
> On 11/25/20 10:42 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> On 11/24/20 12:04 PM, Claudio Fontana wrote:
>>>> Hi Alex,
>>>>
>>>> I am seeing build failures with build-user and build-user-plugin:
>>>>
>>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/220245998
>>>>
>>>> and I am trying to start investigating.
>>>>
>>>> How do I reproduce this locally?
>>>>
>>>> I am trying to run locally the check-tcg rule, but I cannot get it to =
work.
>>>> I managed to work around the problem of static libraries (disabled the=
m),
>>>>
>>>> but then I get:
>>>>
>>>>   BUILD   TCG tests for x86_64-linux-user
>>>>   BUILD   x86_64-linux-user guest-tests with cc
>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/l=
d: /tmp/ccgqtAM9.o: in function `test_fops':
>>>> /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:759: undefined refer=
ence to `fmod'
>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/l=
d: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:760: undefined referen=
ce to `sqrt'
>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/l=
d: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:761: undefined referen=
ce to `sin'
>>>> /usr/lib64/gcc/x86_64-suse-linux/7/../../../../x86_64-suse-linux/bin/l=
d: /dev/shm/cfontana/qemu/tests/tcg/i386/test-i386.c:762: undefined referen=
ce to `cos'
>>>>
>>>> Have you seen it before?
>>>> Any suggestions? I'm on OpenSUSE Leap 15 SP2.
>>>
>>> Related to 3fc1aad3864 ("configure: remove unnecessary libm test")
>>> + tcg tests still not ported to Meson?
>>=20
>> Hmm so we certainly need libm for the testcase but I guess this is> fail=
ing with a local cross compiler rather than docker? I'm not sure the
>> global feature test should be relevant for testcases.
>>=20
>
> Probably it's my attempt to make it work with non-static libm that failed=
 then,
>
> is it supposed to work?
>
> I see mention of BUILD_STATIC there, but it does not seem to actually wor=
k for me.
>
> If I use static libm, then it works.
> If I uninstall static libm, any attempt to build fails, regardless of
> whether I pass BUILD_STATIC=3D'n' or so.

All the test cases themselves should be built as static although I see
we fall back for the case of using a local cross compiler. That normally
only covers the case where the host compiler can also build for 32 bit
for testcases.

>
> Ciao and thanks,
>
> CLaudio


--=20
Alex Benn=C3=A9e

