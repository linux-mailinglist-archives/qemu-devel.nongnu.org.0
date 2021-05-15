Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCF3817EE
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:58:18 +0200 (CEST)
Received: from localhost ([::1]:41102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrzt-00017v-SB
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhryn-0000Ss-VY
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:57:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhryl-0005r9-UJ
 for qemu-devel@nongnu.org; Sat, 15 May 2021 06:57:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id t206so997091wmf.0
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 03:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5LedTU84NPeF3kPMC7rfLq/Z+57eofcPwy2dqiOalLg=;
 b=NqScMC+F99EBw49Rzps3l8m82doHwvoHeoUI4/qB/Yo7yAhOtJS0lqFa4qy3fyJMAx
 x86BzDSaUOKNyq9q0acOOjlg9Y+6DZACCDN/ulwKilETdTyf/3oNuSFE+rd9VHPShW71
 k/FVXWqAg9KaXx9ZmSRZnVPGpi9RU53XfsJBgurHYmltgpfrY1GlBWbTErZnA77wX36a
 UwTh66CUXiHY2MqUgSKQFnOV9fL/JKKS19m1PohfIJlEYQK4Yyg+ce/aY9LNotRRUxFA
 zE07AYW116l4ZN3iBMvEVf14XtK+nacDKQHiJip9QUdPkVR1Sc7hbQRWzaRmPvahtx+u
 EjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5LedTU84NPeF3kPMC7rfLq/Z+57eofcPwy2dqiOalLg=;
 b=NVaHGe0480CMjJL7DtYTrbtmq1t4YnDqOsA31mDy3A65Iglqc5dQ4CFXJKUsBIRv0j
 o7kxEAVVo8XXsldFP1/oDyy/DF0AqvFPcF9qN/WICG9VeHLFCmsBMS6oyVckYYQYiyL7
 99zNY9cNl6vh9A5DC2rvK4ISxSeuByQniY/Ux+LZATgFmjYDHNSDXZ4c7fwHFHcNjm0M
 HXLiWnVm9GPyszuGGG7XSWoTOinowo+MTIx6vPPhNIm4td/E3c5Vc8rcwdNX2+3C3Qui
 RAt2/w9KJxJc7yGEv8hB0y36Lv4FhgQtiTJ5nHAVAHsQWC2MDXqFQir3KF/N3+toOP7F
 ibPw==
X-Gm-Message-State: AOAM532El5lN3Ogu7mdiWXpHw1Hn5G0uqzZdaDrWmBKJeqxbz4/Xgcpt
 exexZQ7cbDvpDN/XI/r83dg=
X-Google-Smtp-Source: ABdhPJyhvKFQP7gGQB713Ei8lqU5b/HisWEc/+rU+1qjB4e7H6FH4nzPkiLvgAuN8NQOXxKQoiNQFQ==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id
 n11mr54484276wmq.180.1621076226168; 
 Sat, 15 May 2021 03:57:06 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a17sm1075434wrt.53.2021.05.15.03.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 03:57:05 -0700 (PDT)
Subject: Re: [PULL 21/38] tcg/tci: Implement the disassembler properly
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210317153444.310566-1-richard.henderson@linaro.org>
 <20210317153444.310566-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3831f59a-e81e-b05d-891c-ab6e2dd8552e@amsat.org>
Date: Sat, 15 May 2021 12:57:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317153444.310566-22-richard.henderson@linaro.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 3/17/21 4:34 PM, Richard Henderson wrote:
> Actually print arguments as opposed to simply the opcodes
> and, uselessly, the argument counts.  Reuse all of the helpers
> developed as part of the interpreter.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build           |   2 +-
>  include/tcg/tcg-opc.h |   2 -
>  disas/tci.c           |  61 ---------
>  tcg/tci.c             | 283 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 284 insertions(+), 64 deletions(-)
>  delete mode 100644 disas/tci.c

> +/* Disassemble TCI bytecode. */
> +int print_insn_tci(bfd_vma addr, disassemble_info *info)
> +{

> +    switch (op) {
> +    case INDEX_op_br:
> +    case INDEX_op_call:
> +    case INDEX_op_exit_tb:
> +    case INDEX_op_goto_tb:
> +        tci_args_l(&tb_ptr, &ptr);
> +        info->fprintf_func(info->stream, "%-12s  %p", op_name, ptr);
> +        break;

I just realized ptr can be NULL:

  "tcg/tci: Implement goto_ptr"

  The check in tcg_prologue_init is disabled because TCI does
  want to use NULL to indicate exit, as opposed to branching to
  a real epilogue.

What about adding str_ptr (similar to str_c/str_r) to pretty print
the NULL case?

