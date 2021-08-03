Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB83DEA32
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 12:00:31 +0200 (CEST)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mArDq-0002I0-GR
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 06:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mArCz-0001co-1R
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:59:37 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mArCx-0001jG-P1
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:59:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p5so24682802wro.7
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GDrxo9B5IjifGERoXVxtX87FYSIqgY2btTmDzMyZPLY=;
 b=YxTQMwd6UPe41uBA3hl0dYn+nXj1r3p9yVGqC7fvsaIed+6UUFa0nTxnpVOqKYcRSe
 8XKaMvmrTAdXxkP2+NSv4OS6+kXFM+2YQiAOROhxrulpAX8qqYOkd3iuMNDbZSuiYhlR
 GiicmJLdhSauboUmtjnLzUb87fSFWQyiAMYud/1aubn7yXEjcrVFa3Pon5GXOhxdOaxY
 UWW1c6RT0jfRfzny+APOxZfsmYwBO7SkklHWdf8rNChl4yqpx/Y5O3ONCA+dCQDeSguD
 2g4p/UKk62cd4NBaevH+KCN43i1bW7vRKaTYBI1y279PN1Fxe8KgQCMA9AeaGlZnCLLM
 BsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GDrxo9B5IjifGERoXVxtX87FYSIqgY2btTmDzMyZPLY=;
 b=iT+jxu57IutV6pQZ8bidXKVpS97THEv6HDZGCEKCXhaX9J6w8XyrqPfgVj8i3yRCGj
 ZSVBbE7bgtEe4XteJDkwaAZAyG1Mm5BxKDFdXqJbFUxLmNIoWX1KOvBfJz2cWgKNQvEs
 EVuilMDqlkFwrbeaD3qMmIkeoMuGLNGgUQ4Qfz4DS1SZFispXXsdQUg4qQbupMLcJc23
 UYjGsAWRosur2TjnDTLF65Z7tJGvC3eLUyYNHlnCL0uq9jzOkhriLdKPSpuSk4jlVHFT
 UkAT0evchO9mURnWZcOnw7GhjipBUnucqKJ6vVLwiIM7cKd308AmUuZ31yjDa0xh5OcR
 TMPQ==
X-Gm-Message-State: AOAM5315agZiXpxyOB17a+3YKOBOoTMnNKJ8SU64N2AqQBX/NZWsQEYG
 by/GP69q8LKi2xvFWmc4c3OdayhDVVAR1A==
X-Google-Smtp-Source: ABdhPJwFYEVtmTCu3Ir36zf8bQkfZU2EhBhj56JedzE2vyd0bBAxaqAZ8mmWYMohoCO60wLkgLbW5A==
X-Received: by 2002:a05:6000:18c8:: with SMTP id
 w8mr22102099wrq.90.1627984773817; 
 Tue, 03 Aug 2021 02:59:33 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z6sm12793260wmp.1.2021.08.03.02.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 02:59:33 -0700 (PDT)
Subject: Re: [PATCH v2 02/55] hw/core: Make do_unaligned_access available to
 user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9aed1ff5-a784-01a3-327b-4426f9098dc5@amsat.org>
Date: Tue, 3 Aug 2021 11:59:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 8/3/21 6:13 AM, Richard Henderson wrote:
> We shouldn't be ignoring SIGBUS for user-only.
> 
> Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
> Move the wrapper, cpu_unaligned_access, to cpu-exec-common.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h          |  4 ++++
>  include/hw/core/tcg-cpu-ops.h | 16 ++++++++--------
>  accel/tcg/cpu-exec-common.c   | 12 ++++++++++++
>  accel/tcg/cputlb.c            |  9 ---------
>  4 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 881bc1ede0..a5e70cd91d 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -19,4 +19,8 @@ void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
>  void page_init(void);
>  void tb_htable_init(void);
>  
> +void QEMU_NORETURN cpu_unaligned_access(CPUState *cpu, vaddr addr,
> +                                        MMUAccessType access_type,
> +                                        int mmu_idx, uintptr_t retaddr);

Thanks for using noreturn :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

