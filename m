Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A35327A0A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 09:54:42 +0100 (CET)
Received: from localhost ([::1]:46232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGeK8-0004EN-Hp
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 03:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGeJF-0003mC-GN
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:53:45 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGeJD-0007vJ-Kr
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 03:53:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l12so15200864wry.2
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 00:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xi+p7cWA7CaTXDG74B6ylQ14l/lg+a4JzCgXKQkdlGI=;
 b=Nb9pfoig1RAdsOu/jvyooRoWcJ9Lzd+NX8dFd7utzaVeoj+Lp6uTJzNZm5YgsFOPLU
 gW70bO86VOnIhT9bgaJFDiO1wWpGJn+16XwBp4fqZknEpBh93Fcd9h9FC+es1cRYnF5/
 STqjSr3+1tp9L0t8PrgbGd50MAfuAJNEQUuK61SwIcwyUcolrDVRDehIeLEFUgGZXUW+
 f5TW7S157jEq9/OgX6/LH3vpiT9saBHlauOm79GishUzbWCVHgfbVsUyQkN9eeYXixZi
 MOl/2T4FDtkh4ef/QtiDBExxV8oFachk5I01TaxUKZfG0AAy6Ad0jykdgnkT3ScTPbV+
 DLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xi+p7cWA7CaTXDG74B6ylQ14l/lg+a4JzCgXKQkdlGI=;
 b=qjnGMQWT3MObI6QWRixX9/8ULZ9eAcLdSfgmEh9ZuFxiN/zU9z2HNz+eT6TJCYTiBt
 lxnWxwToIub8s4oFZx8/zv+aJjWkcTwIsiI6XCJ2DsTOgmJfc8KOjbeafd2VbV+y1oOg
 SHvNz+c2a4B3COW2SJyBtX/dD8J655mUxgYr8H4CCz6hMy4HTas5l/bTDgziuC7sD0Eb
 jZU22bBdn0NYdm9cgFcisxdSOjWHi338D/cyShs7aBbk3Dd+GD2yyWHpmzrznjMk2zr2
 BsSPNVsHsja51Vh7ofpeVORGp3MfxKbIwsHqx6CBWmOkhhZvhnG0/5YBd6SEh007y2C7
 bkKg==
X-Gm-Message-State: AOAM532nPnSNM0OhNaBusHwizsdrn5I17RYzGNAbvNFcw4638BWTHoAI
 knEiwsZqO4VzGT4PhUzw3Us=
X-Google-Smtp-Source: ABdhPJx03hnzbbekmLDr5O1+5lO1C2PRYZ8X9/gkq5eXisTEwht1k79N3FBMiZuYIcGlFMJpgbstEg==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr15375554wrt.120.1614588822205; 
 Mon, 01 Mar 2021 00:53:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s84sm21285926wme.11.2021.03.01.00.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 00:53:41 -0800 (PST)
Subject: Re: [PATCH 1/2] target/mips: Fold jazz behaviour into
 mips_cpu_do_transaction_failed
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210227232519.222663-1-richard.henderson@linaro.org>
 <20210227232519.222663-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0b8d2903-2884-65b3-b902-77bf56e6955e@amsat.org>
Date: Mon, 1 Mar 2021 09:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210227232519.222663-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 12:25 AM, Richard Henderson wrote:
> Add a flag to MIPSCPUClass in order to avoid needing to
> replace mips_tcg_ops.do_transaction_failed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/cpu-qom.h   |  3 +++
>  hw/mips/jazz.c          | 35 +++--------------------------------
>  target/mips/op_helper.c |  3 ++-
>  3 files changed, 8 insertions(+), 33 deletions(-)
...
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 83c8086062..7b22a9b511 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
...> @@ -152,7 +128,7 @@ static void mips_jazz_init(MachineState *machine,
>      int bios_size, n;
>      Clock *cpuclk;
>      MIPSCPU *cpu;
> -    CPUClass *cc;
> +    MIPSCPUClass *mcc;
>      CPUMIPSState *env;
>      qemu_irq *i8259;
>      rc4030_dma *dmas;
> @@ -199,8 +175,6 @@ static void mips_jazz_init(MachineState *machine,
>       * However, we can't simply add a global memory region to catch
>       * everything, as this would make all accesses including instruction
>       * accesses be ignored and not raise exceptions.
> -     * So instead we hijack the do_transaction_failed method on the CPU, and
> -     * do not raise exceptions for data access.
>       *
>       * NOTE: this behaviour of raising exceptions for bad instruction
>       * fetches but not bad data accesses was added in commit 54e755588cf1e9
> @@ -210,11 +184,8 @@ static void mips_jazz_init(MachineState *machine,
>       * we could replace this hijacking of CPU methods with a simple global
>       * memory region that catches all memory accesses, as we do on Malta.
>       */
> -    cc = CPU_GET_CLASS(cpu);
> -#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
> -    real_do_transaction_failed = cc->tcg_ops->do_transaction_failed;
> -    cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;

We don't need the "hw/core/tcg-cpu-ops.h" header anymore.

> -#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
> +    mcc = MIPS_CPU_GET_CLASS(cpu);
> +    mcc->no_data_aborts = true;

