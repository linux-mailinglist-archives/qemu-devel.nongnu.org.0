Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C09135F13
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 18:16:05 +0100 (CET)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipbPg-00078E-Gd
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 12:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ipbNs-0004sT-Vj
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 12:14:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ipbNp-0004fR-Qc
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 12:14:12 -0500
Received: from 6.mo6.mail-out.ovh.net ([87.98.177.69]:57111)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ipbNo-0004Y9-Gw
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 12:14:08 -0500
Received: from player714.ha.ovh.net (unknown [10.108.57.38])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 2F2AD1F86C9
 for <qemu-devel@nongnu.org>; Thu,  9 Jan 2020 18:14:04 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 17DDADFA36E4;
 Thu,  9 Jan 2020 17:13:48 +0000 (UTC)
Date: Thu, 9 Jan 2020 18:13:46 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 02/15] hw/ppc/spapr_rtas: Use local MachineState variable
Message-ID: <20200109181346.5ec5ed8b@bahia.lan>
In-Reply-To: <20200109152133.23649-3-philmd@redhat.com>
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-3-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 6871367133219887395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiuddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepud
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.177.69
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Juan Quintela <quintela@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  9 Jan 2020 16:21:20 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Since we have the MachineState already available locally,
> ues it instead of the global current_machine.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_rtas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8d8d8cdfcb..e88bb1930e 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -281,7 +281,7 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>                                            "DesProcs=3D%d,"
>                                            "MaxPlatProcs=3D%d",
>                                            max_cpus,
> -                                          current_machine->ram_size / Mi=
B,
> +                                          ms->ram_size / MiB,
>                                            ms->smp.cpus,
>                                            max_cpus);
>          if (pcc->n_host_threads > 0) {


