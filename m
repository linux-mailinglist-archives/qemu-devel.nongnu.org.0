Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B66E5FD28D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 03:27:44 +0200 (CEST)
Received: from localhost ([::1]:48590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oin0h-0000sn-3d
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 21:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oimyj-0006xI-7Y
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 21:25:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58408 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oimyg-0003CF-D5
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 21:25:40 -0400
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxPGsMaUdjOIwsAA--.33123S3; 
 Thu, 13 Oct 2022 09:25:32 +0800 (CST)
Message-ID: <f27af3a9-c230-0c71-b64b-6d0e2b7481e5@loongson.cn>
Date: Thu, 13 Oct 2022 09:25:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Qi Hu <huqi@loongson.cn>
Subject: Re: [PATCH 1/2] tcg/loongarch64: Implement INDEX_op_neg_i{32,64}
To: WANG Xuerui <i.qemu@xen0n.name>, WANG Xuerui <git@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
References: <cover.1665405913.git.huqi@loongson.cn>
 <04454bbe9695bd7e5d56f4003ead653fb5719099.1665405913.git.huqi@loongson.cn>
 <6e6600c7-352f-2dc3-4513-db07f40bc6a4@xen0n.name>
Content-Language: en-US
In-Reply-To: <6e6600c7-352f-2dc3-4513-db07f40bc6a4@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGsMaUdjOIwsAA--.33123S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXw47Ary3uw4DCryDKF17ZFb_yoW5Cw1xpw
 1kZry5trW8AaykGr13t3WUJryUJw15X34UJF1jqF4UJa1DJw1jqr10gryagF17WFW0vry7
 AryDXr13uF4DA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
 r21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
 wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
 xUcDDGUUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQASCWNGrmAKGAABsi
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.528,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/10/12 17:41, WANG Xuerui wrote:
> Hi,
>
> On 2022/10/12 17:13, Qi Hu wrote:
>> Signed-off-by: Qi Hu <huqi@loongson.cn>
>> ---
>>   tcg/loongarch64/tcg-target.c.inc | 9 +++++++++
>>   tcg/loongarch64/tcg-target.h     | 4 ++--
>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/tcg/loongarch64/tcg-target.c.inc 
>> b/tcg/loongarch64/tcg-target.c.inc
>> index a3debf6da7..f5a214a17f 100644
>> --- a/tcg/loongarch64/tcg-target.c.inc
>> +++ b/tcg/loongarch64/tcg-target.c.inc
>> @@ -1125,6 +1125,13 @@ static void tcg_out_op(TCGContext *s, 
>> TCGOpcode opc,
>>           tcg_out_opc_nor(s, a0, a1, TCG_REG_ZERO);
>>           break;
>>   +    case INDEX_op_neg_i32:
>> +        tcg_out_opc_sub_w(s, a0, TCG_REG_ZERO, a1);
>> +        break;
>> +    case INDEX_op_neg_i64:
>> +        tcg_out_opc_sub_d(s, a0, TCG_REG_ZERO, a1);
>> +        break;
>> +
>>       case INDEX_op_nor_i32:
>>       case INDEX_op_nor_i64:
>>           if (c2) {
>> @@ -1503,6 +1510,8 @@ static TCGConstraintSetIndex 
>> tcg_target_op_def(TCGOpcode op)
>>       case INDEX_op_ext_i32_i64:
>>       case INDEX_op_not_i32:
>>       case INDEX_op_not_i64:
>> +    case INDEX_op_neg_i32:
>> +    case INDEX_op_neg_i64:
>>       case INDEX_op_extract_i32:
>>       case INDEX_op_extract_i64:
>>       case INDEX_op_bswap16_i32:
>> diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
>> index d58a6162f2..67380b2432 100644
>> --- a/tcg/loongarch64/tcg-target.h
>> +++ b/tcg/loongarch64/tcg-target.h
>> @@ -114,7 +114,7 @@ typedef enum {
>>   #define TCG_TARGET_HAS_bswap16_i32      1
>>   #define TCG_TARGET_HAS_bswap32_i32      1
>>   #define TCG_TARGET_HAS_not_i32          1
>> -#define TCG_TARGET_HAS_neg_i32          0
>> +#define TCG_TARGET_HAS_neg_i32          1
>>   #define TCG_TARGET_HAS_andc_i32         1
>>   #define TCG_TARGET_HAS_orc_i32          1
>>   #define TCG_TARGET_HAS_eqv_i32          0
>> @@ -150,7 +150,7 @@ typedef enum {
>>   #define TCG_TARGET_HAS_bswap32_i64      1
>>   #define TCG_TARGET_HAS_bswap64_i64      1
>>   #define TCG_TARGET_HAS_not_i64          1
>> -#define TCG_TARGET_HAS_neg_i64          0
>> +#define TCG_TARGET_HAS_neg_i64          1
>>   #define TCG_TARGET_HAS_andc_i64         1
>>   #define TCG_TARGET_HAS_orc_i64          1
>>   #define TCG_TARGET_HAS_eqv_i64          0
> The whole change is not necessary, if target doesn't have neg then the 
> target-independent logic already makes sure a sub with the same 
> semantics is emitted. This is explained in the commit message of that 
> commit introducing add/sub support.

That a good news. I think this patch can be absolutely ignored.

Thanks.

Qi


