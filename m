Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E957C336
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 06:06:37 +0200 (CEST)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oENSO-0005Ep-4o
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 00:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oENQ5-0003cF-5Z
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 00:04:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54826 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oENQ2-00005B-Lf
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 00:04:12 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxCeEg0NhiYtwrAA--.15545S3; 
 Thu, 21 Jul 2022 12:04:07 +0800 (CST)
Subject: Re: [PULL 20/21] hw/loongarch: Add acpi ged support
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
 <20220719180000.378186-21-richard.henderson@linaro.org>
 <CAFEAcA82Q60bvOxQ7HNzpiu-Uxgaq2zV8CMW3H9x+YntdG_Weg@mail.gmail.com>
From: gaosong <gaosong@loongson.cn>
Message-ID: <42522ffc-699b-7e24-f692-6e23dc5398e2@loongson.cn>
Date: Thu, 21 Jul 2022 12:03:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82Q60bvOxQ7HNzpiu-Uxgaq2zV8CMW3H9x+YntdG_Weg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxCeEg0NhiYtwrAA--.15545S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4fCFyxAr1Utw48Jw17trb_yoW8KFWrpa
 yUJFWkKF4Yqw1UCwsFgr40yFn3tw4kCasrJas7twsY93s0kF95ur48W3y2kFyxAr1UJF1D
 ZFWq9r9rZa1rtrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/7/20 下午8:10, Peter Maydell wrote:
> On Tue, 19 Jul 2022 at 19:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>
>> Loongarch virt machine uses general hardware reduces acpi method, rather
>> than LS7A acpi device. Now only power management function is used in
>> acpi ged device, memory hotplug will be added later. Also acpi tables
>> such as RSDP/RSDT/FADT etc.
>>
>> The acpi table has submited to acpi spec, and will release soon.
>>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Message-Id: <20220712083206.4187715-6-yangxiaojuan@loongson.cn>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Didn't notice this in the original CI, but this generates a compiler
> warning on openbsd:
>
> ../src/hw/loongarch/acpi-build.c:416:12: warning: variable 'aml_len'
> set but not used [-Wunused-but-set-variable]
>      size_t aml_len = 0;
>             ^
>
> and we do indeed only ever seem to set and update that variable;
> we never use it.
>
>> +static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>> +{
>> +    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
>> +    GArray *table_offsets;
>> +    AcpiFadtData fadt_data;
>> +    unsigned facs, rsdt, fadt, dsdt;
>> +    uint8_t *u;
>> +    size_t aml_len = 0;
>> +    GArray *tables_blob = tables->table_data;
>> +
>> +    init_common_fadt_data(&fadt_data);
>> +
>> +    table_offsets = g_array_new(false, true, sizeof(uint32_t));
>> +    ACPI_BUILD_DPRINTF("init ACPI tables\n");
>> +
>> +    bios_linker_loader_alloc(tables->linker,
>> +                             ACPI_BUILD_TABLE_FILE, tables_blob,
>> +                             64, false);
>> +
>> +    /*
>> +     * FACS is pointed to by FADT.
>> +     * We place it first since it's the only table that has alignment
>> +     * requirements.
>> +     */
>> +    facs = tables_blob->len;
>> +    build_facs(tables_blob);
>> +
>> +    /* DSDT is pointed to by FADT */
>> +    dsdt = tables_blob->len;
>> +    build_dsdt(tables_blob, tables->linker, machine);
>> +
>> +    /*
>> +     * Count the size of the DSDT, we will need it for
>> +     * legacy sizing of ACPI tables.
>> +     */
>> +    aml_len += tables_blob->len - dsdt;
> This comment claims we're going to use this value -- is it wrong ?
This value is unused,  I had send a patch to drop it .

Thanks.
Song Gao
> thanks
> -- PMM


