Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0A6400BE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:57:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zyK-0004QZ-3K; Fri, 02 Dec 2022 01:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1p0zyC-0004PE-BH
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:56:25 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1p0zy7-00083K-Ox
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669964179; x=1701500179;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LInJB99w88b96dJGMSGwn5B+NNIUcRwF7aAeFsKchhI=;
 b=R1wuMg7Za46WqYLir+GN6xelLZddDbVZ6F6jrugn9dvDZ/gsztSgyLGa
 vIMpLmGkJ18Zhs26KX3iYemfudvq7vlHeKtZVXpE+9C9oP6wtybGbWauq
 rqPH0UnKk5KE9pE6eS5NR71tH4L8fLOlwR6GycZnLKZ3/6VZnuQE88Frj
 IBKnFIQUkqIme4kP8Amgbmwvb+fk4CurpYmcpQyX2u466iUEIMUF3vkzx
 rwm+b/gzyriNuPF/qizSxbDNzckDLcX/Cr5AhPNwQs7jgf+2Q4zQOzWUw
 C2cSIlWrbYloeAPEMah62eugMZetOvaQfVI8heAI0Ac8ThCgZ6Y2p0kDu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="295584315"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="295584315"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 22:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="769512336"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="769512336"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga004.jf.intel.com with ESMTP; 01 Dec 2022 22:56:15 -0800
Message-ID: <f83c4b94a285dd8b6a9aac6294f3037129d34df5.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/3] accel: introduce accelerator blocker API
From: Robert Hoo <robert.hu@linux.intel.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,  Yanan Wang
 <wangyanan55@huawei.com>, kvm@vger.kernel.org
Date: Fri, 02 Dec 2022 14:56:14 +0800
In-Reply-To: <20221111154758.1372674-2-eesposit@redhat.com>
References: <20221111154758.1372674-1-eesposit@redhat.com>
 <20221111154758.1372674-2-eesposit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=robert.hu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, 2022-11-11 at 10:47 -0500, Emanuele Giuseppe Esposito wrote:
