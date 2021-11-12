Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0756744E043
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 03:26:11 +0100 (CET)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlMGY-0005j3-17
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 21:26:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mlMFW-00052I-B7
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:25:06 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45068 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mlMFT-0006w9-Mk
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 21:25:06 -0500
Received: from localhost.localdomain (unknown [10.20.42.11])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxudB00I1hL2kCAA--.5694S3;
 Fri, 12 Nov 2021 10:24:53 +0800 (CST)
Subject: Re: [RFC PATCH v2 04/30] target/loongarch: Define exceptions for
 LoongArch.
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-5-git-send-email-yangxiaojuan@loongson.cn>
 <0604327e-4434-8ebf-ecbf-b4e55dec5e78@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <4249cb0b-739c-0ca6-8a26-4edc0d45a572@loongson.cn>
Date: Fri, 12 Nov 2021 10:24:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <0604327e-4434-8ebf-ecbf-b4e55dec5e78@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9CxudB00I1hL2kCAA--.5694S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr48tFWkJF1DWF45XFyrZwb_yoWxAFX_JF
 1UAr47CrZavF9rXr15Crn8Ar45Jw4qyFy0q3W8XrnxWrWUX3s7ta12qr95Aa45trykAF43
 Gr17JFWfCrn8XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbfxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VACjcxG62k0Y48FwI0_Jr0_Gr1lYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14
 v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAq
 YI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
 0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUsJ5rUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.999,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 11/11/2021 09:36 PM, Richard Henderson wrote:
> On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
>> +++ b/target/loongarch/cpu.h
>> @@ -369,8 +369,21 @@ enum {
>>       EXCP_BREAK,
>>       EXCP_INE,
>>       EXCP_FPE,
>> -
>> -    EXCP_LAST = EXCP_FPE,
>> +    EXCP_IPE,
>> +    EXCP_TLBL,
>> +    EXCP_TLBS,
>> +    EXCP_INST_NOTAVAIL,
>> +    EXCP_TLBM,
>> +    EXCP_TLBPE,
>> +    EXCP_TLBNX,
>> +    EXCP_TLBNR,
>> +    EXCP_EXT_INTERRUPT,
>> +    EXCP_DBP,
>> +    EXCP_IBE,
>> +    EXCP_DBE,
>> +    EXCP_DINT,
>> +
>> +    EXCP_LAST = EXCP_DINT,
> 
> Surely this is (essentially) a duplicate of EXCCODE_*.
> I think we should have only one copy of this.
> 

OK, I will use EXCCODE_* directly. Thanks

Xiaojuan

> 
> r~


