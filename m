Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F073DFC4D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 09:52:26 +0200 (CEST)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBBhR-0005Ic-7x
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 03:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mBBgI-0004ZT-Be
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 03:51:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52714 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mBBgE-0000v4-Ab
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 03:51:13 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0HmRgphwkcqAA--.30637S3; 
 Wed, 04 Aug 2021 15:51:03 +0800 (CST)
Subject: Re: [PATCH v2 12/22] target/loongarch: Add fixed point extra
 instruction translation
From: Song Gao <gaosong@loongson.cn>
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-13-git-send-email-gaosong@loongson.cn>
 <7a500d72-7d16-1a02-2ede-5e07f1383812@linaro.org>
 <d9b20db9-ee1d-7860-45c3-c618399cfa52@loongson.cn>
Message-ID: <e3220f79-cb43-2d37-4166-e3f12e204bd8@loongson.cn>
Date: Wed, 4 Aug 2021 15:51:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d9b20db9-ee1d-7860-45c3-c618399cfa52@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0HmRgphwkcqAA--.30637S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4fWw1UJF43Kw45GrWUCFg_yoWkArcEqw
 1Uur1rXryDt3yftrnYyr1DZrZFkr4jyr1ftw4Y9r9rXan2kas5JryrWas3Zry7Gr4rXr9x
 Jr9Fqay7XFyjqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbhxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r10
 6r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 alex.bennee@linaro.org, yangxiaojuan@loongson.cn, maobibo@loongson.cn,
 qemu-devel@nongnu.org, alistair.francis@wdc.com, pbonzini@redhat.com,
 philmd@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 08/04/2021 03:40 PM, Song Gao wrote:
> 
> On 07/23/2021 01:12 PM, Richard Henderson wrote:
>>> +static bool trans_asrtle_d(DisasContext *ctx, arg_asrtle_d * a)
>>> +{
>>> +    TCGv t0, t1;
>>> +
>>> +    t0 = get_gpr(a->rj);
>>> +    t1 = get_gpr(a->rk);
>>> +
>>> +    gen_helper_asrtle_d(cpu_env, t0, t1);
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
>>> +{
>>> +    TCGv t0, t1;
>>> +
>>> +    t0 = get_gpr(a->rj);
>>> +    t1 = get_gpr(a->rk);
>>> +
>>> +    gen_helper_asrtgt_d(cpu_env, t0, t1);
>>> +
>>> +    return true;
>>> +}
>>
>> I'm not sure why both of these instructions are in the ISA, since
>>
>>   ASRTLE X,Y <-> ASRTGT Y,X
>>
>> but we certainly don't need two different helpers.
>> Just swap the arguments for one of them.
> 
> Hi, Richard.
> 
> I find 'ASRTLE X,Y <-> ASRTGT Y,X ' is not right,
>  
>     ASRTLE X, Y is X <= Y, raise a exception.
>     ASRTGT Y, X is X < Y, raise a exception, lose X=Y.
> 

sorry, I said it wrong。

     ASRTLE X, Y is X > Y,  raise a exception.
     ASRTGT Y, X is X >= Y  raise a exception.  more X=Y.

> Thanks
> Song Gao
> 


