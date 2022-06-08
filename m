Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14A542F0B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 13:19:42 +0200 (CEST)
Received: from localhost ([::1]:57564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nytiv-0008Ei-GJ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 07:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nytcs-000719-HW
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:13:26 -0400
Received: from mail.ispras.ru ([83.149.199.84]:53744)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nytcp-0007VP-Sc
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:13:26 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 270A64076254;
 Wed,  8 Jun 2022 11:12:56 +0000 (UTC)
Message-ID: <3ad663e2-13eb-5f96-966a-d1a5b1a7ce9e@ispras.ru>
Date: Wed, 8 Jun 2022 14:12:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/3] target/mips: implement Octeon-specific BBIT
 instructions
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, jiaxun.yang@flygoat.com, aurelien@aurel32.net,
 aleksandar.rikalo@syrmia.com
References: <165459235408.143371.17715826203190085295.stgit@pasha-ThinkPad-X280>
 <165459236498.143371.12833007759486308114.stgit@pasha-ThinkPad-X280>
 <e168c1d2-ad41-5d6a-396a-c04af3831e30@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <e168c1d2-ad41-5d6a-396a-c04af3831e30@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.06.2022 20:06, Richard Henderson wrote:
> On 6/7/22 01:59, Pavel Dovgalyuk wrote:
>> +# Branch on bit set or clear
>> +# BBIT0      110010 ..... ..... ................
>> +# BBIT032    110110 ..... ..... ................
>> +# BBIT1      111010 ..... ..... ................
>> +# BBIT132    111110 ..... ..... ................
>> +
>> +BBIT         11 set:1 shift:1 10 rs:5 p:5 offset:16
> 
> shift + p are logically one field -- all you need to do is concatenate 
> them.
> 
> %bbit_p         28:1 16:5
> BBIT            11 set:1 . 10 rs:5 ..... offset:16  p=%bbit_p

Thank you.
I will make a new version soon.

> 
>> +    if (ctx->hflags & MIPS_HFLAG_BMASK) {
>> +#ifdef MIPS_DEBUG_DISAS
>> +        LOG_DISAS("Branch in delay / forbidden slot at PC 0x"
>> +                  TARGET_FMT_lx "\n", ctx->base.pc_next);
>> +#endif
> 
> Ifdef isn't needed -- it's always defined, even to 0.
> 
>> +    tcg_gen_andi_tl(t0, t0, 1ULL << p);
>> +
>> +    /* Jump conditions */
>> +    if (a->set) {
>> +        tcg_gen_setcondi_tl(TCG_COND_NE, bcond, t0, 0);
>> +    } else {
>> +        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, t0, 0);
>> +    }
> 
> You don't need to produce a boolean, MIPS_HFLAG_BC tests for non-zero.  
> Thus you can simplify this to
> 
>      p = tcg_constant_tl(1ull << a->p);
>      if (a->set) {
>          tcg_gen_and_tl(bcond, rs, p);
>      } else {
>          tcg_gen_andc_tl(bcond, p, rs);
>      }
> 
> 
> r~


