Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A8676BA3
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 09:33:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJVmU-0005LB-0w; Sun, 22 Jan 2023 03:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVmQ-0005EK-NC
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:32:46 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVmM-0006eQ-Gn
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674376357; bh=P5JTDCxaMfn1uKaBV8k5MIj65z0icdLL1JEUILwCjc4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TlFHgzuzpD+MqWiB2o/9YJkoKzCFHmX37l9/WKykvALPSU3ayXfVGvukVLbvkGohK
 ATGFlwgCkD2PaaHGYgpcvNhRw7Hmd/DNX41g1DUc9WAhfxIX24q9SYqIQ2DdzkT8UN
 GuOXbXBflhHfbwx3ConGjfHQYeHu0NTAlPT5iSZI=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 4604F6006F;
 Sun, 22 Jan 2023 16:32:37 +0800 (CST)
Message-ID: <33b5bbc0-ae9d-41f2-0337-6d4af12f2726@xen0n.name>
Date: Sun, 22 Jan 2023 16:32:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 01/10] target/loongarch: Enable the disassembler for
 host tcg
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-2-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/18/23 09:11, Richard Henderson wrote:
> Reuse the decodetree based disassembler from
> target/loongarch/ for tcg/loongarch64/.
>
> The generation of decode-insns.c.inc into ./libcommon.fa.p/ could
> eventually result in conflict, if any other host requires the same
> trick, but this is good enough for now.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas.c                      | 2 ++
>   target/loongarch/meson.build | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/disas.c b/disas.c
> index 3b31315f40..c9fa38e6d7 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -198,6 +198,8 @@ static void initialize_debug_host(CPUDebug *s)
>       s->info.cap_insn_split = 6;
>   #elif defined(__hppa__)
>       s->info.print_insn = print_insn_hppa;
> +#elif defined(__loongarch64)
This could just be `__loongarch__` because both LA32 and LA64 share the 
same encoding, so although LA32 userland isn't quite there yet it 
wouldn't do any harm.
> +    s->info.print_insn = print_insn_loongarch;
>   #endif
>   }
>   
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> index 6376f9e84b..690633969f 100644
> --- a/target/loongarch/meson.build
> +++ b/target/loongarch/meson.build
> @@ -3,7 +3,6 @@ gen = decodetree.process('insns.decode')
>   loongarch_ss = ss.source_set()
>   loongarch_ss.add(files(
>     'cpu.c',
> -  'disas.c',
>   ))
>   loongarch_tcg_ss = ss.source_set()
>   loongarch_tcg_ss.add(gen)
> @@ -24,6 +23,8 @@ loongarch_softmmu_ss.add(files(
>     'iocsr_helper.c',
>   ))
>   
> +common_ss.add(when: 'CONFIG_LOONGARCH_DIS', if_true: [files('disas.c'), gen])
> +
>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
>   
>   target_arch += {'loongarch': loongarch_ss}

Apart from the minor suggestion above,

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks!


