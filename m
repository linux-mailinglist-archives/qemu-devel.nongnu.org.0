Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE44612082
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 07:20:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooeE0-0007SO-Qx; Sat, 29 Oct 2022 01:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ood8M-0003JL-Mq
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 00:07:47 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oocqh-0002F2-4T
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 23:49:32 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxXbfJolxjDDgDAA--.2876S3;
 Sat, 29 Oct 2022 11:49:29 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxLeDIolxj+rcGAA--.23047S3; 
 Sat, 29 Oct 2022 11:49:28 +0800 (CST)
Subject: Re: [PATCH v2 1/3] hw/loongarch: Load FDT table into dram memory space
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, philmd@linaro.org
References: <20221028014007.2718352-1-yangxiaojuan@loongson.cn>
 <20221028014007.2718352-2-yangxiaojuan@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <7ccb0d9a-98f7-e674-2c2b-8290310a0bfb@loongson.cn>
Date: Sat, 29 Oct 2022 11:49:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20221028014007.2718352-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxLeDIolxj+rcGAA--.23047S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCF43ZryUZF15Aw4UArW7CFg_yoW5WFW8pF
 9xCFn5Wr40qrn7Wrn2qa4DuFyDAwn7Ka429FW7Cr4FkF9rWr10grW8A3yqkFy8A395JF4F
 vFyvgrZaq3W8JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8xOz3UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 39
X-Spam_score: 3.9
X-Spam_bar: +++
X-Spam_report: (3.9 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


ÔÚ 2022/10/28 ÉÏÎç9:40, Xiaojuan Yang Ð´µÀ:
> Load FDT table into dram memory space, and the addr is 2 MiB.
> Since lowmem region starts from 0, FDT base address is located
> at 2 MiB to avoid NULL pointer access.
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/virt.c         | 18 +++++++++++-------
>   include/hw/loongarch/virt.h |  3 ---
>   2 files changed, 11 insertions(+), 10 deletions(-)
Acked-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 29df99727d..fe33e7e3e4 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -159,7 +159,6 @@ static void fdt_add_pcie_node(const LoongArchMachineState *lams)
>                                    1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
>                                    2, base_mmio, 2, size_mmio);
>       g_free(nodename);
> -    qemu_fdt_dumpdtb(ms->fdt, lams->fdt_size);
>   }
>   
>   static void fdt_add_irqchip_node(LoongArchMachineState *lams)
> @@ -689,6 +688,7 @@ static void loongarch_init(MachineState *machine)
>       MemoryRegion *address_space_mem = get_system_memory();
>       LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>       int i;
> +    hwaddr fdt_base;
>   
>       if (!cpu_model) {
>           cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
> @@ -793,12 +793,16 @@ static void loongarch_init(MachineState *machine)
>       lams->machine_done.notify = virt_machine_done;
>       qemu_add_machine_init_done_notifier(&lams->machine_done);
>       fdt_add_pcie_node(lams);
> -
> -    /* load fdt */
> -    MemoryRegion *fdt_rom = g_new(MemoryRegion, 1);
> -    memory_region_init_rom(fdt_rom, NULL, "fdt", VIRT_FDT_SIZE, &error_fatal);
> -    memory_region_add_subregion(get_system_memory(), VIRT_FDT_BASE, fdt_rom);
> -    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, VIRT_FDT_BASE);
> +    /*
> +     * Since lowmem region starts from 0, FDT base address is located
> +     * at 2 MiB to avoid NULL pointer access.
> +     *
> +     * Put the FDT into the memory map as a ROM image: this will ensure
> +     * the FDT is copied again upon reset, even if addr points into RAM.
> +     */
> +    fdt_base = 2 * MiB;
> +    qemu_fdt_dumpdtb(machine->fdt, lams->fdt_size);
> +    rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, fdt_base);
>   }
>   
>   bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index 09f1c88ee5..45c383f5a7 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -28,9 +28,6 @@
>   #define VIRT_GED_MEM_ADDR       (VIRT_GED_EVT_ADDR + ACPI_GED_EVT_SEL_LEN)
>   #define VIRT_GED_REG_ADDR       (VIRT_GED_MEM_ADDR + MEMORY_HOTPLUG_IO_LEN)
>   
> -#define VIRT_FDT_BASE           0x1c400000
> -#define VIRT_FDT_SIZE           0x100000
> -
>   struct LoongArchMachineState {
>       /*< private >*/
>       MachineState parent_obj;


