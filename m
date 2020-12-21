Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0062DFDA1
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:36:53 +0100 (CET)
Received: from localhost ([::1]:54990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNEy-0001kC-FB
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krN3J-0006yt-5P
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:24:51 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krN3H-0003gW-1J
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 10:24:48 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q18so11466631wrn.1
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dme5bZb0CyKLd7BXM/D6vSfTaZLNoy1w/sPLP2h8sTI=;
 b=UN0UwcDb2kWau31B4GhSAsriZyrkPrdH6ulm3dW4hhDvOxD33rn0nAkc55euPNPdP2
 fLMhXNjqySXUDoygsXWyYGbMbelwtAaSEw1NZVpJPuyMrdCozOUP61xcbKBigvxElexs
 KkMPGeHgrp0nQ/5+RLGbSxJSYqK1IcVc7nuflrjKvSqRHl5Ela2+NA/q+pEXKfEg5VRt
 22KdM/7AI1uZoebbeAmMbaOcPJSMSovnAUqdyvr8CKthDm+XtornuxVsbMesTd1Kgx+Q
 z1ts+8IwRSjbBxJqdlh7KRTL3eXBbK4K89VZ3UCv++Ut5VNy0SOnFpgpOfDEiqmccGju
 XoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dme5bZb0CyKLd7BXM/D6vSfTaZLNoy1w/sPLP2h8sTI=;
 b=ealaWyR9/+HowUX11dvw22SHWzyemkyONeSUDPdmd1qJk4zpHifkaehlw7e+H6ba9Z
 HU8vXps6qyhShTmXnC8eDg9jxDmedk5vhhgBMi8EVa/8H5fEA0A90OoHHarns8czaJum
 bCodDj9TDpBjryppWLZLOQUtseuxzOga0LsKrPJSrYfLtPx4M99Wz1H881hRsqpAOVFv
 i48CLy7gk/FY6buIMnMVQbxTbVV7+GeYGwS4SncUSUcRMz7NRyUVUFUWs4yQyoyXaUEy
 vctQs7hz4DuYV7CkIjhjgJA7FNIY5hXxD5xIAOCKHtO6Mz/I9u+0oV7DR/2iyz2+iHL3
 hbSA==
X-Gm-Message-State: AOAM531WvKffYVuG6ezbMpOfLMi5ks6uSAZ5vc3zOLuClQJflVyIukki
 s25IHDG9pX6BA986NjGu2wY=
X-Google-Smtp-Source: ABdhPJx5kW7glmQYPUAjWT9NcLpZ55ZUr3RAHUM3Jsy+SM54WC7r9CiDr9HwpabV93ixb3uE2sgqPA==
X-Received: by 2002:a5d:44c6:: with SMTP id z6mr19370982wrr.306.1608564285131; 
 Mon, 21 Dec 2020 07:24:45 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id l8sm30694699wrb.73.2020.12.21.07.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 07:24:44 -0800 (PST)
Subject: Re: pxa crashes with qemu v5.2 when executing xscale operations
To: Guenter Roeck <linux@roeck-us.net>, QEMU Developers <qemu-devel@nongnu.org>
References: <aa0a0bcc-bd00-37dd-1012-cd71d32f1f9b@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2f710d2a-ab7b-de6c-4ada-8fb7300556da@amsat.org>
Date: Mon, 21 Dec 2020 16:24:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <aa0a0bcc-bd00-37dd-1012-cd71d32f1f9b@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 6:28 AM, Guenter Roeck wrote:
> Hi,
> 
> I noticed that booting Linux on PXA emulations no longer works with qemu v5.2.
> When trying to boot akita, borzoi, or similar emulations, I get the following crash.
> 
> [    0.965279] Internal error: Oops - undefined instruction: 0 [#1] PREEMPT ARM
> [    0.967273] Modules linked in:
> [    0.967875] CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.2-rc1-00017-gc96cfd687a3f #1
> [    0.968101] Hardware name: SHARP Akita
> [    0.968676] PC is at xscale_cp0_init+0x84/0x114
> [    0.968815] LR is at do_one_initcall+0x60/0x290
> [    0.968997] pc : [<c08ce068>]    lr : [<c000a2dc>]    psr: 60000013
> [    0.969186] sp : c0bdfec8  ip : c0bdfee0  fp : c0bdfedc
> [    0.969332] r10: c08fe834  r9 : c09f2000  r8 : c08c6a9c
> [    0.969498] r7 : c09e0c00  r6 : 00000000  r5 : 00002041  r4 : 00002040
> [    0.969679] r3 : 00000100  r2 : 00000000  r1 : 69052000  r0 : 00000000
> [    0.969892] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    0.970123] Control: 00007977  Table: a22e0000  DAC: 00000071
> [    0.970349] Process swapper (pid: 1, stack limit = 0x(ptrval))
> [    0.970564] Stack: (0xc0bdfec8 to 0xc0be0000)
> [    0.970818] fec0:                   c08cdfe4 ffffe000 c0bdff4c c0bdfee0 c000a2dc c08cdff0
> [    0.971144] fee0: c004b8a0 c08c9458 c0bdfee4 00000000 00000dc0 00000000 00000007 00000007
> [    0.971438] ff00: 00000000 c07fc180 c08c944c c08c6a9c c017213c c0c07c4c c0c07c54 c092d028
> [    0.971728] ff20: 00000000 000000a0 c0c07c20 c092d028 c09293fc c0c07c20 00000008 c08fe854
> [    0.972026] ff40: c0bdff94 c0bdff50 c08ca220 c000a288 00000007 00000007 00000000 c08c944c
> [    0.972315] ff60: ffffe000 000000a0 c0bdff8c 00000000 c0671de8 00000000 00000000 00000000
> [    0.972603] ff80: 00000000 00000000 c0bdffac c0bdff98 c0671e00 c08ca0d8 00000000 c0671de8
> [    0.972891] ffa0: 00000000 c0bdffb0 c0008360 c0671df4 00000000 00000000 00000000 00000000
> [    0.973199] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    0.973488] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    0.973763] Backtrace:
> [    0.974001] [<c08cdfe4>] (xscale_cp0_init) from [<c000a2dc>] (do_one_initcall+0x60/0x290)
> [    0.974282]  r5:ffffe000 r4:c08cdfe4
> [    0.974564] [<c000a27c>] (do_one_initcall) from [<c08ca220>] (kernel_init_freeable+0x154/0x1dc)
> [    0.974791]  r7:c08fe854 r6:00000008 r5:c0c07c20 r4:c09293fc
> [    0.974948] [<c08ca0cc>] (kernel_init_freeable) from [<c0671e00>] (kernel_init+0x18/0x110)
> [    0.975191]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0671de8
> [    0.975394]  r4:00000000
> [    0.975476] [<c0671de8>] (kernel_init) from [<c0008360>] (ret_from_fork+0x14/0x34)
> [    0.975695] Exception stack(0xc0bdffb0 to 0xc0bdfff8)
> [    0.975885] ffa0:                                     00000000 00000000 00000000 00000000
> [    0.976184] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    0.976458] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    0.976657]  r5:c0671de8 r4:00000000
> [    0.976961] Code: e1a03003 e24ff004 e3a02000 e3a03c01 (ec432000)
> 
> The code is:
> 
>   70:	ee1f3f11 	mrc	15, 0, r3, cr15, cr1, {0}
>   74:	e1a03003 	mov	r3, r3
>   78:	e24ff004 	sub	pc, pc, #4
>   7c:	e3a02000 	mov	r2, #0
>   80:	e3a03c01 	mov	r3, #256	; 0x100
>   84:	ec432000 	mar	acc0, r2, r3
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> This is supposed to be a DSP or iWMMXt coprocessor instruction.
> I did notice that the code to support xscale instructions has changed significantly
> in qemu v5.2.

