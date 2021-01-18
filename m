Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E192F9BCB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:18:45 +0100 (CET)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QgP-0007TZ-1M
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QaB-00036I-VD
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:12:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:49706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QaA-0000gh-Bn
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:12:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5929B1A1;
 Mon, 18 Jan 2021 09:12:16 +0000 (UTC)
Subject: Re: [PATCH 3/6] accel/tcg: Restrict tb_gen_code() from other
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-4-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7359d7bd-ed7d-71ad-3610-b839c9c99fd5@suse.de>
Date: Mon, 18 Jan 2021 10:12:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-4-f4bug@amsat.org>
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
> tb_gen_code() is only called within TCG accelerator,
> declare it locally.

Is this used only in accel/tcg/cpu-exec.c ? Should it be a static function there?

Ciao,

Claudio

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  accel/tcg/internal.h    | 5 +++++
>  include/exec/exec-all.h | 5 -----
>  accel/tcg/cpu-exec.c    | 1 +
>  accel/tcg/user-exec.c   | 1 +
>  4 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 4981d98dbfd..f7e18c3498b 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -11,6 +11,11 @@
>  
>  #include "exec/exec-all.h"
>  
> +TranslationBlock *tb_gen_code(CPUState *cpu,
> +                              target_ulong pc, target_ulong cs_base,
> +                              uint32_t flags,
> +                              int cflags);
> +
>  void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
>  
>  #endif
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 1e3e7cf8e78..3acc7c2943a 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -64,11 +64,6 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
>  
>  void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
>  void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
> -TranslationBlock *tb_gen_code(CPUState *cpu,
> -                              target_ulong pc, target_ulong cs_base,
> -                              uint32_t flags,
> -                              int cflags);
> -
>  void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
>  void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
>  void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index e0df9b6a1dd..43676ae8d13 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -41,6 +41,7 @@
>  #include "exec/cpu-all.h"
>  #include "sysemu/cpu-timers.h"
>  #include "sysemu/replay.h"
> +#include "internal.h"
>  
>  /* -icount align implementation. */
>  
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 1215b55ca08..05f3c09cbf9 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -28,6 +28,7 @@
>  #include "qemu/atomic128.h"
>  #include "trace/trace-root.h"
>  #include "trace/mem.h"
> +#include "internal.h"
>  
>  #undef EAX
>  #undef ECX
> 


