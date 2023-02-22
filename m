Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E821569F5CF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 14:39:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUpLJ-00029d-Ic; Wed, 22 Feb 2023 08:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUpLE-00029H-Ii
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:39:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUpLC-00067d-RX
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 08:39:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id p8so7882687wrt.12
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 05:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEQtF3safae3+1s9H+6M1cB5EIZCXqjy+l54lB0sxUY=;
 b=jnYfTkxxUbP3LiqQmVSW4hTc0izzzhu8fGtQB+RNOZjYWs7Q9jml3fJq8R+Vj05JOP
 MwlGoPtsvHhMwBsO/OEWVWpfLuD9TiTTyOcTox4V1pqRfFF1al4u/F6PqWAgqgT6rM2l
 wHnOA9pU1uZviHbh6/paGoPoyvMO/64ZCLwmWU+q3E7YT5SeC2qbeAx+WRiaOh1QxII9
 YCHojN+21BSF4WqUtafXcUEvB+iANSo1Ho1T+0/GraR//J2hevkR1YkXphQKZ3BYVSsL
 5pG1rxROgZQJM9nZvfjXjM3oOYe5J8HVxsVc9nI7fg5ik/CJaBFs9hyxQlCrjE4S/tp2
 iHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jEQtF3safae3+1s9H+6M1cB5EIZCXqjy+l54lB0sxUY=;
 b=N1+h8oH1EPUlngZV4WOS4h2QgARK3Q2KgIeWoUkOdQNc0v1BLn5nr+yadG6MsnG7r1
 OZjQ6AbR6KaM6zOsB1+b950lliM7ptBNXTe9rjMMuH6CtP/L+gdeOiMZaZAKO/jCvrqN
 +AQLiDFLiUyPaPeVZvvxGUDY63jDb6NuiV0VKfurTcRrmR1Pfv/3tlSEXSM0cFUuj7Am
 oUzSnax2/ZADc7RBEsIlcdbmDL0Iibj4vMZN0SWujSi5sPqLqZd9C4zZZMU8m8UZAJ1s
 tAv3pSb+dDqD90PBN5vwVLoXLDdj8tUnRsjPsPrIJZe1a9yca+8DUvC8P6eJGsgQlTYj
 Yz1Q==
X-Gm-Message-State: AO0yUKVY38eHf/1JQPmC2TE/5Zx9EwmPajYLlEEoPN5d6flUMf6LPeL6
 fNHVx2vjyzyfWjt2jqXZDPvJ3g==
X-Google-Smtp-Source: AK7set9F+vQ8iUOF/BH8H42lUReYTQ/PTCYetNexb1/Dia8I8pjo9XZl2baAKo0UhkZQJHa5U2SOFg==
X-Received: by 2002:adf:eec6:0:b0:2c3:e5e6:f0d8 with SMTP id
 a6-20020adfeec6000000b002c3e5e6f0d8mr7335831wrp.11.1677073165020; 
 Wed, 22 Feb 2023 05:39:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a8-20020adfed08000000b002c55cdb1de5sm7126146wro.116.2023.02.22.05.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 05:39:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A6C01FFB7;
 Wed, 22 Feb 2023 13:39:24 +0000 (GMT)
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <45EE5F9E-B9B8-4DA4-809E-A95FC618E7BE@gmail.com>
 <Y/Xlve3HWhh4QD+u@redhat.com> <Y/YKaEgSxUa1Hsp0@dropje.13thmonkey.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Reinoud Zandijk <reinoud@NetBSD.org>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Bernhard
 Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, libvir-list@redhat.com, Paolo Bonzini
 <pbonzini@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ryo
 ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>, Stefan Weil
 <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Date: Wed, 22 Feb 2023 13:37:54 +0000
In-reply-to: <Y/YKaEgSxUa1Hsp0@dropje.13thmonkey.org>
Message-ID: <87wn49q0oj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Reinoud Zandijk <reinoud@NetBSD.org> writes:

> On Wed, Feb 22, 2023 at 09:51:57AM +0000, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Feb 22, 2023 at 09:11:13AM +0000, Bernhard Beschow wrote:
>> > Are there any plans or ideas to support 128 bit architectures
>> > such as CHERI in the future? There is already a QEMU fork
>> > implementing CHERI for RISC V [1]. Also ARM has developed an
>> > experimental hardware implementation of CHERI within the Morello
>> > project where Linaro is involved as well, although the QEMU
>> > implementation is performed by the University of Cambridge [2].
>>=20
>> If 128 bit hardware exists and has real world non-toy usage,
>> then a request to support it in QEMU is essentially inevitable.
>>=20
>> > I'm asking because once we deeply bake in the assumption that
>> > host size >=3D guest size then adding such architectures will
>> > become much harder.
>>=20
>> Yep, that is a risk.
>
> I can second that. Better keep it in the code and deal with it. Maybe tho=
se
> specific parts can be implemented in such a way that it can easily become=
 a
> noop on host size >=3D guest size.

AIUI these don't expose bigger addresses or natural atomic sizes which
is where things get tricky for the TCG. All the extra bits are used for
authentication or permission checks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

