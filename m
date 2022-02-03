Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8F4A8BA6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:28:55 +0100 (CET)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgqk-0005Nb-7n
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:28:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFgGP-0007BP-01
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:51:21 -0500
Received: from [2a00:1450:4864:20::62b] (port=43655
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFgGJ-0005i9-Gn
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:51:17 -0500
Received: by mail-ej1-x62b.google.com with SMTP id d10so11132180eje.10
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IJ3OsA1v8pG5EUmHKlpXvf6RUBVyzrvZA1tqnEHLsS8=;
 b=JOI8sZGNJVRHhbFvbfMrCivuA2E/JUL2zIpKJ1XSdTkpM+9/3YokMdNfBoT3fj2lmF
 HjXCI1v6SVtPI1Mct+WJ/oIAoeP2dHoHzUGVJz3sAYwD1DI72WY8GeBn86SmEMvgosIx
 jD6BcoaqS80761Q0fkGO2WRH7LBKjZsrIEwzRYHxFo9A4vgJdtfyCuTnxHxgv7XIOitu
 xa1lc1zVgejy9oeskYTmGz8VG+kaxFyJMRkM0fagCfa4ceCg38a1+i+7ZcSXuctCQXRx
 2q0uCIsiyRWr05jJ5gxBlHOgpbwIr6TMtXjRaNr/o40nTReZeayFz/Q9Rwo3w2VMlq8t
 njFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IJ3OsA1v8pG5EUmHKlpXvf6RUBVyzrvZA1tqnEHLsS8=;
 b=j13FgLscA1R19jQ8b7EEVyFwHuwtZpl7n84IkrrT4bcMLFRFQFQAmI6moRpftElZOl
 r9krOtsSi5f4DxTfhwiOatnauJ4oWB60+iZV7PhwCHrB/MUNGViydViUIFIhFhvEliFB
 q1TYCx/p9DAT2Hw37U11ulVIqrD0IseMPuoYYc6LPR9pwwgd15861QiDNGutlMGzSIuS
 0TmOdu/DPsn/tqnLr4Hy+lWQ3nkb7R0NnjQc3qQzlQ3HPeUocyerxrFn6MIxVqfkn0bi
 TwKAc3aGeIy+dDBAA7wfC7Wq7xD+sSeAiJVQvrBLTPybgbqHy2H+PeSsr1+3a8aTTJ4t
 935w==
X-Gm-Message-State: AOAM530fvmKWE3EQcW4b+m2KpF+fpuK+1ad8/iFuErKM/l7ElfqfbVPi
 wSFQ3qjB/uAbq3BGEUrN3wEb/g==
X-Google-Smtp-Source: ABdhPJzw1MqlWqI15PWbsDqYEcVHUZ1DIJmSqaR0l5N8fq4DbnvP63itfe4x9XQox6PXxRLkfLeIeA==
X-Received: by 2002:a17:907:9608:: with SMTP id
 gb8mr30363487ejc.404.1643910664802; 
 Thu, 03 Feb 2022 09:51:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g12sm22862851edv.89.2022.02.03.09.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:51:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 33F241FFB7;
 Thu,  3 Feb 2022 17:51:03 +0000 (GMT)
References: <20220202191242.652607-1-alex.bennee@linaro.org>
 <87k0ecvoxu.fsf@linaro.org>
 <SN4PR0201MB8808B91BF0F27E376C1872AEDE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [RFC PATCH  0/4] improve coverage of vector backend
Date: Thu, 03 Feb 2022 17:50:12 +0000
In-reply-to: <SN4PR0201MB88089C0A52C660DC7A6D71E6DE289@SN4PR0201MB8808.namprd02.prod.outlook.com>
Message-ID: <87pmo3sut4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

>> -----Original Message-----
>> From: Taylor Simpson
>> Sent: Wednesday, February 2, 2022 7:45 PM
>> To: Alex Benn=C3=A9e <alex.bennee@linaro.org>; richard.henderson@linaro.=
org;
>> qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> stefanha@redhat.com; crosa@redhat.com
>> Subject: RE: [RFC PATCH 0/4] improve coverage of vector backend
>>=20
>>=20
>> > -----Original Message-----
>> > From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Sent: Wednesday, February 2, 2022 5:16 PM
>> > To: richard.henderson@linaro.org; qemu-devel@nongnu.org
>> > Cc: qemu-arm@nongnu.org; fam@euphon.net; berrange@redhat.com;
>> > f4bug@amsat.org; aurelien@aurel32.net; pbonzini@redhat.com;
>> > stefanha@redhat.com; crosa@redhat.com; Alex Benn=C3=A9e
>> > <alex.bennee@linaro.org>; Taylor Simpson <tsimpson@quicinc.com>
>> > Subject: Re: [RFC PATCH 0/4] improve coverage of vector backend
>> >
>> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>> >
>> > > Hi Richard,
>> > >
>> > > While reviewing the TCG vector clean-ups I tried to improve the
>> > > range of instructions we tested. I couldn't get the existing hacky
>> > > sha1 test to vectorise nicely so I snarfed the sha512 algorithm from
>> > > CCAN. The sha512 test is good because it is all purely integer so we
>> > > should be able to use native code on the backend. The test also has
>> > > the nice property of validating behaviour.
>> >
>> > Hi Taylor,
>> >
>> > You might want to check this out:
>> >
>> > =E2=9C=97  ./qemu-hexagon ./tests/tcg/hexagon-linux-user/sha512
>> > 1..10
>> > not ok 1 - do_test(&tests[i])
>> > #     Failed test
>> > (/home/alex.bennee/lsrc/qemu.git/tests/tcg/multiarch/sha512.c:main()
>> > at line 986) not ok 2 - do_test(&tests[i])
>>=20
>> Thanks for the heads-up.  I'll take a look
>
> Quick update - I ran the test on the hardware and have the same error mes=
sages.
>
> So, it doesn't look like a QEMU problem.  I'll investigate if the
> problem is due to something in the toolchain.

That reminds me what is the status of the binary toolchain. The last
attempt had some issues so we are still using the hand-built one
upstream.


>
> Taylor


--=20
Alex Benn=C3=A9e

