Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA1C509CB3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:48:30 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhTQK-0001fn-Mp
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhTMq-0000Bj-IO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:44:53 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhTMj-0003QO-N4
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 05:44:47 -0400
Received: by mail-ej1-x62d.google.com with SMTP id lc2so8797554ejb.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 02:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vJlVWZZ8rLX+QcmYDXfgnUUJC8YEGiYib38TruGdagg=;
 b=i/noyvDZyiHOdGhwQtmuQQMIMvm2PGhFHNu8TvhftQy6PCX4oEyFewgOe8vcB8D0ba
 D5DLzwlyMJX6Tx8OCzPDvUFEivyLoyUqFyYQXPnL1iKsgB8xd3okW8JgSU6VuL8ypXxJ
 NaBOVY/jAS9rb2bIofZBGu3+v1UQ5RRFqn5DF/dinCQRkrupzG8kdNf89XKGMwQQbu6L
 4KOLFOivFVzZKvHR2lDItTC828VkdbSxg6vF7zTC+juVsktuOCS2XLu5vGCErIwaMezd
 ZKb4s3K/3Y9e0CqTDtQfx32kzF2FyN05caNBVXFYhWc9oEh6hLT6j0hiLiUZiredj2W7
 5Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vJlVWZZ8rLX+QcmYDXfgnUUJC8YEGiYib38TruGdagg=;
 b=RLR2K2lUcEOE1s809QGmzZQp4bobwutbpLXBhHr/cBU0CIOBpFS1b6Pu2BsX17eSLx
 JzbWc2DKdr4zKJA1/M7co44l3xb8HcXHvDk+gdsMuSBbvX2DslVQoAyCFKVhuFCNYLRi
 kh2blfseVDdvIWbPz67Rt0lDD2vgUre01tDN5DVXiVJu1nibmjZ0NwhtXqjHkTkYD04n
 /uOQPxvXfcH+84W4RbUEURGGiHsw+GtjSCtygSkyFFw1dc6Zf1hAWMHfH8SQup0EwEMz
 4pB5EdFwhW4wgL4ScapbJUkHKrPCI12FP1Bzj1+utwyTOj5EHEXSRBfGE9mW05xAV/h0
 mzmQ==
X-Gm-Message-State: AOAM533BaMjEtN5w8j68AhYaInIJy083p/QCcaMXD1napoU0w1gQIT4s
 rze7vl8Xbc3pT0ocWZtC0wGJrQ==
X-Google-Smtp-Source: ABdhPJxJDiTqG1ZBAnClePDhHkZ40Qw6/mI9Ie8H6WEsC0XISSkXwnOfn5cdHZL5JihqhjJu5D8hYw==
X-Received: by 2002:a17:906:94d6:b0:6e8:d608:c960 with SMTP id
 d22-20020a17090694d600b006e8d608c960mr22477979ejy.96.1650534284148; 
 Thu, 21 Apr 2022 02:44:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm11440745edt.70.2022.04.21.02.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 02:44:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03AFD1FFB7;
 Thu, 21 Apr 2022 10:44:42 +0100 (BST)
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-3-leandro.lupori@eldorado.org.br>
 <CAFEAcA854-k-c5ZAbb=m2LE_ogi2Gf-3idOxOc37zN844mKyAA@mail.gmail.com>
 <962f7ef4-7dcc-fb5d-5e55-90eb3ba65e47@linaro.org>
 <CAFEAcA9HtPAydeC+C5fbCQCFxjhnV9_tbncRFsH51Mf2MeHQyw@mail.gmail.com>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v3 2/5] ppc64: Fix semihosting on ppc64le
Date: Thu, 21 Apr 2022 10:43:25 +0100
In-reply-to: <CAFEAcA9HtPAydeC+C5fbCQCFxjhnV9_tbncRFsH51Mf2MeHQyw@mail.gmail.com>
Message-ID: <87r15qvkhi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 20 Apr 2022 at 20:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 4/20/22 12:42, Peter Maydell wrote:
>> > On Mon, 18 Apr 2022 at 20:19, Leandro Lupori
>> > <leandro.lupori@eldorado.org.br> wrote:
>> >>
>> >> PPC64 CPUs can change its endian dynamically, so semihosting code
>> >> must check its MSR at run time to determine if byte swapping is
>> >> needed.
>> >
>> > Arm CPUs also change endianness dynamically, so why is this
>> > change PPC-specific ?
>>
>> I'm reasonably certain that we simply don't test armbe or aarch64_be sem=
ihosting.  Leandro
>> found this because qemu-system-ppc64 defaults to BE and qemu-system-aarc=
h64 defaults to LE.
>
> Right, so if there's an existing bug here on arm we should fix that,
> and that probably means that the abstraction split between
> "arch-specific thing" and "non-arch-specific code" is different
> from "PPC just overrides the entire swap function".

I think the helper function cpu_virtio_is_big_endian is really just a
proxy for the data endianess mode of the guest. Perhaps it could be
re-named and then used by the semihosting code?

--=20
Alex Benn=C3=A9e

