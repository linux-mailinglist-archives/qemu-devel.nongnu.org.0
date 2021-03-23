Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7EE3454A3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 02:06:42 +0100 (CET)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOVVJ-0004MA-7E
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 21:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVSy-0003UG-5o; Mon, 22 Mar 2021 21:04:16 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOVSv-00066s-KO; Mon, 22 Mar 2021 21:04:15 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F4Cn36pjTz9sXN; Tue, 23 Mar 2021 12:04:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616461447;
 bh=0i2QPaWz45YR0dl+nz0rAYbIu627uWNfmvQ3HaU+Ekw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ag+FtkAGXXDKN3b/YRYd90nr4jCDTOGbCcY18vX1f+Y9IKHw4S8AuUY4rMemN588Q
 ixZFG2e0lGsmVpG3+oaTztBJ+PBq3Ie7hmojSI23ZTAJPvIL+PIIICMFIQauezTRFn
 lvjIQ9Lw0eHD1YMq4TbAfJz3CX2UFPZXelddnOas=
Date: Tue, 23 Mar 2021 12:03:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
Message-ID: <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BJfnte20rY0bAaQQ"
Content-Disposition: inline
In-Reply-To: <20210319183453.4466-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BJfnte20rY0bAaQQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
> Kernel commit 4bce545903fa ("powerpc/topology: Update
> topology_core_cpumask") cause a regression in the pseries machine when
> defining certain SMP topologies [1]. The reasoning behind the change is
> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles with
> large VMs with lots of CPUs and was changed by cpu_cpu_mask because, as
> far as the kernel understanding of SMP topologies goes, both masks are
> equivalent.
>=20
> Further discussions in the kernel mailing list [2] shown that the
> powerpc kernel always considered that the number of sockets were equal
> to the number of NUMA nodes. The claim is that it doesn't make sense,
> for Power hardware at least, 2+ sockets being in the same NUMA node. The
> immediate conclusion is that all SMP topologies the pseries machine were
> supplying to the kernel, with more than one socket in the same NUMA node
> as in [1], happened to be correctly represented in the kernel by
> accident during all these years.
>=20
> There's a case to be made for virtual topologies being detached from
> hardware constraints, allowing maximum flexibility to users. At the same
> time, this freedom can't result in unrealistic hardware representations
> being emulated. If the real hardware and the pseries kernel don't
> support multiple chips/sockets in the same NUMA node, neither should we.
>=20
> Starting in 6.0.0, all sockets must match an unique NUMA node in the
> pseries machine. qtest changes were made to adapt to this new
> condition.

Oof.  I really don't like this idea.  It means a bunch of fiddly work
for users to match these up, for no real gain.  I'm also concerned
that this will require follow on changes in libvirt to not make this a
really cryptic and irritating point of failure.

>=20
> [1] https://bugzilla.redhat.com/1934421
> [2] https://lore.kernel.org/linuxppc-dev/daa5d05f-dbd0-05ad-7395-5d5a3d36=
4fc6@gmail.com/
>=20
> CC: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> CC: C=E9dric Le Goater <clg@kaod.org>
> CC: Igor Mammedov <imammedo@redhat.com>
> CC: Laurent Vivier <lvivier@redhat.com>
> CC: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c                 |  3 ++
>  hw/ppc/spapr_numa.c            |  7 +++++
>  include/hw/ppc/spapr.h         |  1 +
>  tests/qtest/cpu-plug-test.c    |  4 +--
>  tests/qtest/device-plug-test.c |  9 +++++-
>  tests/qtest/numa-test.c        | 52 ++++++++++++++++++++++++++++------
>  6 files changed, 64 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d56418ca29..745f71c243 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4611,8 +4611,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> +
>      spapr_machine_6_0_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    smc->pre_6_0_smp_topology =3D true;
>  }
> =20
>  DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 779f18b994..0ade43dd79 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -163,6 +163,13 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>      int i, j, max_nodes_with_gpus;
>      bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr);
> =20
> +    if (!smc->pre_6_0_smp_topology &&
> +        nb_numa_nodes !=3D machine->smp.sockets) {
> +        error_report("Number of CPU sockets must be equal to the number "
> +                     "of NUMA nodes");
> +        exit(EXIT_FAILURE);
> +    }
> +
>      /*
>       * For all associativity arrays: first position is the size,
>       * position MAX_DISTANCE_REF_POINTS is always the numa_id,
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 47cebaf3ac..98dc5d198a 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -142,6 +142,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> +    bool pre_6_0_smp_topology;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,
> diff --git a/tests/qtest/cpu-plug-test.c b/tests/qtest/cpu-plug-test.c
> index a1c689414b..946b9129ea 100644
> --- a/tests/qtest/cpu-plug-test.c
> +++ b/tests/qtest/cpu-plug-test.c
> @@ -118,8 +118,8 @@ static void add_pseries_test_case(const char *mname)
>      data->machine =3D g_strdup(mname);
>      data->cpu_model =3D "power8_v2.0";
>      data->device_model =3D g_strdup("power8_v2.0-spapr-cpu-core");
> -    data->sockets =3D 2;
> -    data->cores =3D 3;
> +    data->sockets =3D 1;
> +    data->cores =3D 6;
>      data->threads =3D 1;
>      data->maxcpus =3D data->sockets * data->cores * data->threads;
> =20
> diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-tes=
t.c
> index 559d47727a..dd7d8268d2 100644
> --- a/tests/qtest/device-plug-test.c
> +++ b/tests/qtest/device-plug-test.c
> @@ -91,7 +91,14 @@ static void test_spapr_cpu_unplug_request(void)
>  {
>      QTestState *qtest;
> =20
> -    qtest =3D qtest_initf("-cpu power9_v2.0 -smp 1,maxcpus=3D2 "
> +    /*
> +     * Default smp settings will prioritize sockets over cores and
> +     * threads, so '-smp 2,maxcpus=3D2' will add 2 sockets. However,
> +     * the pseries machine requires a NUMA node for each socket
> +     * (since 6.0.0). Specify sockets=3D1 to make life easier.
> +     */
> +    qtest =3D qtest_initf("-cpu power9_v2.0 "
> +                        "-smp 1,maxcpus=3D2,threads=3D1,cores=3D2,socket=
s=3D1 "
>                          "-device power9_v2.0-spapr-cpu-core,core-id=3D1,=
id=3Ddev0");
> =20
>      /* similar to test_pci_unplug_request */
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index dc0ec571ca..bb13f7131b 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -24,9 +24,17 @@ static void test_mon_explicit(const void *data)
>      QTestState *qts;
>      g_autofree char *s =3D NULL;
>      g_autofree char *cli =3D NULL;
> +    const char *arch =3D qtest_get_arch();
> +
> +    if (g_str_equal(arch, "ppc64")) {
> +        cli =3D make_cli(data, "-smp 8,threads=3D1,cores=3D4,sockets=3D2=
 "
> +                             "-numa node,nodeid=3D0,memdev=3Dram,cpus=3D=
0-3 "
> +                             "-numa node,nodeid=3D1,cpus=3D4-7");
> +    } else {
> +        cli =3D make_cli(data, "-smp 8 -numa node,nodeid=3D0,memdev=3Dra=
m,cpus=3D0-3 "
> +                             "-numa node,nodeid=3D1,cpus=3D4-7");
> +    }
> =20
> -    cli =3D make_cli(data, "-smp 8 -numa node,nodeid=3D0,memdev=3Dram,cp=
us=3D0-3 "
> -                         "-numa node,nodeid=3D1,cpus=3D4-7");
>      qts =3D qtest_init(cli);
> =20
>      s =3D qtest_hmp(qts, "info numa");
> @@ -57,10 +65,18 @@ static void test_mon_partial(const void *data)
>      QTestState *qts;
>      g_autofree char *s =3D NULL;
>      g_autofree char *cli =3D NULL;
> +    const char *arch =3D qtest_get_arch();
> +
> +    if (g_str_equal(arch, "ppc64")) {
> +        cli =3D make_cli(data, "-smp 8,threads=3D1,cores=3D4,sockets=3D2=
 "
> +                             "-numa node,nodeid=3D0,memdev=3Dram,cpus=3D=
0-1 "
> +                             "-numa node,nodeid=3D1,cpus=3D4-5 ");
> +    } else {
> +        cli =3D make_cli(data, "-smp 8 "
> +                             "-numa node,nodeid=3D0,memdev=3Dram,cpus=3D=
0-1 "
> +                             "-numa node,nodeid=3D1,cpus=3D4-5 ");
> +    }
> =20
> -    cli =3D make_cli(data, "-smp 8 "
> -                   "-numa node,nodeid=3D0,memdev=3Dram,cpus=3D0-1 "
> -                   "-numa node,nodeid=3D1,cpus=3D4-5 ");
>      qts =3D qtest_init(cli);
> =20
>      s =3D qtest_hmp(qts, "info numa");
> @@ -85,9 +101,17 @@ static void test_query_cpus(const void *data)
>      QObject *e;
>      QTestState *qts;
>      g_autofree char *cli =3D NULL;
> +    const char *arch =3D qtest_get_arch();
> +
> +    if (g_str_equal(arch, "ppc64")) {
> +        cli =3D make_cli(data, "-smp 8,threads=3D1,cores=3D4,sockets=3D2=
 "
> +                             "-numa node,memdev=3Dram,cpus=3D0-3 "
> +                             "-numa node,cpus=3D4-7");
> +    } else {
> +        cli =3D make_cli(data, "-smp 8 -numa node,memdev=3Dram,cpus=3D0-=
3 "
> +                             "-numa node,cpus=3D4-7");
> +    }
> =20
> -    cli =3D make_cli(data, "-smp 8 -numa node,memdev=3Dram,cpus=3D0-3 "
> -                         "-numa node,cpus=3D4-7");
>      qts =3D qtest_init(cli);
>      cpus =3D get_cpus(qts, &resp);
>      g_assert(cpus);
> @@ -177,7 +201,7 @@ static void spapr_numa_cpu(const void *data)
>      QTestState *qts;
>      g_autofree char *cli =3D NULL;
> =20
> -    cli =3D make_cli(data, "-smp 4,cores=3D4 "
> +    cli =3D make_cli(data, "-smp 4,threads=3D1,cores=3D2,sockets=3D2 "
>          "-numa node,nodeid=3D0,memdev=3Dram -numa node,nodeid=3D1 "
>          "-numa cpu,node-id=3D0,core-id=3D0 "
>          "-numa cpu,node-id=3D0,core-id=3D1 "
> @@ -554,7 +578,17 @@ int main(int argc, char **argv)
> =20
>      g_test_init(&argc, &argv, NULL);
> =20
> -    qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu_spl=
it);
> +    /*
> +     * Starting on 6.0.0, for the pseries machine, '-smp 8' will only wo=
rk
> +     * if we have 8 NUMA nodes. If we specify 'smp 8,sockets=3D2' to mat=
ch
> +     * 2 NUMA nodes, the CPUs will be split as 0123/4567 instead of
> +     * 0246/1357 that test_def_cpu_split expects. In short, this test is
> +     * no longer valid for ppc64 in 6.0.0.
> +     */
> +    if (!g_str_equal(arch, "ppc64")) {
> +        qtest_add_data_func("/numa/mon/cpus/default", args, test_def_cpu=
_split);
> +    }
> +
>      qtest_add_data_func("/numa/mon/cpus/explicit", args, test_mon_explic=
it);
>      qtest_add_data_func("/numa/mon/cpus/partial", args, test_mon_partial=
);
>      qtest_add_data_func("/numa/qmp/cpus/query-cpus", args, test_query_cp=
us);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BJfnte20rY0bAaQQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBZPn0ACgkQbDjKyiDZ
s5Ktlw/+J2MWJBFQh1fOGrQBwiipwK/xy2wpt04KG4EVXCT/b4JKiNQVJi9AK8ZO
vJIbFWuaukyRC/D9cglVQlYErMdYRPwlmJNCJpkbFnf3aiKTrbarmX+QaRMeBXVO
0F7prXZX4arcp0dE4ozuVsBiVjeKCLV0bAV7CO0LMaROxUx+n2r95aeLDbJr8bIz
HfDMo3o1M+7RsSGdigqRaCpCQkMececqHtYybw/rUOa2lrMsOtjMECTRBGPgPs/j
4UdPckFtHbpCDGjHIKJ46Lao3I9Plw2D+N0b3VrQZr0PiDIXAOwZmkddCzmiQhQX
cojFf1yt6EgvK5UNsgPCgJ0IWqzULtSJsScGLkEF8Uv3gEU/F4DdHBbWzOGbKhRO
RmuMvtSp/CrbzRwjruY3Ei9P91zldhcjsPtzC/M3oO1JW6xQoKyxS+QIzYMvzuwi
mXu1oZ+BuYctUqimuAO2txKecMZAGYnL73FoBSGq/AomPEQpNDOd+nDMRS2a3ZIT
eSgaOjoOAU7TUqVhP2S6qgyw2H8O7trrfU6vwKpcUR0L4DZz9aFtZX7IwnR+rvL9
oZH7FH6/5MEkX9+E3CTk1ApBUUbLpxt9pryOK0yrIh42nUFKuT+tCuRMGnC5leTj
Ce5hNaLfhjjsKMsuWs8T0604xhxr0rKrRf62ejsqUpkiT7C+yWw=
=5Kt/
-----END PGP SIGNATURE-----

--BJfnte20rY0bAaQQ--

