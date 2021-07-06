Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626613BD80E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 15:56:49 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0lZA-00072q-F4
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 09:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0lY4-00060t-Vw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:55:41 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0lY0-0000lp-Tw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 09:55:40 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so1787452wmb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iAW5aJabVfEanAo2KfoV2LZajh9Ko5kld9g+gM3Q+HA=;
 b=D2ZvP6DjvStU93KBaTjwDL8juSTP5k1gNE4YKlR3SxZtkcZLz7YULkhI55MeP45pjE
 FLQsiUFFo33LozzpwovpNOUpwIE6nqclZFYi9lRj2qARbSlJgyjkTb7GdlbyBVeldUOm
 ceug/0ujf8XGCv4Vgi4+JKVI3qJO6N9uhOYCFr4t+a/tTac01S8z98Ih7wWonZkyXL5R
 S7EvZlM0KJ6stOIM3qGTwf9sO42YJux72dS8SygQ4jE26WTP26sC34+pvKUoIMldx02L
 A8xclI3L9QQ1jqc6x9RqW3b0LHuZRrMLuPUQLUK9Rqk5+enxnzH6LEuiy46Bn8OQvOKO
 cv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iAW5aJabVfEanAo2KfoV2LZajh9Ko5kld9g+gM3Q+HA=;
 b=J1LuDqSQm/QVEnLblaGjuNpY1d845z+cGJIAUfMEgf40ocP7NiG87hzmSKLlnfzqBf
 JT20tKtdLArTsvMnEnaFSYxamvH2naaZe/VoOzUcyeqdQnkYdECp5E4kbUL/ZQydnKvI
 /C3k7cGjJHrf57dB3G/cPXyvbuHP+ARgOm+fO4qmQSiXiH7nv8qN27lYY/Pq6mNArYcH
 hOv/iTh8GSpR5dunRdYZ2OyJyNvWQBGSBhe7pnbQ79LVndqkM7J6Mw/XR3gNQGnYmDn6
 SJPPc1gxfmzvrd5JYwhUM18uxGmkfc3J3vzq9D7zIg/bcjQb7QNedK0w8CUm727Ynh/e
 5OpQ==
X-Gm-Message-State: AOAM530l4Qlfzz2Vp9zxCwSLpISopwVqsXJdx65PwxLdFeh11r1aIqnS
 X/toL1M+p10oEtiIaI3xkD7Cng==
X-Google-Smtp-Source: ABdhPJy/Utv2ojGBXaiBT5a73gi4jqKZyzZBbA+xS/7bJJMc+viwVdIyjmv81DDpDe2/ubxJZk8RBA==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr20036833wmq.105.1625579733856; 
 Tue, 06 Jul 2021 06:55:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm2860292wms.7.2021.07.06.06.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 06:55:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D6F51FF7E;
 Tue,  6 Jul 2021 14:55:32 +0100 (BST)
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-2-alex.bennee@linaro.org>
 <c3d33a80-b3bb-5aa5-50c7-7c1a379814ba@redhat.com>
 <8d018805-8e1f-4c1e-b1a4-45a34c8d2e63@amsat.org>
 <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 1/5] meson: Introduce target-specific Kconfig
Date: Tue, 06 Jul 2021 14:52:19 +0100
In-reply-to: <bd97210a-04d4-939f-b3b7-1e250d7d250a@redhat.com>
Message-ID: <87fswrtuln.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open
 list:S390 general arch..." <qemu-s390x@nongnu.org>, "open list:ARM TCG
 CPUs" <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>, pbonzini@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> On 06/07/2021 14.47, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 7/6/21 12:52 PM, Thomas Huth wrote:
>>> On 21/06/2021 17.21, Alex Benn=C3=A9e wrote:
>>>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>
>>>> Add a target-specific Kconfig. We need the definitions in Kconfig so
>>>> the minikconf tool can verify they exit. However CONFIG_FOO is only
>>>
>>> s/exit/exist/ ?
>>>
>>>> enabled for target foo via the meson.build rules.
>>>>
>>>> Two architecture have a particularity, ARM and MIPS:
>>>> their 64-bit version include the 32-bit subset.
>>>
>>> Why do you mention these here, but not x86, Sparc, PPC and RISC-V which
>>> also have 32-bit and 64-bit variants?
>> Because we consider them as different targets, they don't include
>> (kselect) the subset.
>
> And why is that done this way? There is certainly a big difference
> between Sparc and Sparc64, but for x86 and PPC, the 64-bit variant is
> a superset of the 32-bit variant, so why is it done different here
> compared to ARM and MIPS?

Both ARM and MIPS have a somewhat separated set of translate.c functions
which means they can be built as individual units. AFAICT all the others
have a unified translate.c that handles all ISA variants so they
couldn't be built as standalone units if they wanted to.

You are right for AArch64 at least we have to include translate.c to
support AArch32 encoding. But for qemu-arm we skip all the 64 bit stuff
by compilation units:

arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
  'cpu64.c',
  'gdbstub64.c',
  'helper-a64.c',
  'mte_helper.c',
  'pauth_helper.c',
  'sve_helper.c',
  'translate-a64.c',
  'translate-sve.c',
))


>
>  Thomas
>
>
>>>
>>> The patch itself looks fine to me, so once you've clarified the commit
>>> message:
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>>
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>
>>>> ---
>>>> vajb:
>>>>  =C2=A0=C2=A0 - removed targets that no longer exist
>>>>  =C2=A0=C2=A0 - reword commit message to show why we need the Kconfigs
>>>> ---
>>=20
>>>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>>>> new file mode 100644
>>>> index 0000000000..3f3394a22b
>>>> --- /dev/null
>>>> +++ b/target/arm/Kconfig
>>>> @@ -0,0 +1,6 @@
>>>> +config ARM
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +
>>>> +config AARCH64
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +=C2=A0=C2=A0=C2=A0 select ARM
>>=20
>>>> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
>>>> new file mode 100644
>>>> index 0000000000..6adf145354
>>>> --- /dev/null
>>>> +++ b/target/mips/Kconfig
>>>> @@ -0,0 +1,6 @@
>>>> +config MIPS
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +
>>>> +config MIPS64
>>>> +=C2=A0=C2=A0=C2=A0 bool
>>>> +=C2=A0=C2=A0=C2=A0 select MIPS
>>=20


--=20
Alex Benn=C3=A9e

