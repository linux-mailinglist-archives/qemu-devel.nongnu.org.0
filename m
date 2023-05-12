Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74367003C9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 11:31:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxP6W-0005gr-1P; Fri, 12 May 2023 05:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxP6M-0005gN-PH
 for qemu-devel@nongnu.org; Fri, 12 May 2023 05:30:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pxP6K-0006Mm-VT
 for qemu-devel@nongnu.org; Fri, 12 May 2023 05:30:14 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f42c86543bso29720765e9.3
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683883810; x=1686475810;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbcdtDS5cTiMFQSUFB7ZcoZiXethxMBbph6evnM5uV4=;
 b=PF5Z2rVaqNbRdj20drcWDhf2+w7em9LycZ69cZjXfO6qAqKCfqMa30db4jHfI3kyVK
 anIrcbqqK17IZZbq+jy30fexwxT3Z33LAojUlj7NK3t6jg7uBj/megsNHZ3RxYQkCy1F
 LWmiPVzL+ZwbUOIPWQHzN0RvTuKdeONP7VxXJd4jVENS8Q5XlSRerNeVEwzFfAxJEFw+
 K6Zn2f1Kp9/e684VzQzAUe7MPeYEqHbZkB5cd2rQTx462ZNiubse+sBIDHkeuZNkSfb/
 DHz8mHj4rSiRlDF5qk3+PaB1u0QqlJQbOl6+sX9Fdj0sitLt8V/UwsQOP2Z3kNS5Kj1Q
 oNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683883810; x=1686475810;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LbcdtDS5cTiMFQSUFB7ZcoZiXethxMBbph6evnM5uV4=;
 b=ccvrLZaRAuVOd1yZm8myF9jckfYpsiMXn86tcOBugyWPArO2zzJqwwtiLqPjFH/Zi7
 UsjyIENLcrGWN98mf+ejluowC5M11+MdsQAhx+iaWYwbJK+XLcKrkfyYrvK7OcjgwkZr
 xEh1U+CYWytqksxtzrpoMgMaPJNvlg+NqmnaSbOISFYdCALnlRPItj7hLInuKri6cu6N
 qTH4PcAwNrCFP4GeNGxtTOtOEBfL0pdtijP1agqD6YA7xau1y1tv6n/awJTfsXf5L6e+
 xZge62xSlQM0Dr4gN6xdP4HiN66Iob7zapNtfsxtZNiVpVqUmrcmEuYMF4Zm20Ou5335
 4rvQ==
X-Gm-Message-State: AC+VfDyg1pNtDITrCQqLlFEHATPUJ3h3fKYkfedyB15CmR1k8Y7Wk5Vf
 3IEOvO6spNAa70JI60CxKTsjnQ==
X-Google-Smtp-Source: ACHHUZ74a/tkGORYrVgd2YBP+bTT0fP1lETTot7SteF0qAIXObPhbY9LpUzMWhHcKAP88v0UzuGPxA==
X-Received: by 2002:a05:600c:21d0:b0:3f1:8aaa:c20c with SMTP id
 x16-20020a05600c21d000b003f18aaac20cmr16345052wmj.7.1683883809821; 
 Fri, 12 May 2023 02:30:09 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1c7902000000b003f195d540d9sm27810654wme.14.2023.05.12.02.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 02:30:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C03361FFBB;
 Fri, 12 May 2023 10:30:08 +0100 (BST)
References: <20230421132421.1617479-1-fei2.wu@intel.com>
 <87wn259n4g.fsf@linaro.org>
 <1b2aae6d-ebce-65a9-0cda-84bf0fcc8b1e@intel.com>
 <87lehux7ao.fsf@linaro.org>
 <97cd91c9-2604-4dd6-1ef0-b33a11061621@intel.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v11 00/14] TCG code quality tracking
Date: Fri, 12 May 2023 10:29:01 +0100
In-reply-to: <97cd91c9-2604-4dd6-1ef0-b33a11061621@intel.com>
Message-ID: <87cz35yk0v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


"Wu, Fei" <fei2.wu@intel.com> writes:

> On 5/12/2023 4:42 PM, Alex Benn=C3=A9e wrote:
>>=20
>> "Wu, Fei" <fei2.wu@intel.com> writes:
>>=20
>>> On 4/22/2023 12:42 AM, Alex Benn=C3=A9e wrote:
>>>>
>>>> Fei Wu <fei2.wu@intel.com> writes:
>>>>
>>>>> This patch series were done by Vanderson and Alex originally in 2019,=
 I
>>>>> (Fei Wu) rebased them on latest upstream from:
>>>>>     https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
>>>>> and send out this review per Alex's request, I will continue to addre=
ss
>>>>> any future review comments here. As it's been a very long time and th=
ere
>>>>> are lots of conflicts during rebase, it's my fault if I introduce any
>>>>> problems during the process.
>>>>
>>>> Hi Fei,
>>>>
>>>> Thanks for picking this up. I can confirm that this applies cleanly to
>>>> master and I have kicked the tyres and things still seem to work. I'm
>>>> not sure if I can provide much review on code I wrote but a few things
>>>> to point out:
>>>>
>>> Hi Alex,
>>>
>>> There are several new files added, should I put your name as their
>>> maintainer? Also, should I signed-off these patches or not, definitely
>>> the original signed-offs will be kept.
>>=20
>> I assume they would just become part of the accel/tcg stuff rather than
>> be maintained as a separate subsystem.
>>=20
> ok. I see ./scripts/checkpatch.pl reports some warnings as follows:
>
> WARNING: added, moved or deleted file(s), does MAINTAINERS need
> updating?

All the stuff under accel/tcg should already be caught by:

Overall TCG CPUs
...
F: accel/tcg/

but I suspect the new headers will need explicit entries in the
MAINTAINERS file adding.

>
>> For sign-offs you should keep the original authors and add your own.
>> Each s-o-b is a statement by the person working with the code that they
>> are "legally okay to contribute this and happy for it to go into QEMU".
>> So it is totally normal for work that goes through several trees before
>> being merged to have multiple sign-offs. When the maintainer creates
>> their pull request they will add theirs as well.
>>=20
> Got it, thank you.
>
> Fei.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

