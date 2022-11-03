Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB0617B8B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:32:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqYJ9-0001R9-H2; Thu, 03 Nov 2022 07:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huqi@loongson.cn>) id 1oqYIy-0001QH-Uh
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:22:40 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huqi@loongson.cn>) id 1oqYIw-0004Sq-Bb
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:22:40 -0400
Received: from loongson.cn (unknown [10.90.50.23])
 by gateway (Coremail) with SMTP id _____8CxjdpxpGNjMjgEAA--.14569S3;
 Thu, 03 Nov 2022 19:22:25 +0800 (CST)
Received: from [10.90.50.23] (unknown [10.90.50.23])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx9VZxpGNjydYLAA--.15879S3; 
 Thu, 03 Nov 2022 19:22:25 +0800 (CST)
Message-ID: <3beb23f8-0a7b-26c0-65d8-77a552d1b61b@loongson.cn>
Date: Thu, 3 Nov 2022 19:22:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3] target/i386: Fix calculation of LOCK NEG eflags
Content-Language: en-US
From: Qi Hu <huqi@loongson.cn>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-devel@nongnu.org, Jinyang Shen <shenjinyang@loongson.cn>,
 Xuehai Chen <chenxuehai@loongson.cn>
References: <20221024084155.713121-1-huqi@loongson.cn>
In-Reply-To: <20221024084155.713121-1-huqi@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx9VZxpGNjydYLAA--.15879S3
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQATCWNiXeMb7QABsT
X-Coremail-Antispam: 1Uk129KBjvJXoWxJryfXryUuryDJrW8GFWxZwb_yoW8GFW8pF
 ZrCry0kay8Jr4UC3ZrWrWUKr4Uuws8CFykZa9Fyrn5Jwn8Xw1kXr1qk3y5GF4F9ayFgFyr
 ZF98uFWDCayjqa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==
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

ping

On 2022/10/24 16:41, Qi Hu wrote:
> In sequence:
> ---
> lock negl -0x14(%rbp)
> pushf
> pop    %rax
> ---
>
> %rax will obtain the wrong value becasue the "lock neg" calculates the
> wrong eflags. The "s->T0" is updated by the wrong value.
>
> You can use this to do some test:
> ---
> #include <assert.h>
>
> int main()
> {
>    __volatile__ unsigned test = 0x2363a;
>    __volatile__ char cond = 0;
>    asm(
>        "lock negl %0 \n\t"
>        "sets %1"
>        : "=m"(test), "=r"(cond)
>        :
>        :);
>    assert(cond & 1);
>    return 0;
> }
> ---
>
> Reported-by: Jinyang Shen <shenjinyang@loongson.cn>
> Co-Developed-by: Xuehai Chen <chenxuehai@loongson.cn>
> Signed-off-by: Xuehai Chen <chenxuehai@loongson.cn>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
> V2 -> V3:
> Fix typo "caculation".
>
> V1 -> V2:
> Following Richard's suggestion, just change mov to neg instead of using
> local_tmp.
> ---
>   target/i386/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index e19d5c1c64..cec2182080 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -3299,7 +3299,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
>   
>                   tcg_temp_free(t2);
>                   tcg_temp_free(a0);
> -                tcg_gen_mov_tl(s->T0, t0);
> +                tcg_gen_neg_tl(s->T0, t0);
>                   tcg_temp_free(t0);
>               } else {
>                   tcg_gen_neg_tl(s->T0, s->T0);


