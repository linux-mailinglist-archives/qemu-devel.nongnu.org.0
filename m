Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691E44F9CE
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 18:43:13 +0100 (CET)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmJX6-00037z-4i
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 12:43:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mmJVG-0002Bj-FP; Sun, 14 Nov 2021 12:41:18 -0500
Received: from mail.csgraf.de ([85.25.223.15]:39402 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mmJVB-00026W-SV; Sun, 14 Nov 2021 12:41:18 -0500
Received: from smtpclient.apple
 (dynamic-095-118-029-131.95.118.pool.telefonica.de [95.118.29.131])
 by csgraf.de (Postfix) with ESMTPSA id 966D5608038A;
 Sun, 14 Nov 2021 18:41:07 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Date: Sun, 14 Nov 2021 18:41:06 +0100
Message-Id: <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: iPhone Mail (19B74)
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
>=20
> =EF=BB=BFOn Sun, 14 Nov 2021 at 10:56, Alexander Graf <agraf@csgraf.de> wr=
ote:
>>=20
>> When we expose an SMC conduit, we're implicitly telling the guest that
>> there is EL3 available because it needs to call it. While that EL3 then
>> is not backed by the emulated CPU, from the guest's EL2 point of view,
>> it still means there is an EL3 to call into.
>>=20
>> This is a problem for VMware ESXi, which validates EL3 availability befor=
e
>> doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.
>>=20
>> Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>> target/arm/cpu.c | 20 +++++++++++++++-----
>> 1 file changed, 15 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index a211804fd3..21092c5242 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>>          */
>>         unset_feature(env, ARM_FEATURE_EL3);
>>=20
>> -        /* Disable the security extension feature bits in the processor f=
eature
>> -         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:=
12].
>> -         */
>> -        cpu->isar.id_pfr1 &=3D ~0xf0;
>> -        cpu->isar.id_aa64pfr0 &=3D ~0xf000;
>> +        if (cpu->psci_conduit =3D=3D QEMU_PSCI_CONDUIT_SMC) {
>> +            /*
>> +             * We tell the guest to use SMC calls into EL3 for PSCI call=
s, so
>> +             * there has to be EL3 available. We merely execute it on th=
e host
>> +             * in QEMU rather than in actual EL3 inside the guest.
>> +             */
>> +        } else {
>> +            /*
>> +             * Disable the security extension feature bits in the proces=
sor
>> +             * feature registers as well. These are id_pfr1[7:4] and
>> +             * id_aa64pfr0[15:12].
>> +             */
>> +            cpu->isar.id_pfr1 &=3D ~0xf0;
>> +            cpu->isar.id_aa64pfr0 &=3D ~0xf000;
>> +        }
>=20
> This is tricky, because we use the cpu->isar values to determine whether
> we should be emulating things. So this change means we now create an
> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
> unset), and depending on which of the two "do we have EL3?" methods
> any bit of the TCG code is using will give different results...

Do you think it would be sufficient to go through all readers of the isar bi=
ts and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy=
 to do so then! :)

Alex


