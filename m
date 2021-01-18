Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE332F9BCD
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:20:43 +0100 (CET)
Received: from localhost ([::1]:33684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QiI-0008TW-3A
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1Qc2-00048I-6b
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:14:14 -0500
Received: from mx2.suse.de ([195.135.220.15]:51100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1Qc0-0001Xi-4t
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:14:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9835CAC6E;
 Mon, 18 Jan 2021 09:14:10 +0000 (UTC)
Subject: Re: [PATCH 2/6] accel/tcg: Restrict tb_flush_jmp_cache() from other
 accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-3-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <80eb180d-4f91-a286-5e97-5406cdb7b25d@suse.de>
Date: Mon, 18 Jan 2021 10:14:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-3-f4bug@amsat.org>
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
> tb_flush_jmp_cache() is only called within TCG accelerator,
> declare it locally.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> We could also inline it in cputlb.c, the single user.

That is what I was thinking, I would be more inclined to put it as a static function there.

Thanks,

Claudio

> ---
>  accel/tcg/internal.h      | 16 ++++++++++++++++
>  include/exec/exec-all.h   |  3 ---
>  accel/tcg/cputlb.c        |  1 +
>  accel/tcg/translate-all.c |  1 +
>  4 files changed, 18 insertions(+), 3 deletions(-)
>  create mode 100644 accel/tcg/internal.h
> 
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> new file mode 100644
> index 00000000000..4981d98dbfd
> --- /dev/null
> +++ b/accel/tcg/internal.h
> @@ -0,0 +1,16 @@
> +/*
> + * internal execution defines for qemu
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + */
> +
> +#ifndef ACCEL_TCG_INTERNAL_H
> +#define ACCEL_TCG_INTERNAL_H
> +
> +#include "exec/exec-all.h"
> +
> +void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
> +
> +#endif
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 516013e735a..1e3e7cf8e78 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -663,9 +663,6 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
>  void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
>  void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
>  
> -/* exec.c */
> -void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
> -
>  MemoryRegionSection *
>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>                                    hwaddr *xlat, hwaddr *plen,
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index ced3dc077ec..b1f0f404aa5 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -36,6 +36,7 @@
>  #include "exec/translate-all.h"
>  #include "trace/trace-root.h"
>  #include "trace/mem.h"
> +#include "internal.h"
>  #ifdef CONFIG_PLUGIN
>  #include "qemu/plugin-memory.h"
>  #endif
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ca7ef6aa177..6427bf87ae0 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -60,6 +60,7 @@
>  #include "sysemu/cpu-timers.h"
>  #include "sysemu/tcg.h"
>  #include "qapi/error.h"
> +#include "internal.h"
>  
>  /* #define DEBUG_TB_INVALIDATE */
>  /* #define DEBUG_TB_FLUSH */
> 


