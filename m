Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DFE6C8427
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 19:01:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfliO-0005JR-Jg; Fri, 24 Mar 2023 14:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfliM-0005J8-Ah
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:00:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfliK-0004su-N9
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:00:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d17so2631072wrb.11
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 11:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679680830;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o56HeilqBHfL5pIKoZfl2z2Y07duMylFoFDNJ2Np/sc=;
 b=XIMTJaHHtQPRJPUBf0QuFm3+MtFAC6Me3RBKPhGt1QeoXgcjt15RHA+yk6GHonakyh
 N14hzY2tMFgQZMwAev5QO3p5eoq3Ti37gczHO2hUu4NDKZQQe3EZWmAaJBLj/S0IijWa
 ZOL+OoCkxXdx1a4TDhyACUoNcDedRSn2LjCH+MswvEktAVPX2xz+fYvhog0IQ9OYo+2o
 hyWfzyYdgL0NvNVCwlAtMbA7MsBwtxO+8iboOYHL35u0Eak37W7JEYjyUSgLR9VK9iOH
 cdnwxpBOThm/tIITZVQ8v/AhQHO+ImTShu9taJ7E64YgK4K2NibaF6rEFmnnl9yv5NSA
 6xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679680830;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o56HeilqBHfL5pIKoZfl2z2Y07duMylFoFDNJ2Np/sc=;
 b=wC5JsM1E8h2lAFiREpManyufvweCyTmOE22+aIQcCi267PlaEbEdXbdsyvz/GB6zKx
 xS6OFJagOZoZ0A+KRAr5yRuk9O+0/B6q2kDFEclcNlY7viFBL5mrlu6NX88Q9OSlKm6I
 HMRRlsx9VNypk8SzH32I7v8Eb77sUSPeVZoXg+7M/UhsdVeAQNlVu5CYEw0TQWbLD3Uf
 /jq3stqHqlT/20n/HjGK8yUQ5QapKetjMY/wDEEZWpONdRg158mEwwSuL2RZXHJfIOYE
 yZfXUnWvE081ewfi2XGrJocRESJWuLI0hMChU8IDjbhWLZU1BHihnjXk9WD1R39AQPUe
 UASw==
X-Gm-Message-State: AAQBX9fkQYcGHYsYTDCNE6T2orNB+2QFoeggaq+9WE4msXEAv8WlVpZz
 je2adibUAaXOqJz9UIA/BUlg0p6Fm8p/Wrp6VdA=
X-Google-Smtp-Source: AKy350ZpYc2mxffqK20L+rlPuCZMWP4AtJhZl0CMWjNXkPBc68niuyLexYmY82IDTJCYtaydEgt9CA==
X-Received: by 2002:adf:e288:0:b0:2ce:a93d:882d with SMTP id
 v8-20020adfe288000000b002cea93d882dmr3059717wri.11.1679680830653; 
 Fri, 24 Mar 2023 11:00:30 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b002d64fcb362dsm13598137wrn.111.2023.03.24.11.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 11:00:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC2261FFB7;
 Fri, 24 Mar 2023 18:00:29 +0000 (GMT)
References: <20230214160738.88614-1-quintela@redhat.com>
 <ZByhueDO9J9MLuSJ@redhat.com> <87pm8ykq09.fsf@secure.mitica>
User-agent: mu4e 1.9.22; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: quintela@redhat.com
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
Date: Fri, 24 Mar 2023 17:56:46 +0000
In-reply-to: <87pm8ykq09.fsf@secure.mitica>
Message-ID: <87zg822fnm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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


Juan Quintela <quintela@redhat.com> writes:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
>>> Hi
>>>=20
>>> I want to enter a discussion about changing the default of the style
>>> guide.
>>>=20
>>> There are several reasons for that:
>>> - they exist since C99 (i.e. all supported compilers support them)
>>> - they eliminate the posibility of an unitialized variable.
>>
>> Actually they don't do that reliably. In fact, when combined
>> with usage of 'goto', they introduce uninitialized variables,
>> despite the declaration having an initialization present, and
>> thus actively mislead reviewers into thinking their code is
>> safe.
>
> Wait a minute.
> If you use goto, you are already in special rules.
>
> And don't get confused, I fully agree when using goto for two reasons:
> - performance
>   if you show that the code is x% faster when using goto, it is
>   justified.  It is even better if you send a bug report to gcc/clang,
>   but I will not opose that use.

I await a clear example in the context of QEMU - there is almost always
a better way to structure things.

> - code clearity
>   Some code (basically error paths) are clearer with goto that without
>   them.

Now we have g_auto* and lock guards we should encourage their use. goto
error_path is a relic of a simpler time ;-)

<snip>
>> IMHO if we are concerned about uninitialized variables then I think
>> a better approach is to add -ftrivial-auto-var-init=3Dzero, which will
>> make the compiler initialize all variables to 0 if they lack an
>> explicit initializer.=20
>
> I think this is a bad idea.
> If we want to "catch" unitialized variables, using something like:
>
> -ftrivial-auto-var-init=3Dpattern sounds much saner.
>
> Obviously gcc is missing
>
> -ftrivial-auto-var-init=3D42

I think we could at least eat the runtime cost of
-ftrvial-auto-var-init=3D0xDEADBEEF for our --enable-debug builds.

>
> But well, no project is perfect.
>
> Later, Juan.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

