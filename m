Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD76C6270
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 09:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGiQ-00034L-Nc; Thu, 23 Mar 2023 04:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfGiO-00034B-Nf
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:54:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfGiL-00055e-VD
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 04:54:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so628238wmb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 01:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679561668;
 h=content-transfer-encoding:in-reply-to:cc:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TqwxBbKg4AFxmiCcAOqNG24WVpXBCYWOEXOOcUqQ7Ms=;
 b=z4eN/QId4xA6zJD5hrd8FZnVQWRInL/vVl3ASY2/2YjnJez6Kzv3q7NwtvBjpVewPh
 YHDfAjfdzHiOHDqdbBJf2rawiom2l6liyX8Zaf6kPXFlCA+0ucl4MEIKgMVy7LVT6AMO
 R31ImkdyEhCdKxC5NTr6c7l78zd3NuaNszzoHo9BtovGqn2D11Ylm3afhZJOvWLScLYx
 5mj70bZnEHOja5D8jhrxsCzUCjoDEnrUsS9f7SaMQN6mKAGJ1dNKms1IX6VP3bL1iys6
 KCX09qD+pcQ8VvZvGM7cm3QgQGHjTd17n6kuDTI7d7CBgx0JVyitEum7vKN1Lr0PbA6u
 r7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679561668;
 h=content-transfer-encoding:in-reply-to:cc:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TqwxBbKg4AFxmiCcAOqNG24WVpXBCYWOEXOOcUqQ7Ms=;
 b=Ii0yYcNfTg9elz+4KLy2m/dxlH2N6BA/en/5f2qL7vLaWH/ocpnAlu8fls+698U6Hj
 a2NaU4tlmUOnJNf3cRbF6amu0CowCjfBwB9GQeTRgXY5y6xNYrG7NisFD6WbFrDo7XA2
 EYfVNehrbV5L0ZL4gRSVQeJRRPj5ALVvW1dgmEjx8HYNXheOiW+psM9vT7p9TznTP+mm
 MlRB8G2JVcWGPtia6MUDhxu6SihM+JExS9rANyC6RV3vkE4XeEhT44AOqLT94Tc++47G
 ohIeV1+qAG8wTMX6P7TVEkB8oJNhTGsefpuA59zFTaB+dVHeFFyfIzD0mLTXVWNiDb75
 Gagw==
X-Gm-Message-State: AO0yUKVEb9jzMUSqoPtNC3QIbzp6MlS5wT2jnLp0eZp5vovNeDaLHe+5
 OE+8ZE32BfA74j7YbMLnimjvZw==
X-Google-Smtp-Source: AK7set9hMfykXHl5JcXUc3Ra9xbItZMPhBvkvr7i7dFtGLmAZnGzvvCxmQUUPXvzZmNsGsxpfvpAsA==
X-Received: by 2002:a7b:ce87:0:b0:3eb:3843:9f31 with SMTP id
 q7-20020a7bce87000000b003eb38439f31mr1649514wmj.10.1679561668152; 
 Thu, 23 Mar 2023 01:54:28 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b003ee10fb56ebsm1262111wmk.9.2023.03.23.01.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 01:54:27 -0700 (PDT)
Message-ID: <c8c3c74f-53e6-6b3f-756f-b9c2eaa389a0@linaro.org>
Date: Thu, 23 Mar 2023 09:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PULL 034/126] softmmu: Extract watchpoint API from physmem.c
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230227140213.35084-1-philmd@linaro.org>
 <20230227140213.35084-25-philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>
In-Reply-To: <20230227140213.35084-25-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 27/2/23 15:00, Philippe Mathieu-Daudé wrote:
> The watchpoint API is specific to TCG system emulation.

I'm seeing CPUWatchpoint being used by KVM:

