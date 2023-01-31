Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A2682C33
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 13:06:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpOO-0008Hz-81; Tue, 31 Jan 2023 07:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pMpOJ-0008HI-6v
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:05:35 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pMpOG-0005jJ-Fg
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 07:05:34 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxZ+kBBNljoYUKAA--.16539S3;
 Tue, 31 Jan 2023 20:05:21 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxQuUBBNljyHklAA--.39437S3; 
 Tue, 31 Jan 2023 20:05:21 +0800 (CST)
Subject: Re: [PATCH 1/1] hw/loongarch/virt: add system_powerdown hmp command
 support
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org,
 yangxiaojuan@loongson.cn, maobibo@loongson.cn
References: <20230112061144.3539393-1-gaosong@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <334a362a-7560-12ce-e3d9-12ce1602aa53@loongson.cn>
Date: Tue, 31 Jan 2023 20:05:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230112061144.3539393-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxQuUBBNljyHklAA--.39437S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxZrWrGr4UAF1xuw48uw15Arb_yoW5Jw1Upa
 s8uFn3ua1kXryfWasFqas8ZF45Arn7Cw12vF1IkrWFkFnrKr1v9rW8C34qyFy8C3yrWFsY
 vFn5KFy3Wa1UWrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.09, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping !

ÔÚ 2023/1/12 ÏÂÎç2:11, Song Gao Ð´µÀ:
> For loongarch virt machine, add powerdown notification callback
> and send ACPI_POWER_DOWN_STATUS event by acpi ged. Also add
> acpi dsdt table for ACPI_POWER_BUTTON_DEVICE device in this
> patch.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/acpi-build.c   |  1 +
>   hw/loongarch/virt.c         | 14 ++++++++++++++
>   include/hw/loongarch/virt.h |  1 +
>   3 files changed, 16 insertions(+)
>
> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
> index c2b237736d..b7601cb284 100644
> --- a/hw/loongarch/acpi-build.c
> +++ b/hw/loongarch/acpi-build.c
> @@ -261,6 +261,7 @@ build_la_ged_aml(Aml *dsdt, MachineState *machine)
>                                    AML_SYSTEM_MEMORY,
>                                    VIRT_GED_MEM_ADDR);
>       }
> +    acpi_dsdt_add_power_button(dsdt);
>   }
>   
>   static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 66be925068..a4998599d3 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -316,6 +316,16 @@ static void virt_machine_done(Notifier *notifier, void *data)
>       loongarch_acpi_setup(lams);
>   }
>   
> +static void virt_powerdown_req(Notifier *notifier, void *opaque)
> +{
> +    LoongArchMachineState *s = container_of(notifier,
> +                                   LoongArchMachineState, powerdown_notifier);
> +
> +    if (s->acpi_ged) {
> +        acpi_send_event(s->acpi_ged, ACPI_POWER_DOWN_STATUS);
> +    }
> +}
> +
>   struct memmap_entry {
>       uint64_t address;
>       uint64_t length;
> @@ -859,6 +869,10 @@ static void loongarch_init(MachineState *machine)
>                                      VIRT_PLATFORM_BUS_IRQ);
>       lams->machine_done.notify = virt_machine_done;
>       qemu_add_machine_init_done_notifier(&lams->machine_done);
> +     /* connect powerdown request */
> +    lams->powerdown_notifier.notify = virt_powerdown_req;
> +    qemu_register_powerdown_notifier(&lams->powerdown_notifier);
> +
>       fdt_add_pcie_node(lams);
>       /*
>        * Since lowmem region starts from 0 and Linux kernel legacy start address
> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
> index f5f818894e..7ae8a91229 100644
> --- a/include/hw/loongarch/virt.h
> +++ b/include/hw/loongarch/virt.h
> @@ -45,6 +45,7 @@ struct LoongArchMachineState {
>       /* State for other subsystems/APIs: */
>       FWCfgState  *fw_cfg;
>       Notifier     machine_done;
> +    Notifier     powerdown_notifier;
>       OnOffAuto    acpi;
>       char         *oem_id;
>       char         *oem_table_id;


