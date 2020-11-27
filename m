Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BE22C6C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 21:03:21 +0100 (CET)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijxg-0000eB-Kp
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 15:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kijvQ-00089d-MK; Fri, 27 Nov 2020 15:01:01 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:48616 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kijvL-0004PG-V9; Fri, 27 Nov 2020 15:01:00 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5725D41393;
 Fri, 27 Nov 2020 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606507249;
 x=1608321650; bh=oMx33fS+3KpV3stClwufaSqyXQJ4bnQrUhQ5vWOMfaA=; b=
 fvq3xO9bPMqyZ2uFsRgfLAylUxXMd1FRMOmB7Pp/ir1nYzJTfPYw/am7SnjLLlgT
 2Vvr9/0xdPCxvYTJcNWuRlmOqL/DxfdmCyWgDQwtC1g1tHy5oA+70BGOTqsk8eFA
 9LSGb4Sk3bjrSHzGQEQmUaHUFDpaMDruVbVYqwOM1HQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qv-Yn1EctO0p; Fri, 27 Nov 2020 23:00:49 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5092041381;
 Fri, 27 Nov 2020 23:00:49 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 27
 Nov 2020 23:00:48 +0300
Date: Fri, 27 Nov 2020 23:00:54 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH 2/8] hvf: Move common code out
Message-ID: <20201127200054.GC56950@SPB-NB-133.local>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201126215017.41156-3-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 10:50:11PM +0100, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's move common code out
> into its own accel directory.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  MAINTAINERS                 |   9 +-
>  accel/hvf/hvf-all.c         |  56 +++++
>  accel/hvf/hvf-cpus.c        | 468 ++++++++++++++++++++++++++++++++++++
>  accel/hvf/meson.build       |   7 +
>  accel/meson.build           |   1 +
>  include/sysemu/hvf_int.h    |  69 ++++++
>  target/i386/hvf/hvf-cpus.c  | 131 ----------
>  target/i386/hvf/hvf-cpus.h  |  25 --
>  target/i386/hvf/hvf-i386.h  |  48 +---
>  target/i386/hvf/hvf.c       | 360 +--------------------------
>  target/i386/hvf/meson.build |   1 -
>  target/i386/hvf/x86hvf.c    |  11 +-
>  target/i386/hvf/x86hvf.h    |   2 -
>  13 files changed, 619 insertions(+), 569 deletions(-)
>  create mode 100644 accel/hvf/hvf-all.c
>  create mode 100644 accel/hvf/hvf-cpus.c
>  create mode 100644 accel/hvf/meson.build
>  create mode 100644 include/sysemu/hvf_int.h
>  delete mode 100644 target/i386/hvf/hvf-cpus.c
>  delete mode 100644 target/i386/hvf/hvf-cpus.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68bc160f41..ca4b6d9279 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -444,9 +444,16 @@ M: Cameron Esfahani <dirty@apple.com>
>  M: Roman Bolshakov <r.bolshakov@yadro.com>
>  W: https://wiki.qemu.org/Features/HVF
>  S: Maintained
> -F: accel/stubs/hvf-stub.c

There was a patch for that in the RFC series from Claudio.