$ git grep CPUWatchpoint|fgrep kvm
target/arm/kvm64.c:1558:        CPUWatchpoint *wp = 
find_hw_watchpoint(cs, debug_exit->far);
target/i386/kvm/kvm.c:5216:static CPUWatchpoint hw_watchpoint;
target/ppc/kvm.c:443:static CPUWatchpoint hw_watchpoint;
target/s390x/kvm/kvm.c:139:static CPUWatchpoint hw_watchpoint;

Scrolling a bit in git-history:

commit e4482ab7e3849fb5e01ccacfc13f424cc6acb8d5
Author: Alex Bennée <alex.bennee@linaro.org>
Date:   Thu Dec 17 13:37:15 2015 +0000

     target-arm: kvm - add support for HW assisted debug

     This adds basic support for HW assisted debug. The ioctl interface
     to KVM allows us to pass an implementation defined number of break
     and watch point registers. When KVM_GUESTDBG_USE_HW is specified
     these debug registers will be installed in place on the world switch
     into the guest.

So it seems I missed something big.

> Move it to a new compile unit. The inlined stubs are used
> for user-mode and non-TCG accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20221209141254.68662-1-philmd@linaro.org>
> ---
>   MAINTAINERS           |   1 +
>   include/hw/core/cpu.h |   2 +-
>   softmmu/meson.build   |   3 +-
>   softmmu/physmem.c     | 191 ------------------------------------
>   softmmu/watchpoint.c  | 220 ++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 224 insertions(+), 193 deletions(-)
>   create mode 100644 softmmu/watchpoint.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f1d230027..75dccf0b4e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -123,6 +123,7 @@ M: Richard Henderson <richard.henderson@linaro.org>
>   R: Paolo Bonzini <pbonzini@redhat.com>
>   S: Maintained
>   F: softmmu/cpus.c
> +F: softmmu/watchpoint.c
>   F: cpus-common.c
>   F: page-vary.c
>   F: page-vary-common.c
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 56cbe9e678..a5aa44d12c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -948,7 +948,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
>       return false;
>   }
>   
> -#ifdef CONFIG_USER_ONLY
> +#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)

Should I partially revert this?

