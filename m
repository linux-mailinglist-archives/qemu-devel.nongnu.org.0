Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F4383529
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:23:26 +0200 (CEST)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lif5Z-0000SQ-Ip
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lif08-0006ZX-MV; Mon, 17 May 2021 11:17:48 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1lif05-0005pX-AZ; Mon, 17 May 2021 11:17:48 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FkN3g4854zlfHJ;
 Mon, 17 May 2021 23:15:11 +0800 (CST)
Received: from dggema713-chm.china.huawei.com (10.3.20.77) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 23:17:26 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggema713-chm.china.huawei.com (10.3.20.77) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 17 May 2021 23:17:24 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Mon, 17 May 2021 16:17:22 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>
Subject: RE: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Thread-Topic: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Thread-Index: AQHXSj/FZmRUdZustEeQifVnUtKQiarnny9g
Date: Mon, 17 May 2021 15:17:22 +0000
Message-ID: <01351414c3424710bf3dc5eb949f0d75@huawei.com>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
 <20210516103228.37792-5-wangyanan55@huawei.com>
In-Reply-To: <20210516103228.37792-5-wangyanan55@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.69.39]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=salil.mehta@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Song Bao Hua \(Barry Song\)" <song.bao.hua@hisilicon.com>,
 zhukeqian <zhukeqian1@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>, "wangyanan
 \(Y\)" <wangyanan55@huawei.com>, "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 yangyicong <yangyicong@huawei.com>, yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Qemu-devel
> [mailto:qemu-devel-bounces+salil.mehta=3Dhuawei.com@nongnu.org] On Behalf=
 Of
> Yanan Wang
> Sent: Sunday, May 16, 2021 11:32 AM
> To: Peter Maydell <peter.maydell@linaro.org>; Paolo Bonzini
> <pbonzini@redhat.com>; Andrew Jones <drjones@redhat.com>; Michael S . Tsi=
rkin
> <mst@redhat.com>; Igor Mammedov <imammedo@redhat.com>; Shannon Zhao
> <shannon.zhaosl@gmail.com>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; Philippe
> Mathieu-Daud=E9 <philmd@redhat.com>; wangyanan (Y) <wangyanan55@huawei.co=
m>;
> Zengtao (B) <prime.zeng@hisilicon.com>; Wanghaibin (D)
> <wanghaibin.wang@huawei.com>; yuzenghui <yuzenghui@huawei.com>; yangyicon=
g
> <yangyicong@huawei.com>; zhukeqian <zhukeqian1@huawei.com>
> Subject: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
> virt_smp_parse
>=20
> There is a separate function virt_smp_parse() in hw/virt/arm.c used
> to parse cpu topology for the ARM machines. So add parsing of -smp
> cluster parameter in it, then total number of logical cpus will be
> calculated like: max_cpus =3D sockets * clusters * cores * threads.
>=20
> Note, we will assume multi-cluster in one socket is not supported
> and default the value of clusters to 1, if it's not explicitly
> specified in -smp cmdline.
>=20
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7de822e491..678d5ef36c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2642,8 +2642,8 @@ static int virt_kvm_type(MachineState *ms, const ch=
ar
> *type_str)
>   * with the -smp cmdlines when parsing them.
>   *
>   * We require that at least one of cpus or maxcpus must be provided.
> - * Threads will default to 1 if not provided. Sockets and cores must
> - * be either both provided or both not.
> + * Clusters and threads will default to 1 if they are not provided.
> + * Sockets and cores must be either both provided or both not.
>   *
>   * Note, if neither sockets nor cores are specified, we will calculate
>   * all the missing values just like smp_parse() does, but will disable
> @@ -2652,15 +2652,18 @@ static int virt_kvm_type(MachineState *ms, const =
char
> *type_str)
>  static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>  {
>      VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(ms);
> +    VirtMachineState *vms =3D VIRT_MACHINE(ms);
>=20
>      if (opts) {
>          unsigned cpus =3D qemu_opt_get_number(opts, "cpus", 0);
>          unsigned maxcpus =3D qemu_opt_get_number(opts, "maxcpus", 0);
>          unsigned sockets =3D qemu_opt_get_number(opts, "sockets", 0);
> +        unsigned clusters =3D qemu_opt_get_number(opts, "clusters", 0);
>          unsigned cores =3D qemu_opt_get_number(opts, "cores", 0);
>          unsigned threads =3D qemu_opt_get_number(opts, "threads", 0);
>=20
> -        /* Default threads to 1 if not provided */
> +        /* Default clusters and threads to 1 if not provided */
> +        clusters =3D clusters > 0 ? clusters : 1;
>          threads =3D threads > 0 ? threads : 1;
>=20
>          if (cpus =3D=3D 0 && maxcpus =3D=3D 0) {
> @@ -2676,13 +2679,13 @@ static void virt_smp_parse(MachineState *ms, Qemu=
Opts
> *opts)
>              cores =3D 1;
>              if (cpus =3D=3D 0) {
>                  sockets =3D 1;
> -                cpus =3D sockets * cores * threads;
> +                cpus =3D sockets * clusters * cores * threads;
>              } else {
>                  maxcpus =3D maxcpus > 0 ? maxcpus : cpus;
> -                sockets =3D maxcpus / (cores * threads);
> +                sockets =3D maxcpus / (clusters * cores * threads);
>              }
>          } else if (sockets > 0 && cores > 0) {
> -            cpus =3D cpus > 0 ? cpus : sockets * cores * threads;
> +            cpus =3D cpus > 0 ? cpus : sockets * clusters * cores * thre=
ads;
>              maxcpus =3D maxcpus > 0 ? maxcpus : cpus;
>          } else {
>              error_report("sockets and cores must be both provided "
> @@ -2695,25 +2698,26 @@ static void virt_smp_parse(MachineState *ms, Qemu=
Opts
> *opts)
>              exit(1);
>          }
>=20
> -        if (sockets * cores * threads < cpus) {
> +        if (sockets * clusters * cores * threads < cpus) {
>              error_report("cpu topology: "
> -                         "sockets (%u) * cores (%u) * threads (%u) < "
> -                         "smp_cpus (%u)",
> -                         sockets, cores, threads, cpus);
> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
> +                         "threads (%u) < smp_cpus (%u)",
> +                         sockets, clusters, cores, threads, cpus);
>              exit(1);
>          }
>=20
> -        if (sockets * cores * threads !=3D maxcpus) {
> +        if (sockets * clusters * cores * threads !=3D maxcpus) {
>              error_report("cpu topology: "
> -                         "sockets (%u) * cores (%u) * threads (%u) "
> -                         "!=3D maxcpus (%u)",
> -                         sockets, cores, threads, maxcpus);
> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
> +                         "threads (%u) !=3D maxcpus (%u)",
> +                         sockets, clusters, cores, threads, maxcpus);
>              exit(1);
>          }
>=20
>          ms->smp.cpus =3D cpus;
>          ms->smp.max_cpus =3D maxcpus;
>          ms->smp.sockets =3D sockets;
> +        vms->smp_clusters =3D clusters;


This variable naming *smp_clusters* looks out-of-sorts. I thought a similar
variable *smp_cpus* was destined to be removed for the reason given in belo=
w
link - a patch by Andrew Jones?

Link: https://lists.gnu.org/archive/html/qemu-arm/2020-12/msg00418.html

Am I missing anything here?

Salil.

>          ms->smp.cores =3D cores;
>          ms->smp.threads =3D threads;
>      }


