Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42EB5BDA0C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 04:20:14 +0200 (CEST)
Received: from localhost ([::1]:57982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaSrt-0006xj-87
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 22:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oaSqE-0004Hw-PW
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 22:18:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50228 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oaSqB-0003yb-Uw
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 22:18:30 -0400
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxT+DdIiljLUseAA--.49044S3; 
 Tue, 20 Sep 2022 10:18:06 +0800 (CST)
Message-ID: <3c401d0f-a34f-bd29-03a3-dddfae94ce0a@loongson.cn>
Date: Tue, 20 Sep 2022 10:18:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/5] target/loongarch: div if x/0 set dividend to 0
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 maobibo <maobibo@loongson.cn>, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org
References: <20220917075950.1412309-1-gaosong@loongson.cn>
 <20220917075950.1412309-6-gaosong@loongson.cn>
 <02cd3a40-d287-35b4-9d68-979c8ebd2e29@loongson.cn>
 <df217ffa-57e1-3e71-f766-fa19770bfe33@loongson.cn>
 <95f7e7f4-f1f1-66d5-0a9f-7bcf6b4ca59a@linaro.org>
 <e8a24cfc-005c-1196-35dd-05efdef6858b@loongson.cn>
From: Qi Hu <huqi@loongson.cn>
In-Reply-To: <e8a24cfc-005c-1196-35dd-05efdef6858b@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxT+DdIiljLUseAA--.49044S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1UCryrtryrJF4UZrW8Zwb_yoWkuwc_Zr
 yfur9rCwsIyan8trs5ta98JFZrtF1kAryrX39Fqw18JasIqa98JrWUGr4Ivw1jkFZ5Gr9I
 qr1FqFW3A390kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbIAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjfUoOJ5UUUUU
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQAPCWMoW90OvQADs6
Received-SPF: pass client-ip=114.242.206.163; envelope-from=huqi@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.952,
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


On 2022/9/19 19:45, gaosong wrote:
>
> 在 2022/9/17 下午6:12, Richard Henderson 写道:
>> On 9/17/22 11:12, gaosong wrote:
>>>
>>> 在 2022/9/17 下午4:59, Qi Hu 写道:
>>>>
>>>> On 2022/9/17 15:59, Song Gao wrote:
>>>>> div.d, div.du, div,w, div.wu, the LoongArch host if x/0  the 
>>>>> result is 0.
>>>>
>>>> The message has a typo: "div,w" => "div.w"
>>>>
>>>> Also I don't know why we need to do this, since the manual say: 
>>>> "When the divisor is 0, the result can be any value".
>>>>
>>> I tested on LoongArch host,   the result is always 0.
>>
>> But it is legal for a different loongarch host implementation to 
>> return some other value.  Therefore the test itself is not correct.
>>
> I think the manual maybe not correct,  the hardware engineer said that 
> they need to comfirm  whether the result is always 0.
>
> Thanks.
> Song Gao

Hi,

The hardware designers suggested that 0 should not be used as the 
default value when "div 0" occurs. The behavior is not guaranteed in 
future processors.

So I think there are some ways to solve this:

- Remove this case("div 0") from risu test.

- Keep this patch by yourself. If you want to do risu test, patch it. :-)


regards,

Qi

>> r~
>


