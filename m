Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00140675A80
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 17:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIubZ-0001H7-Af; Fri, 20 Jan 2023 11:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIubQ-0001Gd-2k
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:50:57 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIubO-0007yq-6m
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:50:55 -0500
Received: by mail-wr1-x432.google.com with SMTP id bk16so5358487wrb.11
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 08:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2OPDj3eUOmfMuy6Exx6slfN1L4FPxth9hLd86tWdSBI=;
 b=X9x4YG/quR6wUfdHTQrviV1Oww72dftWKkmUAcyvgqvBMJxn9uW1pAKJpjfji4QXnM
 s4fcU7+z+Tk7zJCZniT2co+vIqpupuisUpRjD97KLYPZXSrYZVGZVHtpZ8OfsbAmjZbN
 8Ky2bVDDnICLpiZF7cocm2TSI+fG3lnpU8UvT66GnwIUdjZt9Z2gztqSEG7w72Dt1O2y
 b7H8Xp3T1jlnLIrFWY5Fwsf9aXmF9BIB5m/zbWsXrwlXnFJOxWOSl2m+Lk2ggPp+glXZ
 eiG7BKjUmokBQAH6PmSP35qjZOaycrgnO/iYiy7BJ9zfOU2waMeRnkWy4nXeDvheIjHk
 SH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2OPDj3eUOmfMuy6Exx6slfN1L4FPxth9hLd86tWdSBI=;
 b=CT3rlCBY4zAO1ogjZ5CxXgcFQIky2LQ4L/iOt4PyaR3BAc3ed+XP6Z3Jq/Fc+wWBWq
 yn4acZ77cYPr4gS2GxTEFAY5v8c3QjW/mOILXQ0uafRw7nCMwvkLN7+ZceQjRdG3sCIB
 uCY3Rb2u9+Q3ywedmbP0SIJpKu+44UiANMkTJVapfch4e4p23gMgY0TU3eiOFCUje3uC
 fqhm70fSpyYsbPaW3uo5yUHNAgSbNVUJCuO50k2dWjS1DVSQWgj505tpU+QEblRL042P
 f25kvhsWSPmN+E60Y/EdmKC2wn/ba+6gbQ3MdV7P0oCNOGJcKbDybEBosEVfj0YlNnj1
 s0Vw==
X-Gm-Message-State: AFqh2kqJk2qvT9KVhAPQ0nYcUiz/fSDz1tZMka52Q35oc8MF57SszUGq
 L+09s6kTmH8Q0Ssf4Odmk56KEg==
X-Google-Smtp-Source: AMrXdXvEQuoGPipv+vnIKIvyzFQtYCDEp7gCcviKX3aRlBV0AsdSU83NoRWPwAPC/WbHGOGsMB32cw==
X-Received: by 2002:adf:e908:0:b0:2bd:cdf9:b4ed with SMTP id
 f8-20020adfe908000000b002bdcdf9b4edmr12943451wrm.2.1674233452131; 
 Fri, 20 Jan 2023 08:50:52 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600016cd00b002be25db0b7bsm1398875wrf.10.2023.01.20.08.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 08:50:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39DA31FFB7;
 Fri, 20 Jan 2023 16:50:51 +0000 (GMT)
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
 <2c1eb92b-91f8-34d5-c5f7-a56a41ec807b@redhat.com>
 <fd1b116ac19feaaebbf82f8e41a24883af81f851.camel@linux.ibm.com>
 <32e7aa36-8ce8-1866-e085-2b918c58fd35@redhat.com>
User-agent: mu4e 1.9.15; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Subject: Re: [PULL 0/5] tcg patch queue
Date: Fri, 20 Jan 2023 16:49:47 +0000
In-reply-to: <32e7aa36-8ce8-1866-e085-2b918c58fd35@redhat.com>
Message-ID: <87y1pxw3o4.fsf@linaro.org>
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


Thomas Huth <thuth@redhat.com> writes:

> On 20/01/2023 11.53, Ilya Leoshkevich wrote:
>> On Fri, 2023-01-20 at 10:41 +0100, Thomas Huth wrote:
>>> On 16/01/2023 23.36, Richard Henderson wrote:
>>>> The following changes since commit
>>>> fb7e7990342e59cf67dbd895c1a1e3fb1741df7a:
>>>>
>>>>  =C2=A0=C2=A0 tests/qtest/qom-test: Do not print tested properties by =
default
>>>> (2023-01-16 15:00:57 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>  =C2=A0=C2=A0 https://gitlab.com/rth7680/qemu.git=C2=A0tags/pull-tcg-2=
0230116
>>>>
>>>> for you to fetch changes up to
>>>> 61710a7e23a63546da0071ea32adb96476fa5d07:
>>>>
>>>>  =C2=A0=C2=A0 accel/tcg: Split out cpu_exec_{setjmp,loop} (2023-01-16 =
10:14:12
>>>> -1000)
>>>>
>>>> ----------------------------------------------------------------
>>>> - Reorg cpu_tb_exec around setjmp.
>>>> - Use __attribute__((target)) for buffer_is_zero.
>>>> - Add perfmap and jitdump for perf support.
>>>>
>>>> ----------------------------------------------------------------
>>>> Ilya Leoshkevich (3):
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-user: Clean up when exitin=
g due to a signal
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accel/tcg: Add debuginfo support
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg: add perfmap and jitdump
>>>>
>>>> Richard Henderson (2):
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util/bufferiszero: Use __attribu=
te__((target)) for
>>>> avx2/avx512
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accel/tcg: Split out cpu_exec_{s=
etjmp,loop}
>>>
>>>  =C2=A0 Hi Richard, hi Ilya,
>>>
>>> with the recent QEMU master branch (commit 701ed34), I'm now seeing
>>> failures
>>> in Travis:
>>>
>>>  =C2=A0 https://app.travis-ci.com/github/huth/qemu/jobs/593786529#L14411
>>>
>>> Everything was still fine a couple of days ago (commit fb7e799):
>>>
>>>  =C2=A0 https://app.travis-ci.com/github/huth/qemu/builds/259755664
>>>
>>> ... so it seems this is likely related to this pull request. Could
>>> you
>>> please have a look?
>>>
>>>  =C2=A0 Thanks,
>>>  =C2=A0=C2=A0 Thomas
>>>
>> I would expect this to be (temporarily) fixed by [1], but we
>> probably
>> don't set GITLAB_CI in Travis. Would it make sense to set it?=C2=A0It lo=
oks
>> as if this variable is currently used only to skip certain tests.
>> If not, then maybe split it into QEMU_CI, GITLAB_CI and TRAVIS_CI?
>> https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg04438.html
>
> Ah, ok, so this test has issues in gitlab, too!

*sigh* yeah the test is flaky but this is a subtly different failure
 mode. All the gitlab failures I saw where the test triggering the abort
 rather than the assert catch we have here.


>
> For Travis, I think we should either check the CI or TRAVIS
> environment variables:
>
>
> https://docs.travis-ci.com/user/environment-variables/#default-environmen=
t-variables
>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

