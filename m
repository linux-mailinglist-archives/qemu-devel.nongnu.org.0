Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F56C81D9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:53:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfiAf-0004LW-0Y; Fri, 24 Mar 2023 10:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfiAb-0004LI-AN
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:13:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfi8o-00045W-6N
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:13:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id j24so1965582wrd.0
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679667085;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hxg9+0GSg3lcz+vaEm2BVpTX3h68RjmNqjZBXqCOm2s=;
 b=LAihzbjUnQp4mrIPDzcAMShGaO9/pypg7nCpYBGI7TzQW8QoGVXQGI9GL/BJmB5nOV
 J9P6ujXOuFev2vr4naSuk7PAaMHn2IFLO4lxYBa7XmnygDnI/7Hq4t4KqdJIV6jlklHN
 G6hMqJEWGuTK5LpMtaEsa5Twue6o8Hn8m6xigssPXTM9EiKvT5bOZuHRVbEBuS1s93Km
 A2bo9AUrw3w7RRnxZcFokowtWdYJARdmKKPLbNooBG9g5pKjtoswwSPr4WXm0pZpqk6e
 2eox+fzEojVYMEc7h3VVXHcw9UDojQPGv7LRBKZkzk3HKKnxQjYZ7CCT2phbyNv3eUoB
 6V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679667085;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Hxg9+0GSg3lcz+vaEm2BVpTX3h68RjmNqjZBXqCOm2s=;
 b=JBmNst7j4DVARn1aXf4xCueXOhNAEU2wybShkazQn/bFW0wxvAEdXVWPuEmOLMC6py
 8shdyllBUYjZsSb6+aFfFtsNU6xTUEBX6l+mzRznuF0buSAr/bp7zICJyIOZ4CBIgwvb
 s0fDHtbsfAqZrk4pGcU8XINrPiM5snhkgSR5cb80/R+dEcYaNc0h34GJEkNCa5DwL3Xo
 HnVCr9iZbd1i3NgZsj3M/P/MVinxeper+ZMOk3ZgOEA/kPvk1q345CH0hyc01oug59rv
 NZbgn/YDojQguNygl4XZ+RCToFNkPaN+LRfltuv4yyVJv3kCsY3vkjfPS+6soF8wRlX8
 A98A==
X-Gm-Message-State: AAQBX9eW0zSGP1dBKvU9zhj8ydjhw2d7H6/cHDhcFHUAucaA2sKX/tCJ
 ISM0YpQ9PgxoU/YDkjmw0csHqIpI9ATr8ei2cMQ=
X-Google-Smtp-Source: AKy350YiR5JvtYbZDwHGnYfELdfb/bZy2kwbaBAnS1oNmXwNu11hHVdpEeJKLl9zVMVc6GH0vi7PYw==
X-Received: by 2002:adf:efc7:0:b0:2c5:a38f:ca31 with SMTP id
 i7-20020adfefc7000000b002c5a38fca31mr2168924wrp.7.1679667085126; 
 Fri, 24 Mar 2023 07:11:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d65cb000000b002c55de1c72bsm18469057wrw.62.2023.03.24.07.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 07:11:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 468621FFB7;
 Fri, 24 Mar 2023 14:11:24 +0000 (GMT)
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
Date: Fri, 24 Mar 2023 14:04:45 +0000
In-reply-to: <ZByhueDO9J9MLuSJ@redhat.com>
Message-ID: <87cz4y44tv.fsf@linaro.org>
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
>> Hi
>>=20
>> I want to enter a discussion about changing the default of the style
>> guide.
>>=20
>> There are several reasons for that:
>> - they exist since C99 (i.e. all supported compilers support them)
>> - they eliminate the posibility of an unitialized variable.
>
> Actually they don't do that reliably. In fact, when combined
> with usage of 'goto', they introduce uninitialized variables,
> despite the declaration having an initialization present, and
> thus actively mislead reviewers into thinking their code is
> safe.
>
<snip>
>
>> - (at least for me), declaring the index inside the for make clear
>>   that index is not used outside the for.
>
> I'll admit that declaring loop indexes in the for() is a nice
> bit, but I'm not a fan in general of mixing the declarations
> in the middle of code for projects that use the 'goto cleanup'
> pattern.

I think we could just finesse the rules to allow declaring within the
for() as allowable as start of block. I think more freedom to declare on
first use is only warranted when the compiler will stop you foot gunning
yourself (as it does in Rust).

>> - Current documentation already declares that they are allowed in some
>>   cases.
>> - Lots of places already use them.
>>=20
>> We can change the text to whatever you want, just wondering if it is
>> valib to change the standard.
>>=20
>> Doing a trivial grep through my local qemu messages (around 100k) it
>> shows that some people are complaining that they are not allowed, and
>> other saying that they are used all over the place.
>
> IMHO the status quo is bad because it is actively dangerous when
> combined with goto and we aren't using any compiler warnings to
> help us.
>
> Either we allow it, but use -Wjump-misses-init to prevent mixing
> delayed declarations with gotos, and just avoid this when it triggers
> a false positive.

Has anyone looked to see how much this triggers on the code base as is?

> Or we forbid it, rewrite current cases that use it, and then add
> -Wdeclaration-after-statement to enforce it.
>
>
> IMHO if we are concerned about uninitialized variables then I think
> a better approach is to add -ftrivial-auto-var-init=3Dzero, which will
> make the compiler initialize all variables to 0 if they lack an
> explicit initializer.

Would that make us less likely to find the occasional bug that does fire
when missing inititizers could be random?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

