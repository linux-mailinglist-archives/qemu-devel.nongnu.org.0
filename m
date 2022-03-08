Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6494D127D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:42:30 +0100 (CET)
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRVQL-00043F-4Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:42:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVNq-0001FO-0D
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:39:55 -0500
Received: from [2001:41c9:1:41f::167] (port=34206
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVNn-0001aT-Qz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:39:53 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nRVN5-0004Sx-BU; Tue, 08 Mar 2022 08:39:11 +0000
Message-ID: <6b892f97-af51-e2d9-ab97-3f88e37e28c9@ilande.co.uk>
Date: Tue, 8 Mar 2022 08:39:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-33-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220308072005.307955-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 32/33] hw/nios2: Move memory regions into Nios2Machine
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

> Convert to contiguous allocation, as much as possible so far.
> The two timer objects are not exposed for subobject allocation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/nios2/10m50_devboard.c | 29 +++++++++++++++--------------
>   1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index f245e0baa8..f4931b8a67 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -38,6 +38,11 @@
>   
>   struct Nios2MachineState {
>       MachineState parent_obj;
> +
> +    MemoryRegion phys_tcm;
> +    MemoryRegion phys_tcm_alias;
> +    MemoryRegion phys_ram;
> +    MemoryRegion phys_ram_alias;
>   };
>   
>   #define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
> @@ -51,10 +56,6 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>       Nios2CPU *cpu;
>       DeviceState *dev;
>       MemoryRegion *address_space_mem = get_system_memory();
> -    MemoryRegion *phys_tcm = g_new(MemoryRegion, 1);
> -    MemoryRegion *phys_tcm_alias = g_new(MemoryRegion, 1);
> -    MemoryRegion *phys_ram = g_new(MemoryRegion, 1);
> -    MemoryRegion *phys_ram_alias = g_new(MemoryRegion, 1);
>       ram_addr_t tcm_base = 0x0;
>       ram_addr_t tcm_size = 0x1000;    /* 1 kiB, but QEMU limit is 4 kiB */
>       ram_addr_t ram_base = 0x08000000;
> @@ -63,22 +64,22 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>       int i;
>   
>       /* Physical TCM (tb_ram_1k) with alias at 0xc0000000 */
> -    memory_region_init_ram(phys_tcm, NULL, "nios2.tcm", tcm_size,
> +    memory_region_init_ram(&nms->phys_tcm, NULL, "nios2.tcm", tcm_size,
>                              &error_abort);
> -    memory_region_init_alias(phys_tcm_alias, NULL, "nios2.tcm.alias",
> -                             phys_tcm, 0, tcm_size);
> -    memory_region_add_subregion(address_space_mem, tcm_base, phys_tcm);
> +    memory_region_init_alias(&nms->phys_tcm_alias, NULL, "nios2.tcm.alias",
> +                             &nms->phys_tcm, 0, tcm_size);
> +    memory_region_add_subregion(address_space_mem, tcm_base, &nms->phys_tcm);
>       memory_region_add_subregion(address_space_mem, 0xc0000000 + tcm_base,
> -                                phys_tcm_alias);
> +                                &nms->phys_tcm_alias);
>   
>       /* Physical DRAM with alias at 0xc0000000 */
> -    memory_region_init_ram(phys_ram, NULL, "nios2.ram", ram_size,
> +    memory_region_init_ram(&nms->phys_ram, NULL, "nios2.ram", ram_size,
>                              &error_abort);
> -    memory_region_init_alias(phys_ram_alias, NULL, "nios2.ram.alias",
> -                             phys_ram, 0, ram_size);
> -    memory_region_add_subregion(address_space_mem, ram_base, phys_ram);
> +    memory_region_init_alias(&nms->phys_ram_alias, NULL, "nios2.ram.alias",
> +                             &nms->phys_ram, 0, ram_size);
> +    memory_region_add_subregion(address_space_mem, ram_base, &nms->phys_ram);
>       memory_region_add_subregion(address_space_mem, 0xc0000000 + ram_base,
> -                                phys_ram_alias);
> +                                &nms->phys_ram_alias);
>   
>       /* Create CPU -- FIXME */
>       cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

