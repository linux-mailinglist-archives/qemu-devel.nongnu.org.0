Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7353F33F602
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:49:15 +0100 (CET)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZMA-00071S-Gd
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lMZ6Z-0000HF-7X; Wed, 17 Mar 2021 12:33:08 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lMZ6V-0004YA-2X; Wed, 17 Mar 2021 12:33:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B4220914B7E0;
 Wed, 17 Mar 2021 17:32:57 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 17:32:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00655174a42-8f6b-49f8-8ff1-c1d797057d18,
 670D5B4C9DF7F327995E1DB97B2EE849A8F56C3D) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 17 Mar 2021 17:32:56 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH] target/ppc/kvm: Cache timebase frequency
Message-ID: <20210317173256.6c87aca1@bahia.lan>
In-Reply-To: <b10f7706-204b-6bb0-895a-c6e680acd2c3@amsat.org>
References: <161599468311.1752480.3413807875011702040.stgit@bahia.lan>
 <b10f7706-204b-6bb0-895a-c6e680acd2c3@amsat.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 7785fc0a-1c5f-46bc-9d36-aec7e89f8d00
X-Ovh-Tracer-Id: 3402750993471085024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 16:39:04 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> On 3/17/21 4:24 PM, Greg Kurz wrote:
> > Each vCPU core exposes its timebase frequency in the DT. When running
> > under KVM, this means parsing /proc/cpuinfo in order to get the timebase
> > frequency of the host CPU.
> >=20
> > The parsing appears to slow down the boot quite a bit with higher number
> > of cores:
> >=20
> > # of cores     seconds spent in spapr_dt_cpus()
> >       8                  0.550122
> >      16                  1.342375
> >      32                  2.850316
> >      64                  5.922505
> >      96                  9.109224
> >     128                 12.245504
> >     256                 24.957236
> >     384                 37.389113
> >=20
> > The timebase frequency of the host CPU is identical for all
> > cores and it is an invariant for the VM lifetime. Cache it
> > instead of doing the same expensive parsing again and again.
> >=20
> > With this patch applied:
> >=20
> >     384                 0.518382
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  target/ppc/kvm.c |   11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> > index 298c1f882c67..9ad3dae29132 100644
> > --- a/target/ppc/kvm.c
> > +++ b/target/ppc/kvm.c
> > @@ -1819,7 +1819,13 @@ uint32_t kvmppc_get_tbfreq(void)
> >  {
> >      char line[512];
> >      char *ns;
> > -    uint32_t retval =3D NANOSECONDS_PER_SECOND;
> > +    static uint32_t retval =3D -1;
>=20
> Please document why in the code ...
>=20

Yeah, I've been lazy :)

> > +
> > +    if (retval !=3D -1) {
> > +        return retval;
> > +    }
> > +
> > +    retval =3D NANOSECONDS_PER_SECOND;
> > =20
> >      if (read_cpuinfo("timebase", line, sizeof(line))) {
> >          return retval;
> > @@ -1832,7 +1838,8 @@ uint32_t kvmppc_get_tbfreq(void)
> > =20
> >      ns++;
> > =20
> > -    return atoi(ns);
> > +    retval =3D atoi(ns);
> > +    return retval;
> >  }
>=20
> ... or alternatively use self-documented code:
>=20
> -- >8 --
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 298c1f882c6..2b2fe5d8148 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1815,7 +1815,7 @@ static int read_cpuinfo(const char *field, char
> *value, int len)
>      return ret;
>  }
>=20
> -uint32_t kvmppc_get_tbfreq(void)
> +static uint32_t kvmppc_get_tbfreq_procfs(void)
>  {
>      char line[512];
>      char *ns;
> @@ -1835,6 +1835,17 @@ uint32_t kvmppc_get_tbfreq(void)
>      return atoi(ns);
>  }
>=20
> +uint32_t kvmppc_get_tbfreq(void)
> +{
> +    static uint32_t cached_tbfreq;
> +
> +    if (!cached_tbfreq) {
> +        cached_tbfreq =3D kvmppc_get_tbfreq_procfs();
> +    }
> +
> +    return cached_tbfreq;
> +}
> +

This is much nicer indeed. I'll do just that in v2.

Thanks ! :)

>  bool kvmppc_get_host_serial(char **value)
>  {
>      return g_file_get_contents("/proc/device-tree/system-id", value, NUL=
L,
> ---


