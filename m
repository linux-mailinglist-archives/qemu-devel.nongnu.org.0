Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C230618391
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:02:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcej-00070C-VW; Thu, 03 Nov 2022 12:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqceN-0006ZP-5G
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:01:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqceI-0005q4-Rh
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:01:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id y16so3420264wrt.12
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EhxqOZ/KRQ9wVkVIb1sePeKOFjRjzzWzgzGq58aA3C4=;
 b=H1JQqQZqolCJ6e+gYsxdJ6AuoiDKZ3c8uDmXJUGZI6lj2KIcCqQALwfW46GGEDTCb7
 awBO3WE6pBP3FbkEI4l9LW266wD2NJpx3ScSmJlw4uZT32AhgqSQywB1Dn3vpURg2Dzr
 /3KBLY4soGz2JteJst3qIFiW1tN5Z6mIOHpQleclepTCxqSrTuDu0Pp4On6lQJ/7Jpqf
 nNsjhaiVH7OSjhwA/83WZCJp52XuSw2bSyb7kf75EyEiIH4D0R6C47/OnQP5R3cst2fx
 tPOd1AqqJL+NW6K1m3ng/L1lWcJ36yS8Mvu+75jv1KdasjaRUheQPB5sDztnTNRTPhe1
 YZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EhxqOZ/KRQ9wVkVIb1sePeKOFjRjzzWzgzGq58aA3C4=;
 b=QSfm5LB8Z1od8L1ooJQwj4ZKld9g3YyvgQgeIy4qf65pQVz2/WOjTG9zJ2oPfs07AE
 doxte7mOTi2pNeg65TbnZowQf4dOFrql4o8rI4Vb+uVKqKcXdiIXKsr5fIPb0doeCJck
 AJXXqN4CczH0Wyfp091x6CNpS920Xrp556rlXSc+BCqmF/DJW9IqeeM4tbKEgaqGXMo+
 eOW4D9Pzwa7vgNHlt4kbggfbGhTzKWhdEarsHEdMdMxeD59Lc62h04WhFYiB1qZZolI4
 foGpVP0/FEsKO3rVF9/Y1iEbhhnIGHSbdN6jXo9F2U22BT6BvHJg4ChrB+ycdR0f1ly+
 PaqQ==
X-Gm-Message-State: ACrzQf0+3+xR9hruMFpAIg1EJ3axfPjug0oSAVUvRYa1v/ynNQNhZUzO
 G+aCZMad7n5rRqwue5rel/j1WQ==
X-Google-Smtp-Source: AMsMyM5MCAUyJDs4lz3WhqpXoAqFz0wfqhGtLECMPSk5l1DIfK8Gm8Am/2vtlix16Qgm72DudV+lvw==
X-Received: by 2002:a5d:678c:0:b0:236:e417:bcc7 with SMTP id
 v12-20020a5d678c000000b00236e417bcc7mr9431644wru.524.1667491254739; 
 Thu, 03 Nov 2022 09:00:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j20-20020adfb314000000b002258235bda3sm1205363wrd.61.2022.11.03.09.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 09:00:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F3ED1FFB7;
 Thu,  3 Nov 2022 16:00:53 +0000 (GMT)
References: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: TaiseiIto <taisei1212@outlook.jp>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org
Subject: Re: [PATCH] gdb-xml: Fix size of EFER register on i386 architecture
 when debugged by GDB
Date: Thu, 03 Nov 2022 15:59:24 +0000
In-reply-to: <TY0PR0101MB4285F637209075C9F65FCDA6A4479@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Message-ID: <87sfj0jadm.fsf@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


TaiseiIto <taisei1212@outlook.jp> writes:

> Before this commit, there were contradictory descriptions about size of E=
FER
> register.
> Line 113 says the size is 8 bytes.
> Line 129 says the size is 4 bytes.
>
> As a result, when GDB is debugging an OS running on QEMU, the GDB cannot
> read 'g' packets correctly. This 'g' packet transmits values of each
> registers of machine emulated by QEMU to GDB. QEMU, the packet sender,
> assign 4 bytes for EFER in 'g' packet based on the line 113.
> GDB, the packet receiver, extract 8 bytes for EFER in 'g' packet based on
> the line 129. Therefore, all registers located behind EFER in 'g' packet
> has been shifted 4 bytes in GDB.

I can't get the failure to read in my case:

  ./qemu-system-i386 -monitor none -display none \
    -chardev stdio,id=3Dout -device isa-debugcon,chardev=3Dout \
    -device isa-debug-exit,iobase=3D0xf4,iosize=3D0x4 \
    -kernel ./tests/tcg/i386-softmmu/memory -s -S

and then with gdb:

  =E2=9E=9C  gdb ./tests/tcg/i386-softmmu/memory -ex "target remote localho=
st:1234"
  Reading symbols from ./tests/tcg/i386-softmmu/memory...
  Remote debugging using localhost:1234
  0x0000fff0 in ?? ()
  (gdb) info registers efer
  efer           0x0                 [ ]

What am I missing?

>
> After this commit, GDB can read 'g' packets correctly.
>
> Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
> ---
>  gdb-xml/i386-32bit.xml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/gdb-xml/i386-32bit.xml b/gdb-xml/i386-32bit.xml
> index 872fcea9c2..7a66a02b67 100644
> --- a/gdb-xml/i386-32bit.xml
> +++ b/gdb-xml/i386-32bit.xml
> @@ -110,7 +110,7 @@
>  	<field name=3D"PKE" start=3D"22" end=3D"22"/>
>    </flags>
>=20=20
> -  <flags id=3D"i386_efer" size=3D"8">
> +  <flags id=3D"i386_efer" size=3D"4">
>  	<field name=3D"TCE" start=3D"15" end=3D"15"/>
>  	<field name=3D"FFXSR" start=3D"14" end=3D"14"/>
>  	<field name=3D"LMSLE" start=3D"13" end=3D"13"/>


--=20
Alex Benn=C3=A9e

