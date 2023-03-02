Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD26A87B8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:18:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmYB-0002FJ-Kx; Thu, 02 Mar 2023 12:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXmYA-0002F9-62
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:17:02 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXmY8-0008DX-A3
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:17:01 -0500
Received: by mail-wr1-x429.google.com with SMTP id h14so17264746wru.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 09:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7LFaw1eVIWZZU+0eBB/XZT/xjvDyiFvIR0aCCLaXVY=;
 b=BIMDKn0qcKCOoSW7C103+KBb8ur9wMvRzpHGvzeOyzRrY+Q7JrEWTGr7rKHrstuYxi
 6c9DVEzQReKP7/Avz5rrIS3AT1U8VnrOKntiddWNjbE+UBvLkboCWuXGn8/fWirslTft
 udAMJu48ULjN9wvcpuhcFmpdVicauutLpPFxftBt6ylXWbFeAgiHcjYuVYBRuwU0doR1
 ywthoTsMwFbNH7JxMzPsdtZi+ubTe8VIifGEREeCqZ5bNbtS518eNizXhh9YrUZfM1fi
 vFE5VpachLve+MH2PssjJGriqPUk5zyR6oRlhyay5PEViR2zac67bUq0M8fRg+qEpPRe
 ie7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X7LFaw1eVIWZZU+0eBB/XZT/xjvDyiFvIR0aCCLaXVY=;
 b=XptcShO8A5PKgh+6EkmdPDq6GMgGGHwxhzJxTceA4sPwg0Sr/eKdb5ggCsdMtuK/pD
 R86Tl8zZR1l8RrAU/p8NHxDQJNDct6Cerdrqp0GRnrfnsPWv3UZpPSgEL9TDlAT4C3KC
 O5bw8y0dwOfnsyZWc4XlUObAZIwmK84pW4sUbtoEuro7/LESULAuO0e8Fg3DhWu6G7Ma
 Gy1rSdtXg+E1UD7Swr9FRYhtlyZ1N1gcyszp3oku9LQjFkFG4CpTChD4Mb2OL2Kv9qz0
 anAXxXwRblPXR7KS93jfTPvj7fqCRUniXgDpfPbnahGyyAhDC8D/H0xehU2xr3wfJed3
 I2hw==
X-Gm-Message-State: AO0yUKXul8PsW7IzU+vrWDX2edqypD/2Xwui5E+2lT0K8suqzwhUaFEo
 vjIwh3nJ0+w7UiawF5c5BuVoSA==
X-Google-Smtp-Source: AK7set9phY06rLLBW1inWqiRZp5cp22urB9DULw2idBPNK4nHSoISobki1Cc0+ofOkX5zbStwK6ixg==
X-Received: by 2002:adf:fe8e:0:b0:2c7:1b6d:3356 with SMTP id
 l14-20020adffe8e000000b002c71b6d3356mr7786883wrr.70.1677777418333; 
 Thu, 02 Mar 2023 09:16:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm16012728wrv.10.2023.03.02.09.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 09:16:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86DE61FFB7;
 Thu,  2 Mar 2023 17:16:57 +0000 (GMT)
References: <CA+Yfj7vS0kdkbQGe-HYf7stqf-So-5ny5dioeoC_V0LGvMfVuA@mail.gmail.com>
 <20230302135302.GM7636@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Ayush Singh <ayushdevel1325@gmail.com>, Erik Skultety
 <eskultet@redhat.com>, marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: Re: [GSoC 2023] Introducing Myself
Date: Thu, 02 Mar 2023 17:14:15 +0000
In-reply-to: <20230302135302.GM7636@redhat.com>
Message-ID: <87r0u79ipi.fsf@linaro.org>
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


"Richard W.M. Jones" <rjones@redhat.com> writes:

> On Thu, Mar 02, 2023 at 07:17:46PM +0530, Ayush Singh wrote:
>> Hello Everyone,
>>=20
>> I am Ayush Singh, a 3rd-year university student from the Indian Institut=
e of
>> Technology (Indian School of Mines), Dhanbad, India. This email is just =
to
>>=20
>> I participated and successfully completed my GSoC 2022 Project under Tia=
nocore
>> Organization in Rust, so I am pretty experienced in Rust Language. I am =
also
>> fairly proficient in reading and working with C, although not to the same
>> degree as Rust.
>>=20
>> I use Qemu often for testing and thus would like to contribute to Qemu a=
s a
>> part of GSoC 2023. I have narrowed down the projects to:
>>=20
>> 1.=C2=A0 Rust bindings for libnbd: https://wiki.qemu.org/Google_Summer_o=
f_Code_2023#
>> Rust_bindings_for_libnbd
>> 2.=C2=A0 RDP server: https://wiki.qemu.org/Google_Summer_of_Code_2023#RD=
P_server
>>=20
>> I would just like to confirm if both of the above projects are up for gr=
abs in
>> the upcoming GSoC 2023, and if there are any specific requirements/tasks=
 to
>> complete to apply for either of the projects.
>
> We do have another candidate.  I'm not sure what happens in these
> situations .. Erik?

Project allocations happen through the GSoC process so everyone should
apply and then you interview the prospective candidates and choose the
best one.

> Rich.
>
>> Finally, what is the preferred way of discussions in Qemu community? I d=
id see
>> an IRC channel as well as qemu-discuss mailing list.

For realtime questions (keeping in mind TZ's and working hours) IRC is
the best way. You can connect via matrix as described here:

  https://www.qemu.org/support/

as not everyone has access to a persistent IRC bouncer. Otherwise deeper
technical questions are best handled on qemu-devel where the thread can
be followed by the whole community.

>>=20
>> Yours sincerely
>> Ayush Singh
>>=20
>> Github: https://github.com/Ayush1325
>> GSoC 2022 Project: https://summerofcode.withgoogle.com/archive/2022/proj=
ects/
>> PwQlcngc


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

