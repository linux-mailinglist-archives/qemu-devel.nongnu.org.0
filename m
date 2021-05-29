Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C12394C77
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 16:21:51 +0200 (CEST)
Received: from localhost ([::1]:47026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmzqX-0004tg-Fb
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 10:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmzpm-0004Ex-NR
 for qemu-devel@nongnu.org; Sat, 29 May 2021 10:21:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmzpk-0008Of-UW
 for qemu-devel@nongnu.org; Sat, 29 May 2021 10:21:02 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z8so956334wrp.12
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nG6uflCR9LJDMbOuQoZhuTRGkON+FmywylhBkx+Y2ic=;
 b=P7s5wUFBHNpQy/Sxt1NgOVulpxwpPD3Mdh93G04YPv7Uyu4wC1o0buv05zL1dUkVAT
 NptVjPx/jusjxZHtI/NsJvBpaTDcbAOGYexFx1vkwAZF2dH+Omoc0YNxQRnyDjaEYU4Z
 rcUw0f/eHL8AUy96MkPeYlO8kWYSbshoSvLZya5iOtF8CMFfpniqKm6Fkxf8VzWeDR0l
 XuSdGKLG+fG4ngjf4E/zJz76Dz1Pge5Sfpee4pRru3GZfgv2TBVr3OTGYwo5/lfsqhAq
 RS0ysLPgA8QhqQJPzFf0w3oPYN9Wu7JlB3bvRiAw+8Dvgqcq4g6rwhFMTQ7PhPoBqYPu
 fJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nG6uflCR9LJDMbOuQoZhuTRGkON+FmywylhBkx+Y2ic=;
 b=GDoGNKWflq2cPPBSgbawTc3htVJy1DiqaT/MeiOcOnX5fehw/2S5ttpqpZoJPZhkID
 OLgc/MqNmPDcKla03cUZ8mZfg/PH4PmTzrVXXX35ZbhIJGQuSCCXYaDfgYQff1cqB/k4
 DmTmM7GyGh0rlUokfTUmV97Ql4IRqt5FgO5dNdO7OOrWX1UAkO5IAEthzgBaYRD00Y1c
 4qbZDW55ZgxiaP3zf3Hmn80kyC8jWBtnCSpmxQRg9SZaWKlde0vXFj0sb55SAJR6meUg
 WzwuH2kESAvmqCuVG6ZFaC6YAfbqisxlhMxZzxJ9zwm66j9jWSDykY+63x9FuTPIhWuj
 gSRA==
X-Gm-Message-State: AOAM533TJch1cw28LskjM2rLzKEg+7H7GfzDPfARkGlkGD3FUd9+wwI8
 NU9eN6rY5XfvrDrVAS9GZpA=
X-Google-Smtp-Source: ABdhPJxGPCviVlyRXJKRCpy13F9qL83JBCQo9MpWhYZirZ2VOSntIwimr50qdIZrDMIadhNYwqLLlw==
X-Received: by 2002:adf:de09:: with SMTP id b9mr14061267wrm.340.1622298059382; 
 Sat, 29 May 2021 07:20:59 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id t17sm10070990wrp.89.2021.05.29.07.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 07:20:58 -0700 (PDT)
Subject: Re: [PATCH v11 08/46] target/mips: Add emulation of nanoMIPS 16-bit
 branch instructions
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <1534789014-8310-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1534789014-8310-9-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAAdtpL7jGOxhaqA-gLSRX_6FktEm89AMW-xkV=n+mEjWd-O1iA@mail.gmail.com>
Message-ID: <e208f68d-969a-0a07-a24c-25b6a0bbdb42@amsat.org>
Date: Sat, 29 May 2021 16:20:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7jGOxhaqA-gLSRX_6FktEm89AMW-xkV=n+mEjWd-O1iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Dimitrije Nikolic <dnikolic@wavecomp.com>,
 Stefan Markovic <smarkovic@wavecomp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Petar Jovanovic <pjovanovic@wavecomp.com>, Paul Burton <pburton@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/21 3:52 PM, Philippe Mathieu-Daudé wrote:
> On Mon, Aug 20, 2018 at 8:17 PM Aleksandar Markovic
> <aleksandar.markovic@rt-rk.com> wrote:
>>
>> From: Stefan Markovic <smarkovic@wavecomp.com>
>>
>> Add emulation of nanoMIPS 16-bit branch instructions.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Yongbok Kim <yongbok.kim@mips.com>
>> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
>> Signed-off-by: Stefan Markovic <smarkovic@wavecomp.com>
>> ---
>>  target/mips/translate.c | 158 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 158 insertions(+)
>>
>> diff --git a/target/mips/translate.c b/target/mips/translate.c
>> index 261680e..b0bbf4c 100644
>> --- a/target/mips/translate.c
>> +++ b/target/mips/translate.c
>> @@ -4564,6 +4564,128 @@ static void gen_compute_branch (DisasContext *ctx, uint32_t opc,
>>      tcg_temp_free(t1);
>>  }
>>
>> +
>> +/* nanoMIPS Branches */
>> +static void gen_compute_branch_nm(DisasContext *ctx, uint32_t opc,
>> +                                int insn_bytes,
>> +                                int rs, int rt, int32_t offset)
>> +{
>> +    target_ulong btgt = -1;
>> +    int bcond_compute = 0;
>> +    TCGv t0 = tcg_temp_new();
>> +    TCGv t1 = tcg_temp_new();
>> +
>> +    /* Load needed operands */
>> +    switch (opc) {
>> +    case OPC_BEQ:
>> +    case OPC_BNE:
>> +        /* Compare two registers */
>> +        if (rs != rt) {
>> +            gen_load_gpr(t0, rs);
>> +            gen_load_gpr(t1, rt);
>> +            bcond_compute = 1;
>> +        }
>> +        btgt = ctx->base.pc_next + insn_bytes + offset;
>> +        break;
>> +    case OPC_BGEZAL:
>> +        /* Compare to zero */
>> +        if (rs != 0) {
>> +            gen_load_gpr(t0, rs);
>> +            bcond_compute = 1;
>> +        }
>> +        btgt = ctx->base.pc_next + insn_bytes + offset;
>> +        break;
>> +    case OPC_BPOSGE32:
>> +        tcg_gen_andi_tl(t0, cpu_dspctrl, 0x3F);
>> +        bcond_compute = 1;
>> +        btgt = ctx->base.pc_next + insn_bytes + offset;

I think this opcode never worked correctly.

Per the "MIPS® Architecture Extension: nanoMIPS32 DSP Technical
Reference Manual — Revision 0.04" p. 88 "BPOSGE32C":

  "First, the offset argument is left-shifted by one bit to form
   a 17-bit signed integer value."

The caller, decode_nanomips_32_48_opc(), doesn't shift the offset:

    case NM_BPOSGE32C:
        check_dsp_r3(ctx);
        {
            int32_t imm = extract32(ctx->opcode, 1, 13) |
                          extract32(ctx->opcode, 0, 1) << 13;

            gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
                                  imm);
        }
        break;

>> +        break;
>> +    case OPC_JR:
>> +    case OPC_JALR:
>> +        /* Jump to register */
>> +        if (offset != 0 && offset != 16) {
>> +            /* Hint = 0 is JR/JALR, hint 16 is JR.HB/JALR.HB, the
>> +               others are reserved. */
>> +            MIPS_INVAL("jump hint");
>> +            generate_exception_end(ctx, EXCP_RI);
>> +            goto out;
>> +        }
>> +        gen_load_gpr(btarget, rs);
>> +        break;
>> +    default:
>> +        MIPS_INVAL("branch/jump");
>> +        generate_exception_end(ctx, EXCP_RI);
>> +        goto out;
>> +    }
>> +    if (bcond_compute == 0) {
>> +        /* No condition to be computed */
>> +        switch (opc) {
>> +        case OPC_BEQ:     /* rx == rx        */
>> +            /* Always take */
>> +            ctx->hflags |= MIPS_HFLAG_B;
>> +            break;
>> +        case OPC_BGEZAL:  /* 0 >= 0          */
>> +            /* Always take and link */
>> +            tcg_gen_movi_tl(cpu_gpr[31],
>> +                            ctx->base.pc_next + insn_bytes);
>> +            ctx->hflags |= MIPS_HFLAG_B;
>> +            break;
>> +        case OPC_BNE:     /* rx != rx        */
>> +            tcg_gen_movi_tl(cpu_gpr[31], ctx->base.pc_next + 8);
>> +            /* Skip the instruction in the delay slot */
>> +            ctx->base.pc_next += 4;
>> +            goto out;
>> +        case OPC_JR:
>> +            ctx->hflags |= MIPS_HFLAG_BR;
>> +            break;
>> +        case OPC_JALR:
>> +            if (rt > 0) {
>> +                tcg_gen_movi_tl(cpu_gpr[rt],
>> +                                ctx->base.pc_next + insn_bytes);
>> +            }
>> +            ctx->hflags |= MIPS_HFLAG_BR;
>> +            break;
>> +        default:
>> +            MIPS_INVAL("branch/jump");
>> +            generate_exception_end(ctx, EXCP_RI);
>> +            goto out;
>> +        }
>> +    } else {
>> +        switch (opc) {
>> +        case OPC_BEQ:
>> +            tcg_gen_setcond_tl(TCG_COND_EQ, bcond, t0, t1);
>> +            goto not_likely;
>> +        case OPC_BNE:
>> +            tcg_gen_setcond_tl(TCG_COND_NE, bcond, t0, t1);
>> +            goto not_likely;
>> +        case OPC_BGEZAL:
>> +            tcg_gen_setcondi_tl(TCG_COND_GE, bcond, t0, 0);
>> +            tcg_gen_movi_tl(cpu_gpr[31],
>> +                            ctx->base.pc_next + insn_bytes);
>> +            goto not_likely;
>> +        case OPC_BPOSGE32:
>> +            tcg_gen_setcondi_tl(TCG_COND_GE, bcond, t0, 32);
> 
> This opcode implementation seems incomplete, per the ISA manual:
> 
> If a control transfer instruction (CTI) is executed in the forbidden
> slot of a branch or jump, Release 6 implementations are required to
> signal a Reserved Instruction Exception. A CTI is considered to be one
> of the following instructions: branch, jump, NAL (Release 6), ERET,
> ERETNC (Release 5), DERET, WAIT, or PAUSE (Release 2). An instruction
> is in the forbidden slot if it is the instruction following the
> branch.
> 
>> +        not_likely:
>> +            ctx->hflags |= MIPS_HFLAG_BC;
>> +            break;
>> +        default:
>> +            MIPS_INVAL("conditional branch/jump");
>> +            generate_exception_end(ctx, EXCP_RI);
>> +            goto out;
>> +        }
>> +    }
>> +
>> +    ctx->btarget = btgt;
>> +
>> + out:
>> +    if (insn_bytes == 2) {
>> +        ctx->hflags |= MIPS_HFLAG_B16;
>> +    }
>> +    tcg_temp_free(t0);
>> +    tcg_temp_free(t1);
>> +}
> 

