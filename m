Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B325418371
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 18:49:36 +0200 (CEST)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUArm-0006Rz-KQ
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 12:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUAq3-0005e1-VO
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 12:47:48 -0400
Received: from [115.28.160.31] (port=56420 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mUApz-0001Fm-4R
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 12:47:47 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C5F0060B2E;
 Sun, 26 Sep 2021 00:47:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632588447; bh=/WTLOXgh9mide3/hHQn5Si8mWHLYCkwJJQJS91R/d7E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xO3CpGwS8byR+Yjywm+Q3/wBGC/lX45l0DuVEo+YE6/9pUpzpyfULog3Itsl1bo8d
 WFM4gt1KbiY1vtbAvXIxKWY8hR3zMAd9239PMwGsvjFWvD7GXxMYZv8kS97WKFnh34
 KyLLnp0ov0S7VIOWeDeLcRpp61alIBSgkPEN9DFM=
Message-ID: <99dabb06-0624-e5a8-2b73-0c8d63a6c5e9@xen0n.name>
Date: Sun, 26 Sep 2021 00:47:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v5 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-10-git@xen0n.name>
 <b1b97929-ef62-72ec-609f-bd84c49481d1@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <b1b97929-ef62-72ec-609f-bd84c49481d1@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/25/21 17:54, Philippe Mathieu-Daudé wrote:
> On 9/24/21 19:25, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/loongarch64/tcg-target.c.inc | 109 +++++++++++++++++++++++++++++++
>>   1 file changed, 109 insertions(+)
>
>> +/* Loads a 32-bit immediate into rd, sign-extended.  */
>> +static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
>> +{
>> +    /* Single-instruction cases.  */
>> +    tcg_target_long lo = sextreg(val, 0, 12);
>> +    if (lo == val) {
>> +        /* val fits in simm12: addi.w rd, zero, val */
>> +        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
>> +        return;
>> +    }
>> +    if (0x800 <= val && val <= 0xfff) {
>> +        /* val fits in uimm12: ori rd, zero, val */
>> +        tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
>> +        return;
>> +    }
>> +
>> +    /* High bits must be set; load with lu12i.w + optional ori.  */
>> +    tcg_target_long hi12 = sextreg(val, 12, 20);
>
> Please declare variables in function prologue.
Sure; will fix in v6.
>
> Maybe name lo12 and hi20?
I added ASCII art to hopefully clarify the namings; originally I used 
MIPS R6 terms (low, upper, higher, top) but all the MIPS R6 instructions 
take 16-bit imm, so I figured just naming by bitfield LSB index would be 
best. The Loongson documentation people didn't invent any dedicated name 
for the 4 parts or 3 load-upper instructions, either.
>
>> +    tcg_out_opc_lu12i_w(s, rd, hi12);
>> +    if (lo != 0) {
>> +        tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
>
> Isn't lo already 12-bit? Why the mask?
As Richard explained, lo is signed while ori takes unsigned imm, so this 
is necessary to not trip up the debug assert and overwrite the opcode.
>
>> +    }
>> +}
>> +
>> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>> +                         tcg_target_long val)
>> +{
>> +    if (type == TCG_TYPE_I32 || val == (int32_t)val) {
>> +        tcg_out_movi_i32(s, rd, val);
>> +        return;
>> +    }
>> +
>> +    /* PC-relative cases.  */
>> +    intptr_t pc_offset = tcg_pcrel_diff(s, (void *)val);
>
> Declare in prologue.
Ack; will fix.
>
>> +    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 
>> 0) {
>> +        /* Single pcaddu2i.  */
>> +        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
>> +        return;
>> +    }
>> +
>> +    if (pc_offset == (int32_t)pc_offset) {
>> +        /* Offset within 32 bits; load with pcalau12i + ori. */
>> +        tcg_target_long lo = sextreg(val, 0, 12);
>
> Name this 'val_lo' similarly to val_hi?
Nice catch; that was leftover from v4 where the tcg_out_movi_i32 logic 
was not factored out. Fixed in v6.
>
>> +        tcg_target_long pc_hi = (val - pc_offset) >> 12;
>> +        tcg_target_long val_hi = val >> 12;
>> +        tcg_target_long offset_hi = val_hi - pc_hi;
>> +        tcg_debug_assert(offset_hi == sextreg(offset_hi, 0, 20));
>> +        tcg_out_opc_pcalau12i(s, rd, offset_hi);
>> +        if (lo != 0) {
>> +            tcg_out_opc_ori(s, rd, rd, lo & 0xfff);
>
> Again, lo is already 12-bit.
Same as above.
>
>> +        }
>> +        return;
>> +    }
>> +
>> +    /* Single cu52i.d case.  */
>> +    if (ctz64(val) >= 52) {
>> +        tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, val >> 52);
>> +        return;
>> +    }
>> +
>> +    /* Slow path.  Initialize the low 32 bits, then concat high 
>> bits.  */
>> +    tcg_out_movi_i32(s, rd, val);
>> +
>> +    bool rd_high_bits_are_ones = (int32_t)val < 0;
>
> Declare in prologue, however this is hard to read. KISS:
>
>        rd_high_bits_are_ones = (int32_t)val < 0 ? true : false;
Hmm, comparison operators return boolean results already; and I thought 
expressions like `foo ? true : false` are typically considered to have 
"bad smell"? I think I'd want to keep the current way of saying 
things... But I'll of course move the declaration to function prologue.
>
>> +    tcg_target_long hi32 = sextreg(val, 32, 20);
>
> By 'hi32' I expect the 32 high bits. Maybe explicit as hi32_20?
>
>> +    tcg_target_long hi52 = sextreg(val, 52, 12);
>
> And hi52_12?
The names are getting long with addition of bitfield lengths; I hope the 
ASCII art in v6 could alleviate the need for longer names.
>
>> +
>> +    if (imm_part_needs_loading(rd_high_bits_are_ones, hi32)) {
>> +        tcg_out_opc_cu32i_d(s, rd, hi32);
>> +        rd_high_bits_are_ones = hi32 < 0;
>
> Again KISS:
>
>            if (hi32 < 0) {
>                rd_high_bits_are_ones = true;
>            }
>
As explained by Richard, this is indeed meant to be an unconditional 
overwrite. After concatenating the 51-to-32 bits, the topmost 12 bits is 
changed to be sign-extension of hi32, so the flag must be updated to 
reflect that.
>> +    }
>> +
>> +    if (imm_part_needs_loading(rd_high_bits_are_ones, hi52)) {
>> +        tcg_out_opc_cu52i_d(s, rd, rd, hi52);
>> +    }
>> +}
>
> With comment addressed:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

