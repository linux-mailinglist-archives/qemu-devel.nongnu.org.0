Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31A103DF2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 16:05:17 +0100 (CET)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXRXg-0002P8-RQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 10:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iXRWA-0001IZ-Fn
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:03:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iXRW8-0006pZ-QR
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:03:41 -0500
Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167]:37909)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iXRW8-0006p0-Cg
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:03:40 -0500
Received: from player714.ha.ovh.net (unknown [10.109.160.39])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id DD49225AFED
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 16:03:37 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 64587C46C784;
 Wed, 20 Nov 2019 15:03:29 +0000 (UTC)
Date: Wed, 20 Nov 2019 16:03:27 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] pseries: fix migration-test and pxe-test
Message-ID: <20191120160327.62814af1@bahia.lan>
In-Reply-To: <20191120142539.236279-1-lvivier@redhat.com>
References: <20191120142539.236279-1-lvivier@redhat.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6181471966354774310
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudehtddgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.47.167
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
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Nov 2019 15:25:39 +0100
Laurent Vivier <lvivier@redhat.com> wrote:

> Commit 29cb4187497d ("spapr: Set VSMT to smp_threads by default")
> has introduced a new default value for VSMT that is not supported
> by old kernels (before 4.13 kernel) and this breaks "make check"
> on these kernels.
> 
> To fix that, explicitly set in the involved tests the value that was
> used as the default value before the change.
> 

Some more details: the 'make check' failure was observed on a POWER8 host
with an old kernel RHEL7 kernel without VSMT support. Passing vsmt=8 to QEMU
causes spapr_set_vsmt_mode() to simply not even try to change the VSMT in KVM
since POWER8 hosts are SMT8 by default, and the VM starts just fine.

> Cc: Greg Kurz <groug@kaod.org>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

I could also check this is doesn't break the following setups:
- KVM HV on POWER9 host
- KVM PR on POWER8 host (just spits a non-fatal warning)
- TCG

Note that migration-test explicitly requires KVM HV. It simply
exits otherwise.

Tested-by: Greg Kurz <groug@kaod.org>

>  tests/migration-test.c | 4 ++--
>  tests/pxe-test.c       | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/migration-test.c b/tests/migration-test.c
> index ac780dffdaad..ebd77a581aff 100644
> --- a/tests/migration-test.c
> +++ b/tests/migration-test.c
> @@ -614,7 +614,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>          end_address = S390_TEST_MEM_END;
>      } else if (strcmp(arch, "ppc64") == 0) {
>          extra_opts = use_shmem ? get_shmem_opts("256M", shmem_path) : NULL;
> -        cmd_src = g_strdup_printf("-machine accel=%s -m 256M -nodefaults"
> +        cmd_src = g_strdup_printf("-machine accel=%s,vsmt=8 -m 256M -nodefaults"
>                                    " -name source,debug-threads=on"
>                                    " -serial file:%s/src_serial"
>                                    " -prom-env 'use-nvramrc?=true' -prom-env "
> @@ -623,7 +623,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>                                    "until' %s %s",  accel, tmpfs, end_address,
>                                    start_address, extra_opts ? extra_opts : "",
>                                    opts_src);
> -        cmd_dst = g_strdup_printf("-machine accel=%s -m 256M"
> +        cmd_dst = g_strdup_printf("-machine accel=%s,vsmt=8 -m 256M"
>                                    " -name target,debug-threads=on"
>                                    " -serial file:%s/dest_serial"
>                                    " -incoming %s %s %s",
> diff --git a/tests/pxe-test.c b/tests/pxe-test.c
> index 948b0fbdc727..aaae54f7550d 100644
> --- a/tests/pxe-test.c
> +++ b/tests/pxe-test.c
> @@ -46,15 +46,15 @@ static testdef_t x86_tests_slow[] = {
>  
>  static testdef_t ppc64_tests[] = {
>      { "pseries", "spapr-vlan",
> -      "-machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken" },
> +      "-machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,vsmt=8" },
>      { "pseries", "virtio-net-pci",
> -      "-machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken" },
> +      "-machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,vsmt=8" },
>      { NULL },
>  };
>  
>  static testdef_t ppc64_tests_slow[] = {
>      { "pseries", "e1000",
> -      "-machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken" },
> +      "-machine cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,vsmt=8" },
>      { NULL },
>  };
>  


