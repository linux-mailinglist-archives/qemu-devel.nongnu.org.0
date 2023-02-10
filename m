Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9069235C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWKC-00069e-QZ; Fri, 10 Feb 2023 11:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWKA-00069G-Ky
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:32:34 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQWK8-0007JO-Ot
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:32:34 -0500
Received: by mail-pl1-x633.google.com with SMTP id z1so7004494plg.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676046751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYzOTT1coovdrUdnwjxpTAbnUp2yQRlpY32VWDjXAu4=;
 b=RgCDACx7F+GXJ+/ERX2NfDnZjdqW6LE7PB4ZfDViYoHypxkc2AnERUt4bgwmZ8Rq9U
 cObcMzp6B2aQEwTHLwLLuGcE55AzfMRbvHdW80yz6/jFg+Yw3Krb/z2owfhuOxDaE/tw
 Mn7dcF2TEKf+Ilct7Oiog0y4wEyH0Uc1Cn6ry9Gs9bFEpyRtHIxBcHw5ol93glZwGgL2
 dEw++cApXp5b6bTO6WJdXDd5wehSSL7cgzzXsPMpkooH0/vbCYBDfA3U6SnfHlmq4B+B
 qftGBEhZbhirwHvPoGYCsjtyIsRetyUdAGZiAUZGKP9kU7OadjsOXMDRJoxQLMxKfPdR
 aBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676046751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYzOTT1coovdrUdnwjxpTAbnUp2yQRlpY32VWDjXAu4=;
 b=jaRiuORZGKnSq+gKUxGEsr5jovoWQfNUFSShaI0Ei68Soa5TsQWJx2Wc7H8a49A45F
 YPz+IcBBp6VGpMrLPIBiPVqB/Tx6YPnwZJwCCnIbHAW8U9ITHbCJCZHBjfc7rhFKy8uo
 Ar5+DHXuJE7hDpjXKrhhFV6UuqCjVSCISpDK8qb6aNROA+bulBLeflSkPHLXCBGbUYEV
 ret6U1GC72PnACqHWvKEr7fNehlzGTlxnOIqp7qROgsavNRO8lL+UEbJwpKvCNNoQ2NG
 Kto0eqPzL/g5v4yicUFXDnkK2hQY0TCMgcaNOEYoGML8TxZYdblLxLXVk3t4m8Ixz4Xj
 LRHg==
X-Gm-Message-State: AO0yUKXY1hndcOgHHrCtxj5PH6Rx4elAEqxGJvZwNSf+IJDGdLjXp1jy
 2Xf6oYEEPDElihBglnALJZHYH3Gihkhf9AFQNZocvQ==
X-Google-Smtp-Source: AK7set+8SbskkesotySTSAo5hbqRtwgqx7PaSt6bJrU3tPVDG9aVCtL/JT15h5FWwFLrf+Lb60V1Pb8e5sXK02ScPyM=
X-Received: by 2002:a17:902:9a87:b0:199:5374:b831 with SMTP id
 w7-20020a1709029a8700b001995374b831mr2222400plp.11.1676046751134; Fri, 10 Feb
 2023 08:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
In-Reply-To: <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:32:19 +0000
Message-ID: <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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

On Fri, 10 Feb 2023 at 16:01, John Snow <jsnow@redhat.com> wrote:
> On Fri, Feb 10, 2023, 5:41 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>> On Fri, 10 Feb 2023 at 00:31, John Snow <jsnow@redhat.com> wrote:
>> This confuses me. We work fine with Python 3.6 today.
>
>
> That won't last - Many tools such as mypy, pylint and flake8 which I use =
to manage our python codebase have been dropping support for 3.6 and I've h=
ad to implement an increasing number of workarounds to help keep it possibl=
e to test 3.6 via CI while also ensuring our newest platforms work as dev e=
nvironments.

Something somewhere seems kind of out-of-sync here. Either:
 * Python is deprecating old versions too quickly and
   dropping support for them too fast
 * CentOS is retaining old versions of Python when it needs to
   ship newer ones
 * Our policy for what distros we support is overly lax
   and causing us to try to support ancient platforms
   that we shouldn't be trying to support

because "use the system version of foo" should not be a big
deal -- it's not like we're trying to support decades-old
hosts here: Centos 8 was released in 2019, which is less than
five years ago.

> The argument I'm making is:
>
> - CentOS 8 is a supported build platform
> - All platforms *do* have a Python modern enough to allow us to drop 3.6
> - CentOS's repo version of sphinx is hardcoded to use the older 3.6, thou=
gh
> - You expressed a preference to me in the past to NOT use a pip installed=
 version of sphinx in preference to the system version in "configure"
> - It's still possible to build docs on CentOS 8 after this patchset, you =
just need a pip version.
> - We've used the justification that our build platform promise does not n=
ecessarily extend to docs and tests in the past.
> - So just skip docs building for CentOS 8, only in the CI.
>
> If you believe docs in CI for CentOS 8 is a hard deal breaker, then I wan=
t to go back to discussing the possibility of using sphinx versions from pi=
p.

If Python 3.6 is EOL, shouldn't CentOS have shipped an updated
version of Sphinx to go with their updated Python ?

I'm not super-happy about dropping the docs build requirement,
but I guess it's probably the least-worst choice.

thanks
-- PMM