>  F: target/i386/hvf/
> +
> +HVF
> +M: Cameron Esfahani <dirty@apple.com>
> +M: Roman Bolshakov <r.bolshakov@yadro.com>
> +W: https://wiki.qemu.org/Features/HVF
> +S: Maintained
> +F: accel/hvf/
>  F: include/sysemu/hvf.h
> +F: include/sysemu/hvf_int.h
>  
>  WHPX CPUs
>  M: Sunil Muthuswamy <sunilmut@microsoft.com>
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> new file mode 100644
> index 0000000000..47d77a472a
> --- /dev/null
> +++ b/accel/hvf/hvf-all.c
> @@ -0,0 +1,56 @@
> +/*
> + * QEMU Hypervisor.framework support
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/error-report.h"
> +#include "sysemu/hvf.h"
> +#include "sysemu/hvf_int.h"
> +#include "sysemu/runstate.h"
> +
> +#include "qemu/main-loop.h"
> +#include "sysemu/accel.h"
> +
> +#include <Hypervisor/Hypervisor.h>
> +
> +bool hvf_allowed;
> +HVFState *hvf_state;
> +
> +void assert_hvf_ok(hv_return_t ret)
> +{
> +    if (ret == HV_SUCCESS) {
> +        return;
> +    }
> +
> +    switch (ret) {
> +    case HV_ERROR:
> +        error_report("Error: HV_ERROR");
> +        break;
> +    case HV_BUSY:
> +        error_report("Error: HV_BUSY");
> +        break;
> +    case HV_BAD_ARGUMENT:
> +        error_report("Error: HV_BAD_ARGUMENT");
> +        break;
> +    case HV_NO_RESOURCES:
> +        error_report("Error: HV_NO_RESOURCES");
> +        break;
> +    case HV_NO_DEVICE:
> +        error_report("Error: HV_NO_DEVICE");
> +        break;
> +    case HV_UNSUPPORTED:
> +        error_report("Error: HV_UNSUPPORTED");
> +        break;
> +    default:
> +        error_report("Unknown Error");
> +    }
> +
> +    abort();
> +}
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> new file mode 100644
> index 0000000000..f9bb5502b7
> --- /dev/null
> +++ b/accel/hvf/hvf-cpus.c
> @@ -0,0 +1,468 @@
> +/*
> + * Copyright 2008 IBM Corporation
> + *           2008 Red Hat, Inc.
> + * Copyright 2011 Intel Corporation
> + * Copyright 2016 Veertu, Inc.
> + * Copyright 2017 The Android Open Source Project
> + *
> + * QEMU Hypervisor.framework support
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of version 2 of the GNU General Public
> + * License as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + * This file contain code under public domain from the hvdos project:
> + * https://github.com/mist64/hvdos
> + *
> + * Parts Copyright (c) 2011 NetApp, Inc.
> + * All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + *
> + * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS IS'' AND
> + * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> + * ARE DISCLAIMED.  IN NO EVENT SHALL NETAPP, INC OR CONTRIBUTORS BE LIABLE
> + * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> + * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> + * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> + * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> + * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> + * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> + * SUCH DAMAGE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +#include "exec/address-spaces.h"
> +#include "exec/exec-all.h"
> +#include "sysemu/cpus.h"
> +#include "sysemu/hvf.h"
> +#include "sysemu/hvf_int.h"
> +#include "sysemu/runstate.h"
> +#include "qemu/guest-random.h"
> +
> +#include <Hypervisor/Hypervisor.h>
> +
> +/* Memory slots */
> +
> +struct mac_slot {
> +    int present;
> +    uint64_t size;
> +    uint64_t gpa_start;
> +    uint64_t gva;
> +};
> +
> +hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
> +{
> +    hvf_slot *slot;
> +    int x;
> +    for (x = 0; x < hvf_state->num_slots; ++x) {
> +        slot = &hvf_state->slots[x];
> +        if (slot->size && start < (slot->start + slot->size) &&
> +            (start + size) > slot->start) {
> +            return slot;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +struct mac_slot mac_slots[32];
> +
> +static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
> +{
> +    struct mac_slot *macslot;
> +    hv_return_t ret;
> +
> +    macslot = &mac_slots[slot->slot_id];
> +
> +    if (macslot->present) {
> +        if (macslot->size != slot->size) {
> +            macslot->present = 0;
> +            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
> +            assert_hvf_ok(ret);
> +        }
> +    }
> +
> +    if (!slot->size) {
> +        return 0;
> +    }
> +
> +    macslot->present = 1;
> +    macslot->gpa_start = slot->start;
> +    macslot->size = slot->size;
> +    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);
> +    assert_hvf_ok(ret);
> +    return 0;
> +}
> +
> +static void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
> +{
> +    hvf_slot *mem;
> +    MemoryRegion *area = section->mr;
> +    bool writeable = !area->readonly && !area->rom_device;
> +    hv_memory_flags_t flags;
> +
> +    if (!memory_region_is_ram(area)) {
> +        if (writeable) {
> +            return;
> +        } else if (!memory_region_is_romd(area)) {
> +            /*
> +             * If the memory device is not in romd_mode, then we actually want
> +             * to remove the hvf memory slot so all accesses will trap.
> +             */
> +             add = false;
> +        }
> +    }
> +
> +    mem = hvf_find_overlap_slot(
> +            section->offset_within_address_space,
> +            int128_get64(section->size));
> +
> +    if (mem && add) {
> +        if (mem->size == int128_get64(section->size) &&
> +            mem->start == section->offset_within_address_space &&
> +            mem->mem == (memory_region_get_ram_ptr(area) +
> +            section->offset_within_region)) {
> +            return; /* Same region was attempted to register, go away. */
> +        }
> +    }
> +
> +    /* Region needs to be reset. set the size to 0 and remap it. */
> +    if (mem) {
> +        mem->size = 0;
> +        if (do_hvf_set_memory(mem, 0)) {
> +            error_report("Failed to reset overlapping slot");
> +            abort();
> +        }
> +    }
> +
> +    if (!add) {
> +        return;
> +    }
> +
> +    if (area->readonly ||
> +        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
> +        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
> +    } else {
> +        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
> +    }
> +
> +    /* Now make a new slot. */
> +    int x;
> +
> +    for (x = 0; x < hvf_state->num_slots; ++x) {
> +        mem = &hvf_state->slots[x];
> +        if (!mem->size) {
> +            break;
> +        }
> +    }
> +
> +    if (x == hvf_state->num_slots) {
> +        error_report("No free slots");
> +        abort();
> +    }
> +
> +    mem->size = int128_get64(section->size);
> +    mem->mem = memory_region_get_ram_ptr(area) + section->offset_within_region;
> +    mem->start = section->offset_within_address_space;
> +    mem->region = area;
> +
> +    if (do_hvf_set_memory(mem, flags)) {
> +        error_report("Error registering new memory slot");
> +        abort();
> +    }
> +}
> +
> +static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
> +{
> +    hvf_slot *slot;
> +
> +    slot = hvf_find_overlap_slot(
> +            section->offset_within_address_space,
> +            int128_get64(section->size));
> +
> +    /* protect region against writes; begin tracking it */
> +    if (on) {
> +        slot->flags |= HVF_SLOT_LOG;
> +        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> +                      HV_MEMORY_READ);
> +    /* stop tracking region*/
> +    } else {
> +        slot->flags &= ~HVF_SLOT_LOG;
> +        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> +                      HV_MEMORY_READ | HV_MEMORY_WRITE);
> +    }
> +}
> +
> +static void hvf_log_start(MemoryListener *listener,
> +                          MemoryRegionSection *section, int old, int new)
> +{
> +    if (old != 0) {
> +        return;
> +    }
> +
> +    hvf_set_dirty_tracking(section, 1);
> +}
> +
> +static void hvf_log_stop(MemoryListener *listener,
> +                         MemoryRegionSection *section, int old, int new)
> +{
> +    if (new != 0) {
> +        return;
> +    }
> +
> +    hvf_set_dirty_tracking(section, 0);
> +}
> +
> +static void hvf_log_sync(MemoryListener *listener,
> +                         MemoryRegionSection *section)
> +{
> +    /*
> +     * sync of dirty pages is handled elsewhere; just make sure we keep
> +     * tracking the region.
> +     */
> +    hvf_set_dirty_tracking(section, 1);
> +}
> +
> +static void hvf_region_add(MemoryListener *listener,
> +                           MemoryRegionSection *section)
> +{
> +    hvf_set_phys_mem(section, true);
> +}
> +
> +static void hvf_region_del(MemoryListener *listener,
> +                           MemoryRegionSection *section)
> +{
> +    hvf_set_phys_mem(section, false);
> +}
> +
> +static MemoryListener hvf_memory_listener = {
> +    .priority = 10,
> +    .region_add = hvf_region_add,
> +    .region_del = hvf_region_del,
> +    .log_start = hvf_log_start,
> +    .log_stop = hvf_log_stop,
> +    .log_sync = hvf_log_sync,
> +};
> +
> +static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
> +{
> +    if (!cpu->vcpu_dirty) {
> +        hvf_get_registers(cpu);
> +        cpu->vcpu_dirty = true;
> +    }
> +}
> +
> +static void hvf_cpu_synchronize_state(CPUState *cpu)
> +{
> +    if (!cpu->vcpu_dirty) {
> +        run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
> +    }
> +}
> +
> +static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
> +                                              run_on_cpu_data arg)
> +{
> +    hvf_put_registers(cpu);
> +    cpu->vcpu_dirty = false;
> +}
> +
> +static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
> +{
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
> +}
> +
> +static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
> +                                             run_on_cpu_data arg)
> +{
> +    hvf_put_registers(cpu);
> +    cpu->vcpu_dirty = false;
> +}
> +
> +static void hvf_cpu_synchronize_post_init(CPUState *cpu)
> +{
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
> +}
> +
> +static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
> +                                              run_on_cpu_data arg)
> +{
> +    cpu->vcpu_dirty = true;
> +}
> +
> +static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
> +{
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
> +}
> +
> +static void hvf_vcpu_destroy(CPUState *cpu)
> +{
> +    hv_return_t ret = hv_vcpu_destroy(cpu->hvf_fd);
> +    assert_hvf_ok(ret);
> +
> +    hvf_arch_vcpu_destroy(cpu);
> +}
> +
> +static void dummy_signal(int sig)
> +{
> +}
> +
> +static int hvf_init_vcpu(CPUState *cpu)
> +{
> +    int r;
> +
> +    /* init cpu signals */
> +    sigset_t set;
> +    struct sigaction sigact;
> +
> +    memset(&sigact, 0, sizeof(sigact));
> +    sigact.sa_handler = dummy_signal;
> +    sigaction(SIG_IPI, &sigact, NULL);
> +
> +    pthread_sigmask(SIG_BLOCK, NULL, &set);
> +    sigdelset(&set, SIG_IPI);
> +
> +#ifdef __aarch64__
> +    r = hv_vcpu_create(&cpu->hvf_fd, (hv_vcpu_exit_t **)&cpu->hvf_exit, NULL);
> +#else
> +    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
> +#endif

I think the first __aarch64__ bit fits better to arm part of the series.

> +    cpu->vcpu_dirty = 1;
> +    assert_hvf_ok(r);
> +
> +    return hvf_arch_init_vcpu(cpu);
> +}
> +
> +/*
> + * The HVF-specific vCPU thread function. This one should only run when the host
> + * CPU supports the VMX "unrestricted guest" feature.
> + */
> +static void *hvf_cpu_thread_fn(void *arg)
> +{
> +    CPUState *cpu = arg;
> +
> +    int r;
> +
> +    assert(hvf_enabled());
> +
> +    rcu_register_thread();
> +
> +    qemu_mutex_lock_iothread();
> +    qemu_thread_get_self(cpu->thread);
> +
> +    cpu->thread_id = qemu_get_thread_id();
> +    cpu->can_do_io = 1;
> +    current_cpu = cpu;
> +
> +    hvf_init_vcpu(cpu);
> +
> +    /* signal CPU creation */
> +    cpu_thread_signal_created(cpu);
> +    qemu_guest_random_seed_thread_part2(cpu->random_seed);
> +
> +    do {
> +        if (cpu_can_run(cpu)) {
> +            r = hvf_vcpu_exec(cpu);
> +            if (r == EXCP_DEBUG) {
> +                cpu_handle_guest_debug(cpu);
> +            }
> +        }
> +        qemu_wait_io_event(cpu);
> +    } while (!cpu->unplug || cpu_can_run(cpu));
> +
> +    hvf_vcpu_destroy(cpu);
> +    cpu_thread_signal_destroyed(cpu);
> +    qemu_mutex_unlock_iothread();
> +    rcu_unregister_thread();
> +    return NULL;
> +}
> +
> +static void hvf_start_vcpu_thread(CPUState *cpu)
> +{
> +    char thread_name[VCPU_THREAD_NAME_SIZE];
> +
> +    /*
> +     * HVF currently does not support TCG, and only runs in
> +     * unrestricted-guest mode.
> +     */
> +    assert(hvf_enabled());
> +
> +    cpu->thread = g_malloc0(sizeof(QemuThread));
> +    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
> +    qemu_cond_init(cpu->halt_cond);
> +
> +    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
> +             cpu->cpu_index);
> +    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn,
> +                       cpu, QEMU_THREAD_JOINABLE);
> +}
> +
> +static const CpusAccel hvf_cpus = {
> +    .create_vcpu_thread = hvf_start_vcpu_thread,
> +
> +    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
> +    .synchronize_post_init = hvf_cpu_synchronize_post_init,
> +    .synchronize_state = hvf_cpu_synchronize_state,
> +    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
> +};
> +
> +static int hvf_accel_init(MachineState *ms)
> +{
> +    int x;
> +    hv_return_t ret;
> +    HVFState *s;
> +
> +    ret = hv_vm_create(HV_VM_DEFAULT);
> +    assert_hvf_ok(ret);
> +
> +    s = g_new0(HVFState, 1);
> +
> +    s->num_slots = 32;
> +    for (x = 0; x < s->num_slots; ++x) {
> +        s->slots[x].size = 0;
> +        s->slots[x].slot_id = x;
> +    }
> +
> +    hvf_state = s;
> +    memory_listener_register(&hvf_memory_listener, &address_space_memory);
> +    cpus_register_accel(&hvf_cpus);
> +    return 0;
> +}
> +
> +static void hvf_accel_class_init(ObjectClass *oc, void *data)
> +{
> +    AccelClass *ac = ACCEL_CLASS(oc);
> +    ac->name = "HVF";
> +    ac->init_machine = hvf_accel_init;
> +    ac->allowed = &hvf_allowed;
> +}
> +
> +static const TypeInfo hvf_accel_type = {
> +    .name = TYPE_HVF_ACCEL,
> +    .parent = TYPE_ACCEL,
> +    .class_init = hvf_accel_class_init,
> +};
> +
> +static void hvf_type_init(void)
> +{
> +    type_register_static(&hvf_accel_type);
> +}
> +
> +type_init(hvf_type_init);
> diff --git a/accel/hvf/meson.build b/accel/hvf/meson.build
> new file mode 100644
> index 0000000000..dfd6b68dc7
> --- /dev/null
> +++ b/accel/hvf/meson.build
> @@ -0,0 +1,7 @@
> +hvf_ss = ss.source_set()
> +hvf_ss.add(files(
> +  'hvf-all.c',
> +  'hvf-cpus.c',
> +))
> +
> +specific_ss.add_all(when: 'CONFIG_HVF', if_true: hvf_ss)
> diff --git a/accel/meson.build b/accel/meson.build
> index b26cca227a..6de12ce5d5 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,5 +1,6 @@
>  softmmu_ss.add(files('accel.c'))
>  
> +subdir('hvf')
>  subdir('qtest')
>  subdir('kvm')
>  subdir('tcg')
> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> new file mode 100644
> index 0000000000..de9bad23a8
> --- /dev/null
> +++ b/include/sysemu/hvf_int.h
> @@ -0,0 +1,69 @@
> +/*
> + * QEMU Hypervisor.framework (HVF) support
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +/* header to be included in HVF-specific code */
> +
> +#ifndef HVF_INT_H
> +#define HVF_INT_H
> +
> +#include <Hypervisor/Hypervisor.h>
> +
> +#define HVF_MAX_VCPU 0x10
> +
> +extern struct hvf_state hvf_global;
> +
> +struct hvf_vm {
> +    int id;
> +    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
> +};
> +
> +struct hvf_state {
> +    uint32_t version;
> +    struct hvf_vm *vm;
> +    uint64_t mem_quota;
> +};
> +
> +/* hvf_slot flags */
> +#define HVF_SLOT_LOG (1 << 0)
> +
> +typedef struct hvf_slot {
> +    uint64_t start;
> +    uint64_t size;
> +    uint8_t *mem;
> +    int slot_id;
> +    uint32_t flags;
> +    MemoryRegion *region;
> +} hvf_slot;
> +
> +typedef struct hvf_vcpu_caps {
> +    uint64_t vmx_cap_pinbased;
> +    uint64_t vmx_cap_procbased;
> +    uint64_t vmx_cap_procbased2;
> +    uint64_t vmx_cap_entry;
> +    uint64_t vmx_cap_exit;
> +    uint64_t vmx_cap_preemption_timer;
> +} hvf_vcpu_caps;
> +
> +struct HVFState {
> +    AccelState parent;
> +    hvf_slot slots[32];
> +    int num_slots;
> +
> +    hvf_vcpu_caps *hvf_caps;
> +};
> +extern HVFState *hvf_state;
> +
> +void assert_hvf_ok(hv_return_t ret);
> +int hvf_get_registers(CPUState *cpu);
> +int hvf_put_registers(CPUState *cpu);
> +int hvf_arch_init_vcpu(CPUState *cpu);
> +void hvf_arch_vcpu_destroy(CPUState *cpu);
> +int hvf_vcpu_exec(CPUState *cpu);
> +hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
> +
> +#endif
> diff --git a/target/i386/hvf/hvf-cpus.c b/target/i386/hvf/hvf-cpus.c
> deleted file mode 100644
> index 817b3d7452..0000000000
> --- a/target/i386/hvf/hvf-cpus.c
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -/*
> - * Copyright 2008 IBM Corporation
> - *           2008 Red Hat, Inc.
> - * Copyright 2011 Intel Corporation
> - * Copyright 2016 Veertu, Inc.
> - * Copyright 2017 The Android Open Source Project
> - *
> - * QEMU Hypervisor.framework support
> - *
> - * This program is free software; you can redistribute it and/or
> - * modify it under the terms of version 2 of the GNU General Public
> - * License as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, see <http://www.gnu.org/licenses/>.
> - *
> - * This file contain code under public domain from the hvdos project:
> - * https://github.com/mist64/hvdos
> - *
> - * Parts Copyright (c) 2011 NetApp, Inc.
> - * All rights reserved.
> - *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions and the following disclaimer.
> - * 2. Redistributions in binary form must reproduce the above copyright
> - *    notice, this list of conditions and the following disclaimer in the
> - *    documentation and/or other materials provided with the distribution.
> - *
> - * THIS SOFTWARE IS PROVIDED BY NETAPP, INC ``AS IS'' AND
> - * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> - * ARE DISCLAIMED.  IN NO EVENT SHALL NETAPP, INC OR CONTRIBUTORS BE LIABLE
> - * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> - * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> - * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> - * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> - * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> - * SUCH DAMAGE.
> - */
> -
> -#include "qemu/osdep.h"
> -#include "qemu/error-report.h"
> -#include "qemu/main-loop.h"
> -#include "sysemu/hvf.h"
> -#include "sysemu/runstate.h"
> -#include "target/i386/cpu.h"
> -#include "qemu/guest-random.h"
> -
> -#include "hvf-cpus.h"
> -
> -/*
> - * The HVF-specific vCPU thread function. This one should only run when the host
> - * CPU supports the VMX "unrestricted guest" feature.
> - */
> -static void *hvf_cpu_thread_fn(void *arg)
> -{
> -    CPUState *cpu = arg;
> -
> -    int r;
> -
> -    assert(hvf_enabled());
> -
> -    rcu_register_thread();
> -
> -    qemu_mutex_lock_iothread();
> -    qemu_thread_get_self(cpu->thread);
> -
> -    cpu->thread_id = qemu_get_thread_id();
> -    cpu->can_do_io = 1;
> -    current_cpu = cpu;
> -
> -    hvf_init_vcpu(cpu);
> -
> -    /* signal CPU creation */
> -    cpu_thread_signal_created(cpu);
> -    qemu_guest_random_seed_thread_part2(cpu->random_seed);
> -
> -    do {
> -        if (cpu_can_run(cpu)) {
> -            r = hvf_vcpu_exec(cpu);
> -            if (r == EXCP_DEBUG) {
> -                cpu_handle_guest_debug(cpu);
> -            }
> -        }
> -        qemu_wait_io_event(cpu);
> -    } while (!cpu->unplug || cpu_can_run(cpu));
> -
> -    hvf_vcpu_destroy(cpu);
> -    cpu_thread_signal_destroyed(cpu);
> -    qemu_mutex_unlock_iothread();
> -    rcu_unregister_thread();
> -    return NULL;
> -}
> -
> -static void hvf_start_vcpu_thread(CPUState *cpu)
> -{
> -    char thread_name[VCPU_THREAD_NAME_SIZE];
> -
> -    /*
> -     * HVF currently does not support TCG, and only runs in
> -     * unrestricted-guest mode.
> -     */
> -    assert(hvf_enabled());
> -
> -    cpu->thread = g_malloc0(sizeof(QemuThread));
> -    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
> -    qemu_cond_init(cpu->halt_cond);
> -
> -    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/HVF",
> -             cpu->cpu_index);
> -    qemu_thread_create(cpu->thread, thread_name, hvf_cpu_thread_fn,
> -                       cpu, QEMU_THREAD_JOINABLE);
> -}
> -
> -const CpusAccel hvf_cpus = {
> -    .create_vcpu_thread = hvf_start_vcpu_thread,
> -
> -    .synchronize_post_reset = hvf_cpu_synchronize_post_reset,
> -    .synchronize_post_init = hvf_cpu_synchronize_post_init,
> -    .synchronize_state = hvf_cpu_synchronize_state,
> -    .synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm,
> -};
> diff --git a/target/i386/hvf/hvf-cpus.h b/target/i386/hvf/hvf-cpus.h
> deleted file mode 100644
> index ced31b82c0..0000000000
> --- a/target/i386/hvf/hvf-cpus.h
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * Accelerator CPUS Interface
> - *
> - * Copyright 2020 SUSE LLC
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef HVF_CPUS_H
> -#define HVF_CPUS_H
> -
> -#include "sysemu/cpus.h"
> -
> -extern const CpusAccel hvf_cpus;
> -
> -int hvf_init_vcpu(CPUState *);
> -int hvf_vcpu_exec(CPUState *);
> -void hvf_cpu_synchronize_state(CPUState *);
> -void hvf_cpu_synchronize_post_reset(CPUState *);
> -void hvf_cpu_synchronize_post_init(CPUState *);
> -void hvf_cpu_synchronize_pre_loadvm(CPUState *);
> -void hvf_vcpu_destroy(CPUState *);
> -
> -#endif /* HVF_CPUS_H */
> diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
> index e0edffd077..6d56f8f6bb 100644
> --- a/target/i386/hvf/hvf-i386.h
> +++ b/target/i386/hvf/hvf-i386.h
> @@ -18,57 +18,11 @@
>  
>  #include "sysemu/accel.h"
>  #include "sysemu/hvf.h"
> +#include "sysemu/hvf_int.h"
>  #include "cpu.h"
>  #include "x86.h"
>  
> -#define HVF_MAX_VCPU 0x10
> -
> -extern struct hvf_state hvf_global;
> -
> -struct hvf_vm {
> -    int id;
> -    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
> -};
> -
> -struct hvf_state {
> -    uint32_t version;
> -    struct hvf_vm *vm;
> -    uint64_t mem_quota;
> -};
> -
> -/* hvf_slot flags */
> -#define HVF_SLOT_LOG (1 << 0)
> -
> -typedef struct hvf_slot {
> -    uint64_t start;
> -    uint64_t size;
> -    uint8_t *mem;
> -    int slot_id;
> -    uint32_t flags;
> -    MemoryRegion *region;
> -} hvf_slot;
> -
> -typedef struct hvf_vcpu_caps {
> -    uint64_t vmx_cap_pinbased;
> -    uint64_t vmx_cap_procbased;
> -    uint64_t vmx_cap_procbased2;
> -    uint64_t vmx_cap_entry;
> -    uint64_t vmx_cap_exit;
> -    uint64_t vmx_cap_preemption_timer;
> -} hvf_vcpu_caps;
> -
> -struct HVFState {
> -    AccelState parent;
> -    hvf_slot slots[32];
> -    int num_slots;
> -
> -    hvf_vcpu_caps *hvf_caps;
> -};
> -extern HVFState *hvf_state;
> -
> -void hvf_set_phys_mem(MemoryRegionSection *, bool);
>  void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
> -hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
>  
>  #ifdef NEED_CPU_H
>  /* Functions exported to host specific mode */
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index ed9356565c..8b96ecd619 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -51,6 +51,7 @@
>  #include "qemu/error-report.h"
>  
>  #include "sysemu/hvf.h"
> +#include "sysemu/hvf_int.h"
>  #include "sysemu/runstate.h"
>  #include "hvf-i386.h"
>  #include "vmcs.h"
> @@ -72,171 +73,6 @@
>  #include "sysemu/accel.h"
>  #include "target/i386/cpu.h"
>  
> -#include "hvf-cpus.h"
> -
> -HVFState *hvf_state;
> -
> -static void assert_hvf_ok(hv_return_t ret)
> -{
> -    if (ret == HV_SUCCESS) {
> -        return;
> -    }
> -
> -    switch (ret) {
> -    case HV_ERROR:
> -        error_report("Error: HV_ERROR");
> -        break;
> -    case HV_BUSY:
> -        error_report("Error: HV_BUSY");
> -        break;
> -    case HV_BAD_ARGUMENT:
> -        error_report("Error: HV_BAD_ARGUMENT");
> -        break;
> -    case HV_NO_RESOURCES:
> -        error_report("Error: HV_NO_RESOURCES");
> -        break;
> -    case HV_NO_DEVICE:
> -        error_report("Error: HV_NO_DEVICE");
> -        break;
> -    case HV_UNSUPPORTED:
> -        error_report("Error: HV_UNSUPPORTED");
> -        break;
> -    default:
> -        error_report("Unknown Error");
> -    }
> -
> -    abort();
> -}
> -
> -/* Memory slots */
> -hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
> -{
> -    hvf_slot *slot;
> -    int x;
> -    for (x = 0; x < hvf_state->num_slots; ++x) {
> -        slot = &hvf_state->slots[x];
> -        if (slot->size && start < (slot->start + slot->size) &&
> -            (start + size) > slot->start) {
> -            return slot;
> -        }
> -    }
> -    return NULL;
> -}
> -
> -struct mac_slot {
> -    int present;
> -    uint64_t size;
> -    uint64_t gpa_start;
> -    uint64_t gva;
> -};
> -
> -struct mac_slot mac_slots[32];
> -
> -static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
> -{
> -    struct mac_slot *macslot;
> -    hv_return_t ret;
> -
> -    macslot = &mac_slots[slot->slot_id];
> -
> -    if (macslot->present) {
> -        if (macslot->size != slot->size) {
> -            macslot->present = 0;
> -            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
> -            assert_hvf_ok(ret);
> -        }
> -    }
> -
> -    if (!slot->size) {
> -        return 0;
> -    }
> -
> -    macslot->present = 1;
> -    macslot->gpa_start = slot->start;
> -    macslot->size = slot->size;
> -    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size, flags);
> -    assert_hvf_ok(ret);
> -    return 0;
> -}
> -
> -void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
> -{
> -    hvf_slot *mem;
> -    MemoryRegion *area = section->mr;
> -    bool writeable = !area->readonly && !area->rom_device;
> -    hv_memory_flags_t flags;
> -
> -    if (!memory_region_is_ram(area)) {
> -        if (writeable) {
> -            return;
> -        } else if (!memory_region_is_romd(area)) {
> -            /*
> -             * If the memory device is not in romd_mode, then we actually want
> -             * to remove the hvf memory slot so all accesses will trap.
> -             */
> -             add = false;
> -        }
> -    }
> -
> -    mem = hvf_find_overlap_slot(
> -            section->offset_within_address_space,
> -            int128_get64(section->size));
> -
> -    if (mem && add) {
> -        if (mem->size == int128_get64(section->size) &&
> -            mem->start == section->offset_within_address_space &&
> -            mem->mem == (memory_region_get_ram_ptr(area) +
> -            section->offset_within_region)) {
> -            return; /* Same region was attempted to register, go away. */
> -        }
> -    }
> -
> -    /* Region needs to be reset. set the size to 0 and remap it. */
> -    if (mem) {
> -        mem->size = 0;
> -        if (do_hvf_set_memory(mem, 0)) {
> -            error_report("Failed to reset overlapping slot");
> -            abort();
> -        }
> -    }
> -
> -    if (!add) {
> -        return;
> -    }
> -
> -    if (area->readonly ||
> -        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
> -        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
> -    } else {
> -        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
> -    }
> -
> -    /* Now make a new slot. */
> -    int x;
> -
> -    for (x = 0; x < hvf_state->num_slots; ++x) {
> -        mem = &hvf_state->slots[x];
> -        if (!mem->size) {
> -            break;
> -        }
> -    }
> -
> -    if (x == hvf_state->num_slots) {
> -        error_report("No free slots");
> -        abort();
> -    }
> -
> -    mem->size = int128_get64(section->size);
> -    mem->mem = memory_region_get_ram_ptr(area) + section->offset_within_region;
> -    mem->start = section->offset_within_address_space;
> -    mem->region = area;
> -
> -    if (do_hvf_set_memory(mem, flags)) {
> -        error_report("Error registering new memory slot");
> -        abort();
> -    }
> -}
> -
>  void vmx_update_tpr(CPUState *cpu)
>  {
>      /* TODO: need integrate APIC handling */
> @@ -276,56 +112,6 @@ void hvf_handle_io(CPUArchState *env, uint16_t port, void *buffer,
>      }
>  }
>  
> -static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
> -{
> -    if (!cpu->vcpu_dirty) {
> -        hvf_get_registers(cpu);
> -        cpu->vcpu_dirty = true;
> -    }
> -}
> -
> -void hvf_cpu_synchronize_state(CPUState *cpu)
> -{
> -    if (!cpu->vcpu_dirty) {
> -        run_on_cpu(cpu, do_hvf_cpu_synchronize_state, RUN_ON_CPU_NULL);
> -    }
> -}
> -
> -static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
> -                                              run_on_cpu_data arg)
> -{
> -    hvf_put_registers(cpu);
> -    cpu->vcpu_dirty = false;
> -}
> -
> -void hvf_cpu_synchronize_post_reset(CPUState *cpu)
> -{
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
> -}
> -
> -static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
> -                                             run_on_cpu_data arg)
> -{
> -    hvf_put_registers(cpu);
> -    cpu->vcpu_dirty = false;
> -}
> -
> -void hvf_cpu_synchronize_post_init(CPUState *cpu)
> -{
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
> -}
> -
> -static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
> -                                              run_on_cpu_data arg)
> -{
> -    cpu->vcpu_dirty = true;
> -}
> -
> -void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
> -{
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
> -}
> -
>  static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
>  {
>      int read, write;
> @@ -370,109 +156,19 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
>      return false;
>  }
>  
> -static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
> -{
> -    hvf_slot *slot;
> -
> -    slot = hvf_find_overlap_slot(
> -            section->offset_within_address_space,
> -            int128_get64(section->size));
> -
> -    /* protect region against writes; begin tracking it */
> -    if (on) {
> -        slot->flags |= HVF_SLOT_LOG;
> -        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
> -                      HV_MEMORY_READ);
> -    /* stop tracking region*/
> -    } else {
> -        slot->flags &= ~HVF_SLOT_LOG;
> -        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
> -    }
> -}
> -
> -static void hvf_log_start(MemoryListener *listener,
> -                          MemoryRegionSection *section, int old, int new)
> -{
> -    if (old != 0) {
> -        return;
> -    }
> -
> -    hvf_set_dirty_tracking(section, 1);
> -}
> -
> -static void hvf_log_stop(MemoryListener *listener,
> -                         MemoryRegionSection *section, int old, int new)
> -{
> -    if (new != 0) {
> -        return;
> -    }
> -
> -    hvf_set_dirty_tracking(section, 0);
> -}
> -
> -static void hvf_log_sync(MemoryListener *listener,
> -                         MemoryRegionSection *section)
> -{
> -    /*
> -     * sync of dirty pages is handled elsewhere; just make sure we keep
> -     * tracking the region.
> -     */
> -    hvf_set_dirty_tracking(section, 1);
> -}
> -
> -static void hvf_region_add(MemoryListener *listener,
> -                           MemoryRegionSection *section)
> -{
> -    hvf_set_phys_mem(section, true);
> -}
> -
> -static void hvf_region_del(MemoryListener *listener,
> -                           MemoryRegionSection *section)
> -{
> -    hvf_set_phys_mem(section, false);
> -}
> -
> -static MemoryListener hvf_memory_listener = {
> -    .priority = 10,
> -    .region_add = hvf_region_add,
> -    .region_del = hvf_region_del,
> -    .log_start = hvf_log_start,
> -    .log_stop = hvf_log_stop,
> -    .log_sync = hvf_log_sync,
> -};
> -
> -void hvf_vcpu_destroy(CPUState *cpu)
> +void hvf_arch_vcpu_destroy(CPUState *cpu)
>  {
>      X86CPU *x86_cpu = X86_CPU(cpu);
>      CPUX86State *env = &x86_cpu->env;
>  
> -    hv_return_t ret = hv_vcpu_destroy((hv_vcpuid_t)cpu->hvf_fd);
>      g_free(env->hvf_mmio_buf);
> -    assert_hvf_ok(ret);
> -}
> -
> -static void dummy_signal(int sig)
> -{
>  }
>  
> -int hvf_init_vcpu(CPUState *cpu)
> +int hvf_arch_init_vcpu(CPUState *cpu)
>  {
>  
>      X86CPU *x86cpu = X86_CPU(cpu);
>      CPUX86State *env = &x86cpu->env;
> -    int r;
> -
> -    /* init cpu signals */
> -    sigset_t set;
> -    struct sigaction sigact;
> -
> -    memset(&sigact, 0, sizeof(sigact));
> -    sigact.sa_handler = dummy_signal;
> -    sigaction(SIG_IPI, &sigact, NULL);
> -
> -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> -    sigdelset(&set, SIG_IPI);
>  
>      init_emu();
>      init_decoder();
> @@ -480,10 +176,6 @@ int hvf_init_vcpu(CPUState *cpu)
>      hvf_state->hvf_caps = g_new0(struct hvf_vcpu_caps, 1);
>      env->hvf_mmio_buf = g_new(char, 4096);
>  
> -    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
> -    cpu->vcpu_dirty = 1;
> -    assert_hvf_ok(r);
> -
>      if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
>          &hvf_state->hvf_caps->vmx_cap_pinbased)) {
>          abort();
> @@ -865,49 +557,3 @@ int hvf_vcpu_exec(CPUState *cpu)
>  
>      return ret;
>  }
> -
> -bool hvf_allowed;
> -
> -static int hvf_accel_init(MachineState *ms)
> -{
> -    int x;
> -    hv_return_t ret;
> -    HVFState *s;
> -
> -    ret = hv_vm_create(HV_VM_DEFAULT);
> -    assert_hvf_ok(ret);
> -
> -    s = g_new0(HVFState, 1);
> - 
> -    s->num_slots = 32;
> -    for (x = 0; x < s->num_slots; ++x) {
> -        s->slots[x].size = 0;
> -        s->slots[x].slot_id = x;
> -    }
> -  
> -    hvf_state = s;
> -    memory_listener_register(&hvf_memory_listener, &address_space_memory);
> -    cpus_register_accel(&hvf_cpus);
> -    return 0;
> -}
> -
> -static void hvf_accel_class_init(ObjectClass *oc, void *data)
> -{
> -    AccelClass *ac = ACCEL_CLASS(oc);
> -    ac->name = "HVF";
> -    ac->init_machine = hvf_accel_init;
> -    ac->allowed = &hvf_allowed;
> -}
> -
> -static const TypeInfo hvf_accel_type = {
> -    .name = TYPE_HVF_ACCEL,
> -    .parent = TYPE_ACCEL,
> -    .class_init = hvf_accel_class_init,
> -};
> -
> -static void hvf_type_init(void)
> -{
> -    type_register_static(&hvf_accel_type);
> -}
> -
> -type_init(hvf_type_init);
> diff --git a/target/i386/hvf/meson.build b/target/i386/hvf/meson.build
> index 409c9a3f14..c8a43717ee 100644
> --- a/target/i386/hvf/meson.build
> +++ b/target/i386/hvf/meson.build
> @@ -1,6 +1,5 @@
>  i386_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
>    'hvf.c',
> -  'hvf-cpus.c',
>    'x86.c',
>    'x86_cpuid.c',
>    'x86_decode.c',
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index bbec412b6c..89b8e9d87a 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -20,6 +20,9 @@
>  #include "qemu/osdep.h"
>  
>  #include "qemu-common.h"
> +#include "sysemu/hvf.h"
> +#include "sysemu/hvf_int.h"
> +#include "sysemu/hw_accel.h"
>  #include "x86hvf.h"
>  #include "vmx.h"
>  #include "vmcs.h"
> @@ -32,8 +35,6 @@
>  #include <Hypervisor/hv.h>
>  #include <Hypervisor/hv_vmx.h>
>  
> -#include "hvf-cpus.h"
> -
>  void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
>                       SegmentCache *qseg, bool is_tr)
>  {
> @@ -437,7 +438,7 @@ int hvf_process_events(CPUState *cpu_state)
>      env->eflags = rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
>  
>      if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
> -        hvf_cpu_synchronize_state(cpu_state);
> +        cpu_synchronize_state(cpu_state);
>          do_cpu_init(cpu);
>      }
>  
> @@ -451,12 +452,12 @@ int hvf_process_events(CPUState *cpu_state)
>          cpu_state->halted = 0;
>      }
>      if (cpu_state->interrupt_request & CPU_INTERRUPT_SIPI) {
> -        hvf_cpu_synchronize_state(cpu_state);
> +        cpu_synchronize_state(cpu_state);
>          do_cpu_sipi(cpu);
>      }
>      if (cpu_state->interrupt_request & CPU_INTERRUPT_TPR) {
>          cpu_state->interrupt_request &= ~CPU_INTERRUPT_TPR;
> -        hvf_cpu_synchronize_state(cpu_state);
> +        cpu_synchronize_state(cpu_state);

The changes from hvf_cpu_*() to cpu_*() are cleanup and perhaps should
be a separate patch. It follows cpu/accel cleanups Claudio was doing the
summer.

Phillipe raised the idea that the patch might go ahead of ARM-specific
part (which might involve some discussions) and I agree with that.

Some sync between Claudio series (CC'd him) and the patch might be need.

Thanks,
Roman

>          apic_handle_tpr_access_report(cpu->apic_state, env->eip,
>                                        env->tpr_access_type);
>      }
> diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
> index 635ab0f34e..99ed8d608d 100644
> --- a/target/i386/hvf/x86hvf.h
> +++ b/target/i386/hvf/x86hvf.h
> @@ -21,8 +21,6 @@
>  #include "x86_descr.h"
>  
>  int hvf_process_events(CPUState *);
> -int hvf_put_registers(CPUState *);
> -int hvf_get_registers(CPUState *);
>  bool hvf_inject_interrupts(CPUState *);
>  void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
>                       SegmentCache *qseg, bool is_tr);
> -- 
> 2.24.3 (Apple Git-128)
> 
> 
> 


