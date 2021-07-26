Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2B3D54DF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 10:06:18 +0200 (CEST)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7vcu-000222-LQ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 04:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m7vbY-0001KQ-Q0; Mon, 26 Jul 2021 04:04:52 -0400
Received: from dedi548.your-server.de ([85.10.215.148]:39512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m7vbU-0000d3-Vq; Mon, 26 Jul 2021 04:04:51 -0400
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by dedi548.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m7vbP-000AmH-3v; Mon, 26 Jul 2021 10:04:43 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1m7vbO-000Fn5-WC; Mon, 26 Jul 2021 10:04:43 +0200
Received: from localhost (localhost.localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id AA7452A1610;
 Mon, 26 Jul 2021 10:04:42 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Q9omW2QCT8DT; Mon, 26 Jul 2021 10:04:42 +0200 (CEST)
Received: from localhost (localhost.localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 2A5AF2A165B;
 Mon, 26 Jul 2021 10:04:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 9YKS6nNY27NJ; Mon, 26 Jul 2021 10:04:42 +0200 (CEST)
Received: from shuber-nb-linux.eb.localhost (unknown [10.10.171.10])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id EC70C2A1610;
 Mon, 26 Jul 2021 10:04:41 +0200 (CEST)
Subject: Re: [PATCH] hw/intc/arm_gic: Fix set/clear pending of PPI/SPI
To: Luc Michel <luc@lmichel.fr>
References: <20210709094948.60344-1-sebastian.huber@embedded-brains.de>
 <20210725080817.ivlkutnow7sojoyd@sekoia-pc.home.lmichel.fr>
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
Message-ID: <57459310-fe80-0cc2-5ffb-5b42bfe1a351@embedded-brains.de>
Date: Mon, 26 Jul 2021 10:04:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210725080817.ivlkutnow7sojoyd@sekoia-pc.home.lmichel.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldinet.de
X-Virus-Scanned: Clear (ClamAV 0.103.2/26243/Sun Jul 25 10:20:27 2021)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.091,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Luc,

thanks for having a look at the patch.

On 25/07/2021 10:08, Luc Michel wrote:
> Hi Sebastian,
>=20
> On 11:49 Fri 09 Jul     , Sebastian Huber wrote:
>> According to the GICv3 specification register GICD_ISPENDR0 is Banked =
for each
> You're referring to GICv3 but actually modifying GICv2 model. Having a
> look at GICv2 reference manual, your affirmation still hold though.
>=20
>> connected PE with GICR_TYPER.Processor_Number < 8.  For Qemu this is t=
he case
>> since GIC_NCPU =3D=3D 8.
> This is GICv3 specific. For GICv2 the architectural limit is 8 CPUs.

The wording in the GICv2 manual is:

"In a multiprocessor implementation, GICD_ISPENDR0 is banked for each=20
connected processor. This register holds the Set-pending bits for=20
interrupts 0-31."

>=20
>>
>> For SPI, make the interrupt pending on all CPUs and not just the proce=
ssor
>> targets of the interrupt.
> So you're not referring to GICD_ISPENDR0 anymore right? SPIs starts at
> IRQ number 32.  GICD_ISPENDR0 is for IRQs 0 to 31, which are SGIs and
> PPIs (This is why this reg is banked, meaning that a CPU can only
> trigger a PPI of its own). Maybe make it clear in your commit message
> that you are now talking about GICD_ISPENDRn with n > 0
>=20
> Moreover your statement regarding SPIs seems weird to me. Setting an
> SPI pending (in GICD_ISPENDRn with n > 0) should really be like having
> it being triggered from the IRQ line. It makes it pending in the
> distributor. The distributor then forward it as normal. Why the
> GICD_ITARGETSRn configuration should be ignored in this case? At least =
I
> can't find any reference to such a behaviour in the reference manual.

Ok, I will remove this part from the patch in v2. I probably didn't=20
fully understand how the Qemu GICv2 emulation works. What I wanted to=20
address is this behaviour (see GICv2 manual) when someone changes the=20
GICD_ITARGETSR<n> (n > 1):

"Has an effect on any pending interrupts. This means:

* adding a CPU interface to the target list of a pending interrupt makes=20
that interrupt pending on that CPU interface


* removing a CPU interface from the target list of a pending interrupt=20
removes the pending state of that interrupt on that CPU interface.

Note

There is a small but finite time required for any change to take effect."

The set/clear active bit uses ALL_CPU_MASK for example.

>=20
>>
>> This behaviour is at least present on the i.MX7D which uses an Cortex-=
A7MPCore.
> Which has a GICv2, not a v3 right?

Yes, the Cortex-A7MPCore uses a GICv2:

https://developer.arm.com/documentation/ddi0464/f/Generic-Interrupt-Contr=
oller/About-the-GIC?lang=3Den

>=20
>>
>> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
>> ---
>>   hw/intc/arm_gic.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
>> index a994b1f024..8e377bac59 100644
>> --- a/hw/intc/arm_gic.c
>> +++ b/hw/intc/arm_gic.c
>> @@ -1294,12 +1294,14 @@ static void gic_dist_writeb(void *opaque, hwad=
dr offset,
>>  =20
>>           for (i =3D 0; i < 8; i++) {
>>               if (value & (1 << i)) {
>> +                int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CP=
U_MASK;
>> +
> Indeed, I think the current implementation for PPIs is wrong
> (GIC_DIST_TARGET(irq + i) is probably 0 in this case, so a set pending
> request for a PPI will get incorrectly ignored). So I agree with the ir=
q <
> GIC_INTERNAL case. But for SPIs my concerns still hold (see my comment
> in the commit message).
>=20
>>                   if (s->security_extn && !attrs.secure &&
>>                       !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>>                       continue; /* Ignore Non-secure access of Group0 =
IRQ */
>>                   }
>>  =20
>> -                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i=
));
>> +                GIC_DIST_SET_PENDING(irq + i, cm);
>>               }
>>           }
>>       } else if (offset < 0x300) {
>> @@ -1317,11 +1319,10 @@ static void gic_dist_writeb(void *opaque, hwad=
dr offset,
>>                   continue; /* Ignore Non-secure access of Group0 IRQ =
*/
>>               }
>>  =20
>> -            /* ??? This currently clears the pending bit for all CPUs=
, even
>> -               for per-CPU interrupts.  It's unclear whether this is =
the
>> -               corect behavior.  */
>>               if (value & (1 << i)) {
>> -                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
>> +                int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CP=
U_MASK;
>> +
>> +                GIC_DIST_CLEAR_PENDING(irq + i, cm);
> I agree with this change too, but you are modifying the GICD_ICPENDRn
> register behaviour without mentioning it in the commit message.
>=20
> Thanks,
>=20

--=20
embedded brains GmbH
Herr Sebastian HUBER
Dornierstr. 4
82178 Puchheim
Germany
email: sebastian.huber@embedded-brains.de
phone: +49-89-18 94 741 - 16
fax:   +49-89-18 94 741 - 08

Registergericht: Amtsgericht M=C3=BCnchen
Registernummer: HRB 157899
Vertretungsberechtigte Gesch=C3=A4ftsf=C3=BChrer: Peter Rasmussen, Thomas=
 D=C3=B6rfler
Unsere Datenschutzerkl=C3=A4rung finden Sie hier:
https://embedded-brains.de/datenschutzerklaerung/

