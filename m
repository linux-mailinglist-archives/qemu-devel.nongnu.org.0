Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0D2C5520
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 14:19:15 +0100 (CET)
Received: from localhost ([::1]:41544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiHB3-0006JW-Sz
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 08:19:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kiH5M-0004lg-DN
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:13:37 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kiH5I-0006px-HY
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:13:20 -0500
Received: by mail-wm1-x343.google.com with SMTP id a3so2351386wmb.5
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 05:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=sJHNEDoVV36zHQGrYvTXzuDx4cAa/RF291bMid6ANpY=;
 b=a/qu33RPvLz7FeRjbtQn1+qydSeLZI5ob9EyVSlbPddyRf7w/iw7Ng6u5+Kimjyxyb
 Ld63ikVn8Zca4GN6mNuE3p5/m9Ip+LE7T2N3O0ypEyi4NMH8L4iH1xRoFh5ivSB499t1
 zaeY7L7CmqHxTtYSgktiysxjy1tagpv4HDAMSM76y6qCflFs0RxYwH9y+YpPJZsUjULp
 BTOTEMKItFoIs81XrJNIs5qvyaky9wBiF+YftEem8wZmaXOGvPRgjlC14/hPHzWtFkKD
 5zmNFN9mQQ5QNICIYDhl13VHjqN1TBBrL/udCOMYDq7ygPEFzEiUvCvoQV6aX81497eb
 AS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=sJHNEDoVV36zHQGrYvTXzuDx4cAa/RF291bMid6ANpY=;
 b=H3XpigU+87efaOne3GY3xAEagi4e0wQ1u8CzkwJ/KVARFkKrw/jOOgYKDXO0dgcTj5
 CX17j04FBHug+pE7ZXn2UnmC8wnaKBTm9PG6yyFf11y6iWxI+20zUKMESMPlxYzTP+L8
 KlOHfQxfUQO58CBS4fWQIgKRqLIABxShNLA4SWF1NuzN+WkU53etkG6UbUpbiA1iMlnx
 HvP0wm9ym+IkCpDtJrBgcAyD9fyk/pVJ1XvgtNd/zqGkg14QWrJPEzUfdY4pNCqNWAmm
 5cYVq9088P1vwvoEn2kWwYN+huCTBvPRskQKthlNUuTf22sRC0OVxzUA2psv4CjPDxXd
 SRbw==
X-Gm-Message-State: AOAM530kVB5Pc9U1g0RLsPYAy0HkxGk3Eb4A5eQ1ctN6r8fjJSqp3GNu
 NTXTaUWgL4rL9lafFzsq5tUArw==
X-Google-Smtp-Source: ABdhPJzkgvW6wCSHIyCd+c8eh1r2Kn2B0nvBtcBBRVDO4B0iJGhWMzlf6sZpmmzUDtJKNw3KjZ0+WA==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr3297447wma.105.1606396394086; 
 Thu, 26 Nov 2020 05:13:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm9274882wrw.45.2020.11.26.05.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:13:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B27601FF7E;
 Thu, 26 Nov 2020 13:13:10 +0000 (GMT)
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-6-marcandre.lureau@redhat.com>
 <CAFEAcA9+hV2L9qjCj8naNX1GuPgGenE2CLBuKR+LHa415jrmRw@mail.gmail.com>
 <20201126121243.GF1122957@redhat.com>
 <CAFEAcA8QqAq=+UQ2m7ztD7-Qh6y0YJ=qY3koabX7koWi-9b_MA@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 05/13] qemu-plugin.h: remove GCC < 4
In-reply-to: <CAFEAcA8QqAq=+UQ2m7ztD7-Qh6y0YJ=qY3koabX7koWi-9b_MA@mail.gmail.com>
Date: Thu, 26 Nov 2020 13:13:10 +0000
Message-ID: <87h7pcgt21.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 26 Nov 2020 at 12:12, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>> On Thu, Nov 26, 2020 at 11:57:14AM +0000, Peter Maydell wrote:
>> > This is an interesting case, because it's a header intended
>> > for external use (people compiling plugins), not part of
>> > QEMU proper. I don't know whether we want to impose the
>> > same clang/gcc requirements on plugin builders, though it's
>> > probably not a bad idea to do so. Alex ?
>>
>> IIUC, we expect that the plugins are built specifically to go with
>> the QEMU you have built.
>
> No, the point of the plugin interface is that it actually is
> a (constrained) stable ABI with version-querying and checking
> so you don't have to build a plugin against the exact matching
> QEMU version. (But "don't use really ancient gcc" doesn't seem
> like a very major thing to ask of its users.)

Quite. But I agree using a GCC from this decade seems reasonable
especially as the feature has only been in QEMU for a few cycles.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
=20=20=20=20=20=20=20=20=20=20
--=20
Alex Benn=C3=A9e

