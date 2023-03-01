Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6226A6A4C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJCn-0003HX-4J; Wed, 01 Mar 2023 04:57:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJCl-0003HK-Rc
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:56:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJCj-0003ih-Rw
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:56:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so7461158wmi.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7IdYx7bXhRk4ejJaUv2RkkRy5sRG4K8r94ReMMUNGvg=;
 b=N56B7df8eCuXBkj/EC2RxZjVDuCrrEHAeSjmN99lfz7AUsaBE0m0Wov5PMrCA4E5+p
 qKDJ4HRC/4mXOoyXdq9r0eKFqVkAEBtD01+zd5DZpwzU7xNdfk2VoQr0MmKDABZNDx6E
 aXr3XBXeXa1a1Hj0mAAdnqqoB7y+mz/Tvb6o7vcxlJN4gMWRvCCPJ9+CSUjwHL2UmSL+
 o/ufrsY5ptEkMsDBf1TZg8glIOhoP+mGbNukb8IZUz2KR29rHL3kFEhq+Xfiq5Fyow8J
 eKMXe+quFJ8miOmYi+kTypO71hpMpxHsUGOaIYMGYly9N5Ny98Q7qETWZJT+HwGWSVoN
 KbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7IdYx7bXhRk4ejJaUv2RkkRy5sRG4K8r94ReMMUNGvg=;
 b=MICtw4RKtQIXObFz7tTdUInukmAMxVEzt1Jrzl9CdTInnVff3p9JssbeKphCFWBpov
 09v8ojAFvwYUIttJXmPb1mpRru0E/fSchGsnWt3grf8DzKnp60TtMPSXnVDEdozEoqOD
 HjL/7JS0MKyxhS7qJKNwHmQ/1o4MBQNaza48XvCnb6B60o+AIb83WJOIRRGF0q0IQNHO
 Y1z8A5P2pd5kS1qlNEt+1J/KK67AwXYwLzuPpLOVvUBeacEmZL7V8DgpNm8uQpJLlhBT
 N+XAKKu3S+olh2dcxHQBvvasWuQG66kU6r6p/CUB4nis174J9A3MDj6Lm6I7R7uCfvmh
 VgoA==
X-Gm-Message-State: AO0yUKVwhWtQAx0x0O6gAZzhIVMd5L0mMxCdpdfglfNu0mtdHQYGHO2Q
 LcDR05ieIAmisTsFkkAgTxbQxQ==
X-Google-Smtp-Source: AK7set/YopvjD+7gZ7xghhlzxvXN8DnQzlLZzDD8aXRUR4vI6SbP5HBd42Mwsy9suBHbJwNESz67zw==
X-Received: by 2002:a05:600c:5252:b0:3ea:8ed9:8f03 with SMTP id
 fc18-20020a05600c525200b003ea8ed98f03mr4326050wmb.24.1677664615960; 
 Wed, 01 Mar 2023 01:56:55 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003eb192787bfsm15977574wmq.25.2023.03.01.01.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:56:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1928F1FFB7;
 Wed,  1 Mar 2023 09:56:55 +0000 (GMT)
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
 <Y/zhZ4brfdQ7nwLI@redhat.com>
 <CAJSP0QX2tkaVZh0FX4Ke8EWn7tO9qm76YnRCHe6-UxWJg6LzTQ@mail.gmail.com>
 <Y/7ZzH/X5eb3vhPG@invalid>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, =?utf-8?Q?Daniel_P=2E_Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>, Ben Dooks <qemu@ben.fluff.org>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: out of CI pipeline minutes again
Date: Wed, 01 Mar 2023 09:53:51 +0000
In-reply-to: <Y/7ZzH/X5eb3vhPG@invalid>
Message-ID: <875ybkeqvt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Eldon Stegall <eldon-qemu@eldondev.com> writes:

> On Mon, Feb 27, 2023 at 12:43:55PM -0500, Stefan Hajnoczi wrote:
>> - Personally, I don't think this should exclude other efforts like
>> Eldon's. We can always add more private runners!
>
> Hi!
> Thanks so much to Alex, Thomas, Gerd, et al for the pointers.
>
> Although the month has passed and presumably gitlab credits have
> replenished, I am interested in continuing my efforts to replicate the
> shared runner capabilities. After some tinkering I was able to utilise
> Gerd's stateless runner strategy with a few changes, and had a number of
> tests pass in a pipeline on my repo:
>
> https://gitlab.com/eldondev/qemu/-/pipelines/791573670

Looking good. Eyeballing the run times they seem to be faster as well. I
assume the runner is less loaded than the shared gitlab ones?

> Looking at the failures, it seems that some may already be addressed in
> patchsets, and some may be attributable to things like open file handle
> count, which would be useful to configure directly on the d-in-d
> runners, so I will investigate those after integrating the changes from
> the past couple of days.
>
> I have been reading through Alex's patchsets to lower CI time in the
> hopes that I might be able to contribute something there from my
> learnings on these pipelines. If there is an intent to switch to the
> kubernetes gitlab executor, I have worked with kubernetes a number of
> times in the past, and I can trial that as well.

I've dropped that patch for now but I might revisit once the current
testing/next is done.

> Even with the possibility of turning on Azure and avoiding these monthly
> crunches, maybe I can provide some help improving the turnaround time of
> some of the jobs themselves, once I polish off greening the remaining
> failures on my fork.
>
> Forgive me if I knock around a bit here while I figure out how to be
> useful.

No problem, thanks for taking the time to look into it.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

