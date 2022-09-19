Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F085BCB6A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 14:07:38 +0200 (CEST)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaFYm-0005oE-K2
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 08:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaFDl-000842-Pi
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 07:45:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44820 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaFDj-0004BV-2y
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 07:45:53 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxXWtlVihjVrwdAA--.50447S3; 
 Mon, 19 Sep 2022 19:45:42 +0800 (CST)
Subject: Re: [PATCH 5/5] target/loongarch: div if x/0 set dividend to 0
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 maobibo <maobibo@loongson.cn>, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org, Qi Hu <huqi@loongson.cn>
References: <20220917075950.1412309-1-gaosong@loongson.cn>
 <20220917075950.1412309-6-gaosong@loongson.cn>
 <02cd3a40-d287-35b4-9d68-979c8ebd2e29@loongson.cn>
 <df217ffa-57e1-3e71-f766-fa19770bfe33@loongson.cn>
 <95f7e7f4-f1f1-66d5-0a9f-7bcf6b4ca59a@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <e8a24cfc-005c-1196-35dd-05efdef6858b@loongson.cn>
Date: Mon, 19 Sep 2022 19:45:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <95f7e7f4-f1f1-66d5-0a9f-7bcf6b4ca59a@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxXWtlVihjVrwdAA--.50447S3
X-Coremail-Antispam: 1UD129KBjvdXoWruFyfurWDAw1rury5Ary3twb_yoW3Crc_Zr
 yfZFsrCwsIyr4ktrs3ta98JFnxtF1kJryFv3yqqr18Xa4aqF4rJryUWr40vFnFyF1DGr9I
 qrZaqFW3A34Y9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
 aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
 x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7
 I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
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


在 2022/9/17 下午6:12, Richard Henderson 写道:
> On 9/17/22 11:12, gaosong wrote:
>>
>> 在 2022/9/17 下午4:59, Qi Hu 写道:
>>>
>>> On 2022/9/17 15:59, Song Gao wrote:
>>>> div.d, div.du, div,w, div.wu, the LoongArch host if x/0  the result 
>>>> is 0.
>>>
>>> The message has a typo: "div,w" => "div.w"
>>>
>>> Also I don't know why we need to do this, since the manual say: 
>>> "When the divisor is 0, the result can be any value".
>>>
>> I tested on LoongArch host,   the result is always 0.
>
> But it is legal for a different loongarch host implementation to 
> return some other value.  Therefore the test itself is not correct.
>
I think the manual maybe not correct,  the hardware engineer said that 
they need to comfirm  whether the result is always 0.

Thanks.
Song Gao
> r~


