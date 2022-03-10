Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52244D469B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:16:19 +0100 (CET)
Received: from localhost ([::1]:49002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHiM-0001zS-Hj
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSH49-0006So-68
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:34:45 -0500
Received: from [2a00:1450:4864:20::32f] (port=39561
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nSH46-0000dm-RK
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:34:44 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 206-20020a1c02d7000000b00389d73ceb43so6248wmc.4
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=or7joVf3ClsrPbqDLRRSGldvq/n0Pm9eZDvSNCGGw8g=;
 b=SgGQ6Af7rndDWeI9MUQQGp5ADqj61l3wmVHifVEoV3DfXclkfMA2XPOFFO20+Pz++B
 v98CeXE1TNjXXq3J2Ep3qGF5PXlAUoNcmLtqn0efcmhHJV8ErfYakqnkvVKQM8EMv3oi
 IgF6hmnhLYLDepIKT1xUpBCSRr9BPy5R/SgaJQktU1x1y2v/9n+Nk7aoqSJaqExm8shM
 9/+mu/mloALTtGUOnnxryEFwF+CMq+xoYfpQ4Yp7MXS3PYvxZOpWN3IM7PpgdtNADynh
 hHnkgayUgrugLy8ZvqYUwmyyoSJm5jpCx1PhiLAJ+6QfKnmP7YIbkKojTRVhQkunbU+r
 x0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=or7joVf3ClsrPbqDLRRSGldvq/n0Pm9eZDvSNCGGw8g=;
 b=cCRbC4la5F9CfR4zuEFIoQpQ+qC5KistKaY43Ke5JyptX+YeFYAjjyrMsU+qfL3z/3
 QAgNhxMXcqbs6gau2FqwdPrEVEOIHJqm1uLk43fDKHR7uw+TuZhmxvLyOW/4kqVsphtV
 1VxhRCqQ7N0rF3tr0GTRzU7ueDPwUEGFkQwxJuC9q7XXybwkmdIKVqCZxT9Y90k06N7z
 aYflhmEO63id+q3y5o+54QXAe3benK3cwUN0in+dzMa7+5/JWWFKrHTL7mBmcqqPet8J
 iiTdWvV/XrAwoA16qq7zz/ma/BZjX/AgPHANRERyy6AT7aIO7vmZYyUTnfQMyFM8MFbM
 vyLw==
X-Gm-Message-State: AOAM531Z0Xb85l8YO8KSswkPG/upxcEJ08kXMwGhgJLIcl6y5h3/LrA7
 u24xZsoZArVHQczkFzvEWgpTMQ==
X-Google-Smtp-Source: ABdhPJyOUpO/9hBuAa6m1oLiMBxsCyWiI1dlq67BHuBV8Bwg60EyOHW6tvNyKQZ9/guqgWlJh9GOhw==
X-Received: by 2002:a05:600c:1c88:b0:389:bede:34d0 with SMTP id
 k8-20020a05600c1c8800b00389bede34d0mr11434469wms.62.1646912080667; 
 Thu, 10 Mar 2022 03:34:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a1c4e01000000b003899c8053e1sm5623419wmh.41.2022.03.10.03.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:34:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBC471FFB7;
 Thu, 10 Mar 2022 11:34:38 +0000 (GMT)
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
 <5ac2ce87-90a3-05f9-d65e-a8ef9854863c@redhat.com>
 <87a6dy5c1s.fsf@linaro.org>
 <d6f8c1af-b47b-ce2e-38b4-c8ef4ffc2204@redhat.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
Date: Thu, 10 Mar 2022 11:33:37 +0000
In-reply-to: <d6f8c1af-b47b-ce2e-38b4-c8ef4ffc2204@redhat.com>
Message-ID: <875yom59dd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 10/03/2022 11.34, Alex Benn=C3=A9e wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> On 09/03/2022 12.22, Alex Benn=C3=A9e wrote:
>>>> With -cpu max we get a warning:
>>>>     qemu-s390x: warning: 'msa5-base' requires 'kimd-sha-512'.
>>>> But dropping the -cpu max and it still runs fine.
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Cc: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    tests/tcg/s390x/Makefile.target | 2 --
>>>>    1 file changed, 2 deletions(-)
>>>> diff --git a/tests/tcg/s390x/Makefile.target
>>>> b/tests/tcg/s390x/Makefile.target
>>>> index 257c568c58..7aa502a557 100644
>>>> --- a/tests/tcg/s390x/Makefile.target
>>>> +++ b/tests/tcg/s390x/Makefile.target
>>>> @@ -34,6 +34,4 @@ sha512-mvx: CFLAGS=3D-march=3Dz13 -mvx -O3
>>>>    sha512-mvx: sha512.c
>>>>    	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>>>>    -run-sha512-mvx: QEMU_OPTS+=3D-cpu max
>>>> -
>>>>    TESTS+=3Dsha512-mvx
>>>
>>> Ok, this helps to get rid of the warnings, thus feel free to add:
>>>
>>> Tested-by: Thomas Huth <thuth@redhat.com>
>>>
>>> However, the error still persists. I now had a closer look by running
>>> the test with "qemu-s390x" on my z15 machine directly, and all tests
>>> are failing! The problem happens with both, gcc v11.2.1 and clang
>>> v13.0.1. The problem goes away (i.e. test works fine) if I compile the
>>> code with -O1 instead of -O3, or if I use GCC v8.5 instead. I'll try
>>> to find out more, but as a temporary workaround, we could also switch
>>> to -O1 instead of -O3.
>> The -O3 is included to force the compiler to vectorise the code -
>> otherwise you will get the same code as the plain sha512 test. However
>> is it because gcc v11.2.1 is using even more advanced mvx instructions
>> or just getting it's code generation wrong?
>> Do the tests also fail when run natively?
>
> No, it's running fine natively (see my other mail), it must be
> something in the s390x TCG backend.
>
> It's definitely related to commit 9bca986df88b8ea ... I just tried to
> switch TCG_TARGET_HAS_bitsel_vec back to 0, and then the test is
> working fine again...

Yeah it doesn't trigger on the s390x I've got so I guess the newer
compilers generates something we've not seen before and that trips up on
the new vector bitsel generation.

At least the test is doing it's job of exercising more of the vector
code generation.

>
>  Thomas


--=20
Alex Benn=C3=A9e

