Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D206ECB4A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:26:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquKJ-0005jX-1Q; Mon, 24 Apr 2023 07:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pquKF-0005jF-2R
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:25:43 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pquKC-0005tm-8B
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:25:42 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8DxZPAvZ0ZklQUAAA--.71S3;
 Mon, 24 Apr 2023 19:25:35 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxkrQtZ0ZkVrI4AA--.11047S3; 
 Mon, 24 Apr 2023 19:25:33 +0800 (CST)
Subject: Re: [RFC PATCH v3 14/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-15-gaosong@loongson.cn>
 <691b8b09-6bc5-82db-f4c3-103fd98c406a@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <14bbe700-0611-f2ed-556a-9aa4a12d318b@loongson.cn>
Date: Mon, 24 Apr 2023 19:25:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <691b8b09-6bc5-82db-f4c3-103fd98c406a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxkrQtZ0ZkVrI4AA--.11047S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxAF4fAw1UKrWkKF4fXFyxKrg_yoW5Gw15pF
 1kKrWjqFyrJrn5Jr17Jrs8AFy5uw1UCw1jvr10vFW3JF4UAw10qF15urn0grs0yws5Xw45
 A34DWr9rZw18Ga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.194,
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


在 2023/4/24 下午3:15, Richard Henderson 写道:
> On 4/20/23 09:06, Song Gao wrote:
>> @@ -972,6 +972,33 @@ void tcg_gen_mulsu2_i32(TCGv_i32 rl, TCGv_i32 
>> rh, TCGv_i32 arg1, TCGv_i32 arg2)
>>       }
>>   }
>>   +void tcg_gen_mulus2_i32(TCGv_i32 rl, TCGv_i32 rh, TCGv_i32 arg1, 
>> TCGv_i32 arg2)
>> +{
>> +    if (TCG_TARGET_REG_BITS == 32) {
>> +        TCGv_i32 t0 = tcg_temp_ebb_new_i32();
>> +        TCGv_i32 t1 = tcg_temp_ebb_new_i32();
>> +        TCGv_i32 t2 = tcg_temp_ebb_new_i32();
>> +        tcg_gen_mulu2_i32(t0, t1, arg1, arg2);
>> +        /* Adjust for negative input for the signed arg2.  */
>> +        tcg_gen_sari_i32(t2, arg2, 31);
>> +        tcg_gen_and_i32(t2, t2, arg1);
>> +        tcg_gen_sub_i32(rh, t1, t2);
>> +        tcg_gen_mov_i32(rl, t0);
>> +        tcg_temp_free_i32(t0);
>> +        tcg_temp_free_i32(t1);
>> +        tcg_temp_free_i32(t2);
>> +    } else {
>> +        TCGv_i64 t0 = tcg_temp_ebb_new_i64();
>> +        TCGv_i64 t1 = tcg_temp_ebb_new_i64();
>> +        tcg_gen_extu_i32_i64(t0, arg1);
>> +        tcg_gen_ext_i32_i64(t1, arg2);
>> +        tcg_gen_mul_i64(t0, t0, t1);
>> +        tcg_gen_extr_i64_i32(rl, rh, t0);
>> +        tcg_temp_free_i64(t0);
>> +        tcg_temp_free_i64(t1);
>> +    }
>> +}
>> +
>>   void tcg_gen_ext8s_i32(TCGv_i32 ret, TCGv_i32 arg)
>>   {
>>       if (TCG_TARGET_HAS_ext8s_i32) {
>> @@ -2634,6 +2661,22 @@ void tcg_gen_mulsu2_i64(TCGv_i64 rl, TCGv_i64 
>> rh, TCGv_i64 arg1, TCGv_i64 arg2)
>>       tcg_temp_free_i64(t2);
>>   }
>>   +void tcg_gen_mulus2_i64(TCGv_i64 rl, TCGv_i64 rh, TCGv_i64 arg1, 
>> TCGv_i64 arg2)
>> +{
>> +    TCGv_i64 t0 = tcg_temp_ebb_new_i64();
>> +    TCGv_i64 t1 = tcg_temp_ebb_new_i64();
>> +    TCGv_i64 t2 = tcg_temp_ebb_new_i64();
>> +    tcg_gen_mulu2_i64(t0, t1, arg1, arg2);
>> +    /* Adjust for negative input for the signed arg2.  */
>> +    tcg_gen_sari_i64(t2, arg2, 63);
>> +    tcg_gen_and_i64(t2, t2, arg1);
>> +    tcg_gen_sub_i64(rh, t1, t2);
>> +    tcg_gen_mov_i64(rl, t0);
>> +    tcg_temp_free_i64(t0);
>> +    tcg_temp_free_i64(t1);
>> +    tcg_temp_free_i64(t2);
>> +}
>
> You don't need these.
> Just reverse the operands to the existing tcg_gen_mulsu2_*.
>
>
Ok, I'm just trying to unify  "u * s " to the macros VMUL_Q and VMADD_Q.

Thanks.
Song Gao


