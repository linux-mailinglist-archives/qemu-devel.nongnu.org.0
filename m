Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757904AC15B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:36:50 +0100 (CET)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH58L-0007TZ-51
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH4tY-00016r-5F; Mon, 07 Feb 2022 09:21:32 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33676 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH4tT-0005Tm-AV; Mon, 07 Feb 2022 09:21:29 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 5EB826080AD5;
 Mon,  7 Feb 2022 15:21:17 +0100 (CET)
Message-ID: <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
Date: Mon, 7 Feb 2022 15:21:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220127154639.2090164-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, sstabellini@kernel.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, michal.simek@xilinx.com,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 27.01.22 16:46, Peter Maydell wrote:
> Change the Xilinx ZynqMP-based board xlnx-zcu102 to use the new
> boot.c functionality to allow us to enable psci-conduit only if
> the guest is being booted in EL1 or EL2, so that if the user runs
> guest EL3 firmware code our PSCI emulation doesn't get in its
> way.
>
> To do this we stop setting the psci-conduit property on the CPU
> objects in the SoC code, and instead set the psci_conduit field in
> the arm_boot_info struct to tell the common boot loader code that
> we'd like PSCI if the guest is starting at an EL that it makes
> sense with.
>
> Note that this means that EL3 guest code will have no way
> to power on secondary cores, because we don't model any
> kind of power controller that does that on this SoC.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


It's been a while since I worked with ZynqMP, but typically your ATF in 
EL3 will want to talk to a microblaze firmware blob on the PMU.

I only see a stand alone PMU machine for microblaze and a PMU IRQ 
handling I/O block in QEMU, but nothing that would listen to the events. 
So I'm fairly sure it will be broken after this patch - and really only 
worked by accident before.

I've added Michal Simek and Stefano Stabellini (both Xilinx) to CC to 
clarify and determine the best path forward here - either disallow EL3 
in the model or build proper PMU emulation in QEMU which then handles 
those PSCI triggered IPI events.


Alex

[1] 
https://github.com/Xilinx/arm-trusted-firmware/blob/master/plat/xilinx/zynqmp/plat_psci.c


> ---
> Again, if anybody knows the real-hardware EL3 behaviour for
> CPUs that would be great.
> ---
>   hw/arm/xlnx-zcu102.c |  1 +
>   hw/arm/xlnx-zynqmp.c | 13 ++++++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 45eb19ab3b7..4c84bb932aa 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -236,6 +236,7 @@ static void xlnx_zcu102_init(MachineState *machine)
>       s->binfo.ram_size = ram_size;
>       s->binfo.loader_start = 0;
>       s->binfo.modify_dtb = zcu102_modify_dtb;
> +    s->binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
>       arm_load_kernel(s->soc.boot_cpu_ptr, machine, &s->binfo);
>   }
>   
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 1c52a575aad..17305fe7b76 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -215,7 +215,10 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
>   
>           name = object_get_canonical_path_component(OBJECT(&s->rpu_cpu[i]));
>           if (strcmp(name, boot_cpu)) {
> -            /* Secondary CPUs start in PSCI powered-down state */
> +            /*
> +             * Secondary CPUs start in powered-down state.
> +             * TODO: check this is what EL3 firmware expects.
> +             */
>               object_property_set_bool(OBJECT(&s->rpu_cpu[i]),
>                                        "start-powered-off", true, &error_abort);
>           } else {
> @@ -435,12 +438,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
>       for (i = 0; i < num_apus; i++) {
>           const char *name;
>   
> -        object_property_set_int(OBJECT(&s->apu_cpu[i]), "psci-conduit",
> -                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
> -
>           name = object_get_canonical_path_component(OBJECT(&s->apu_cpu[i]));
>           if (strcmp(name, boot_cpu)) {
> -            /* Secondary CPUs start in PSCI powered-down state */
> +            /*
> +             * Secondary CPUs start in powered-down state.
> +             * TODO: check this is what EL3 firmware expects.
> +             */
>               object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>                                        "start-powered-off", true, &error_abort);
>           } else {

