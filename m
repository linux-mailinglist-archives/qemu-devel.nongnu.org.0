Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB243D5969
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:26:09 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zgO-000670-OF
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7zfY-0005LJ-V0
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:25:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48500 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7zfW-0005aO-N5
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:25:16 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv0Cmqf5gWRMkAA--.23612S3; 
 Mon, 26 Jul 2021 20:25:11 +0800 (CST)
Subject: Re: [PATCH v2 10/22] target/loongarch: Add fixed point load/store
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-11-git-send-email-gaosong@loongson.cn>
 <166c1101-fb3c-4e33-9584-121d06200af6@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <f6ec719e-229a-023f-1139-01698bb7bea1@loongson.cn>
Date: Mon, 26 Jul 2021 20:25:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <166c1101-fb3c-4e33-9584-121d06200af6@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv0Cmqf5gWRMkAA--.23612S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rXF4UuF47ZrykXrWUJwb_yoW8ZF4kpr
 18JrWUJryUJrn5Jw1UJr1UJFyUAryUJ3WDJr18X3WUAr47Jr1jgr1UXr1qgw1UJr48JryU
 Ar1UXr17Zr17JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB21xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWU
 XwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4
 x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI
 1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r
 yrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DUUUU
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

On 07/23/2021 09:45 AM, Richard Henderson wrote:
>> +/* Fixed point load/store instruction translation */
>> +static bool trans_ld_b(DisasContext *ctx, arg_ld_b *a)
>> +{
>> +    TCGv t0;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +    int mem_idx = ctx->mem_idx;
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
> 
> A load into the zero register is not a nop.  It is a load with the result discarded.  One should still fault if the load is to an invalid address.
> 
> You should be using a common routine, passing in the MO_* operand.
> 
OK.

>> +#define ASRTGT                                \
>> +    do {                                      \
>> +        TCGv t1 = get_gpr(a->rj);             \
>> +        TCGv t2 = get_gpr(a->rk);             \
>> +        gen_helper_asrtgt_d(cpu_env, t1, t2); \
>> +    } while (0)
>> +
>> +#define ASRTLE                                \
>> +    do {                                      \
>> +        TCGv t1 = get_gpr(a->rj);             \
>> +        TCGv t2 = get_gpr(a->rk);             \
>> +        gen_helper_asrtle_d(cpu_env, t1, t2); \
>> +    } while (0)
>> +
>> +#define DECL_ARG(name)   \
>> +    arg_ ## name arg = { \
>> +        .rd = a->rd,     \
>> +        .rj = a->rj,     \
>> +        .rk = a->rk,     \
>> +    };
>> +
>> +static bool trans_ldgt_b(DisasContext *ctx, arg_ldgt_b *a)
>> +{
>> +    ASRTGT;
>> +    DECL_ARG(ldx_b)
>> +    trans_ldx_b(ctx, &arg);
>> +    return true;
>> +}
> 
> Use of a common routine would avoid the macro ugliness.
OK.

Thanks you kindly help.

Thanks
Song Gao.


