Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A426ECB1E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:15:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqu9N-0005u4-6g; Mon, 24 Apr 2023 07:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pqu9K-0005lX-KS
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:14:26 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pqu9H-0002Za-K5
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:14:25 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8DxyOmCZEZkKAUAAA--.57S3;
 Mon, 24 Apr 2023 19:14:11 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxirKCZEZkKLA4AA--.11109S3; 
 Mon, 24 Apr 2023 19:14:10 +0800 (CST)
Subject: Re: [RFC PATCH v3 01/44] target/loongarch: Add LSX data type VReg
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-2-gaosong@loongson.cn>
 <a2d5ca6c-8480-4c0b-7404-611d8f238ca9@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <516e64a9-d0ab-6335-4d1e-2cc6abdf250c@loongson.cn>
Date: Mon, 24 Apr 2023 19:14:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a2d5ca6c-8480-4c0b-7404-611d8f238ca9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8AxirKCZEZkKLA4AA--.11109S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ary3AFyDKF1xCw4ftw4DXFb_yoW5JrWDpF
 1kAFyUCryUGrZ5Jw4UGry5WFWDGr1UG3WDAr18WF18KF4DJrn0grWvqr9Ygr1rAw48Jr12
 vr4UZr9rZr47JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.143,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/4/24 上午3:41, Richard Henderson 写道:
> On 4/20/23 09:06, Song Gao wrote:
>> diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
>> index b1e523ea72..a67b735a32 100644
>> --- a/target/loongarch/machine.c
>> +++ b/target/loongarch/machine.c
>> @@ -10,6 +10,112 @@
>>   #include "migration/cpu.h"
>>   #include "internals.h"
>>   +/* FPU state */
>> +static int get_fpr(QEMUFile *f, void *pv, size_t size,
>> +                   const VMStateField *field)
>> +{
>> +    fpr_t *v = pv;
>> +
>> +    qemu_get_sbe64s(f, &v->vreg.D(0));
>> +    return 0;
>> +}
>> +
>> +static int put_fpr(QEMUFile *f, void *pv, size_t size,
>> +                   const VMStateField *field, JSONWriter *vmdesc)
>> +{
>> +    fpr_t *v = pv;
>> +
>> +    qemu_put_sbe64s(f, &v->vreg.D(0));
>> +    return 0;
>> +}
>> +
>> +static const VMStateInfo vmstate_info_fpr = {
>> +    .name = "fpr",
>> +    .get  = get_fpr,
>> +    .put  = put_fpr,
>> +};
>
> These functions are old style.
> Compare target/i386/machine.c, vmstate_xmm_reg.
>
> I notice you're migrating the same data twice, between fpu and lsx.
> Compare target/i386/machine.c, vmstate_ymmh_reg, for migrating only 
> the upper half with lsx. 
Got it .
> I assume lsx without fpu is not a valid cpu configuration?
>
Yes.
>>   const VMStateDescription vmstate_loongarch_cpu = {
>>       .name = "cpu",
>>       .version_id = 0,
>>       .minimum_version_id = 0,
>>       .fields = (VMStateField[]) {
>> -
>>           VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
>>           VMSTATE_UINTTL(env.pc, LoongArchCPU),
>> -        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
>> -        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
>> -        VMSTATE_BOOL_ARRAY(env.cf, LoongArchCPU, 8),
>>             /* Remaining CSRs */
>>           VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
>> @@ -99,4 +200,8 @@ const VMStateDescription vmstate_loongarch_cpu = {
>>             VMSTATE_END_OF_LIST()
>>       },
>> +    .subsections = (const VMStateDescription*[]) {
>> +        &vmstate_fpu,
>> +        &vmstate_lsx,
>> +    }
>
> Need to increment version_id and minimum_version_id.
>
OK.

Thanks.
Song Gao


