Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5452EAB39
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 13:52:08 +0100 (CET)
Received: from localhost ([::1]:49822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwlol-0000fz-Tz
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 07:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwllq-0007dy-1H
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:49:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwllo-0003nB-7R
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 07:49:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id t16so36070075wra.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 04:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FP0U5EPdrMsskPCHLjhyHRTZG9hyRra4jcQQvhQsv7I=;
 b=W/toq8yOqnT1vyp9wspbmvjm5eitMRBslLzyO9sUkCXYkvWEHEUSRXnI3tOmTENngD
 LM+OYxNziYzjRH0NgxMG7jsU/fzRsH9oZSnjVBCeIaZHx8QFNBwMUqolubfrJV7mqIcX
 yiSNOYsASER0mrNR0XgNe8Fzvn3ikdE0kLxyRmoHj9U92oAAZ3Jjtkj9xkIaC/J7Eb6D
 7hRpxvTBAbK/EaPb9ATuoe57jP+LLR9cTbwpnOEezAAYzuQ4lXQGJttkVsbNdIBlILUT
 JifLQWko2g/WjjKAurL/qU5NdeQYqMFs8Y+n57J6s+wJO+q742li0h7rSuHEkuWJ5GIX
 QXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FP0U5EPdrMsskPCHLjhyHRTZG9hyRra4jcQQvhQsv7I=;
 b=k4jL39m+3KVdA5OmGXLzenpL7DPaRPwpkGgJmQORr/3jqBrk04wVZzUqAbQpD+7yOD
 cQ/nhVfAiZOa6BK2xRpW+PeIoRTEe4iip1wFswglEYoWxHSceCjlA6lU6jNMqU8pOxVa
 Kkj4rINiDhFPSp2txZjsJTLlgfMnPijRsnMUSAltppNbof220OqZAbeNEPVTdXXXrWpW
 o6GZcQUhY308RdPQGcSXPCiCv+Rx9FzLwhF5S4HjRoTK7FwbPZJfPKj8lznOt4bW5iU5
 gpXrmImoozJY7pLCgS33UOovveXMN+NeakLulQ9rl4zDxj0IW1gT5B4galDAab3HNMxQ
 v7wg==
X-Gm-Message-State: AOAM530i07WCCvHgBxhRJ/aFRPVm27aFjGo870utB4uMh4juYMzxCrlI
 EezKBKmLEXA9EwzKKNBIA72qtg==
X-Google-Smtp-Source: ABdhPJz30u29gJUJ0KdXB2SB0cXyBi7xtAsq1m58cKrVIAn0zLFMRf9dwzBy4G8fZNFnxXBI1CBH+w==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr84028796wru.197.1609850942772; 
 Tue, 05 Jan 2021 04:49:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g191sm4520263wmg.39.2021.01.05.04.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 04:49:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A610B1FF7E;
 Tue,  5 Jan 2021 12:49:00 +0000 (GMT)
References: <20201213211601.253530-1-f4bug@amsat.org>
 <21650cc2-8e1e-067c-fc89-ec7904dc87eb@redhat.com>
 <5b4bca2e-366a-fd5a-f334-39c0f342e284@amsat.org>
 <c25922ac-6553-1e2e-9c2b-7af2e933c3cd@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] tests/docker: Include 'ccache' in Debian base image
Date: Tue, 05 Jan 2021 12:48:54 +0000
In-reply-to: <c25922ac-6553-1e2e-9c2b-7af2e933c3cd@amsat.org>
Message-ID: <87im8b35xf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Hi,
>
> On 12/14/20 2:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 12/14/20 6:44 AM, Thomas Huth wrote:
>>> On 13/12/2020 22.16, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Include the 'ccache' package to speed up compilation.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>>  tests/docker/dockerfiles/debian10.docker | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/d=
ockerfiles/debian10.docker
>>>> index 73a3caac9cd..9d42b5a4b81 100644
>>>> --- a/tests/docker/dockerfiles/debian10.docker
>>>> +++ b/tests/docker/dockerfiles/debian10.docker
>>>> @@ -20,6 +20,7 @@ RUN apt update && \
>>>>          bc \
>>>>          build-essential \
>>>>          ca-certificates \
>>>> +        ccache \
>>>>          clang \
>>>>          dbus \
>>>>          gdb-multiarch \
>>>
>>> Don't you need some additional setup for this? Like caching the
>>> corresponding directory during CI runs?
>>=20
>> I hadn't looked at CI (too many CI series in fly).
>>=20
>> w.r.t. Docker this is in use since 4 years, see:
>> 324027c24cd ("Makefile: Rules for docker testing")
>> 36ac78e65a0 ("docker: Don't mount ccache db if NOUSER=3D1")
>>=20
>> I suppose we forgot the package when introducing debian10
>> base image in commit d6db2a1cdf6 ("docker: add
>> debian-buster-arm64-cross").
>
> Should I do something else with this patch?

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

