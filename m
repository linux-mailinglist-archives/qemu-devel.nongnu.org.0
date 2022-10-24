Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D90609EC9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:14:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omt0p-00029P-Es; Mon, 24 Oct 2022 04:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1omt0c-000291-FZ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:40:37 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1omt0a-0005DK-1c
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:40:34 -0400
Received: from loongson.cn (unknown [10.90.50.23])
 by gateway (Coremail) with SMTP id _____8CxbbdsT1Zj9g8CAA--.3257S3;
 Mon, 24 Oct 2022 16:40:12 +0800 (CST)
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxb+JrT1Zj_UYEAA--.16467S3; 
 Mon, 24 Oct 2022 16:40:12 +0800 (CST)
Message-ID: <af5794d3-5a16-d3d8-cf9d-6436c3df8e38@loongson.cn>
Date: Mon, 24 Oct 2022 16:40:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] target/i386: Fix caculation of LOCK NEG eflags
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
References: <20221022061216.423098-1-huqi@loongson.cn>
 <bee67948-bbdf-d9a9-854a-ebc62f170589@linaro.org>
Content-Language: en-US
From: Qi Hu <huqi@loongson.cn>
In-Reply-To: <bee67948-bbdf-d9a9-854a-ebc62f170589@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+JrT1Zj_UYEAA--.16467S3
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAJCWNVLuILnwANsi
X-Coremail-Antispam: 1Uk129KBjvJXoWrKF45WFyUuFy3Xry5Jr4rAFb_yoW8Jr43pr
 WkCFyvkayjkrn5GrnrWryDXrW5Z398Ga4kJFW7tFy5ZrZ8Xw1qqF4vqF40gFn7ua1rKF18
 AryUAF9I9F1YyFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
 AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
 Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
 xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
 JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2022/10/24 05:02, Philippe Mathieu-Daudé wrote:
> Typo "calculation" in subject.

Thanks for the reminder. It's my fault. I will send V3 to fix this typo.


Qi

>
> On 22/10/22 08:12, Qi Hu wrote:
>> In sequence:
>> ---
>> lock negl -0x14(%rbp)
>> pushf
>> pop    %rax
>> ---
>>
>> %rax will obtain the wrong value becasue the "lock neg" caculates the
>> wrong eflags. The "s->T0" is updated by the wrong value.
>>
>> You can use this to do some test:
>> ---
>> #include <assert.h>
>>
>> int main()
>> {
>>    __volatile__ unsigned test = 0x2363a;
>>    __volatile__ char cond = 0;
>>    asm(
>>        "lock negl %0 \n\t"
>>        "sets %1"
>>        : "=m"(test), "=r"(cond)
>>        :
>>        :);
>>    assert(cond & 1);
>>    return 0;
>> }
>> ---
>>
>> Reported-by: Jinyang Shen <shenjinyang@loongson.cn>
>> Co-Developed-by: Xuehai Chen <chenxuehai@loongson.cn>
>> Signed-off-by: Xuehai Chen <chenxuehai@loongson.cn>
>> Signed-off-by: Qi Hu <huqi@loongson.cn>
>> ---
>> V1 -> V2:
>> Following Richard's suggestion, just change mov to neg instead of using
>> local_tmp.
>> ---
>>   target/i386/tcg/translate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>


