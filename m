Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0EF3D58F8
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:59:06 +0200 (CEST)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zGE-0001Yf-1T
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m7zF6-0000Nm-Rk
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:57:56 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44140 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m7zF5-0000B1-1K
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:57:56 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxQOI+o_5g6hAkAA--.48844S3; 
 Mon, 26 Jul 2021 19:57:52 +0800 (CST)
Subject: Re: [PATCH v2 08/22] target/loongarch: Add fixed point shift
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-9-git-send-email-gaosong@loongson.cn>
 <1a19e8ba-e408-7952-9bea-2022a78f67f2@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <41881809-607b-5171-f16a-c2cbb11e2f37@loongson.cn>
Date: Mon, 26 Jul 2021 19:57:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1a19e8ba-e408-7952-9bea-2022a78f67f2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxQOI+o_5g6hAkAA--.48844S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWkJw1DuF1DZFy3ZF1fJFb_yoWfJrb_Aw
 48Wr4FvF1DX3y5tr1rGry5ZasrAr4qkw1ktws09r97G3ZrtFs5Jr1rGas5JFZrKF43Cry7
 Wr93X3WftF12qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
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

On 07/23/2021 08:51 AM, Richard Henderson wrote:
> On 7/20/21 11:53 PM, Song Gao wrote:
>> +/* Fixed point shift operation instruction translation */
>> +static bool trans_sll_w(DisasContext *ctx, arg_sll_w *a)
>> +{
>> +    TCGv t0, t1;
>> +    TCGv Rd = cpu_gpr[a->rd];
>> +
>> +    if (a->rd == 0) {
>> +        /* Nop */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_new();
>> +    t1 = get_gpr(a->rj);
>> +
>> +    gen_load_gpr(t0, a->rk);
>> +
>> +    tcg_gen_andi_tl(t0, t0, 0x1f);
>> +    tcg_gen_shl_tl(t0, t1, t0);
>> +    tcg_gen_ext32s_tl(Rd, t0);
>> +
>> +    tcg_temp_free(t0);
>> +
>> +    return true;
>> +}
> 
> Again, you should be using common helper functions for this instead of replicating the same pattern 16 times.
> 

OK. 

Thanks
Song Gao


