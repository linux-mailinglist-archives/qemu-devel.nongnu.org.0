Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF193D596E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:26:59 +0200 (CEST)
Received: from localhost ([::1]:48140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zhC-0007kv-M0
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7zgH-0006WJ-SS
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:26:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48684 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7zgF-0005ye-Tz
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:26:01 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn0LSqf5gZxMkAA--.23458S3; 
 Mon, 26 Jul 2021 20:25:55 +0800 (CST)
Subject: Re: [PATCH v2 11/22] target/loongarch: Add fixed point atomic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-12-git-send-email-gaosong@loongson.cn>
 <1b4f41a3-1f7c-6eaa-d0d4-e676888fdc98@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <c7c20423-a027-5f93-bb15-9b483dc0be58@loongson.cn>
Date: Mon, 26 Jul 2021 20:25:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1b4f41a3-1f7c-6eaa-d0d4-e676888fdc98@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn0LSqf5gZxMkAA--.23458S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCryruF1UAF4kCF1xJr1rCrg_yoWrJry5pr
 18Jr1UJryUJr18Jr1UJr1UJryUJr1UJw1UJr1UJF1UJr1UJr1jqr1UXr1jgr1UJr48Jr1U
 Jr1UJr1UZr1UJrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
 JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
 07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8V
 W5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbE_M3UUUUU==
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

On 07/23/2021 09:49 AM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +#define TRANS_AM_W(name, op)                                      \
>> +static bool trans_ ## name(DisasContext *ctx, arg_ ## name * a)   \
>> +{                                                                 \
>> +    TCGv addr, val, ret;                                          \
>> +    TCGv Rd = cpu_gpr[a->rd];                                     \
>> +    int mem_idx = ctx->mem_idx;                                   \
>> +                                                                  \
>> +    if (a->rd == 0) {                                             \
>> +        return true;                                              \
>> +    }                                                             \
>> +    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) { \
>> +        printf("%s: warning, register equal\n", __func__);        \
>> +        return false;                                             \
>> +    }                                                             \
>> +                                                                  \
>> +    addr = get_gpr(a->rj);                                        \
>> +    val = get_gpr(a->rk);                                         \
>> +    ret = tcg_temp_new();                                         \
>> +                                                                  \
>> +    tcg_gen_atomic_##op##_tl(ret, addr, val, mem_idx, MO_TESL |   \
>> +                            ctx->default_tcg_memop_mask);         \
>> +    tcg_gen_mov_tl(Rd, ret);                                      \
>> +                                                                  \
>> +    tcg_temp_free(ret);                                           \
>> +                                                                  \
>> +    return true;                                                  \
>> +}
> 
> No printf.  Use a common routine instead of macros.
> 
OK.

Thanks
Song Gao.
> 
> r~