Indeed a lot changed...

I had a quick look. The instruction is decoded in aa32 as LDR_ri.

Without looking at the spec, I simply googled the instruction and
got this link:
https://developer.arm.com/documentation/ddi0406/c/Application-Level-Architecture/ARM-Instruction-Set-Encoding/Load-store-word-and-unsigned-byte
which is for ARMv7-[AR] so I tried this dumb diff to skip the
LDR_ri decoding:

-- >8 --
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6562,6 +6562,10 @@ static bool op_load_ri(DisasContext *s,
arg_ldst_ri *a,
     ISSInfo issinfo = make_issinfo(s, a->rt, a->p, a->w);
     TCGv_i32 addr, tmp;

+    if (!ENABLE_ARCH_7) {
+        return false;
+    }
+
     addr = op_addr_ri_pre(s, a);

     tmp = tcg_temp_new_i32();
@@ -6583,6 +6587,10 @@ static bool op_store_ri(DisasContext *s,
arg_ldst_ri *a,
     ISSInfo issinfo = make_issinfo(s, a->rt, a->p, a->w) | ISSIsWrite;
     TCGv_i32 addr, tmp;

+    if (!ENABLE_ARCH_7) {
+        return false;
+    }
+
     addr = op_addr_ri_pre(s, a);

     tmp = load_reg(s, a->rt);
---

Then realized disas_xscale_insn() isn't reached. In case that helped,
I focused on these commits:

590057d969a ("target/arm: Simplify disas_arm_insn")
19c23a9baaf ("target/arm: Separate decode from handling of coproc insns")
7b4f933db86 ("target/arm: Pull handling of XScale insns out of
disas_coproc_insn()")

> Does this mean that there is a bug, that the affected emulations are no longer
> supported, that I now have to specify some new option on the qemu command line,
> or something else ?

The command line is likely correct, all the pxa270* CPUs have the same
architectural features. It is not yet listed as "no longer supported"
but certainly "not enough tested". Good news, you seem to have an easy
reproducible test.

> 
> Thanks,
> Guenter
> 


