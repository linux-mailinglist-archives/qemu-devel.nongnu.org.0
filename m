Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB72F822A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:24:44 +0100 (CET)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Sq3-0005Ug-9r
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l0Snw-0004PJ-GJ; Fri, 15 Jan 2021 12:22:32 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:48007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l0Sns-0001Z5-TM; Fri, 15 Jan 2021 12:22:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id D7FDF827D32D;
 Fri, 15 Jan 2021 18:22:17 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 15 Jan
 2021 18:22:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001f7debb62-5d6c-48ed-9fdf-04444cec998f,
 DCCBFB19B1A3BA1C031047B2F93F7C58B25CC811) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Fri, 15 Jan 2021 18:22:16 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 7/7] spapr.c: consider CPU core online state before
 allowing unplug
Message-ID: <20210115182216.6dccadee@bahia.lan>
In-Reply-To: <20210114180628.1675603-8-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
 <20210114180628.1675603-8-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3bd46b67-3850-4d96-8d0b-d3dc6841d592
X-Ovh-Tracer-Id: 14936469643058911651
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvedtkeetieejvdehfefguddttdekleeljedukeejleevgfffheekteeifeejvdefnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopeiguhhmrgesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xujun Ma <xuma@redhat.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 15:06:28 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The only restriction we have when unplugging CPUs is to forbid unplug of
> the boot cpu core. spapr_core_unplug_possible() does not contemplate the

I can't remember why this restriction was introduced in the first place...
This should be investigated and documented if the limitation still stands.

> possibility of some cores being offlined by the guest, meaning that we're
> rolling the dice regarding on whether we're unplugging the last online
> CPU core the guest has.
>=20

Trying to unplug the last CPU is obviously something that deserves
special care. LoPAPR is quite explicit on the outcome : this should
terminate the partition.

13.7.4.1.1. Isolation of CPUs

The isolation of a CPU, in all cases, is preceded by the stop-self
RTAS function for all processor threads, and the OS insures that all
the CPU=E2=80=99s threads are in the RTAS stopped state prior to isolating =
the
CPU. Isolation of a processor that is not stopped produces unpredictable
results. The stopping of the last processor thread of a LPAR partition
effectively kills the partition, and at that point, ownership of all
partition resources reverts to the platform firmware.

R1-13.7.4.1.1-1. For the LRDR option: Prior to issuing the RTAS
set-indicator specifying isolate isolation-state of a CPU DR
connector type, all the CPU threads must be in the RTAS stopped
state.

R1-13.7.4.1.1-2. For the LRDR option: Stopping of the last processor
thread of a LPAR partition with the stop-self RTAS function, must kill
the partition, with ownership of all partition resources reverting to
the platform firmware.

This is clearly not how things work today : linux doesn't call
"stop-self" on the last vCPU and even if it did, QEMU doesn't
terminate the VM.

If there's a valid reason to not implement this PAPR behavior, I'd like
it to be documented.

> If we hit the jackpot, we're going to detach the core DRC and pulse the
> hotplug IRQ, but the guest OS will refuse to release the CPU. Our
> spapr_core_unplug() DRC release callback will never be called and the CPU
> core object will keep existing in QEMU. No error message will be sent
> to the user, but the CPU core wasn't unplugged from the guest.
>=20
> If the guest OS onlines the CPU core again we won't be able to hotunplug =
it
> either. 'dmesg' inside the guest will report a failed attempt to offline =
an
> unknown CPU:
>=20
> [  923.003994] pseries-hotplug-cpu: Failed to offline CPU <NULL>, rc: -16
>=20
> This is the result of stopping the DRC state transition in the middle in =
the
> first failed attempt.
>=20

Yes, at this point only a machine reset can fix things up.

Given this is linux's choice not to call "stop-self" as it should do, I'm n=
ot
super fan of hardcoding this logic in QEMU, unless there are really good
reasons to do so.

> We can avoid this, and potentially other bad things from happening, if we
> avoid to attempt the unplug altogether in this scenario. Let's check for
> the online/offline state of the CPU cores in the guest before allowing
> the hotunplug, and forbid removing a CPU core if it's the last one online
> in the guest.
>=20
> Reported-by: Xujun Ma <xuma@redhat.com>
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1911414
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a2f01c21aa..d269dcd102 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3709,9 +3709,16 @@ static void spapr_core_unplug(HotplugHandler *hotp=
lug_dev, DeviceState *dev)
>  static int spapr_core_unplug_possible(HotplugHandler *hotplug_dev, CPUCo=
re *cc,
>                                        Error **errp)
>  {
> +    CPUArchId *core_slot;
> +    SpaprCpuCore *core;
> +    PowerPCCPU *cpu;
> +    CPUState *cs;
> +    bool last_cpu_online =3D true;
>      int index;
> =20
> -    if (!spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id, &index))=
 {
> +    core_slot =3D spapr_find_cpu_slot(MACHINE(hotplug_dev), cc->core_id,
> +                                    &index);
> +    if (!core_slot) {
>          error_setg(errp, "Unable to find CPU core with core-id: %d",
>                     cc->core_id);
>          return -1;
> @@ -3722,6 +3729,36 @@ static int spapr_core_unplug_possible(HotplugHandl=
er *hotplug_dev, CPUCore *cc,
>          return -1;
>      }
> =20
> +    /* Allow for any non-boot CPU core to be unplugged if already offlin=
e */
> +    core =3D SPAPR_CPU_CORE(core_slot->cpu);
> +    cs =3D CPU(core->threads[0]);
> +    if (cs->halted) {
> +        return 0;
> +    }
> +
> +    /*
> +     * Do not allow core unplug if it's the last core online.
> +     */
> +    cpu =3D POWERPC_CPU(cs);
> +    CPU_FOREACH(cs) {
> +        PowerPCCPU *c =3D POWERPC_CPU(cs);
> +
> +        if (c =3D=3D cpu) {
> +            continue;
> +        }
> +
> +        if (!cs->halted) {
> +            last_cpu_online =3D false;
> +            break;
> +        }
> +    }
> +
> +    if (last_cpu_online) {
> +        error_setg(errp, "Unable to unplug CPU core with core-id %d: it =
is "
> +                   "the only CPU core online in the guest", cc->core_id);
> +        return -1;
> +    }
> +
>      return 0;
>  }
> =20


