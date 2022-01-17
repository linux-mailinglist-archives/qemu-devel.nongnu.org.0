Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380C8490318
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 08:47:13 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9MjQ-0000qI-BL
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 02:47:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9MVK-0004Ri-8D
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:32:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n9MVG-0002g8-Eu
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 02:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642404753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=92PqXdFYoPjk/EH7Y3ZQ1GkYzc6/Q6L4ckNNXJUPGr4=;
 b=QRZFQqKgC64MkEU9ZcVnRUL1T9uV3eIxW58T5Z09DlJ7JJfJjJ89dRWsVX/yRQi7fzqNSz
 Aa9Eoz/WkDBggeAvgPB7pJ79pFBk18qCahb7l3mhqukmt/ePKlaQqm/QsAIGw66hXTivhs
 4aQHNYCRKUm62zYWGxAuyJnoXGJGcVY=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-mGuFQLWAOriKOoZFyEJOqw-1; Mon, 17 Jan 2022 02:32:29 -0500
X-MC-Unique: mGuFQLWAOriKOoZFyEJOqw-1
Received: by mail-pg1-f197.google.com with SMTP id
 r1-20020a639b01000000b0034243da71caso7190652pgd.7
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 23:32:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=92PqXdFYoPjk/EH7Y3ZQ1GkYzc6/Q6L4ckNNXJUPGr4=;
 b=idqN5mL7fxTWQ82ucscffLnMgQmK4QpqXadafFoJr9QoVr/vrXz2RMynaCXlBsaaPn
 r4+MFWp0rHl4RJSTuVlcWWsxIjbwFoAvMUB2mbZetnuiAfW5FxROuvwAsWt2DjpE41tT
 XMCdfGHlD3gNUivl6GLSlxy2KXbgijt5MzI8kRAcq5Dc7goR4EnU/MTKmqgRfSb9MWSM
 ++TgYh5aGHvLJMkAeKBoMXL8nUTyH7DVeKE9ZliGKkH1eIBWMnau09shs5aafXMrRHpZ
 viGzYUHxyoaS5z3QdIpOrgrh7i53+yliB/2PzXGEP4cTR9xE07v18Ca4Yz2mHr/41pkO
 H1oQ==
X-Gm-Message-State: AOAM530qyxmo1w8r+VcQ1b1jDY3i+uYSlyZmDpWCKRhvXn5VcIX/nUnG
 tgb+hL3N/yWUXyKdZz1UR8Oqj1YxDKWN5cUDyZ1wCaFFOCFULT8Pv5pIdHkLYhY/pawHHbftwCv
 /u2cdlzXkA6yF9eQ=
X-Received: by 2002:a63:2ac2:: with SMTP id q185mr18299131pgq.25.1642404747893; 
 Sun, 16 Jan 2022 23:32:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0fP7hGQtNX7PlhAn9m/WfGqHOWrhWyT1oa06f5wigm6dQZ9w0UOkUyVb/tcVgJlJjGUsAQA==
X-Received: by 2002:a63:2ac2:: with SMTP id q185mr18299101pgq.25.1642404747478; 
 Sun, 16 Jan 2022 23:32:27 -0800 (PST)
Received: from xz-m1.local ([191.101.132.74])
 by smtp.gmail.com with ESMTPSA id s8sm13301548pfk.165.2022.01.16.23.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 23:32:26 -0800 (PST)
Date: Mon, 17 Jan 2022 15:32:20 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
Message-ID: <YeUbhC7MG32K9pxu@xz-m1.local>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 01:14:08AM +0800, huangy81@chinatelecom.cn wrote:
>  ##
> +# @DirtyLimitInfo:
> +#
> +# Dirty page rate limit information of virtual CPU.
> +#
> +# @cpu-index: index of virtual CPU.
> +#
> +# @limit-rate: upper limit of dirty page rate for virtual CPU.
> +#
> +# @current-rate: current dirty page rate for virtual CPU.

Please consider spell out the unit too for all these dirty rate fields (MB/s).

> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'DirtyLimitInfo',
> +  'data': { 'cpu-index': 'int',
> +            'limit-rate': 'int64',
> +            'current-rate': 'int64' } }
> +
> +##
>  # @snapshot-save:
>  #
>  # Save a VM snapshot
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index a10ac6f..c9f5745 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -18,6 +18,26 @@
>  #include "sysemu/dirtylimit.h"
>  #include "exec/memory.h"
>  #include "hw/boards.h"
> +#include "sysemu/kvm.h"
> +#include "trace.h"
> +
> +/*
> + * Dirtylimit stop working if dirty page rate error
> + * value less than DIRTYLIMIT_TOLERANCE_RANGE
> + */
> +#define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
> +/*
> + * Plus or minus vcpu sleep time linearly if dirty
> + * page rate error value percentage over
> + * DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT.
> + * Otherwise, plus or minus a fixed vcpu sleep time.
> + */
> +#define DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT     50
> +/*
> + * Max vcpu sleep time percentage during a cycle
> + * composed of dirty ring full and sleep time.
> + */
> +#define DIRTYLIMIT_THROTTLE_PCT_MAX 99

(Thanks for the enriched comments)

> +static inline void dirtylimit_vcpu_set_quota(int cpu_index,
> +                                             uint64_t quota,
> +                                             bool on)
> +{
> +    dirtylimit_state->states[cpu_index].quota = quota;

To be clear, we could move this line into the "(on)" if condition, then in !on
case we reset it.

> +    if (on) {
> +        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
> +            dirtylimit_state->limited_nvcpu++;
> +        }
> +    } else {
> +        if (dirtylimit_state->states[cpu_index].enabled) {
> +            dirtylimit_state->limited_nvcpu--;
> +        }
> +    }
> +
> +    dirtylimit_state->states[cpu_index].enabled = on;
> +}
> +
> +static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
> +{
> +    static uint64_t max_dirtyrate;
> +    uint32_t dirty_ring_size = kvm_dirty_ring_size();
> +    uint64_t dirty_ring_size_meory_MB =
> +        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
> +
> +    if (max_dirtyrate < dirtyrate) {
> +        max_dirtyrate = dirtyrate;
> +    }
> +
> +    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
> +}
> +
> +static inline bool dirtylimit_done(uint64_t quota,
> +                                   uint64_t current)
> +{
> +    uint64_t min, max;
> +
> +    min = MIN(quota, current);
> +    max = MAX(quota, current);
> +
> +    return ((max - min) <= DIRTYLIMIT_TOLERANCE_RANGE) ? true : false;
> +}
> +
> +static inline bool
> +dirtylimit_need_linear_adjustment(uint64_t quota,
> +                                  uint64_t current)
> +{
> +    uint64_t min, max, pct;
> +
> +    min = MIN(quota, current);
> +    max = MAX(quota, current);
> +
> +    pct = (max - min) * 100 / max;
> +
> +    return pct > DIRTYLIMIT_LINEAR_ADJUSTMENT_PCT;
> +}
> +
> +static void dirtylimit_set_throttle(CPUState *cpu,
> +                                    uint64_t quota,
> +                                    uint64_t current)
> +{
> +    int64_t ring_full_time_us = 0;
> +    uint64_t sleep_pct = 0;
> +    uint64_t throttle_us = 0;
> +
> +    ring_full_time_us = dirtylimit_dirty_ring_full_time(current);
> +
> +    if (dirtylimit_need_linear_adjustment(quota, current)) {
> +        if (quota < current) {
> +            sleep_pct = (current - quota) * 100 / current;
> +            throttle_us =
> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
> +            cpu->throttle_us_per_full += throttle_us;
> +        } else {
> +            sleep_pct = (quota - current) * 100 / quota;
> +            throttle_us =
> +                ring_full_time_us * sleep_pct / (double)(100 - sleep_pct);
> +            cpu->throttle_us_per_full -= throttle_us;
> +        }
> +
> +        trace_dirtylimit_throttle_pct(cpu->cpu_index,
> +                                      sleep_pct,
> +                                      throttle_us);
> +    } else {
> +        if (quota < current) {
> +            cpu->throttle_us_per_full += ring_full_time_us / 10;
> +        } else {
> +            cpu->throttle_us_per_full -= ring_full_time_us / 10;
> +        }
> +    }
> +
> +    cpu->throttle_us_per_full = MIN(cpu->throttle_us_per_full,
> +        ring_full_time_us * DIRTYLIMIT_THROTTLE_PCT_MAX);
> +
> +    cpu->throttle_us_per_full = MAX(cpu->throttle_us_per_full, 0);
> +}

