Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843516CB372
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 03:56:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgyZR-000870-S0; Mon, 27 Mar 2023 21:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgyZP-0007vz-41; Mon, 27 Mar 2023 21:56:19 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgyZL-0004Iz-Ru; Mon, 27 Mar 2023 21:56:18 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowACXnkIuSSJkyxcWCw--.8922S2;
 Tue, 28 Mar 2023 09:56:00 +0800 (CST)
Message-ID: <ae53e46c-b7e2-c986-a797-06a2630cc393@iscas.ac.cn>
Date: Tue, 28 Mar 2023 09:55:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
To: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
 <8fed2551-a67d-cd53-f5a1-f089f980aa08@linaro.org>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <8fed2551-a67d-cd53-f5a1-f089f980aa08@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXnkIuSSJkyxcWCw--.8922S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyxCFy8Kw47tF4DWrW7urg_yoWxKrb_tw
 4UWr4xZwsFqw4DK3W5Jry5Zr18Jw1jywn2qrs7Ar97XrW5JFZxJr1Sywn5J343GF4Utr1x
 tw15WryfAa4UWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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


On 2023/3/28 02:04, Richard Henderson wrote:
> On 3/27/23 03:00, Weiwei Li wrote:
>> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>> address, int size,
>>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx 
>> %d\n",
>>                     __func__, address, access_type, mmu_idx);
>>   +    if (access_type == MMU_INST_FETCH) {
>> +        address = adjust_pc_address(env, address);
>> +    }
>
> Why do you want to do this so late, as opposed to earlier in 
> cpu_get_tb_cpu_state?

In this way, the pc for tb may be different from the reg pc. Then the pc 
register will be wrong if sync from tb.

Regards,

Weiwei Li

>
>
> r~