>   static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
>                                           int flags, CPUWatchpoint **watchpoint)
>   {
> diff --git a/softmmu/meson.build b/softmmu/meson.build
> index 1828db149c..0180577517 100644
> --- a/softmmu/meson.build
> +++ b/softmmu/meson.build
> @@ -8,7 +8,8 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
>   )])
>   
>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: [files(
> -  'icount.c'
> +  'icount.c',
> +  'watchpoint.c',
>   )])
>   
>   softmmu_ss.add(files(
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cb998cdf23..df54b917a9 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -781,197 +781,6 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>       return cpu->cpu_ases[asidx].as;
>   }
>   
> -/* Add a watchpoint.  */
> -int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
> -                          int flags, CPUWatchpoint **watchpoint)
> -{
> -    CPUWatchpoint *wp;
> -    vaddr in_page;
> -
> -    /* forbid ranges which are empty or run off the end of the address space */
> -    if (len == 0 || (addr + len - 1) < addr) {
> -        error_report("tried to set invalid watchpoint at %"
> -                     VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
> -        return -EINVAL;
> -    }
> -    wp = g_malloc(sizeof(*wp));
> -
> -    wp->vaddr = addr;
> -    wp->len = len;
> -    wp->flags = flags;
> -
> -    /* keep all GDB-injected watchpoints in front */
> -    if (flags & BP_GDB) {
> -        QTAILQ_INSERT_HEAD(&cpu->watchpoints, wp, entry);
> -    } else {
> -        QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, entry);
> -    }
> -
> -    in_page = -(addr | TARGET_PAGE_MASK);
> -    if (len <= in_page) {
> -        tlb_flush_page(cpu, addr);
> -    } else {
> -        tlb_flush(cpu);
> -    }
> -
> -    if (watchpoint)
> -        *watchpoint = wp;
> -    return 0;
> -}
> -
> -/* Remove a specific watchpoint.  */
> -int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
> -                          int flags)
> -{
> -    CPUWatchpoint *wp;
> -
> -    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        if (addr == wp->vaddr && len == wp->len
> -                && flags == (wp->flags & ~BP_WATCHPOINT_HIT)) {
> -            cpu_watchpoint_remove_by_ref(cpu, wp);
> -            return 0;
> -        }
> -    }
> -    return -ENOENT;
> -}
> -
> -/* Remove a specific watchpoint by reference.  */
> -void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
> -{
> -    QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
> -
> -    tlb_flush_page(cpu, watchpoint->vaddr);
> -
> -    g_free(watchpoint);
> -}
> -
> -/* Remove all matching watchpoints.  */
> -void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
> -{
> -    CPUWatchpoint *wp, *next;
> -
> -    QTAILQ_FOREACH_SAFE(wp, &cpu->watchpoints, entry, next) {
> -        if (wp->flags & mask) {
> -            cpu_watchpoint_remove_by_ref(cpu, wp);
> -        }
> -    }
> -}
> -
> -#ifdef CONFIG_TCG
> -/* Return true if this watchpoint address matches the specified
> - * access (ie the address range covered by the watchpoint overlaps
> - * partially or completely with the address range covered by the
> - * access).
> - */
> -static inline bool watchpoint_address_matches(CPUWatchpoint *wp,
> -                                              vaddr addr, vaddr len)
> -{
> -    /* We know the lengths are non-zero, but a little caution is
> -     * required to avoid errors in the case where the range ends
> -     * exactly at the top of the address space and so addr + len
> -     * wraps round to zero.
> -     */
> -    vaddr wpend = wp->vaddr + wp->len - 1;
> -    vaddr addrend = addr + len - 1;
> -
> -    return !(addr > wpend || wp->vaddr > addrend);
> -}
> -
> -/* Return flags for watchpoints that match addr + prot.  */
> -int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
> -{
> -    CPUWatchpoint *wp;
> -    int ret = 0;
> -
> -    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        if (watchpoint_address_matches(wp, addr, len)) {
> -            ret |= wp->flags;
> -        }
> -    }
> -    return ret;
> -}
> -
> -/* Generate a debug exception if a watchpoint has been hit.  */
> -void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> -                          MemTxAttrs attrs, int flags, uintptr_t ra)
> -{
> -    CPUClass *cc = CPU_GET_CLASS(cpu);
> -    CPUWatchpoint *wp;
> -
> -    assert(tcg_enabled());
> -    if (cpu->watchpoint_hit) {
> -        /*
> -         * We re-entered the check after replacing the TB.
> -         * Now raise the debug interrupt so that it will
> -         * trigger after the current instruction.
> -         */
> -        qemu_mutex_lock_iothread();
> -        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
> -        qemu_mutex_unlock_iothread();
> -        return;
> -    }
> -
> -    if (cc->tcg_ops->adjust_watchpoint_address) {
> -        /* this is currently used only by ARM BE32 */
> -        addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
> -    }
> -    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> -        if (watchpoint_address_matches(wp, addr, len)
> -            && (wp->flags & flags)) {
> -            if (replay_running_debug()) {
> -                /*
> -                 * replay_breakpoint reads icount.
> -                 * Force recompile to succeed, because icount may
> -                 * be read only at the end of the block.
> -                 */
> -                if (!cpu->can_do_io) {
> -                    /* Force execution of one insn next time.  */
> -                    cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
> -                    cpu_loop_exit_restore(cpu, ra);
> -                }
> -                /*
> -                 * Don't process the watchpoints when we are
> -                 * in a reverse debugging operation.
> -                 */
> -                replay_breakpoint();
> -                return;
> -            }
> -            if (flags == BP_MEM_READ) {
> -                wp->flags |= BP_WATCHPOINT_HIT_READ;
> -            } else {
> -                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
> -            }
> -            wp->hitaddr = MAX(addr, wp->vaddr);
> -            wp->hitattrs = attrs;
> -
> -            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
> -                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
> -                wp->flags &= ~BP_WATCHPOINT_HIT;
> -                continue;
> -            }
> -            cpu->watchpoint_hit = wp;
> -
> -            mmap_lock();
> -            /* This call also restores vCPU state */
> -            tb_check_watchpoint(cpu, ra);
> -            if (wp->flags & BP_STOP_BEFORE_ACCESS) {
> -                cpu->exception_index = EXCP_DEBUG;
> -                mmap_unlock();
> -                cpu_loop_exit(cpu);
> -            } else {
> -                /* Force execution of one insn next time.  */
> -                cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ | curr_cflags(cpu);
> -                mmap_unlock();
> -                cpu_loop_exit_noexc(cpu);
> -            }
> -        } else {
> -            wp->flags &= ~BP_WATCHPOINT_HIT;
> -        }
> -    }
> -}
> -
> -#endif /* CONFIG_TCG */
> -
>   /* Called from RCU critical section */
>   static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
>   {
> diff --git a/softmmu/watchpoint.c b/softmmu/watchpoint.c
> new file mode 100644
> index 0000000000..279129dd1c
> --- /dev/null
> +++ b/softmmu/watchpoint.c
> @@ -0,0 +1,220 @@
> +/*
> + * CPU watchpoints
> + *
> + *  Copyright (c) 2003 Fabrice Bellard
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "exec/exec-all.h"
> +#include "exec/translate-all.h"
> +#include "sysemu/tcg.h"
> +#include "sysemu/replay.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +#include "hw/core/cpu.h"
> +
> +/* Add a watchpoint.  */
> +int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
> +                          int flags, CPUWatchpoint **watchpoint)
> +{
> +    CPUWatchpoint *wp;
> +    vaddr in_page;
> +
> +    /* forbid ranges which are empty or run off the end of the address space */
> +    if (len == 0 || (addr + len - 1) < addr) {
> +        error_report("tried to set invalid watchpoint at %"
> +                     VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
> +        return -EINVAL;
> +    }
> +    wp = g_malloc(sizeof(*wp));
> +
> +    wp->vaddr = addr;
> +    wp->len = len;
> +    wp->flags = flags;
> +
> +    /* keep all GDB-injected watchpoints in front */
> +    if (flags & BP_GDB) {
> +        QTAILQ_INSERT_HEAD(&cpu->watchpoints, wp, entry);
> +    } else {
> +        QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, entry);
> +    }
> +
> +    in_page = -(addr | TARGET_PAGE_MASK);
> +    if (len <= in_page) {
> +        tlb_flush_page(cpu, addr);
> +    } else {
> +        tlb_flush(cpu);
> +    }
> +
> +    if (watchpoint) {
> +        *watchpoint = wp;
> +    }
> +    return 0;
> +}
> +
> +/* Remove a specific watchpoint.  */
> +int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
> +                          int flags)
> +{
> +    CPUWatchpoint *wp;
> +
> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> +        if (addr == wp->vaddr && len == wp->len
> +                && flags == (wp->flags & ~BP_WATCHPOINT_HIT)) {
> +            cpu_watchpoint_remove_by_ref(cpu, wp);
> +            return 0;
> +        }
> +    }
> +    return -ENOENT;
> +}
> +
> +/* Remove a specific watchpoint by reference.  */
> +void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
> +{
> +    QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
> +
> +    tlb_flush_page(cpu, watchpoint->vaddr);
> +
> +    g_free(watchpoint);
> +}
> +
> +/* Remove all matching watchpoints.  */
> +void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
> +{
> +    CPUWatchpoint *wp, *next;
> +
> +    QTAILQ_FOREACH_SAFE(wp, &cpu->watchpoints, entry, next) {
> +        if (wp->flags & mask) {
> +            cpu_watchpoint_remove_by_ref(cpu, wp);
> +        }
> +    }
> +}
> +
> +/*
> + * Return true if this watchpoint address matches the specified
> + * access (ie the address range covered by the watchpoint overlaps
> + * partially or completely with the address range covered by the
> + * access).
> + */
> +static inline bool watchpoint_address_matches(CPUWatchpoint *wp,
> +                                              vaddr addr, vaddr len)
> +{
> +    /*
> +     * We know the lengths are non-zero, but a little caution is
> +     * required to avoid errors in the case where the range ends
> +     * exactly at the top of the address space and so addr + len
> +     * wraps round to zero.
> +     */
> +    vaddr wpend = wp->vaddr + wp->len - 1;
> +    vaddr addrend = addr + len - 1;
> +
> +    return !(addr > wpend || wp->vaddr > addrend);
> +}
> +
> +/* Return flags for watchpoints that match addr + prot.  */
> +int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
> +{
> +    CPUWatchpoint *wp;
> +    int ret = 0;
> +
> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> +        if (watchpoint_address_matches(wp, addr, len)) {
> +            ret |= wp->flags;
> +        }
> +    }
> +    return ret;
> +}
> +
> +/* Generate a debug exception if a watchpoint has been hit.  */
> +void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> +                          MemTxAttrs attrs, int flags, uintptr_t ra)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    CPUWatchpoint *wp;
> +
> +    assert(tcg_enabled());
> +    if (cpu->watchpoint_hit) {
> +        /*
> +         * We re-entered the check after replacing the TB.
> +         * Now raise the debug interrupt so that it will
> +         * trigger after the current instruction.
> +         */
> +        qemu_mutex_lock_iothread();
> +        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
> +        qemu_mutex_unlock_iothread();
> +        return;
> +    }
> +
> +    if (cc->tcg_ops->adjust_watchpoint_address) {
> +        /* this is currently used only by ARM BE32 */
> +        addr = cc->tcg_ops->adjust_watchpoint_address(cpu, addr, len);
> +    }
> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> +        if (watchpoint_address_matches(wp, addr, len)
> +            && (wp->flags & flags)) {
> +            if (replay_running_debug()) {
> +                /*
> +                 * replay_breakpoint reads icount.
> +                 * Force recompile to succeed, because icount may
> +                 * be read only at the end of the block.
> +                 */
> +                if (!cpu->can_do_io) {
> +                    /* Force execution of one insn next time.  */
> +                    cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ
> +                                          | curr_cflags(cpu);
> +                    cpu_loop_exit_restore(cpu, ra);
> +                }
> +                /*
> +                 * Don't process the watchpoints when we are
> +                 * in a reverse debugging operation.
> +                 */
> +                replay_breakpoint();
> +                return;
> +            }
> +            if (flags == BP_MEM_READ) {
> +                wp->flags |= BP_WATCHPOINT_HIT_READ;
> +            } else {
> +                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
> +            }
> +            wp->hitaddr = MAX(addr, wp->vaddr);
> +            wp->hitattrs = attrs;
> +
> +            if (wp->flags & BP_CPU && cc->tcg_ops->debug_check_watchpoint &&
> +                !cc->tcg_ops->debug_check_watchpoint(cpu, wp)) {
> +                wp->flags &= ~BP_WATCHPOINT_HIT;
> +                continue;
> +            }
> +            cpu->watchpoint_hit = wp;
> +
> +            mmap_lock();
> +            /* This call also restores vCPU state */
> +            tb_check_watchpoint(cpu, ra);
> +            if (wp->flags & BP_STOP_BEFORE_ACCESS) {
> +                cpu->exception_index = EXCP_DEBUG;
> +                mmap_unlock();
> +                cpu_loop_exit(cpu);
> +            } else {
> +                /* Force execution of one insn next time.  */
> +                cpu->cflags_next_tb = 1 | CF_LAST_IO | CF_NOIRQ
> +                                      | curr_cflags(cpu);
> +                mmap_unlock();
> +                cpu_loop_exit_noexc(cpu);
> +            }
> +        } else {
> +            wp->flags &= ~BP_WATCHPOINT_HIT;
> +        }
> +    }
> +}


