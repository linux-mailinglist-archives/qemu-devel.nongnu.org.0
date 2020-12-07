Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B162D0B9D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 09:18:32 +0100 (CET)
Received: from localhost ([::1]:34082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmBj5-0000g3-Vy
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 03:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmBRD-0002cN-A5
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:00:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:33798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmBRA-0005Ia-PJ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 03:00:02 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE2ECAC90;
 Mon,  7 Dec 2020 07:59:58 +0000 (UTC)
Subject: Re: [RFC PATCH 18/19] target/mips: Restrict some TCG specific
 CPUClass handlers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-19-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <88161f99-aae5-3b80-e8c6-a57d122a28c4@suse.de>
Date: Mon, 7 Dec 2020 08:59:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:39 AM, Philippe Mathieu-Daudé wrote:
> Restrict the following CPUClass handlers to TCG:
> - do_interrupt

In this patch it seems do_interrupt is changed to be CONFIG_USER_ONLY, it is not restricted to TCG.
Was this desired, should be commented as such?

Also, should the whole function then be #ifdefed out in helpers.c?
I guess I am vouching for moving the ifndef CONFIG_USER_ONLY one line up in helpers.c.

But you wanted this CONFIG_TCG-only?


> - do_transaction_failed
> - do_unaligned_access
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Claudio Fontana <cfontana@suse.de>
> 
>  target/mips/cpu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 8a4486e3ea1..03bd35b7903 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -483,7 +483,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>  
>      cc->class_by_name = mips_cpu_class_by_name;
>      cc->has_work = mips_cpu_has_work;
> -    cc->do_interrupt = mips_cpu_do_interrupt;
>      cc->cpu_exec_interrupt = mips_cpu_exec_interrupt;
>      cc->dump_state = mips_cpu_dump_state;
>      cc->set_pc = mips_cpu_set_pc;
> @@ -491,8 +490,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>      cc->gdb_read_register = mips_cpu_gdb_read_register;
>      cc->gdb_write_register = mips_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
> -    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
> -    cc->do_unaligned_access = mips_cpu_do_unaligned_access;
> +    cc->do_interrupt = mips_cpu_do_interrupt;
>      cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
>      cc->vmsd = &vmstate_mips_cpu;
>  #endif
> @@ -500,6 +498,10 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize = mips_tcg_init;
>      cc->tlb_fill = mips_cpu_tlb_fill;
> +#if !defined(CONFIG_USER_ONLY)
> +    cc->do_unaligned_access = mips_cpu_do_unaligned_access;
> +    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
> +#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
>  #endif
>  
>      cc->gdb_num_core_regs = 73;
> 