> This API allows the accelerators to prevent vcpus from issuing
> new ioctls while execting a critical section marked with the
> accel_ioctl_inhibit_begin/end functions.
> 
> Note that all functions submitting ioctls must mark where the
> ioctl is being called with accel_{cpu_}ioctl_begin/end().
> 
> This API requires the caller to always hold the BQL.
> API documentation is in sysemu/accel-blocker.h
> 
> Internally, it uses a QemuLockCnt together with a per-CPU QemuLockCnt
> (to minimize cache line bouncing) to keep avoid that new ioctls
> run when the critical section starts, and a QemuEvent to wait
> that all running ioctls finish.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  accel/accel-blocker.c          | 154
> +++++++++++++++++++++++++++++++++
>  accel/meson.build              |   2 +-
>  hw/core/cpu-common.c           |   2 +
>  include/hw/core/cpu.h          |   3 +
>  include/sysemu/accel-blocker.h |  56 ++++++++++++
>  5 files changed, 216 insertions(+), 1 deletion(-)
>  create mode 100644 accel/accel-blocker.c
>  create mode 100644 include/sysemu/accel-blocker.h
> 
> diff --git a/accel/accel-blocker.c b/accel/accel-blocker.c
> new file mode 100644
> index 0000000000..1e7f423462
> --- /dev/null
> +++ b/accel/accel-blocker.c
> @@ -0,0 +1,154 @@
> +/*
> + * Lock to inhibit accelerator ioctls
> + *
> + * Copyright (c) 2022 Red Hat Inc.
> + *
> + * Author: Emanuele Giuseppe Esposito       <eesposit@redhat.com>
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> + * of this software and associated documentation files (the
> "Software"), to deal
> + * in the Software without restriction, including without limitation
> the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense,
> and/or sell
> + * copies of the Software, and to permit persons to whom the
> Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/thread.h"
> +#include "qemu/main-loop.h"
> +#include "hw/core/cpu.h"
> +#include "sysemu/accel-blocker.h"
> +
> +static QemuLockCnt accel_in_ioctl_lock;
> +static QemuEvent accel_in_ioctl_event;
> +
> +void accel_blocker_init(void)
> +{
> +    qemu_lockcnt_init(&accel_in_ioctl_lock);
> +    qemu_event_init(&accel_in_ioctl_event, false);
> +}
> +
> +void accel_ioctl_begin(void)
> +{
> +    if (likely(qemu_mutex_iothread_locked())) {
> +        return;
> +    }
> +
> +    /* block if lock is taken in kvm_ioctl_inhibit_begin() */
> +    qemu_lockcnt_inc(&accel_in_ioctl_lock);
> +}
> +
> +void accel_ioctl_end(void)
> +{
> +    if (likely(qemu_mutex_iothread_locked())) {
> +        return;
> +    }
> +
> +    qemu_lockcnt_dec(&accel_in_ioctl_lock);
> +    /* change event to SET. If event was BUSY, wake up all waiters
> */
> +    qemu_event_set(&accel_in_ioctl_event);
> +}
> +
> +void accel_cpu_ioctl_begin(CPUState *cpu)
> +{
> +    if (unlikely(qemu_mutex_iothread_locked())) {
> +        return;
> +    }
> +
> +    /* block if lock is taken in kvm_ioctl_inhibit_begin() */
> +    qemu_lockcnt_inc(&cpu->in_ioctl_lock);
> +}
> +
> +void accel_cpu_ioctl_end(CPUState *cpu)
> +{
> +    if (unlikely(qemu_mutex_iothread_locked())) {
> +        return;
> +    }
> +
> +    qemu_lockcnt_dec(&cpu->in_ioctl_lock);
> +    /* change event to SET. If event was BUSY, wake up all waiters
> */
> +    qemu_event_set(&accel_in_ioctl_event);
> +}
> +
> +static bool accel_has_to_wait(void)
> +{
> +    CPUState *cpu;
> +    bool needs_to_wait = false;
> +
> +    CPU_FOREACH(cpu) {
> +        if (qemu_lockcnt_count(&cpu->in_ioctl_lock)) {
> +            /* exit the ioctl, if vcpu is running it */
> +            qemu_cpu_kick(cpu);
> +            needs_to_wait = true;
> +        }
> +    }
> +
> +    return needs_to_wait ||
> qemu_lockcnt_count(&accel_in_ioctl_lock);
> +}
> +
> +void accel_ioctl_inhibit_begin(void)
> +{
> +    CPUState *cpu;
> +
> +    /*
> +     * We allow to inhibit only when holding the BQL, so we can
> identify
> +     * when an inhibitor wants to issue an ioctl easily.
> +     */
> +    g_assert(qemu_mutex_iothread_locked());
> +
> +    /* Block further invocations of the ioctls outside the BQL.  */
> +    CPU_FOREACH(cpu) {
> +        qemu_lockcnt_lock(&cpu->in_ioctl_lock);
> +    }
> +    qemu_lockcnt_lock(&accel_in_ioctl_lock);
> +
> +    /* Keep waiting until there are running ioctls */
> +    while (true) {
> +
> +        /* Reset event to FREE. */
> +        qemu_event_reset(&accel_in_ioctl_event);
> +
> +        if (accel_has_to_wait()) {
> +            /*
> +             * If event is still FREE, and there are ioctls still in
> progress,
> +             * wait.
> +             *
> +             *  If an ioctl finishes before qemu_event_wait(), it
> will change
> +             * the event state to SET. This will prevent
> qemu_event_wait() from
> +             * blocking, but it's not a problem because if other
> ioctls are
> +             * still running the loop will iterate once more and
> reset the event
> +             * status to FREE so that it can wait properly.
> +             *
> +             * If an ioctls finishes while qemu_event_wait() is
> blocking, then
> +             * it will be waken up, but also here the while loop
> makes sure
> +             * to re-enter the wait if there are other running
> ioctls.
> +             */
> +            qemu_event_wait(&accel_in_ioctl_event);
> +        } else {
> +            /* No ioctl is running */
> +            return;
> +        }
> +    }
> +}
> +
> +void accel_ioctl_inhibit_end(void)
> +{
> +    CPUState *cpu;
> +
> +    qemu_lockcnt_unlock(&accel_in_ioctl_lock);
> +    CPU_FOREACH(cpu) {
> +        qemu_lockcnt_unlock(&cpu->in_ioctl_lock);
> +    }
> +}
> +
> diff --git a/accel/meson.build b/accel/meson.build
> index b9a963cf80..a0d49c4f31 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -1,4 +1,4 @@
> -specific_ss.add(files('accel-common.c'))
> +specific_ss.add(files('accel-common.c', 'accel-blocker.c'))
>  softmmu_ss.add(files('accel-softmmu.c'))
>  user_ss.add(files('accel-user.c'))
>  
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index f9fdd46b9d..8d6a4b1b65 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -237,6 +237,7 @@ static void cpu_common_initfn(Object *obj)
>      cpu->nr_threads = 1;
>  
>      qemu_mutex_init(&cpu->work_mutex);
> +    qemu_lockcnt_init(&cpu->in_ioctl_lock);
>      QSIMPLEQ_INIT(&cpu->work_list);
>      QTAILQ_INIT(&cpu->breakpoints);
>      QTAILQ_INIT(&cpu->watchpoints);
> @@ -248,6 +249,7 @@ static void cpu_common_finalize(Object *obj)
>  {
>      CPUState *cpu = CPU(obj);
>  
> +    qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>      qemu_mutex_destroy(&cpu->work_mutex);
>  }
>  
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index f9b58773f7..15053663bc 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -397,6 +397,9 @@ struct CPUState {
>      uint32_t kvm_fetch_index;
>      uint64_t dirty_pages;
>  
> +    /* Use by accel-block: CPU is executing an ioctl() */
> +    QemuLockCnt in_ioctl_lock;
> +
>      /* Used for events with 'vcpu' and *without* the 'disabled'
> properties */
>      DECLARE_BITMAP(trace_dstate_delayed,
> CPU_TRACE_DSTATE_MAX_EVENTS);
>      DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
> diff --git a/include/sysemu/accel-blocker.h b/include/sysemu/accel-
> blocker.h
> new file mode 100644
> index 0000000000..72020529ef
> --- /dev/null
> +++ b/include/sysemu/accel-blocker.h
> @@ -0,0 +1,56 @@
> +/*
> + * Accelerator blocking API, to prevent new ioctls from starting and
> wait the
> + * running ones finish.
> + * This mechanism differs from pause/resume_all_vcpus() in that it
> does not
> + * release the BQL.
> + *
> + *  Copyright (c) 2022 Red Hat Inc.
> + *
> + * Author: Emanuele Giuseppe Esposito       <eesposit@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2
> or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef ACCEL_BLOCKER_H
> +#define ACCEL_BLOCKER_H
> +
> +#include "qemu/osdep.h"
> +#include "sysemu/cpus.h"
> +
> +extern void accel_blocker_init(void);
> +
> +/*
> + * accel_{cpu_}ioctl_begin/end:
> + * Mark when ioctl is about to run or just finished.
> + *
> + * accel_{cpu_}ioctl_begin will block after
> accel_ioctl_inhibit_begin() is
> + * called, preventing new ioctls to run. They will continue only
> after
> + * accel_ioctl_inibith_end().

Typo inibith --> inhibit

> + */
> +extern void accel_ioctl_begin(void);
> +extern void accel_ioctl_end(void);
> +extern void accel_cpu_ioctl_begin(CPUState *cpu);
> +extern void accel_cpu_ioctl_end(CPUState *cpu);
> +
> +/*
> + * accel_ioctl_inhibit_begin: start critical section
> + *
> + * This function makes sure that:
> + * 1) incoming accel_{cpu_}ioctl_begin() calls block
> + * 2) wait that all ioctls that were already running reach
> + *    accel_{cpu_}ioctl_end(), kicking vcpus if necessary.
> + *
> + * This allows the caller to access shared data or perform
> operations without
> + * worrying of concurrent vcpus accesses.
> + */
> +extern void accel_ioctl_inhibit_begin(void);
> +
> +/*
> + * accel_ioctl_inhibit_end: end critical section started by
> + * accel_ioctl_inhibit_begin()
> + *
> + * This function allows blocked accel_{cpu_}ioctl_begin() to
> continue.
> + */
> +extern void accel_ioctl_inhibit_end(void);
> +

git am complains ".git/rebase-apply/patch:170: new blank line at EOF."

> +#endif /* ACCEL_BLOCKER_H */


