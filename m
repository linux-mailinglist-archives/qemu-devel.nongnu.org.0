Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9FC3ADB2D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:49:14 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luf5l-0002QF-Pa
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luf4t-0001bA-GX
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:48:19 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luf4r-0000WK-JC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:48:19 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so972130wma.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u0shu5lGvq4pJGRWFOCAnAqvmCF9JggGV7WCHPTBT0w=;
 b=XPZORxYhFq9NKVNRWPs3t6xBREErbfIclQmTP8n68uL6qpazRoa+WJEklkksqKt8Pe
 G1EBJwvU0ox+cI2UaiZKA+5hRecKl8GazFtPYvaKJ+t1em80AOuL6wL2wwK5EXb+LSuS
 DB37+6CgwjLtxg16Es4LabKBng/yWckWl9//A+sHrKn4n/Tn4YQ+SjRk1rqIC2EV1Ul8
 8Obv2OQr9hHSxz91TUEQbp5EBJSPIToTpQR8oW5WHryogBMhiI0ShHnCfw4IHgXRfDTG
 WgI73vGpLrA5++amlrLGLzWf9gbhrQzdgH1TFc9oVy5OT25hCWS9uHJtdk0xPl1pTtIf
 nVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u0shu5lGvq4pJGRWFOCAnAqvmCF9JggGV7WCHPTBT0w=;
 b=bxPjD4kbob+affHBPLe9Pgow4hEABGloYzN/Qy09abED+BzOn1s3ZR+irddxdLR8m7
 bZT+D0CNzFP3c9IIL2adRvNu9oCA9Zs5BHZ8swqaUzXEDxYXW3qFafs8a6CfSPNKqkYy
 TjGPUhJvj2qiclMuFZxWs+nb0Ah3WjDedWVfWSSI8g6TH0+ZTAmWoTd53v4FCmoaRFmr
 T+cWQ/3kA0ZPzXOpqLtdfkDCOAHmkwNh1D2Bc6gRd+V4tKTWy6rYeQqzEywPnkVvoR6T
 GTucA0vbM+DUAZuYA77mFGIIAW0TDpsBLZXYlNygdSH9ZPK899/IccnTdLw3d22lTHcw
 J3JA==
X-Gm-Message-State: AOAM5327g96cqWyo23mMESRyekiz2ybKVn9iUwMxMuP4OHXNA7/dpGGn
 JC8a/5CEU4OWYJqzPDq/Llk7TwyuxRDCNQ==
X-Google-Smtp-Source: ABdhPJwolif5NIQX3Vw4utSc6g/yz65w8gY4q16zwvz3ThJ1yM+MJZHs9/c3gvvogIm32vTLNJ2KhA==
X-Received: by 2002:a1c:98c9:: with SMTP id a192mr17552694wme.66.1624124895605; 
 Sat, 19 Jun 2021 10:48:15 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j18sm12347019wrw.30.2021.06.19.10.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 10:48:15 -0700 (PDT)
Subject: Re: [PATCH v7 15/27] tcg/tci: Change encoding to uint32_t units
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ca5f8c8e-2e92-75c7-5e09-e82ada0f122b@amsat.org>
Date: Sat, 19 Jun 2021 19:48:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:00 PM, Richard Henderson wrote:
> This removes all of the problems with unaligned accesses
> to the bytecode stream.
> 
> With an 8-bit opcode at the bottom, we have 24 bits remaining,
> which are generally split into 6 4-bit slots.  This fits well
> with the maximum length opcodes, e.g. INDEX_op_add2_i32, which
> have 6 register operands.
> 
> We have, in previous patches, rearranged things such that there
> are no operations with a label which have more than one other
> operand.  Which leaves us with a 20-bit field in which to encode
> a label, giving us a maximum TB size of 512k -- easily large.
> 
> Change the INDEX_op_tci_movi_{i32,i64} opcodes to tci_mov[il].
> The former puts the immediate in the upper 20 bits of the insn,
> like we do for the label displacement.  The later uses a label
> to reference an entry in the constant pool.  Thus, in the worst
> case we still have a single memory reference for any constant,
> but now the constants are out-of-line of the bytecode and can
> be shared between different moves saving space.
> 
> Change INDEX_op_call to use a label to reference a pair of
> pointers in the constant pool.  This removes the only slightly
> dodgy link with the layout of struct TCGHelperInfo.
> 
> The re-encode cannot be done in pieces.
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-opc.h    |   4 +-
>  tcg/tci/tcg-target.h     |   3 +-
>  tcg/tci.c                | 541 +++++++++++++++------------------------
>  tcg/tci/tcg-target.c.inc | 379 ++++++++++++---------------
>  tcg/tci/README           |  20 +-
>  5 files changed, 384 insertions(+), 563 deletions(-)

> @@ -1082,87 +961,69 @@ static const char *str_c(TCGCond c)
>  /* Disassemble TCI bytecode. */
>  int print_insn_tci(bfd_vma addr, disassemble_info *info)
>  {

>      case INDEX_op_setcond_i32:
>      case INDEX_op_setcond_i64:
> -        tci_args_rrrc(&tb_ptr, &r0, &r1, &r2, &c);
> +        tci_args_rrrc(insn, &r0, &r1, &r2, &c);
>          info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
>                             op_name, str_r(r0), str_r(r1), str_r(r2), str_c(c));
>          break;
>  
> -    case INDEX_op_tci_movi_i32:
> -        tci_args_ri(&tb_ptr, &r0, &i1);
> -        info->fprintf_func(info->stream, "%-12s  %s, 0x%" TCG_PRIlx,
> +    case INDEX_op_tci_movi:
> +        tci_args_ri(insn, &r0, &i1);
> +        info->fprintf_func(info->stream, "%-12s  %s,0x%" TCG_PRIlx "",

Missing space in format: "%s, 0x%"

>                             op_name, str_r(r0), i1);
>          break;
>  
> -#if TCG_TARGET_REG_BITS == 64
> -    case INDEX_op_tci_movi_i64:
> -        tci_args_rI(&tb_ptr, &r0, &i1);
> -        info->fprintf_func(info->stream, "%-12s  %s, 0x%" TCG_PRIlx,
> -                           op_name, str_r(r0), i1);
> +    case INDEX_op_tci_movl:
> +        tci_args_rl(insn, tb_ptr, &r0, &ptr);
> +        info->fprintf_func(info->stream, "%-12s  %s, %p",
> +                           op_name, str_r(r0), ptr);
>          break;
> -#endif

