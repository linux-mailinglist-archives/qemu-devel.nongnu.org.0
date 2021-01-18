Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F0E2F9BC6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:16:57 +0100 (CET)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Qee-0005b6-Lj
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QYt-000288-T7
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:11:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:48978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QYp-0008RN-Jj
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:10:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39143AC6E;
 Mon, 18 Jan 2021 09:10:54 +0000 (UTC)
Subject: Re: [RFC PATCH 6/6] softmmu: Restrict watchpoint handlers to TCG
 accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-7-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <56d3c4ca-8963-b1c3-8635-58f20fcb8e37@suse.de>
Date: Mon, 18 Jan 2021 10:10:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-7-f4bug@amsat.org>
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
> Watchpoint funtions use cpu_restore_state() which is only
> available when TCG accelerator is built. Restrict them
> to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

I am doing some of this in my series, and I did not notice that
cpu_watchpoint_insert was also TCG only.

Probably we should merge this somehow.

I thought it was used by gdbstub.c as well, passing flags BP_GDB .

I noticed that gdbstub does something else entirely for kvm_enabled(), ie, kvm_insert_breakpoint,
but what about the other accels, it seems that the code flows to the cpu_breakpoint_insert and watchpoint_insert..?

should cpu_breakpoint_insert have the same fate then?

And is this really all TCG specific?

From gdbstub.c:1020:

static int gdb_breakpoint_insert(int type, target_ulong addr, target_ulong len)
{
    CPUState *cpu;
    int err = 0;

    if (kvm_enabled()) {
        return kvm_insert_breakpoint(gdbserver_state.c_cpu, addr, len, type);
    }

    switch (type) {
    case GDB_BREAKPOINT_SW:
    case GDB_BREAKPOINT_HW:
        CPU_FOREACH(cpu) {
            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
            if (err) {
                break;
            }
        }
        return err;
#ifndef CONFIG_USER_ONLY
    case GDB_WATCHPOINT_WRITE:
    case GDB_WATCHPOINT_READ:
    case GDB_WATCHPOINT_ACCESS:
        CPU_FOREACH(cpu) {
            err = cpu_watchpoint_insert(cpu, addr, len,
                                        xlat_gdb_type(cpu, type), NULL);




> ---
> RFC because we could keep that code by adding an empty
>     stub for cpu_restore_state(), but it is unclear as
>     the function is named generically.
> ---
>  include/hw/core/cpu.h | 4 ++--
>  softmmu/physmem.c     | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 140fa32a5e3..1b4af30db04 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -1033,7 +1033,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
>      return false;
>  }
>  
> -#ifdef CONFIG_USER_ONLY
> +#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
>  static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>                                          int flags, CPUWatchpoint **watchpoint)
>  {
> @@ -1098,7 +1098,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>   * If no watchpoint is registered for the range, the result is 0.
>   */
>  int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
> -#endif
> +#endif /* !CONFIG_TCG || CONFIG_USER_ONLY */
>  
>  /**
>   * cpu_get_address_space:
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 65602ed548e..5135a6371b5 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -765,6 +765,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>      return cpu->cpu_ases[asidx].as;
>  }
>  
> +#ifdef CONFIG_TCG
>  /* Add a watchpoint.  */
>  int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>                            int flags, CPUWatchpoint **watchpoint)
> @@ -873,6 +874,7 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
>      }
>      return ret;
>  }
> +#endif /* CONFIG_TCG */
>  
>  /* Called from RCU critical section */
>  static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
> @@ -2356,6 +2358,7 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
>      return block->offset + offset;
>  }
>  
> +#ifdef CONFIG_TCG
>  /* Generate a debug exception if a watchpoint has been hit.  */
>  void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>                            MemTxAttrs attrs, int flags, uintptr_t ra)
> @@ -2424,6 +2427,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>          }
>      }
>  }
> +#endif /* CONFIG_TCG */
>  
>  static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
>                                   MemTxAttrs attrs, void *buf, hwaddr len);
> 


