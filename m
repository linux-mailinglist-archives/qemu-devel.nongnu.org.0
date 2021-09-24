Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B27A417744
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:09:48 +0200 (CEST)
Received: from localhost ([::1]:54966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmpf-0006pU-9I
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTmoD-0005C9-Of
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:08:17 -0400
Received: from [115.28.160.31] (port=39778 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTmoA-0004QH-60
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:08:17 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DB99560B0B;
 Fri, 24 Sep 2021 23:08:05 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632496086; bh=Q+zX9LxLdPSMj1l1YEACY+aOHhrJcgRMFOyYAkG1NKk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DdXvcb9eCmL5jS114cH/d7RtpTYpI4rBJ8MbFZLw9Khq/Q0s9n8jhFDuyRtDFkvtu
 4ZXOsfv5h7tszarMEhYF9/xyvBlekE2nT69XaBE4xmvN4juWE+UUcYRTaD44msmlvc
 wXlG+w6nO0XEDgcLItwB4RfeIALGX2OXkCpJPAmE=
Message-ID: <7ca2e822-839f-96ab-9dc9-276565d03478@xen0n.name>
Date: Fri, 24 Sep 2021 23:08:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
 <5ace7b10-b7de-46e2-2021-01129024ffe2@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <5ace7b10-b7de-46e2-2021-01129024ffe2@linaro.org>
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/24/21 00:50, Richard Henderson wrote:
> On 9/22/21 11:09 AM, WANG Xuerui wrote:
>
> Following up on previous, I suggest:
>
>> +static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>> +                         tcg_target_long val)
>> +{
>> +    if (type == TCG_TYPE_I32) {
>> +        val = (int32_t)val;
>> +    }
>> +
>> +    /* Single-instruction cases.  */
>> +    tcg_target_long low = sextreg(val, 0, 12);
>> +    if (low == val) {
>> +        /* val fits in simm12: addi.w rd, zero, val */
>> +        tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, val);
>> +        return;
>> +    }
>> +    if (0x800 <= val && val <= 0xfff) {
>> +        /* val fits in uimm12: ori rd, zero, val */
>> +        tcg_out_opc_ori(s, rd, TCG_REG_ZERO, val);
>> +        return;
>> +    }
>
>> +    /* Test for PC-relative values that can be loaded faster.  */
>> +    intptr_t pc_offset = tcg_pcrel_diff(s, (void *)val);
>> +    if (pc_offset == sextreg(pc_offset, 0, 22) && (pc_offset & 3) == 
>> 0) {
>> +        tcg_out_opc_pcaddu2i(s, rd, pc_offset >> 2);
>> +        return;
>> +    }
>
>     /* Handle all 32-bit constants. */
>     if (val == (int32_t)val) {
>         tcg_out_opc_lu12i(s, rd, val >> 12);
>         if (low) {
>             tcg_out_opc_ori(s, rd, rd, val & 0xfff);
>         }
>         return;
>     }
>
>     /* Handle pc-relative values requiring 2 instructions. */
>     intptr_t pc_lo = sextract64(pc_offset, 0, 12);
>     intptr_t pc_hi = pc_offset - pc_low;
>     if (pc_hi == (int32_t)pc_hi) {
>         tcg_out_opc_pcaddu12i(s, rd, pc_hi >> 12);
>         tcg_out_opc_addi_d(s, rd, rd, pc_lo);
>         return;
>     }
>
>     /*
>      * Choose signed low part if bit 13 is also set,
>      * which gives us a chance of making more zeros.
>      * Otherwise, let low be unsigned.
>      */
>     if ((val & 0x1800) != 0x1800) {
>         low = val & 0xfff;
>     }
>     val -= low;
>
>     tcg_target_long hi20 = sextract64(val, 12, 20);
>     tcg_target_long hi32 = sextract64(val, 32, 20);
>     tcg_target_long hi52 = sextract64(val, 52, 12);
>
>     /*
>      * If we can use the sign-extension of a previous
>      * operation, suppress higher -1.
>      */
>     if (hi32 < 0 && hi52 == -1) {
>         hi52 = 0;
>     }
>     if (hi20 < 0 && hi32 == -1) {
>         hi32 = 0;
>     }
>
>     /* Initialize RD with the least non-zero component. */
>     if (hi20) {
>         tcg_out_opc_lu12i_w(s, rd, hi20 >> 12);
>     } else if (hi32) {
>         /* CU32I_D is modify in place, so RD must be initialized. */
>         if (low < 0) {
>             tcg_out_opc_addi_w(s, rd, TCG_REG_ZERO, low);
>         } else {
>             tcg_out_opc_ori(s, rd, TCG_REG_ZERO, low);
>         }
>         low = 0;
>     } else {
>         tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, hi52);
>         hi52 = 0;
>     }
>
>     /* Assume that lu12i + ori are fusable */
>     if (low > 0) {
>         tcg_out_opc_ori(s, rd, rd, low);
>     }
>
>     /* Set the high 32 bits */
>     if (hi32) {
>         tcg_out_opc_cu32i_d(s, rd, hi32);
>     }
>     if (hi52) {
>         tcg_out_opc_cu52i(s, rd, rd, hi52);
>     }
>
>     /*
>      * Note that any subtraction must come last,
>      * because cu32i and cu52i overwrite high bits,
>      * and we have computed them as val - low.
>      */
>     if (low < 0) {
>         tcg_out_opc_addi_d(s, rd, rd, low);
>     }
>
> Untested, and all bugs are mine, of course.
>
> Try "qemu-system-ppc64 -D z -d in_asm,op_opt,out_asm".
> You should see some masking constants like
>
>  ---- 000000001daf2898
>  and_i64 CA,r9,$0x7fffffffffffffff        dead: 2  pref=0xffff
>
>   cu52i.d rd, zero, 0x800
>   addi.d  rd, rd, -1
>
>  ---- 000000001db0775c
>  mov_i64 r26,$0x300000002                 sync: 0  dead: 0 1 pref=0xffff
>
>   ori     rd, zero, 2
>   cu32i   rd, 3
>
Oops, for some reason I only received this at about 8 pm... I'll of 
course take advantage of the Saturday and compare the generated code for 
the cases, hopefully incorporating some of your ideas presented here. 
Thanks for the detailed reply!
>
> r~

