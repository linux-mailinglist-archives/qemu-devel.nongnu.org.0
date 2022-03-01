Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C144C8096
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 02:57:41 +0100 (CET)
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOrlk-0006sV-CM
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 20:57:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineet.gupta@linux.dev>)
 id 1nOrJJ-0005kf-9O
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 20:28:17 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:48002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineet.gupta@linux.dev>)
 id 1nOrJH-0007h6-Cw
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 20:28:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F06BD61565;
 Tue,  1 Mar 2022 01:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2709CC340EE;
 Tue,  1 Mar 2022 01:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
 t=1646098092; bh=nBpKn2l4/jL9/oP1jNHX31dDFgP/8N2Rhj+vUx+tWak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GUG2iIMU6VojsYohPRJJIJqyZ2IV7QbwzG3HI+q6ppr4bCprFLOZYvwHAFOoYaGUY
 f7OHhT1qSyS+votuPT70bhu6xYM5SzlT/nWv4JGIQ1pRjA3Ho7tH/nmEjfySbYdMeK
 wjyBMAEBDnkVgK1T5d0m1OW6T0y9kEO80BxK9dWc=
Message-ID: <b7676252-781d-a7c6-6172-09dd319ef744@linux.dev>
Date: Mon, 28 Feb 2022 17:28:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/riscv: fix inverted checks for ext_zb[abcs]
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Newsgroups: gmane.comp.emulators.qemu
References: <20220203153946.2676353-1-philipp.tomsich@vrull.eu>
 <CAKmqyKOLO7VdSPsXmeqQN-z3a2bKZQ3yeQqCmjt-SBpT9MfcgA@mail.gmail.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <CAKmqyKOLO7VdSPsXmeqQN-z3a2bKZQ3yeQqCmjt-SBpT9MfcgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=vineet.gupta@linux.dev; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 20:56:11 -0500
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 gnu-toolchain <gnu-toolchain@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

On 2/3/22 16:59, Alistair Francis wrote:
> On Fri, Feb 4, 2022 at 1:42 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>>
>> While changing to the use of cfg_ptr, the conditions for REQUIRE_ZB[ABCS]
>> inadvertently became inverted and slipped through the initial testing (which
>> used RV64GC_XVentanaCondOps as a target).
>> This fixes the regression.
>>
>> Tested against SPEC2017 w/ GCC 12 (prerelease) for RV64GC_zba_zbb_zbc_zbs.
>>
>> Fixes: 718143c126 ("target/riscv: add a MAINTAINERS entry for XVentanaCondOps")
>>
>> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> 
>>
>> ---
>> We may want to squash this onto the affected commit, if it hasn't made
>> it beyond the next-tree, yet.
> 
> Yeah, agreed. I'll squash it in
> 
> Alistair

Has this already been committed upstream. I was running into weird issue 
related to bitmanip and seems this was missing in my local tree.

Also the "Fixes: " entry in changelog doesn't seem OK; the issue seems 
to have been introduced in f2a32bec8f0da99 ("target/riscv: access cfg 
structure through DisasContext")

Thx,
-Vineet

> 
>>
>>   target/riscv/insn_trans/trans_rvb.c.inc | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
>> index f9bd3b7ec4..e3c6b459d6 100644
>> --- a/target/riscv/insn_trans/trans_rvb.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
>> @@ -19,25 +19,25 @@
>>    */
>>
>>   #define REQUIRE_ZBA(ctx) do {                    \
>> -    if (ctx->cfg_ptr->ext_zba) {                 \
>> +    if (!ctx->cfg_ptr->ext_zba) {                 \
>>           return false;                            \
>>       }                                            \
>>   } while (0)
>>
>>   #define REQUIRE_ZBB(ctx) do {                    \
>> -    if (ctx->cfg_ptr->ext_zbb) {                 \
>> +    if (!ctx->cfg_ptr->ext_zbb) {                 \
>>           return false;                            \
>>       }                                            \
>>   } while (0)
>>
>>   #define REQUIRE_ZBC(ctx) do {                    \
>> -    if (ctx->cfg_ptr->ext_zbc) {                 \
>> +    if (!ctx->cfg_ptr->ext_zbc) {                 \
>>           return false;                            \
>>       }                                            \
>>   } while (0)
>>
>>   #define REQUIRE_ZBS(ctx) do {                    \
>> -    if (ctx->cfg_ptr->ext_zbs) {                 \
>> +    if (!ctx->cfg_ptr->ext_zbs) {                 \
>>           return false;                            \
>>       }                                            \
>>   } while (0)
>> --
>> 2.34.1
>>
>>
> 
> 


