Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05776B4FFE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:21:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pahLk-0000bN-9Q; Fri, 10 Mar 2023 13:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pahLh-0000b6-Uq
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:20:13 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pahLe-000825-O8
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:20:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id p16so3989332wmq.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678472408;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARpEER3rcq7nJPk1aUfOpdpd+Tzob1kL5i2bOHhiBlc=;
 b=pbMEtGou/3xP3nRzC66IDcdl6dqjcbfAzP+6UxnlqWKZ9KF6X9oxW4zoil/dt2NB57
 pB1nO8nW9us6EXAkvadYxzJv8UM0GxFpWCWvPDgYV9soCxuQvczfaO0x27xIdURm5BQ9
 tpY7J4vtC0bjnI8kJ7f6MamJzRReXl3vyPtjMSkx9JXjipLltYiqNSwTfKrHQY9TY0iY
 zg0A0R6DiKbQ48SOUE/AbdHjSt+wc20OoI3z9PVmM13ZfHd+tU15diwxKMIzqGAm0T6c
 TABP0gCQwXNDG3twvYhuCi0wOnpFbiJcgUnAR9AkQR9tx7FZDM6t+HyQLw48w8A05oQP
 hNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678472408;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ARpEER3rcq7nJPk1aUfOpdpd+Tzob1kL5i2bOHhiBlc=;
 b=U0ADW/KqU0W7skg/wewonrDf1+89NLM16dgySg98jNYT7KYUVopPd8bDfj1+NdeLd7
 ppYdpkPmdCKgSz6+LsYyUy+hCY5HsV6XG74T8zC3s9MVimOnaTIsEeLvxd1qwkApHYAI
 I9qguLjvPYnkSn3qAW8ztL36zXtH2yoKEAPTUK0o+I+5U1uetS4Bdtsx2p0/Mjn5SydA
 GxsVdBzte4inua+CCLwloYIIoNpLxn44ML5GkclosMCNyaUGleQYPgCO1diU4XSpq/il
 6ItfKGS1DRFfQKjaWbj+4VF7Gps6SzpKV32AlrIR2wO9koS/7UJl0kIwvmwHl6VHAunK
 TV9A==
X-Gm-Message-State: AO0yUKXAFIk1gjrWIwUnJzlygOLQ4sxA5g3Eqe/2/EUsX6NB18/V8A8R
 o9UaCwFuwyMxkSoL0wkoAnns0w==
X-Google-Smtp-Source: AK7set9mQjM67NS999J7iZep86vlBlFEPWOP5/Bcpfs4XHX4LCY7XupseGWOpxKtXIheg+fyjq7xgQ==
X-Received: by 2002:a05:600c:5113:b0:3ea:f05b:50cc with SMTP id
 o19-20020a05600c511300b003eaf05b50ccmr3742935wms.8.1678472407839; 
 Fri, 10 Mar 2023 10:20:07 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b002c5694aef92sm436473wrp.21.2023.03.10.10.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:20:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20B8C1FFB7;
 Fri, 10 Mar 2023 18:20:07 +0000 (GMT)
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, David
 Hildenbrand <david@redhat.com>, Wainer dos  Santos Moschetta
 <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>, Cleber  Rosa <crosa@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, gdb <gdb@gnu.org>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, Omair Javaid <omair.javaid@linaro.org>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
Date: Fri, 10 Mar 2023 18:14:12 +0000
In-reply-to: <87wn3ocwqz.fsf@suse.de>
Message-ID: <87sfeclb8o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


(adding some more gdb types to CC)

Fabiano Rosas <farosas@suse.de> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>
>>> You need a very new gdb to be able to run with pauth support otherwise
>>> your likely to hit asserts and aborts. Disable pauth for now until we
>>> can properly probe support in gdb.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> If it makes gdb fall over, then shouldn't we be disabling
>> the pauth gdbstub stuff entirely ? Otherwise even if our
>> tests are fine our users will not be...
>>
>
> Have you seem my message on IRC about changing the feature name in the
> XML? I think the issue is that we're putting the .xml in a "namespace"
> where GDB expects to only find stuff which it has code to
> support. Changing from "org.gnu.gdb.aarch64.pauth" to
> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
> registers just fine.

That would work, although I would prefer to probe support so we can use
the official namespace. We went through something similar with SVE
until:

  797920b952 (target/arm: use official org.gnu.gdb.aarch64.sve layout for r=
egisters)

which required:

  b1863ccc95 (configure: gate our use of GDB to 8.3.1 or above)

Since then we've introduced:

 ./scripts/probe-gdb-support.py

which given the runes to check for pauth support in gdb could expose a
symbol and we get the best of both worlds. Of course if this keeps
happening we could throw up our hands and just use custom XML for all
the extra register sets.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