This algorithm seems works even worse than the previous version, could you have
a look on what's wrong? 

See how it fluctuates when I set a throttle of 300MB/s:

(QMP) set-vcpu-dirty-limit dirty-rate=300

Dirty rate: 17622 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 17617 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 17611 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 13023 (MB/s), duration: 1153 (ms), load: 100.00%
Dirty rate: 923 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 2853 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 1963 (MB/s), duration: 1040 (ms), load: 100.00%
Dirty rate: 180 (MB/s), duration: 1006 (ms), load: 100.00%
Dirty rate: 182 (MB/s), duration: 1007 (ms), load: 100.00%
Dirty rate: 177 (MB/s), duration: 1005 (ms), load: 100.00%
Dirty rate: 181 (MB/s), duration: 1007 (ms), load: 100.00%
Dirty rate: 179 (MB/s), duration: 1006 (ms), load: 100.00%
Dirty rate: 168 (MB/s), duration: 1005 (ms), load: 100.00%
Dirty rate: 169 (MB/s), duration: 1006 (ms), load: 100.00%
Dirty rate: 2717 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 2851 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 1773 (MB/s), duration: 1021 (ms), load: 100.00%
Dirty rate: 177 (MB/s), duration: 1006 (ms), load: 100.00%
Dirty rate: 179 (MB/s), duration: 1006 (ms), load: 100.00%
Dirty rate: 175 (MB/s), duration: 1005 (ms), load: 100.00%
Dirty rate: 1973 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 2878 (MB/s), duration: 1000 (ms), load: 100.00%
Dirty rate: 1690 (MB/s), duration: 1022 (ms), load: 100.00%
Dirty rate: 174 (MB/s), duration: 1005 (ms), load: 100.00%
Dirty rate: 184 (MB/s), duration: 1006 (ms), load: 100.00%

This is the tool I'm using:

https://github.com/xzpeter/mig_mon#memory-dirty

Again, I won't ask for a good algorithm as the 1st version, but then I think
it's nicer we have the simplest algorithm merged first, which should be very
easy to verify.

