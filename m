Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D990468B71B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 09:10:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOwZf-00061h-2s; Mon, 06 Feb 2023 03:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pOwZb-0005tB-8E
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:09:59 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pOwZY-0003Og-Nv
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:09:58 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8BxKurFteBj3RcPAA--.29630S3;
 Mon, 06 Feb 2023 16:09:41 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxF73EteBj3cIqAA--.16803S3; 
 Mon, 06 Feb 2023 16:09:41 +0800 (CST)
Subject: Re: [PATCH 1/1] hw/loongarch/virt: add system_powerdown hmp command
 support
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org,
 yangxiaojuan@loongson.cn, maobibo@loongson.cn
References: <20230112061144.3539393-1-gaosong@loongson.cn>
 <334a362a-7560-12ce-e3d9-12ce1602aa53@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <eedc2016-42c2-0ce4-e4ec-2839d517ac9f@loongson.cn>
Date: Mon, 6 Feb 2023 16:09:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <334a362a-7560-12ce-e3d9-12ce1602aa53@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8CxF73EteBj3cIqAA--.16803S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXw4ktFy3KryDXFWftF18Krg_yoW5uFW7pF
 ykuF18JrWUXr1kGr17t34UXFy5Jr17G3W7Xr18tFW8KFsrGr1jqrWUXw1q9F1UJ3y8Jr10
 vr1DXr17ZF17XrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.149,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Ping !!

在 2023/1/31 下午8:05, gaosong 写道:
> Ping !
>
> 在 2023/1/12 下午2:11, Song Gao 写道:
>> For loongarch virt machine, add powerdown notification callback
>> and send ACPI_POWER_DOWN_STATUS event by acpi ged. Also add
>> acpi dsdt table for ACPI_POWER_BUTTON_DEVICE device in this
>> patch.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   hw/loongarch/acpi-build.c   |  1 +
>>   hw/loongarch/virt.c         | 14 ++++++++++++++
>>   include/hw/loongarch/virt.h |  1 +
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
>> index c2b237736d..b7601cb284 100644
>> --- a/hw/loongarch/acpi-build.c
>> +++ b/hw/loongarch/acpi-build.c
>> @@ -261,6 +261,7 @@ build_la_ged_aml(Aml *dsdt, MachineState *machine)
>>                                    AML_SYSTEM_MEMORY,
>>                                    VIRT_GED_MEM_ADDR);
>>       }
>> +    acpi_dsdt_add_power_button(dsdt);
>>   }
>>     static void build_pci_device_aml(Aml *scope, 
>> LoongArchMachineState *lams)
>> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
>> index 66be925068..a4998599d3 100644
>> --- a/hw/loongarch/virt.c
>> +++ b/hw/loongarch/virt.c
>> @@ -316,6 +316,16 @@ static void virt_machine_done(Notifier 
>> *notifier, void *data)
>>       loongarch_acpi_setup(lams);
>>   }
>>   +static void virt_powerdown_req(Notifier *notifier, void *opaque)
>> +{
>> +    LoongArchMachineState *s = container_of(notifier,
>> +                                   LoongArchMachineState, 
>> powerdown_notifier);
>> +
>> +    if (s->acpi_ged) {
>> +        acpi_send_event(s->acpi_ged, ACPI_POWER_DOWN_STATUS);
>> +    }
>> +}
>> +
>>   struct memmap_entry {
>>       uint64_t address;
>>       uint64_t length;
>> @@ -859,6 +869,10 @@ static void loongarch_init(MachineState *machine)
>>                                      VIRT_PLATFORM_BUS_IRQ);
>>       lams->machine_done.notify = virt_machine_done;
>> qemu_add_machine_init_done_notifier(&lams->machine_done);
>> +     /* connect powerdown request */
>> +    lams->powerdown_notifier.notify = virt_powerdown_req;
>> + qemu_register_powerdown_notifier(&lams->powerdown_notifier);
>> +
>>       fdt_add_pcie_node(lams);
>>       /*
>>        * Since lowmem region starts from 0 and Linux kernel legacy 
>> start address
>> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
>> index f5f818894e..7ae8a91229 100644
>> --- a/include/hw/loongarch/virt.h
>> +++ b/include/hw/loongarch/virt.h
>> @@ -45,6 +45,7 @@ struct LoongArchMachineState {
>>       /* State for other subsystems/APIs: */
>>       FWCfgState  *fw_cfg;
>>       Notifier     machine_done;
>> +    Notifier     powerdown_notifier;
>>       OnOffAuto    acpi;
>>       char         *oem_id;
>>       char         *oem_table_id;


