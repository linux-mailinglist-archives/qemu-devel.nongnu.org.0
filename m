Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A462E2EA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:23:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oviaA-000560-20; Thu, 17 Nov 2022 12:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovia8-00055n-0e
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:21:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oviZy-0005TM-8U
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:21:42 -0500
Received: by mail-wr1-x429.google.com with SMTP id bs21so4959395wrb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PNXrX9IQ2J6FoxDX/SBs8JvSu6l5Q6sx6L2VUSoD5t4=;
 b=oFGbiQ2ZwhSGqWyyFqeL1aGMcJ3Oj92XbBWxYDEjtU5SsBegi7FrdExozCF3h63H+F
 6Lcw0/LsMepWT/Q9Eqo9nIxRziVPYErcNgM6hI6t67oWxekVJrpjkJTjNPoK5bUYBf3t
 +VS7wFmn+DefmPWm2hIc911mrlOUA8DtiYkGBD22hdhcAlJ24gjafGl8sQCyKWHv1HdD
 qcPzOEUXJTdrHwPDPUSf7ZwGXfJ5L/qAbckpSX3txcYp27ZN4oqIuxbU8tKuTcOL6nCZ
 Xo6O/Wc1mQAl43Bu36SsQUPVe3oROyeouuRmgVWJSbbawM2Yiu6l5MRzhWoJsq/Gk6Sv
 XtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PNXrX9IQ2J6FoxDX/SBs8JvSu6l5Q6sx6L2VUSoD5t4=;
 b=WLdk2vWLkYKN3JEvE++Lfj5Bu6tj3ZWIluz6HXKBfYGOBkCj0yXFjVoKQQPcH2/5EU
 c6Zb9OvC8ubxh26YN6AmabBEDRO1KBFnJnYDdThPhg8QwFBcZupBXukAcAWDObxJ14XR
 Nv0fPvQZbcOe8tZz8/QwlfRExsgi8rXb16CFM0nAy1nbUbVyM5nfVgZwWgiR0dSEtX2/
 zXvydBUsmFMqJFVR7RkivT8vep6PVf5nxR/6j8D3lAkEbwA3WCJPNgCiKwyx1DdVULgB
 vfV9V6vEBlDggqxa9r0Uusn4+zB7nvuWFAQvMzn0wjmejA5/e+WluBH/KRaGS1t8wrsX
 dlZg==
X-Gm-Message-State: ANoB5pn/K6GaZtJqQ7r4LmtSFjbHfWwrRURC7SkoTr1wRNUWKQIr0Zsn
 d0o9lWhKNh85O0Qotit1Yyyhuw==
X-Google-Smtp-Source: AA0mqf6zXzazhSFGfUiWu+qUo44XaE4hgXeo0JnFb6TG4IjDjlifMg7fAUogHofZAfMz6JtzdsyzNg==
X-Received: by 2002:a5d:4c83:0:b0:236:7f36:1c05 with SMTP id
 z3-20020a5d4c83000000b002367f361c05mr2031360wrs.269.1668705692349; 
 Thu, 17 Nov 2022 09:21:32 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a7bc854000000b003b476cabf1csm1824336wml.26.2022.11.17.09.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:21:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5BB71FFB7;
 Thu, 17 Nov 2022 17:21:30 +0000 (GMT)
References: <20221116175023.80627-1-berrange@redhat.com>
 <4baeb599-43df-34cd-0ae1-5f2454b7069d@redhat.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] ci: replace x86_64 macos-11 with aarch64 macos-12
Date: Thu, 17 Nov 2022 17:21:08 +0000
In-reply-to: <4baeb599-43df-34cd-0ae1-5f2454b7069d@redhat.com>
Message-ID: <87wn7t7azp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> On 16/11/2022 18.50, Daniel P. Berrang=C3=A9 wrote:
>> The Cirrus CI service has announced the intent to discontinue
>> support for x86_64 macOS CI runners. They already have aarch64
>> runners available and require all projects to switch to these
>> images before Jan 1st 2023. The different architecture is
>> merely determined by the image name requested.
>> For aarch64 they only support macOS 12 onwards. At the same
>> time our support policy only guarantees the most recent 2
>> major versions, so macOS 12 is already technically our min
>> version.
>> https://cirrus-ci.org/blog/2022/11/08/sunsetting-intel-macos-instances/
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> ---
>>   .gitlab-ci.d/cirrus.yml                              | 12 ++++++------
>>   .gitlab-ci.d/cirrus/{macos-11.vars =3D> macos-12.vars} | 12 ++++++----=
--
>>   tests/lcitool/libvirt-ci                             |  2 +-
>>   tests/lcitool/refresh                                |  2 +-
>>   4 files changed, 14 insertions(+), 14 deletions(-)
>>   rename .gitlab-ci.d/cirrus/{macos-11.vars =3D> macos-12.vars} (74%)
>
> Works for me:
>
> https://gitlab.com/thuth/qemu/-/jobs/3336969845
>
> Tested-by: Thomas Huth <thuth@redhat.com>
>
> I can pick this up for my next pull request.

I'm rolling a series now so I've queued to for-7.2/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e