> +
> +static void dirtylimit_adjust_throttle(CPUState *cpu)
> +{
> +    uint64_t quota = 0;
> +    uint64_t current = 0;
> +    int cpu_index = cpu->cpu_index;
> +
> +    quota = dirtylimit_vcpu_get_state(cpu_index)->quota;
> +    current = vcpu_dirty_rate_get(cpu_index);
> +
> +    if (current == 0 &&
> +        dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt == 0) {
> +        cpu->throttle_us_per_full = 0;
> +        goto end;
> +    } else if (++dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt
> +               < 2) {
> +        goto end;
> +    } else if (dirtylimit_done(quota, current)) {
> +        goto end;
> +    } else {
> +        dirtylimit_vcpu_get_state(cpu_index)->unmatched_cnt = 0;
> +        dirtylimit_set_throttle(cpu, quota, current);
> +    }
> +end:
> +    trace_dirtylimit_adjust_throttle(cpu_index,
> +                                     quota, current,
> +                                     cpu->throttle_us_per_full);
> +    return;
> +}
> +
> +static void *dirtylimit_thread(void *opaque)
> +{
> +    CPUState *cpu;
> +
> +    rcu_register_thread();
> +
> +    while (!qatomic_read(&dirtylimit_quit)) {
> +        sleep(DIRTYLIMIT_CALC_TIME_MS / 1000);

Sorry to have not mentioned this: I think we probably don't even need this
dirtylimit thread.

It'll be hard to make the "sleep" right here.. you could read two identical
values from the dirty calc thread because the 1sec sleep is not accurate, so
even after this sleep() the calc thread may not have provided the latest number
yet.

It'll be much cleaner (and most importantly, accurate..) to me if we could make
this a hook function being passed over to the vcpu_dirty_rate_stat_thread()
thread, then after each vcpu_dirty_rate_stat_collect() we call the hook.

> +
> +        dirtylimit_state_lock();
> +
> +        if (!dirtylimit_in_service()) {
> +            dirtylimit_state_unlock();
> +            break;
> +        }
> +
> +        CPU_FOREACH(cpu) {
> +            if (!dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled) {
> +                continue;
> +            }
> +            dirtylimit_adjust_throttle(cpu);
> +        }
> +        dirtylimit_state_unlock();
> +    }
> +
> +    rcu_unregister_thread();
> +
> +    return NULL;
> +}
> +
> +static void dirtylimit_thread_start(void)
> +{
> +    qatomic_set(&dirtylimit_quit, 0);
> +    qemu_thread_create(&dirtylimit_thr,
> +                       "dirtylimit",
> +                       dirtylimit_thread,
> +                       NULL,
> +                       QEMU_THREAD_JOINABLE);
> +}
> +
> +static void dirtylimit_thread_stop(void)
> +{
> +    qatomic_set(&dirtylimit_quit, 1);
> +    qemu_mutex_unlock_iothread();
> +    qemu_thread_join(&dirtylimit_thr);
> +    qemu_mutex_lock_iothread();
> +}
> +
> +void dirtylimit_set_vcpu(int cpu_index,
> +                         uint64_t quota,
> +                         bool enable)
> +{
> +    trace_dirtylimit_set_vcpu(cpu_index, quota);
> +
> +    if (enable) {
> +        if (dirtylimit_in_service()) {
> +            /* only set the vcpu dirty page rate limit */
> +            dirtylimit_vcpu_set_quota(cpu_index, quota, true);
> +            return;
> +        }
> +
> +        /* initialize state when set dirtylimit first time */
> +        dirtylimit_state_lock();
> +        dirtylimit_state_initialize();
> +        dirtylimit_vcpu_set_quota(cpu_index, quota, true);
> +        dirtylimit_state_unlock();
> +
> +        dirtylimit_thread_start();

Can we move dirtylimit global initializations out of dirtylimit_set_vcpu() too?
We should always keep init/cleanup of dirty_rate_calc and dirtylimit together,
because they should, imho.  We never enable one of them.

I commented similarly in previous version on this.

> +    } else {
> +        if (!dirtylimit_in_service()) {
> +            return;
> +        }
> +
> +        dirtylimit_state_lock();
> +        /* dirty page rate limit is not enabled */
> +        if (!dirtylimit_vcpu_get_state(cpu_index)->enabled) {
> +            dirtylimit_state_unlock();
> +            return;
> +        }
> +
> +        /* switch off vcpu dirty page rate limit */
> +        dirtylimit_vcpu_set_quota(cpu_index, 0, false);
> +        dirtylimit_state_unlock();
> +
> +        if (!dirtylimit_state->limited_nvcpu) {
> +            dirtylimit_thread_stop();
> +
> +            dirtylimit_state_lock();
> +            dirtylimit_state_finalize();
> +            dirtylimit_state_unlock();

We don't need such a fine control of locking, IMHO.. it can be a very big lock
just to serialize things..

IMHO it could be as simple as:

void dirtylimit_set_vcpu(int cpu_index,
                         uint64_t quota,
                         bool enable)
{
    dirtylimit_vcpu_set_quota(cpu_index, quota, enable);
    trace_dirtylimit_set_vcpu(cpu_index, quota);
}

void qmp_set_vcpu_dirty_limit(bool has_cpu_index,
                              uint64_t cpu_index,
                              uint64_t dirty_rate,
                              Error **errp)
{
    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
        error_setg(errp, "dirty page limit feature requires KVM with"
                   " accelerator property 'dirty-ring-size' set'");
        return;
    }

    if (has_cpu_index && !dirtylimit_vcpu_index_valid(cpu_index)) {
        error_setg(errp, "incorrect cpu index specified");
        return;
    }

    dirtylimit_state_lock();

    if (!dirtylimit_in_service()) {
        /* TODO: we could have one helper to initialize all of them */
        vcpu_dirty_rate_stat_initialize();
        vcpu_dirty_rate_stat_start();
        dirtylimit_state_initialize();
        dirtylimit_vcpu_set_quota(cpu_index, quota, true);
    }

    if (has_cpu_index) {
        dirtylimit_set_vcpu(cpu_index, dirty_rate, true);
    } else {
        dirtylimit_set_all(dirty_rate, true);
    }

    dirtylimit_state_unlock();
}

I didn't write the cleanup path, but it's the same: we should only cleanup all
the global structs in cancel-vcpu-dirty-limit when we found there's zero vcpus
in track, and it should be done once there.

Thanks,

-- 
Peter Xu


