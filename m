Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD45009FA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 11:35:05 +0200 (CEST)
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nevsW-0003cf-Bt
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 05:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nevqv-0002Zn-MB; Thu, 14 Apr 2022 05:33:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nevqs-0001Kq-IJ; Thu, 14 Apr 2022 05:33:25 -0400
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KfDgz15dVz6H6lG;
 Thu, 14 Apr 2022 17:29:51 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 14 Apr 2022 11:33:13 +0200
Received: from localhost (10.81.205.215) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 14 Apr
 2022 10:33:11 +0100
Date: Thu, 14 Apr 2022 10:33:10 +0100
To: Gavin Shan <gshan@redhat.com>
CC: "wangyanan (Y)" <wangyanan55@huawei.com>, <qemu-arm@nongnu.org>,
 <peter.maydell@linaro.org>, <drjones@redhat.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>, <imammedo@redhat.com>
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
Message-ID: <20220414103310.0000356a@Huawei.com>
In-Reply-To: <503fb329-8f39-eddb-d05a-729279934fa7@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
 <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
 <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
 <c49d80af-f68b-1b5c-a808-848172d88f89@redhat.com>
 <f02ae2ce-0256-ac85-0bb7-bd34244d9781@huawei.com>
 <503fb329-8f39-eddb-d05a-729279934fa7@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.81.205.215]
X-ClientProxiedBy: lhreml744-chm.china.huawei.com (10.201.108.194) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 14 Apr 2022 15:35:41 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Yanan,
>=20
> On 4/14/22 10:49 AM, wangyanan (Y) wrote:
> > On 2022/4/14 10:37, Gavin Shan wrote: =20
> >> On 4/14/22 10:27 AM, wangyanan (Y) wrote: =20
> >>> On 2022/4/14 8:08, Gavin Shan wrote: =20
> >>>> On 4/13/22 8:39 PM, wangyanan (Y) wrote: =20
> >>>>> On 2022/4/3 22:59, Gavin Shan wrote: =20
> >>>>>> Currently, the SMP configuration isn't considered when the CPU
> >>>>>> topology is populated. In this case, it's impossible to provide
> >>>>>> the default CPU-to-NUMA mapping or association based on the socket
> >>>>>> ID of the given CPU.
> >>>>>>
> >>>>>> This takes account of SMP configuration when the CPU topology
> >>>>>> is populated. The die ID for the given CPU isn't assigned since
> >>>>>> it's not supported on arm/virt machine yet.
> >>>>>>
> >>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>>>> ---
> >>>>>> =A0 hw/arm/virt.c | 16 +++++++++++++++-
> >>>>>> =A0 1 file changed, 15 insertions(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>>>> index d2e5ecd234..3174526730 100644
> >>>>>> --- a/hw/arm/virt.c
> >>>>>> +++ b/hw/arm/virt.c
> >>>>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cp=
u_arch_ids(MachineState *ms)
> >>>>>> =A0=A0=A0=A0=A0 int n;
> >>>>>> =A0=A0=A0=A0=A0 unsigned int max_cpus =3D ms->smp.max_cpus;
> >>>>>> =A0=A0=A0=A0=A0 VirtMachineState *vms =3D VIRT_MACHINE(ms);
> >>>>>> +=A0=A0=A0 MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >>>>>> =A0=A0=A0=A0=A0 if (ms->possible_cpus) {
> >>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 assert(ms->possible_cpus->len =3D=3D m=
ax_cpus);
> >>>>>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_c=
pu_arch_ids(MachineState *ms)
> >>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 ms->possible_cpus->cpus[n].type =3D ms=
->cpu_type;
> >>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 ms->possible_cpus->cpus[n].arch_id =3D
> >>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 virt_cpu_mp_affinity(vms, =
n);
> >>>>>> +
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0 assert(!mc->smp_props.dies_supported);
> >>>>>> + ms->possible_cpus->cpus[n].props.has_socket_id =3D true;
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0 ms->possible_cpus->cpus[n].props.socket_id =
=3D
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (n / (ms->smp.clusters * ms->sm=
p.cores * ms->smp.threads)) %
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ms->smp.sockets; =20
> >>>>> No need for "% ms->smp.sockets". =20
> >>>>
> >>>> Yeah, lets remove it in v6.
> >>>> =20
> >>>>>> + ms->possible_cpus->cpus[n].props.has_cluster_id =3D true;
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0 ms->possible_cpus->cpus[n].props.cluster_id=
 =3D
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (n / (ms->smp.cores * ms->smp.t=
hreads)) % ms->smp.clusters;
> >>>>>> + ms->possible_cpus->cpus[n].props.has_core_id =3D true;
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0 ms->possible_cpus->cpus[n].props.core_id =3D
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (n / ms->smp.threads) % ms->smp=
.cores;
> >>>>>> ms->possible_cpus->cpus[n].props.has_thread_id =3D true;
> >>>>>> -=A0=A0=A0=A0=A0=A0=A0 ms->possible_cpus->cpus[n].props.thread_id =
=3D n;
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0 ms->possible_cpus->cpus[n].props.thread_id =
=3D
> >>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 n % ms->smp.threads;
> >>>>>> =A0=A0=A0=A0=A0 }
> >>>>>> =A0=A0=A0=A0=A0 return ms->possible_cpus;
> >>>>>> =A0 } =20
> >>>>> Otherwise, looks good to me:
> >>>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> >>>>> =20
> >>>>
> >>>> Thanks for your time to review :)
> >>>>
> >>>> =20
> >>> Oh, after further testing this patch breaks numa-test for aarch64,
> >>> which should be checked and fixed. I guess it's because we have
> >>> more IDs supported for ARM. We have to fully running the QEMU
> >>> tests before sending some patches to ensure that they are not
> >>> breaking anything. :)
> >>> =20
> >>
> >> Thanks for catching the failure and reporting back. I'm not
> >> too much familar with QEMU's test workframe. Could you please
> >> share the detailed commands to reproduce the failure? I will
> >> fix in v6, which will be done in a separate patch :)
> >> =20
> > There is a reference link: https://wiki.qemu.org/Testing
> > To catch the failure of this patch: "make check" will be enough.
> >  =20

Speaking from experience, best bet is also upload to a gitlab repo
and let the CI hit things. It will catch this plus any weirdness
elsewhere without you having to figure out too much unless you see
a failure.

The CI is pretty good though more tests always needed!

Jonathan

>=20
> Thanks for the pointer. The issue is caused by ms->possible_cpus->cpus[n]=
.props.thread_id.
> Before this patch, it's value of [0 ... smp.cpus]. However, it's always z=
ero
> after this patch is applied because '%' operation is applied for the thre=
ad
> ID.
>=20
> What we need to do is to specify SMP configuration for the test case. I w=
ill
> add PATCH[v6 5/5] for it.
>=20
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index 90bf68a5b3..6178ac21a5 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -223,7 +223,7 @@ static void aarch64_numa_cpu(const void *data)
>       QTestState *qts;
>       g_autofree char *cli =3D NULL;
>  =20
> -    cli =3D make_cli(data, "-machine smp.cpus=3D2 "
> +    cli =3D make_cli(data, "-machine smp.cpus=3D2,smp.sockets=3D1,smp.co=
res=3D1,smp.threads=3D2 "
>=20
> Thanks,
> Gavin
>=20
>=20
>=20


