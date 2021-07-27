Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17193D70EB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:10:45 +0200 (CEST)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8IAm-0006z5-Qk
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m8I8C-0004LI-Kb
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:08:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57180 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m8I89-0002e2-2m
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:08:04 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0DZvv9gAHUkAA--.23929S3; 
 Tue, 27 Jul 2021 16:07:55 +0800 (CST)
Subject: Re: [PATCH v2 18/22] target/loongarch: Add branch instruction
 translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-19-git-send-email-gaosong@loongson.cn>
 <d721302e-ddcf-95d1-f39d-35afd25999ce@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <7a54a840-ee59-988a-59da-cd11d7846417@loongson.cn>
Date: Tue, 27 Jul 2021 16:07:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <d721302e-ddcf-95d1-f39d-35afd25999ce@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0DZvv9gAHUkAA--.23929S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWkJw4rAF47WF47WF17KFg_yoWDWrb_Xw
 4UWr18Zr15J3yUAr18Jr1rZ347JrnFyw1xtrs0k34Du3W3Jrs5Ars5Jas5AFy7Gr45Jry7
 WryfW3W3tF1UXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
 6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
 e2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY2
 0_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAI
 cVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JULID7UUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
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
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi, Richard.

On 07/23/2021 02:38 PM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +/* Branch Instructions translation */
>> +static bool trans_beqz(DisasContext *ctx, arg_beqz *a)
>> +{
>> +    TCGv t0, t1;
>> +    int bcond_flag = 0;
>> +
>> +    t0 = tcg_temp_new();
>> +    t1 = tcg_const_i64(0);
>> +
>> +    if (a->rj != 0) {
>> +        gen_load_gpr(t0, a->rj);
>> +        bcond_flag = 1;
>> +    }
>> +
>> +    if (bcond_flag == 0) {
>> +        ctx->hflags |= LOONGARCH_HFLAG_B;
>> +    } else {
>> +        tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
>> +        ctx->hflags |= LOONGARCH_HFLAG_BC;
>> +    }
>> +    ctx->btarget = ctx->base.pc_next + (a->offs21 << 2);
>> +
>> +    tcg_temp_free(t0);
>> +    tcg_temp_free(t1);
>> +
>> +    return true;
>> +}
> 
> Drop all of the branch delay slot stuff.
> Use a common routine and pass in the TCGCond.
>
OK> 
> r~

Thanks 
Song Gao.


