Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE93872B5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:55:54 +0200 (CEST)
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litdx-0007VR-4u
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1litbh-0005gT-NY; Tue, 18 May 2021 02:53:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48366
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1litbf-0004gf-R4; Tue, 18 May 2021 02:53:33 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1litbg-0004lB-Gx; Tue, 18 May 2021 07:53:32 +0100
To: David Gibson <david@gibson.dropbear.id.au>, "Paul A. Clarke"
 <pc@us.ibm.com>
References: <20210517214032.156187-1-pc@us.ibm.com> <YKMZwVmfec0IocfV@yekko>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <25618d64-b40c-ff7e-8f69-1cddcd3863f1@ilande.co.uk>
Date: Tue, 18 May 2021 07:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKMZwVmfec0IocfV@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] Fix `lxvdsx` (issue #212)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/2021 02:34, David Gibson wrote:

> I'm having a hard time convincing myself this is correct in all cases.
> Have you tested it with all combinations of BE/LE host and BE/LE guest
> code?
> 
> The description in the ISA is pretty inscrutable, since it's in terms
> of the confusing numbering if different element types in BE vs LE
> mode.
> 
> It looks to me like before bcb0b7b1a1c0 this originally resolved to
> MO_Q modified by ctx->default_tcg_memop_mask, which appears to depend
> on the current guest endian mode.  That's pretty hard to trace through
> the various layers of macros, but for reference, before bcb0b7b1a1c0
> this used gen_qemu_ld64_i64(), which appears to be constructed by the
> line GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_Q)) in translate.c.
> 
> Richard or Giuseppe, care to weigh in?
> 
>> ---
>>   target/ppc/translate/vsx-impl.c.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
>> index b817d31260bb..46f97c029ca8 100644
>> --- a/target/ppc/translate/vsx-impl.c.inc
>> +++ b/target/ppc/translate/vsx-impl.c.inc
>> @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
>>       gen_addr_reg_index(ctx, EA);
>>   
>>       data = tcg_temp_new_i64();
>> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
>> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
>>       tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
>>   
>>       tcg_temp_free(EA);

Right. I think what is happening here is currently the load uses MO_TE (i.e. target 
endian) which defaults to big endian for PPC and that's why you're seeing the byte 
swap. The reason this is required for the vector instructions is because the vector 
registers need to be stored in host byte-order to allow them to make use of the 
host's vector instructions.

A quick look around the same file at gen_lxvw4x() suggests that you need a solution 
like this to work correctly with both big and little endian:

     if (ctx->le_mode) {
         tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
     } else {
         tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_BEQ);
     }

The original commit message for bcb0b7b1a1c0 mentions that the implementation is 
based upon that of the lxvwsx instruction, so I'm fairly sure that gen_lxvwsx() is 
also broken for little endian and will need a similar fix too.


ATB,

Mark.

