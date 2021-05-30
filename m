Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91594394FE9
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 08:48:02 +0200 (CEST)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnFEv-0006to-M2
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 02:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnFD4-0005Vo-3A
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:46:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnFD0-0000of-6O
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:46:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso6884647wmm.3
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 23:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l4QMpWsT6X1AOQAIZDjV3/7KkxIUerwtba/gKJce0/8=;
 b=mur0RYA6wxshPV7EgVm457dqsXdkx/LYkFiYusUF+plA22HgpFRfCkj/Ach6XPmSeQ
 Qz61x2wpPdrl3XB/jxtmHJqZ28Lmn9X89SzNbrhmc6KuwkRkfHYx0Rjjgnpx8LjMftU7
 PaWcDnR3slk+419AGSS74djSb50/hi9ODTAzaZ5zSym9xkdw/9pgHQZtGZuehE4MXSNF
 5+59/78wtgerqLwvobCZICWWJL1b8QETXgx3KfW+pLNb2UQgOXL7uxKun58R685ceXEd
 rfNDKkK8pXZfym7wnbwj9c4ggAF9DYOqZ5uliISmfcZBLDAK2CX8TPT1qFUbEPnQmNly
 hTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l4QMpWsT6X1AOQAIZDjV3/7KkxIUerwtba/gKJce0/8=;
 b=r8oWH59YHNlflRqawckN1hlLprEc4dhHxCpvvqrwfb0RGDhq08qTF8PPyKvNhhOcY6
 Cf0PhZ3FkkNml43AlEly+X2kpaA37Flvy/WjgVMpDiU36CE6cT4/IlnkHBAYjLOmAi2L
 D5wh//+ekG/Gl6gh9YE4j4JL7mTDVWen8nDVu39fCtwCsk4N52PWIPVbBxu7HgEUQvzo
 QlVU9M3Gt6j84ryzZQH3+0MxC7sIIJSGDHrVcntohKuTTdGv0F0HJKYgwU7UTMiVAAe2
 3yO7WXNWa75+s/GLiK/E0C1aPQpDgFz5lmpMY8FDAPArzeFxV2pGq7sUfYxTDQUjl0wC
 9zNQ==
X-Gm-Message-State: AOAM532YrEOSPNy7N9nzWEZdx2b26UB1pEh8pwmhCIjHr5EWq7pJ5o7f
 yuGCzr0r7rXNmAxSwz3kyMM=
X-Google-Smtp-Source: ABdhPJy2jM3djvDMzhnb54+tEzzL9XFRmxZkMTEmk3ektSOdNo4oI2U+bG3K2vAtpP8E0tFcWvoySQ==
X-Received: by 2002:a1c:5418:: with SMTP id i24mr4935268wmb.1.1622357160686;
 Sat, 29 May 2021 23:46:00 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q20sm22198921wmq.2.2021.05.29.23.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 23:46:00 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Fix DBALIGN DSP-R2 opcode 'byte position'
 field size
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20210529130520.1039274-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6bea3af-c75f-c90a-056d-54f9c2c7c5ea@amsat.org>
Date: Sun, 30 May 2021 08:45:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210529130520.1039274-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jia Liu <proljc@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/21 3:05 PM, Philippe Mathieu-Daudé wrote:
> Per the "MIPS® DSP Module for MIPS64 Architecture" manual (rev 3.02),
> Figure 5.12 "SPECIAL3 Encoding of APPEND/DAPPEND Instruction Sub-class"
> the byte position field ('bp') is 2 bits, not 3.
> 
> Cc: Jia Liu <proljc@gmail.com>
> Fixes: 26690560240 ("target-mips: Add ASE DSP compare-pick instructions")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index c03a8ae1fed..e68647ce14c 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -23016,8 +23016,8 @@ static void gen_mipsdsp_append(CPUMIPSState *env, DisasContext *ctx,
>              }
>              break;
>          case OPC_DBALIGN:
> -            sa &= 7;
> -            if (sa != 0 && sa != 2 && sa != 4) {
> +            sa &= 3;
> +            if (sa != 0 && sa != 2) {
>                  tcg_gen_shli_tl(cpu_gpr[rt], cpu_gpr[rt], 8 * sa);
>                  tcg_gen_shri_tl(t0, t0, 8 * (8 - sa));
>                  tcg_gen_or_tl(cpu_gpr[rt], cpu_gpr[rt], t0);
> 

Looking at GCC, there is a patch adding this opcode:
https://gcc.gnu.org/legacy-ml/gcc-patches/2012-02/msg00127.html
which uses 2 bits:

+(define_insn "mips_dbalign"
+  [(set (match_operand:DI 0 "register_operand" "=d")
+	(unspec:DI [(match_operand:DI 1 "register_operand" "0")
+		    (match_operand:DI 2 "reg_or_0_operand" "dJ")
+		    (match_operand:DI 3 "const_int_operand" "n")]
+		   UNSPEC_DBALIGN))]
+  "ISA_HAS_DSPR2"
+{
+  if (INTVAL (operands[3]) & ~(unsigned HOST_WIDE_INT) 3)
+    operands[2] = GEN_INT (INTVAL (operands[2]) & 3);
+  return "dbalign\t%0,%z2,%3";
+}
+  [(set_attr "type"	"arith")
+   (set_attr "mode"	"DI")])

However looking at the releases/gcc-11.1.0 tag it seems GCC never
supported DBALIGN...:

https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/mips/mips-dspr2.md;h=95ba712f6a12946100cd4fe98d05732e70de8f98;hb=50bc9185c2821350f0b785d6e23a6e9dcde58466

