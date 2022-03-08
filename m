Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235984D1272
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:41:12 +0100 (CET)
Received: from localhost ([::1]:41068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVP4-0001dM-TR
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVNI-0000tC-Dl
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:39:20 -0500
Received: from [2001:41c9:1:41f::167] (port=34198
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVNG-0001Xt-Mz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:39:20 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVMV-0004Rk-0o; Tue, 08 Mar 2022 08:38:35 +0000
Message-ID: <9462028f-3285-a399-4158-068aaaed28cf@ilande.co.uk>
Date: Tue, 8 Mar 2022 08:39:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-32-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220308072005.307955-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 31/33] hw/nios2: Introduce Nios2MachineState
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2022 07:20, Richard Henderson wrote:

> We want to move data from the heap into Nios2MachineState,
> which is not possible with DEFINE_MACHINE.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/nios2/10m50_devboard.c | 28 +++++++++++++++++++++++++---
>   1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index 3d1205b8bd..f245e0baa8 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -36,10 +36,18 @@
>   
>   #include "boot.h"
>   
> +struct Nios2MachineState {
> +    MachineState parent_obj;
> +};
> +
> +#define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
> +OBJECT_DECLARE_TYPE(Nios2MachineState, MachineClass, NIOS2_MACHINE)
> +
>   #define BINARY_DEVICE_TREE_FILE    "10m50-devboard.dtb"
>   
>   static void nios2_10m50_ghrd_init(MachineState *machine)
>   {
> +    Nios2MachineState *nms = NIOS2_MACHINE(machine);
>       Nios2CPU *cpu;
>       DeviceState *dev;
>       MemoryRegion *address_space_mem = get_system_memory();
> @@ -101,15 +109,29 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>       cpu->exception_addr = 0xc8000120;
>       cpu->fast_tlb_miss_addr = 0xc0000100;
>   
> -    nios2_load_kernel(cpu, ram_base, ram_size, machine->initrd_filename,
> +    nios2_load_kernel(cpu, ram_base, ram_size, nms->parent_obj.initrd_filename,
>                         BINARY_DEVICE_TREE_FILE, NULL);

I think you should be able to keep this as machine->initrd_filename? Certainly there 
should be no direct access to parent_obj here, and if you did need it a QOM cast 
macro would be the way to do this.

>   }
>   
> -static void nios2_10m50_ghrd_machine_init(struct MachineClass *mc)
> +static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
>   {
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
>       mc->desc = "Altera 10M50 GHRD Nios II design";
>       mc->init = nios2_10m50_ghrd_init;
>       mc->is_default = true;
>   }
>   
> -DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
> +static const TypeInfo nios2_10m50_ghrd_type_info = {
> +    .name          = TYPE_NIOS2_MACHINE,
> +    .parent        = TYPE_MACHINE,
> +    .instance_size = sizeof(Nios2MachineState),
> +    .class_size    = sizeof(MachineClass),

Technically you can drop .class_size here since this should be inherited 
automatically from MachineClass.

> +    .class_init    = nios2_10m50_ghrd_class_init,
> +};
> +
> +static void nios2_10m50_ghrd_type_init(void)
> +{
> +    type_register_static(&nios2_10m50_ghrd_type_info);
> +}
> +type_init(nios2_10m50_ghrd_type_init);


ATB,

Mark.

