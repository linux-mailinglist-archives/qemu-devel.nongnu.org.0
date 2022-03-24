Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25CD4E61D0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 11:34:34 +0100 (CET)
Received: from localhost ([::1]:36150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXKnZ-0001YD-HQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 06:34:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXKmV-0000rO-8p
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:33:27 -0400
Received: from [2a00:1450:4864:20::631] (port=38724
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXKmT-0004KT-G0
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:33:26 -0400
Received: by mail-ej1-x631.google.com with SMTP id r13so8227968ejd.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 03:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=s9Vz/jqonCk+mtpj2Crv26JYFjKQXeIrY1foRlaHIuE=;
 b=XfYFtkYQZQcpTq1j2dmN/lBsF78VeZy8NG7wtiB2mw15OKK2HyyGalICna2SOdcsuJ
 oXzK/VDme4RUkNA4xSpdiqAAW6Wukzni8meSktkM9mKf8vR5+I+J3gz++VAOhFEAJWTM
 khQkoSI1JGXmgNvDyuZWOAlRTYmwp8EizvOmIE+alczxuQRcBwCHCe/Qd2nldMr79Ygj
 HLVxNQacVTXlOQMDsAwGqEVYxd1AVvL8B66ytbLZsHzUe6qyTPVpf+x4Sp2Cv0HWdMr7
 3OdHvxcLUdCnhTDJes3CNKbj+MI6VmcVBnJQNWrud7a52YLXGi5SEfqHJIV0nXC71HbU
 OTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=s9Vz/jqonCk+mtpj2Crv26JYFjKQXeIrY1foRlaHIuE=;
 b=v1tOrG40jU9Lh7Ba0Svq4E6JbDwnXfa+2Tl0OE3Lj44VY0woWIQtJEHWUy+nQwmD7H
 zLWTQmC+EjH7C5z7xEgDogvUdw1Xf84GT7kBpf6FcnQWrEl+VC/c3plYaagnYjchUwYK
 nclE2RTL/z8ULTYu+CaHiL68FQHpAKl4Y8FIkyOJSMQHKBwpJyxssbpGAl3vYpdwoksw
 NJBr4LDGACIZ45N69M5ROW0HorlzHuo22Ok97HC3y8a0K9nwPRKzMEMBm8H1xrGH6vq1
 mabYi/p1HZ2ExPnhDQKGLQNX6Xi2glopXbKBWhcPzdpJG7OBPvC5fVgRjP90afmJQ2vI
 mHvg==
X-Gm-Message-State: AOAM533o6w3Cz5ssKm0HkkqM3gs5iy1KIcptTN0gkAe2F4tpARnZwBoN
 F/uzZTn3MTr3UGU1fET7JbAzWg==
X-Google-Smtp-Source: ABdhPJzQli7JLN+7+41Z76S1BfddpZ1Dw4qCGpbxGKOxNJ1oIUT62DmEs93K1X8jwrRRI1ZIWC274Q==
X-Received: by 2002:a17:907:1ca3:b0:6e0:5a9:37a1 with SMTP id
 nb35-20020a1709071ca300b006e005a937a1mr4895072ejc.651.1648118003692; 
 Thu, 24 Mar 2022 03:33:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a056402139900b0041904036ab1sm1230270edv.5.2022.03.24.03.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 03:33:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3E021FFB7;
 Thu, 24 Mar 2022 10:33:21 +0000 (GMT)
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
 <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
Date: Thu, 24 Mar 2022 10:27:54 +0000
In-reply-to: <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
Message-ID: <87wngj3aj2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> On Tue, Mar 22, 2022 at 11:56 PM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
>>
>> On Tue, 22 Mar 2022 at 15:43, Bin Meng <bmeng.cn@gmail.com> wrote:
>> >
>> > When accessing the per-CPU register bank of some devices (e.g.: GIC)
>> > from the GDB stub context, a segfault occurs. This is due to current_c=
pu
>> > is not set, as the contect is not a guest CPU.
>> >
>> > Let's set current_cpu before doing the acutal memory read write.
>> >
>> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > ---
>>
>> This works, but I worry a bit that it might have unexpected
>> side effects, and setting globals (even if thread-local) to
>> cause side-effects elsewhere isn't ideal...
>>
>
> The functions modified are local to the gdbstub or monitor thread, so
> modifying the thread-local variable should have no side-effects.

The functions may be but current_cpu isn't as evidenced by the fact you
set it despite passing cpu down the call chain. We have places in the
code that assert(current_cpu) because they absolutely be only called in
a real vCPU thread and not elsewhere. This loosens that guarantee.

I think we need to not use cpu_physical_memory_write (which is
explicitly the system address space) but have a function that takes cpu
so it can work out the correct address space to you
address_space_read/write. If null we could probably reasonably use
first_cpu as an approximation.

--=20
Alex Benn=C3=A9e

