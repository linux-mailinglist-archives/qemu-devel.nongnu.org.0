Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A469E1D084
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 22:23:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQdxJ-00023E-So
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 16:23:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hQdwB-0001hF-BS
	for qemu-devel@nongnu.org; Tue, 14 May 2019 16:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1hQdw9-000885-Rq
	for qemu-devel@nongnu.org; Tue, 14 May 2019 16:22:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1hQdw9-00087h-KJ; Tue, 14 May 2019 16:22:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B19728764F;
	Tue, 14 May 2019 20:22:08 +0000 (UTC)
Received: from x1.home (ovpn-117-92.phx2.redhat.com [10.3.117.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D72A608AB;
	Tue, 14 May 2019 20:22:03 +0000 (UTC)
Date: Tue, 14 May 2019 14:22:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190514142203.430c106e@x1.home>
In-Reply-To: <155785983236.11040.9618506134214930578.stgit@gimli.home>
References: <155785983236.11040.9618506134214930578.stgit@gimli.home>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 14 May 2019 20:22:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.0.1] q35: Revert to kernel irqchip
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
	ehabkost@redhat.com, mst@redhat.com, qemu-stable@nongnu.org,
	peterx@redhat.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 May 2019 13:03:31 -0600
Alex Williamson <alex.williamson@redhat.com> wrote:

> Commit b2fc91db8447 ("q35: set split kernel irqchip as default") changed
> the default for the pc-q35-4.0 machine type to use split irqchip, which
> turned out to have disasterous effects on vfio-pci INTx support.  KVM
> resampling irqfds are registered for handling these interrupts, but
> these are non-functional in split irqchip mode.  We can't simply test
> for split irqchip in QEMU as userspace handling of this interrupt is a
> significant performance regression versus KVM handling (GeForce GPUs
> assigned to Windows VMs are non-functional without forcing MSI mode or
> re-enabling kernel irqchip).
> 
> The resolution is to revert the change in default irqchip mode with a
> new pc-q35-4.0.1 machine type for qemu-stable while the development
> branch makes the same change in the pc-q35-4.1 machine type.  The
> qemu-q35-4.0 machine type should not be used in vfio-pci configurations
> for devices requiring legacy INTx support without explicitly modifying
> the VM configuration to use KVM irqchip.  This new 4.0.1 machine type
> makes this change automatically.
> 
> Link: https://bugs.launchpad.net/qemu/+bug/1826422
> Link: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03305.html

This link is superseded by a v2 of the mainline patch:

Link: https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03338.html

I believe this patch is still the proper stable backport though.  Also
to clarify, this patch should be gated on mainline acceptance of the
link above, but clearly there's no clean cherry-pick between mainline
and stable for this, so I'm proposing them in parallel.  Thanks,

Alex

> Fixes: b2fc91db8447 ("q35: set split kernel irqchip as default")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
> 
> Do we want new stable versions for other archs too or only as needed?
> 
>  hw/core/machine.c    |    3 +++
>  hw/i386/pc.c         |    3 +++
>  hw/i386/pc_q35.c     |   16 ++++++++++++++--
>  include/hw/boards.h  |    3 +++
>  include/hw/i386/pc.h |    3 +++
>  5 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 743fef28982c..5d046a43e3d2 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -24,6 +24,9 @@
>  #include "hw/pci/pci.h"
>  #include "hw/mem/nvdimm.h"
>  
> +GlobalProperty hw_compat_4_0[] = {};
> +const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
> +
>  GlobalProperty hw_compat_3_1[] = {
>      { "pcie-root-port", "x-speed", "2_5" },
>      { "pcie-root-port", "x-width", "1" },
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index f2c15bf1f2c3..d98b737b8f3b 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -115,6 +115,9 @@ struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
>  /* Physical Address of PVH entry point read from kernel ELF NOTE */
>  static size_t pvh_start_addr;
>  
> +GlobalProperty pc_compat_4_0[] = {};
> +const size_t pc_compat_4_0_len = G_N_ELEMENTS(pc_compat_4_0);
> +
>  GlobalProperty pc_compat_3_1[] = {
>      { "intel-iommu", "dma-drain", "off" },
>      { "Opteron_G3" "-" TYPE_X86_CPU, "rdtscp", "off" },
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 372c6b73bebd..45cc29d1adb7 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->units_per_default_bus = 1;
>      m->default_machine_opts = "firmware=bios-256k.bin";
>      m->default_display = "std";
> -    m->default_kernel_irqchip_split = true;
> +    m->default_kernel_irqchip_split = false;
>      m->no_floppy = 1;
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
> @@ -365,12 +365,24 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_4_0_machine_options(MachineClass *m)
> +static void pc_q35_4_0_1_machine_options(MachineClass *m)
>  {
>      pc_q35_machine_options(m);
>      m->alias = "q35";
>  }
>  
> +DEFINE_Q35_MACHINE(v4_0_1, "pc-q35-4.0.1", NULL,
> +                   pc_q35_4_0_1_machine_options);
> +
> +static void pc_q35_4_0_machine_options(MachineClass *m)
> +{
> +    pc_q35_4_0_1_machine_options(m);
> +    m->default_kernel_irqchip_split = true;
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_4_0, hw_compat_4_0_len);
> +    compat_props_add(m->compat_props, pc_compat_4_0, pc_compat_4_0_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v4_0, "pc-q35-4.0", NULL,
>                     pc_q35_4_0_machine_options);
>  
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index e231860666a1..fe1885cbffa0 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -293,6 +293,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_4_0[];
> +extern const size_t hw_compat_4_0_len;
> +
>  extern GlobalProperty hw_compat_3_1[];
>  extern const size_t hw_compat_3_1_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index ca65ef18afb4..43df7230a22b 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -293,6 +293,9 @@ int e820_add_entry(uint64_t, uint64_t, uint32_t);
>  int e820_get_num_entries(void);
>  bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
>  
> +extern GlobalProperty pc_compat_4_0[];
> +extern const size_t pc_compat_4_0_len;
> +
>  extern GlobalProperty pc_compat_3_1[];
>  extern const size_t pc_compat_3_1_len;
>  
> 


