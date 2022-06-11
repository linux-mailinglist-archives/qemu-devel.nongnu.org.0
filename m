Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5DC5472B8
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 09:51:11 +0200 (CEST)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzvtl-0006nW-IW
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 03:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzvqy-0004gQ-It
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 03:48:16 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nzvqw-0008RE-Je
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 03:48:16 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r187-20020a1c44c4000000b0039c76434147so2126805wma.1
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 00:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sM886I6QrldEL+s7Yk45RtjVUSsCpmCPa+2WZu5/KdA=;
 b=yrSR1jdAYHVznTgzWsQ08aON61QpT0nf4foTjuvi1LUvWWOuWyt2DWu1dRs9KjUzDj
 TL1bzkaXI6M7BEpu+xVEwip0fzUJH9qDOsdDIBFsQNSvSQ/JGO3eMrSR8nCT2yOzzSmt
 p+CiOUv1SBkix0pGZZjNyh/8WnTLeHoBIXDHovW714yHwNJih7RqeTh2ls4J61s+7kZm
 BYLh3MoqdALYmE83MjIcSlxSONj39kW5XmzxQriUU+lVc2GyWpByI3Gk8UU+6tM6Um/e
 W4jWhGaLMmBpzuvduFeYyn/hOJ6lDwEX9TfsSt3jesIxysNJ4HSNsTsQL9rXkrXV21Ta
 xCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sM886I6QrldEL+s7Yk45RtjVUSsCpmCPa+2WZu5/KdA=;
 b=P0kks1E4c156gOKGSzFaKyURVUruG+gKpSVTl31bsfx/IdMxyaxOIWddn0brSboTso
 vmbfVXsQnwmhSPvy/1YOhSXsciiNJ9wZU9osIGiKPrvtugSuvc1RV9zFMS4VoIHSf9D0
 Y0cfWWaVfzFCqJOLeM5OC8pTbZYKVyMUDuFO/C/YJ2aToJhex++Z+AI4KhRLTKpN/EPy
 c4qR3K4WcIvHNhCJny4pLWn1J/BRhBRM6IAF0Cl4XJTm/pdpIWCOtI5QrdUuy2da1LtB
 mVOCIwPYeb//ZNI811JF1bUdV3yI3K0P4OjuBTHWYdii4XK8wMePCnsuluM5M6hUs7jz
 NepQ==
X-Gm-Message-State: AOAM531IK1zA1bZtx4LwMugrZJEomKlU/uE7qnJj744LpnN06Xz4xaMC
 KUq/h/wCnqsuhKt6nfwsYM6yzw==
X-Google-Smtp-Source: ABdhPJwahypukqx80UAE+YxTKr08Xk7i7FrD4MNXdvn5B6m4WI8iAyT3fXMPZXpejvvWGE/GDxBMxQ==
X-Received: by 2002:a05:600c:6008:b0:39c:861b:c808 with SMTP id
 az8-20020a05600c600800b0039c861bc808mr1133420wmb.171.1654933693098; 
 Sat, 11 Jun 2022 00:48:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b0039c673952bfsm5693383wms.6.2022.06.11.00.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 00:48:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A91711FFB7;
 Sat, 11 Jun 2022 08:48:11 +0100 (BST)
References: <20220610154036.1253158-1-alex.bennee@linaro.org>
 <CAFEAcA9B1NJs4F_LVQ6FomJ0KMVZ-OFwYNjd5_=veYCNTd8tiw@mail.gmail.com>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, agorglouk@gmail.com, "open list:ARM TCG CPUs"
 <qemu-arm@nongnu.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: Re: [RFC PATCH] target/arm: de-duplicate our register XML definitions
Date: Sat, 11 Jun 2022 08:05:14 +0100
In-reply-to: <CAFEAcA9B1NJs4F_LVQ6FomJ0KMVZ-OFwYNjd5_=veYCNTd8tiw@mail.gmail.com>
Message-ID: <87y1y3r684.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 Jun 2022 at 16:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We generate the XML for each vCPU we create which for heavily threaded
>> linux-user runs can add up to a lot of memory. Unfortunately we can't
>> only do it once as we may have vCPUs with different capabilities in
>> different cores but we can at least free duplicate definitions if we
>> find them.
>
> How big actually is the XML here? 400 bytes? 4K? 40K? 400K?

For linux-user the sysreg XML is about 2k and the sve XML is about 8k
but it all adds up pretty quickly if you have lots of threads. BTW I
think the cpreg handling is also ranking quite highly in valgrinds
reporting but I haven't looked into it too deeply yet.

>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1070
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Can we defer the work until/unless gdb actually asks for it?

Yes. In fact really I'd like to remove all the XML generation details
from the various front-ends and move it to a common register API which
could do exactly that. We could then just share a uniform view of the
registers and perhaps extend it to understand per-core register sets if
we ever get to that point.

I also wonder if we can drop the individual XML segments and static GDB
register mappings in favour of one complete XML for whatever registers
QEMU wants to expose at the point? CC'ing some of our GDB colleges for
their input.

>
> I have some details-of-the-code comments below, but first:
> does gdb even support having the XML for each CPU be different?
> Our gdbstub.c seems to always ask for the XML only for the first
> CPU in the "process". If gdb does support heterogenous CPU XML,
> does it require that different XML descriptions have different
> names? We always call them system-registers.xml and sve-registers.xml
> regardless of whether different CPUs might have different contents
> for those XML blobs...
>
>> ---
>>  target/arm/gdbstub.c | 38 ++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
>> index 2f806512d0..85ef6dc6db 100644
>> --- a/target/arm/gdbstub.c
>> +++ b/target/arm/gdbstub.c
>> @@ -318,7 +318,24 @@ int arm_gen_dynamic_sysreg_xml(CPUState *cs, int ba=
se_reg)
>>      g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.arm.sys.r=
egs\">");
>>      g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &pa=
ram);
>>      g_string_append_printf(s, "</feature>");
>> -    cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
>> +
>> +    /* De-duplicate system register descriptions */
>> +    if (cs !=3D first_cpu) {
>> +        CPUState *other_cs;
>> +        CPU_FOREACH(other_cs) {
>> +            ARMCPU *other_arm =3D ARM_CPU(other_cs);
>> +            if (g_strcmp0(other_arm->dyn_sysreg_xml.desc, s->str) =3D=
=3D 0) {
>
> If you check whether the dyn_sysreg_xml.num matches first, that will
> probably be a much faster way of checking in almost all cases than
> doing the strcmp on the however-long-it-is XML string: it seems unlikely
> that in a heterogenous config the CPUs will manage to have exactly the
> same number of registers.
>
> If you have a setup with, say, 4 CPUs of type X and then 4 of type Y,
> for every type Y CPU this loop will do the strcmp of Y's XML against
> the type X XML for cpu 0, then again for 1, then again for 2, then for 3,
> even though in theory we already know at that point that 0,1,2,3 all
> have the same XML and so if it didn't match for cpu 0 it won't match
> for 1,2,3...  But maybe the comparison against the number-of-registers
> saves us from having to try to optimise that away.
>
>> +                cpu->dyn_sysreg_xml.desc =3D other_arm->dyn_sysreg_xml.=
desc;
>> +                g_string_free(s, true);
>> +                s =3D NULL;
>> +                break;
>> +            }
>> +        }
>> +    }
>> +
>> +    if (s) {
>> +        cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
>> +    }
>>      return cpu->dyn_sysreg_xml.num;
>>  }
>
> -- PMM

I'm travelling today so I'll see if I can use the time to sketch up a
common API and make this fugly approach obsolete.

--=20
Alex Benn=C3=A9e

