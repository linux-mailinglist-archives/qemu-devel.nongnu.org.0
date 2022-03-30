Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE34EBE5C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 12:07:33 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZVEi-00045n-E6
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 06:07:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZV9v-0001A0-EH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:02:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48090 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZV9t-00066V-EJ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 06:02:35 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxisyxKkRiu+4SAA--.20945S3; 
 Wed, 30 Mar 2022 18:02:25 +0800 (CST)
Subject: Re: [RFC PATCH v7 08/29] target/loongarch: Add LoongArch IOCSR
 instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-9-yangxiaojuan@loongson.cn>
 <05fbe6bd-723e-5cb6-5dc7-b7def4df7ec1@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <70a6d078-deda-8e90-f95c-f83954f31427@loongson.cn>
Date: Wed, 30 Mar 2022 18:02:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <05fbe6bd-723e-5cb6-5dc7-b7def4df7ec1@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxisyxKkRiu+4SAA--.20945S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr18trWrJr4kGFy7XF17Awb_yoW8ZF4Dpr
 1kJrWUJryUJrn5Jr1UJr1UJFyUAr1UJ3WDGr18ZF1UAr47Ar1jgr1UWr1qgr1UJr48Jr45
 Jr1UXrsrZF17XrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyT
 uYvjfUozVbDUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/3/29 上午2:55, Richard Henderson wrote:
> On 3/28/22 06:57, Xiaojuan Yang wrote:
>> +uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
>> +                           uint32_t size)
>> +{
>> +    int cpuid = env_cpu(env)->cpu_index;
>> +    CPUState  *cs = qemu_get_cpu(cpuid);
>> +    env = cs->env_ptr;
>> +    uint64_t ret;
>> +
>> +    /*
>> +     * Adjust the per core address such as 0x10xx(IPI)/0x18xx(EXTIOI)
>> +     */
>> +    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 
>> 0x1800)) {
>> +        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
>> +    }
>> +
>> +    switch (size) {
>> +    case 1:
>> +        ret = address_space_ldub(&env->address_space_iocsr, r_addr,
>> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
>> +        break;
>> +    case 2:
>> +        ret = address_space_lduw(&env->address_space_iocsr, r_addr,
>> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
>> +        break;
>> +    case 4:
>> +        ret = address_space_ldl(&env->address_space_iocsr, r_addr,
>> +                                MEMTXATTRS_UNSPECIFIED, NULL);
>> +        break;
>> +    case 8:
>> +        ret = address_space_ldq(&env->address_space_iocsr, r_addr,
>> +                                MEMTXATTRS_UNSPECIFIED, NULL);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
>
> You should have seen an uninitialized use of 'ret' here.
> The default case should be g_assert_not_reached().
> And the same in helper_iocsr_write.
>
OK.

Thanks.
Xiaojuan
>
> r~


