Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF804ED157
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 03:33:45 +0200 (CEST)
Received: from localhost ([::1]:42490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZjh2-0002QD-9x
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 21:33:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZjd8-0008Mg-HX
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:29:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42902 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZjd6-0004cN-23
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 21:29:42 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axusz_A0ViDZETAA--.21960S3; 
 Thu, 31 Mar 2022 09:29:36 +0800 (CST)
Subject: Re: [RFC PATCH v7 11/29] target/loongarch: Add LoongArch interrupt
 and exception handle
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-12-yangxiaojuan@loongson.cn>
 <f2a59dac-34a6-b26b-31d5-59cb4dff75b4@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <cb5a2092-41d2-4d31-ab79-f79aea66cba1@loongson.cn>
Date: Thu, 31 Mar 2022 09:29:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f2a59dac-34a6-b26b-31d5-59cb4dff75b4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Axusz_A0ViDZETAA--.21960S3
X-Coremail-Antispam: 1UD129KBjvJXoWrZrW5tr17uw1fWr1kGF1UAwb_yoW8JF13pr
 1xCrW5GrW8G397Gr17Jw1UJr98Jr48Jw17XF1ft3Z8AF15Jr10qr10q3yqgFyUJw4xGF1j
 qF1rAw15uFyDX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
 IFyTuYvjfUYDGYDUUUU
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


On 2022/3/29 上午4:19, Richard Henderson wrote:
> On 3/28/22 06:57, Xiaojuan Yang wrote:
>> 1.This patch Add loongarch interrupt and exception handle.
>> 2.Rename the user excp to the exccode from the csr defintions.
>>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>   linux-user/loongarch64/cpu_loop.c             |   8 +-
>>   target/loongarch/cpu.c                        | 260 +++++++++++++++++-
>>   target/loongarch/cpu.h                        |  11 -
>>   target/loongarch/fpu_helper.c                 |   2 +-
>>   target/loongarch/insn_trans/trans_extra.c.inc |   4 +-
>>   target/loongarch/translate.c                  |   2 +-
>>   6 files changed, 261 insertions(+), 26 deletions(-)
>
> To repeat my response to the cover letter, the changes in this patch 
> should be folded back into the original patches defining the base 
> architecture.
>
Agreed,  I think we can use this patch in new series,  but we need 
remove '2. Rename the user excp to the excode from the csr defintions'.

Thanks.
Xiaojuan
>
> r~


