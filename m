Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B14846EA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 18:22:51 +0100 (CET)
Received: from localhost ([::1]:45592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4nWM-0006Od-NO
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 12:22:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4nV7-0005gF-8a
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:21:33 -0500
Received: from [2a00:1450:4864:20::334] (port=42732
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4nV4-0001dK-Hx
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:21:32 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso1813658wme.1
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 09:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=B8rB0yvugwItT4uEo73x7mua29dKRgkam3dq0SSBwaM=;
 b=LiFH3qqjBWybTqq/4PtpyhUYiVjtlv4F01yhA2CLIrLc4uwTBDdT7U7v4MA/aBslAn
 tlZcyezk4xZApjyiTkCRb6FzsTXKuXLwWcPGNL8PeRKPp2NlklhXdBLDGYugWdf2XUsN
 Dphk9DZNHnm3SsohJ3YyI7w+73g0jwzRvAckALyCBpkJUeuLfTdaevfFfhAGmeQGecGf
 zA5SjuNxynP+IEn0nS9NKzWodxvjJ/0zY+WwVHaAy38bN4PxWhGgZtk4HUyc9C88fjFr
 20EieHEx/9u9KN/eCix7GASAXGBh5jFj4qE/VIQTKwdF91Uf2VvIhhQRzJSd+8TUPPtc
 MIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=B8rB0yvugwItT4uEo73x7mua29dKRgkam3dq0SSBwaM=;
 b=kjy1pKzsjEqgQ2PSXITHBaN5E2pAQSQjq6q1tEJP+KWvH5cIoZFDYWbPh82RPq5K5d
 Y0nXMf1ai67IjDfT5aRcelPQ6hqZpPg4nETYsQtAtNRbvTcJAOQ1cbNrReku0ZtQFUAM
 82BtK/ThjwwuI+LJ6w//R3L8kJoqFo00bkxj0IwcM6OZXBmkI/CkoLzkn2juRc/fOaUj
 0u8u9kY5PPsSYWaO1A9nRJMAR+AAJ3MlROrVHwEnrrrXVeL0qo5yhHCUzAQpFwEbKEr9
 GY7airvaeQ6FJFUwIkoJMKKIjlIuoVAWZOSvXzTwxY33/OW1MEgU50EWFmGrjHAVy75J
 cZpg==
X-Gm-Message-State: AOAM533+Y1fJk9i6xMIWG40S1xlpwHrRwKffmzsvmAU1J2a0l81pIaHt
 o/UCr+MFDFJlZGbfl6GZSBXjTQ==
X-Google-Smtp-Source: ABdhPJxQlwOzjzdS4wnGQuJBkjxBjDUKwNQHyGu+tUOlSliGWeGIkHBJK8Eyc+fRM5uDBo8pLcNWTQ==
X-Received: by 2002:a7b:c0ce:: with SMTP id s14mr43407728wmh.135.1641316888635; 
 Tue, 04 Jan 2022 09:21:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n12sm31177500wmq.30.2022.01.04.09.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 09:21:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 768651FFB7;
 Tue,  4 Jan 2022 17:21:26 +0000 (GMT)
References: <20211127201846.64187-1-imp@bsdimp.com>
 <CANCZdfpUYJZHfSZCZrk05U3K=gUM8gudFDEHjm3xhZU5bX0ztw@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH for 7.0 0/5] bsd-user-smoke: A simple smoke test for
 bsd-user
Date: Tue, 04 Jan 2022 17:20:24 +0000
In-reply-to: <CANCZdfpUYJZHfSZCZrk05U3K=gUM8gudFDEHjm3xhZU5bX0ztw@mail.gmail.com>
Message-ID: <87k0ffl8mh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gleb Popov <arrowd@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Math?= =?utf-8?Q?ieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Konrad Witaszczyk <def@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Warner Losh <imp@bsdimp.com> writes:

> PING!
>
> If anybody (especially the BSD reviewers) could look at these, that would=
 be great!
>
> It's been suggested I rename bsd-user-smoke to just be bsd-user and we pu=
t our tests there until we can switch to the more generic tcg
> tests, so I'll do that and resend in a few days.

That seems reasonable. I'm curious how much of check-tcg runs on BSD at
the moment?

>
> Warner
>
> On Sat, Nov 27, 2021 at 1:19 PM Warner Losh <imp@bsdimp.com> wrote:
>
>  This series adds a number of simple binaries that FreeBSD's clang can bu=
ild on
>  any system. I've kept it simple so that there's no extra binaries that n=
eed to
>  be installed. Given the current state of bsd-user in the project's repo,=
 this
>  likely is as extensive a set of tests that should be done right now. We =
can load
>  static binaries only (so these are static binaries) and hello world is t=
he
>  canonical test. I have binaries for all the supported FreeBSD targets, b=
ut have
>  included only the ones that are in upstream (or in review) at this time.
>
>  In the future, I'll integreate with the tcg tests when there's more in u=
pstream
>  they can test.  Since that requires putting together FreeBSD sysroots fo=
r all
>  the supported architectures for multiple versions, I'm going to delay th=
at for a
>  while. I'll also integrate FreeBSD's 5k system tests when we're much fur=
ther
>  along with the upstreaming.
>
>  The purpose of this is to give others doing changes in this area a stand=
ardized
>  way to ensure their changes don't fundamentally break bsd-user. This app=
roach
>  will work for all setups that do a 'make check' to do their testing.
>
>  Based-on: 20211108035136.43687-1-imp@bsdimp.com
>
>  Warner Losh (5):
>    h.armv7: Simple hello-world test for armv7
>    h.i386: Simple hello-world test for i386
>    h.amd64: Simple hello-world test for x86_64
>    smoke-bsd-user: A test script to run all the FreeBSD binaries
>    bsd-user-smoke: Add to build
>
>   tests/bsd-user-smoke/h.amd64.S      | 28 +++++++++++++++++++++
>   tests/bsd-user-smoke/h.armv7.S      | 37 +++++++++++++++++++++++++++
>   tests/bsd-user-smoke/h.i386.S       | 39 +++++++++++++++++++++++++++++
>   tests/bsd-user-smoke/meson.build    | 31 +++++++++++++++++++++++
>   tests/bsd-user-smoke/smoke-bsd-user | 22 ++++++++++++++++
>   tests/meson.build                   |  1 +
>   6 files changed, 158 insertions(+)
>   create mode 100644 tests/bsd-user-smoke/h.amd64.S
>   create mode 100644 tests/bsd-user-smoke/h.armv7.S
>   create mode 100644 tests/bsd-user-smoke/h.i386.S
>   create mode 100644 tests/bsd-user-smoke/meson.build
>   create mode 100644 tests/bsd-user-smoke/smoke-bsd-user
>
>  --=20
>  2.33.0


--=20
Alex Benn=C3=A9e

