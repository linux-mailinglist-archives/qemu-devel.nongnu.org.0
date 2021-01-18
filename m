Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888D2F9BB9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:06:51 +0100 (CET)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QUs-0000Mm-LN
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QSY-0008Gz-VA
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:04:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:45792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QSR-0005Zs-JW
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:04:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21FF2ACF4;
 Mon, 18 Jan 2021 09:04:18 +0000 (UTC)
Subject: Re: [RFC PATCH 5/6] accel/tcg: Restrict cpu_io_recompile() from other
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-6-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2434cd1b-57e9-f0ab-22b0-cffe96a536e1@suse.de>
Date: Mon, 18 Jan 2021 10:04:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.252,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
> As cpu_io_recompile() is only called within TCG accelerator
> in cputlb.c, declare it locally.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

It's only used in accel/tcg/cputlb.c, should it be a static function there?


> ---
> RFC because not sure if other accelerator could implement this.
> ---
>  accel/tcg/internal.h    | 2 ++
>  include/exec/exec-all.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index f7e18c3498b..c72a69e4d63 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -18,4 +18,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>  
>  void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
>  
> +void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
> +
>  #endif
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 3acc7c2943a..125000bcf70 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -63,7 +63,6 @@ void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
>  bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
>  
>  void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
> -void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
>  void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
>  void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
>  void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
> 


