Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8743533F2BF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:37:29 +0100 (CET)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXIe-0004AS-Hf
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMXDm-0000SY-10
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:32:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMXDk-0004cd-8d
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 10:32:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w18so2579696edc.0
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AKG4cM3EFNMXL0rFNgVP1PeO1MhY3vBttiH9MZGTsYk=;
 b=YNbqDU1LuFviPXIIDRy1hRt5Htz5cDDoarIgY1n8C7lQ/G1Fq/QXDJ3ekmWWLx6ca0
 +KYrqaYhODyY5UtlzeoMF/LCl6kStpSd5qf/At4sNq9Zam0kgjuOvFq0yhoM2ZwOXCtw
 81HdZf56Ba4iT5HuCNguKVW6LmOh/hwamgP00k4inMIK1FtqA7J/WisNCpHobaog14Rk
 Xwe3POwFKlHjgEiU3oZDD9ZJMP13n1FUPaOgdJv8NfykuTPFHjuJcY7x5a6O3/2t5Jka
 H9NZVhLVHunbkE0p41/2gYOWNuZ41zmPKwi7SzHWBOyWcs3llq/GVhG+V8lKrVb71TXG
 b+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AKG4cM3EFNMXL0rFNgVP1PeO1MhY3vBttiH9MZGTsYk=;
 b=bvK/AJjm6F4rwsn+XXRdHlTym6aBlHi8phF3OoN0JUchWYZa48S8h4fEMFFJSkflK4
 fm/n7PoRV9FH0naAfyiC3iOpphaBSAoWEVplplawLjbYvujZwo6oHBZYZMl/84RhKUG4
 JPv03zFSnFbbSTYzY5ILzplp42MSbDBOyc3v/KiqMXdg7qUUvOVB94HHbKmyOV8FV+wY
 +TyiyeO/ah+3p4IROgC+pbNv6/GM4v9wV0iK7up5mWfoKy49QcAbYr3q4nA211vAXuBm
 g5rLHPfkppzsC8jAf/PRL8j+XfKnY/PTyxqhBln7ZVhglrfc+Sq7CmDdci3ih4BZ670V
 rfOQ==
X-Gm-Message-State: AOAM531HD2LAznpyc0BTCxzSmfzEjUCOagm+3k7ehCTYqs40hzPEc3gX
 HfkGnLgyj4d52fJ9Lg1uFII+Xg==
X-Google-Smtp-Source: ABdhPJw5J3ZsgWD/8/jXUYouWv5C2NVKujRWmsTArMxf3rCKpQ0++I/n1bOgakcBX8nwrHcl+PlxEg==
X-Received: by 2002:aa7:d656:: with SMTP id v22mr41894949edr.119.1615991542809; 
 Wed, 17 Mar 2021 07:32:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n25sm12256653edq.55.2021.03.17.07.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:32:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AEE451FF7E;
 Wed, 17 Mar 2021 14:32:20 +0000 (GMT)
References: <20210317072216.16316-1-alex.bennee@linaro.org>
 <20210317072216.16316-2-alex.bennee@linaro.org>
 <a6e34081-89bd-2af1-fa0d-72a8fc8daa04@redhat.com>
 <87h7lac70s.fsf@linaro.org>
 <285185a0-fa94-9e25-317f-cb24a39c001a@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL v2 01/15] utils: Use fixed-point arithmetic in qemu_strtosz
Date: Wed, 17 Mar 2021 14:31:31 +0000
In-reply-to: <285185a0-fa94-9e25-317f-cb24a39c001a@redhat.com>
Message-ID: <87eegddf63.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 3/17/21 1:13 PM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Hi Alex,
>>>
>>> On 3/17/21 8:22 AM, Alex Benn=C3=A9e wrote:
>>>> From: Richard Henderson <richard.henderson@linaro.org>
>>>>
>>>> Once we've parsed the fractional value, extract it into an integral
>>>> 64-bit fraction.  Perform the scaling with integer arithmetic, and
>>>> simplify the overflow detection.
>>>>
>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> Message-Id: <20210315185117.1986240-2-richard.henderson@linaro.org>
>>>
>>> Something is odd with your tooling, the '---' separator is missing.
>>=20
>> Surely that's only when you have bellow the line comments? b4 strips
>> then when applying series.
>
> Yes, the problem is your series doesn't apply on top of 7625a1ed013
> ("utils: Use fixed-point arithmetic in qemu_strtosz")
>
> $ git am v2_20210317_alex_bennee_misc_fixes_strtoz_plugins_guest_loader.m=
bx
> Applying: utils: Use fixed-point arithmetic in qemu_strtosz
> error: patch failed: tests/unit/test-cutils.c:2128
> error: tests/unit/test-cutils.c: patch does not apply
> error: patch failed: util/cutils.c:275
> error: util/cutils.c: patch does not apply
> Patch failed at 0001 utils: Use fixed-point arithmetic in qemu_strtosz
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> But skipping this patch, the rest can be applied properly by git-am.

I can imagine git am might get confused, out of interest what about git
merge (as this is a PR and previously git is pretty smart about this)?

--=20
Alex Benn=C3=A9e

