Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB5747E221
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:17:05 +0100 (CET)
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0M5n-0006p2-T1
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:17:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0M1r-0000AL-Gx
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:12:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0M1m-0004U6-MC
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640257973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbz/ELParWrJPgEnoB1Mdl5Wv2Bktnao/gNEzCzFhJw=;
 b=VDcu+S+gkZekAXfX3aGR2wz1tgXN9fQ7QflFl3hYuTVq86/EbMFHve/Ewxom7o0LnQEzbf
 TxJJWjp2WZCEmiMyMj4TW0sk0DR6ejtkcU+s7rcWfiYkmjJa5c7fU/bzfwl4ghqXb+xYWG
 yEF8C/BpS8VzOQxcxAIG7BM1iv7cp/c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-bTniANRzO8y73a5Cxdr1sA-1; Thu, 23 Dec 2021 06:12:49 -0500
X-MC-Unique: bTniANRzO8y73a5Cxdr1sA-1
Received: by mail-wm1-f72.google.com with SMTP id
 f202-20020a1c1fd3000000b00344f1cae317so2058812wmf.0
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wbz/ELParWrJPgEnoB1Mdl5Wv2Bktnao/gNEzCzFhJw=;
 b=eh7/3FcVLkanbFVC1zai5GJNv5/QxROh/YXsSh4UdpcUuH8iMWs7lVESxvd0DQ+ujc
 aXPi/rzbQRZqE85n9awrPSLVoIpG7sPMNA/fbaudnvC5V6LXhnTI441hWR0keDLXOvbw
 ydyEjUtkvb9YWwqnhr1Ozz+91X93f/6pHbFgQ0Tb2ZKgdcGgzQ6IBRp4qBQ+8CDuYQaS
 91IfhwFVUHa9J/25ukx7MJc6Heg6NwRFbCqBj6UtOMvvMrpw7wRt4f8FBV5lhYFm9P0K
 DqKd/5Iy/DGpff/xAYz29zLZfEHn6ER8DnqCfLniH7SdpN+Ac7ywfeTlvPfC1XdbpZ4C
 osdQ==
X-Gm-Message-State: AOAM533PuwAhEiE5MXiBPeryH1+h1RKCbF3+gy0yVO5Z3a05KSG50SJy
 ypCCnux4YkBIOjUcrE6xUvLnIJrZxnmp08X2KMxuleJm4MExVab6BoLTH8IxItuOAHQPqGAVeHN
 TEdL6mXCldvGgXEY=
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr1467250wrw.696.1640257967715; 
 Thu, 23 Dec 2021 03:12:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLOqPS3AnXS+CD/ga3fi1Y8SJPcom3U2G3X41foWeGcH0wIYRG23PWx1xfgxDI9WyepPT/xw==
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr1467236wrw.696.1640257967375; 
 Thu, 23 Dec 2021 03:12:47 -0800 (PST)
Received: from xz-m1.local ([64.64.123.18])
 by smtp.gmail.com with ESMTPSA id c7sm5366194wri.21.2021.12.23.03.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:12:46 -0800 (PST)
Date: Thu, 23 Dec 2021 19:12:39 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v10 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
Message-ID: <YcRZpy1zecHd9jMh@xz-m1.local>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <dd69e3b37bb9b3fd9cd1fa6d6bf10b8faf461c83.1639479557.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <dd69e3b37bb9b3fd9cd1fa6d6bf10b8faf461c83.1639479557.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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

Hi, Yong,

On Tue, Dec 14, 2021 at 07:07:32PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce the third method GLOBAL_DIRTY_LIMIT of dirty
> tracking for calculate dirtyrate periodly for dirty restraint.
> 
> Implement thread for calculate dirtyrate periodly, which will
> be used for dirty page limit.
> 
> Add dirtylimit.h to introduce the util function for dirty
> limit implementation.

Sorry to be late on reading it, my apologies.

> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  include/exec/memory.h       |   5 +-
>  include/sysemu/dirtylimit.h |  51 ++++++++++++++
>  migration/dirtyrate.c       | 160 +++++++++++++++++++++++++++++++++++++++++---
>  migration/dirtyrate.h       |   2 +
>  4 files changed, 207 insertions(+), 11 deletions(-)
>  create mode 100644 include/sysemu/dirtylimit.h
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 20f1b27..606bec8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -69,7 +69,10 @@ static inline void fuzz_dma_read_cb(size_t addr,
>  /* Dirty tracking enabled because measuring dirty rate */
>  #define GLOBAL_DIRTY_DIRTY_RATE (1U << 1)
>  
> -#define GLOBAL_DIRTY_MASK  (0x3)
> +/* Dirty tracking enabled because dirty limit */
> +#define GLOBAL_DIRTY_LIMIT      (1U << 2)
> +
> +#define GLOBAL_DIRTY_MASK  (0x7)
>  
>  extern unsigned int global_dirty_tracking;
>  
> diff --git a/include/sysemu/dirtylimit.h b/include/sysemu/dirtylimit.h
> new file mode 100644
> index 0000000..34e48f8
> --- /dev/null
> +++ b/include/sysemu/dirtylimit.h
> @@ -0,0 +1,51 @@
> +/*
> + * dirty limit helper functions
> + *
> + * Copyright (c) 2021 CHINA TELECOM CO.,LTD.
> + *
> + * Authors:
> + *  Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QEMU_DIRTYRLIMIT_H
> +#define QEMU_DIRTYRLIMIT_H
> +
> +#define DIRTYLIMIT_CALC_TIME_MS         1000    /* 1000ms */
> +
> +/**
> + * dirtylimit_calc_current
> + *
> + * get current dirty page rate for specified virtual CPU.
> + */
> +int64_t dirtylimit_calc_current(int cpu_index);
> +
> +/**
> + * dirtylimit_calc_start
> + *
> + * start dirty page rate calculation thread.
> + */
> +void dirtylimit_calc_start(void);
> +
> +/**
> + * dirtylimit_calc_quit
> + *
> + * quit dirty page rate calculation thread.
> + */
> +void dirtylimit_calc_quit(void);
> +
> +/**
> + * dirtylimit_calc_state_init
> + *
> + * initialize dirty page rate calculation state.
> + */
> +void dirtylimit_calc_state_init(int max_cpus);
> +
> +/**
> + * dirtylimit_calc_state_finalize
> + *
> + * finalize dirty page rate calculation state.
> + */
> +void dirtylimit_calc_state_finalize(void);
> +#endif

Since dirtylimit and dirtyrate looks so alike, not sure it's easier to just
reuse dirtyrate.h; after all you reused dirtyrate.c.

> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index d65e744..e8d4e4a 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -27,6 +27,7 @@
>  #include "qapi/qmp/qdict.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/dirtylimit.h"
>  #include "exec/memory.h"
>  
>  /*
> @@ -46,6 +47,155 @@ static struct DirtyRateStat DirtyStat;
>  static DirtyRateMeasureMode dirtyrate_mode =
>                  DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
>  
> +struct {
> +    DirtyRatesData data;
> +    bool quit;
> +    QemuThread thread;
> +} *dirtylimit_calc_state;
> +
> +static void dirtylimit_global_dirty_log_start(void)
> +{
> +    qemu_mutex_lock_iothread();
> +    memory_global_dirty_log_start(GLOBAL_DIRTY_LIMIT);
> +    qemu_mutex_unlock_iothread();
> +}
> +
> +static void dirtylimit_global_dirty_log_stop(void)
> +{
> +    qemu_mutex_lock_iothread();
> +    memory_global_dirty_log_stop(GLOBAL_DIRTY_LIMIT);
> +    qemu_mutex_unlock_iothread();
> +}

This is merely dirtyrate_global_dirty_log_start/stop but with a different flag.

Let's introduce global_dirty_log_change() with BQL?

  global_dirty_log_change(flag, onoff)
  {
    qemu_mutex_lock_iothread();
    if (start) {
        memory_global_dirty_log_start(flag);
    } else {
        memory_global_dirty_log_stop(flag);
    }
    qemu_mutex_unlock_iothread();
  }

Then we merge 4 functions into one.

We can also have a BQL-version of global_dirty_log_sync() in the same patch if
you think above helpful.

> +
> +static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
> +                                     CPUState *cpu, bool start)
> +{
> +    if (start) {
> +        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
> +    } else {
> +        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
> +    }
> +}
> +
> +static void dirtylimit_calc_func(void)

Would you still consider merging this with calculate_dirtyrate_dirty_ring?

I still don't see why it can't.

Maybe it cannot be directly reused, but the whole logic is really, really
similar: alloc an array of DirtyPageRecord, take notes, sleep, take some other
notes, calculate per-vcpu dirty rates.

There's some trivial details that are different (whether start/stop logging,
whether use sync), but they can be abstracted.

At least it can be changed into something like:

  dirtylimit_calc_func(DirtyRateVcpu *stat)
  {
      // never race against cpu hotplug/unplug
      cpu_list_lock();

      // this should include allocate buffers and record initial values for all cores
      record = vcpu_dirty_stat_alloc();
      // do the sleep
      duration = vcpu_dirty_stat_wait(records)

      // the "difference"..
      global_dirty_log_sync();

      // collect end timestamps, calculates
      vcpu_dirty_stat_collect(stat, records);
      vcpu_dirty_stat_free(stat);

      cpu_list_unlock();

      return stat;
  }

It may miss something but just to show what I meant..

> +{
> +    CPUState *cpu;
> +    DirtyPageRecord *dirty_pages;
> +    int64_t start_time, end_time, calc_time;
> +    DirtyRateVcpu rate;
> +    int i = 0;
> +
> +    dirty_pages = g_malloc0(sizeof(*dirty_pages) *
> +        dirtylimit_calc_state->data.nvcpu);
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(dirty_pages, cpu, true);
> +    }

Note that I used cpu_list_lock() above and I think we need it.

Initially I thought rcu read lock is fine too (which is missing! btw) but I
don't really think it'll work, because rcu assignment won't wait for a grace
period when add/remove cpus into global cpu list.  So I don't see a good way to
do this safely with cpu plug/unplug but to take the cpu list lock, otherwise be
prepared to crash qemu when it happens..

I don't know whether the cpu list is doing the right thing on RCU assignment,
but I know the mutex should work..

> +
> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    g_usleep(DIRTYLIMIT_CALC_TIME_MS * 1000);
> +    end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    calc_time = end_time - start_time;
> +
> +    qemu_mutex_lock_iothread();
> +    memory_global_dirty_log_sync();
> +    qemu_mutex_unlock_iothread();
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(dirty_pages, cpu, false);
> +    }
> +
> +    for (i = 0; i < dirtylimit_calc_state->data.nvcpu; i++) {
> +        uint64_t increased_dirty_pages =
> +            dirty_pages[i].end_pages - dirty_pages[i].start_pages;
> +        uint64_t memory_size_MB =
> +            (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
> +        int64_t dirtyrate = (memory_size_MB * 1000) / calc_time;
> +
> +        rate.id = i;
> +        rate.dirty_rate  = dirtyrate;
> +        dirtylimit_calc_state->data.rates[i] = rate;
> +
> +        trace_dirtyrate_do_calculate_vcpu(i,
> +            dirtylimit_calc_state->data.rates[i].dirty_rate);
> +    }
> +
> +    free(dirty_pages);
> +}
> +
> +static void *dirtylimit_calc_thread(void *opaque)
> +{
> +    rcu_register_thread();
> +
> +    dirtylimit_global_dirty_log_start();
> +
> +    while (!qatomic_read(&dirtylimit_calc_state->quit)) {
> +        dirtylimit_calc_func();
> +    }
> +
> +    dirtylimit_global_dirty_log_stop();
> +
> +    rcu_unregister_thread();
> +    return NULL;
> +}
> +
> +int64_t dirtylimit_calc_current(int cpu_index)

It's not "calculating" but "fetching", maybe simply call it
vcpu_get_dirty_rate()?

> +{
> +    DirtyRateVcpu *rates = dirtylimit_calc_state->data.rates;
> +
> +    return qatomic_read(&rates[cpu_index].dirty_rate);
> +}
> +
> +void dirtylimit_calc_start(void)
> +{
> +    if (!qatomic_read(&dirtylimit_calc_state->quit)) {

If we can have a "running", then we should check "running==true" instead.
Please see below on...

> +        goto end;

"return" would work.

> +    }
> +
> +    qatomic_set(&dirtylimit_calc_state->quit, 0);

Same here, set running=true, then clear it when thread quits.

> +    qemu_thread_create(&dirtylimit_calc_state->thread,
> +                       "dirtylimit-calc",
> +                       dirtylimit_calc_thread,
> +                       NULL,
> +                       QEMU_THREAD_JOINABLE);
> +end:
> +    return;

No need for both of them..

> +}
> +
> +void dirtylimit_calc_quit(void)
> +{
> +    qatomic_set(&dirtylimit_calc_state->quit, 1);
> +
> +    if (qemu_mutex_iothread_locked()) {

Ideally I think this should already with BQL so not necessary?  I'll check
later patches, just leave a mark.

> +        qemu_mutex_unlock_iothread();
> +        qemu_thread_join(&dirtylimit_calc_state->thread);
> +        qemu_mutex_lock_iothread();
> +    } else {
> +        qemu_thread_join(&dirtylimit_calc_state->thread);
> +    }
> +}
> +
> +void dirtylimit_calc_state_init(int max_cpus)
> +{
> +    dirtylimit_calc_state =
> +        g_malloc0(sizeof(*dirtylimit_calc_state));
> +
> +    dirtylimit_calc_state->data.nvcpu = max_cpus;
> +    dirtylimit_calc_state->data.rates =
> +        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
> +
> +    dirtylimit_calc_state->quit = true;

Instead of using "quit", I'd rather use "running".  It'll be false by default
and only set when thread runs.

Setting "quit" by default just reads weird.. or let's keep both "quit" or
"running", I think it'll be cleaner, then here we should make running=false and
quit=false too.

> +}
> +
> +void dirtylimit_calc_state_finalize(void)
> +{
> +    free(dirtylimit_calc_state->data.rates);
> +    dirtylimit_calc_state->data.rates = NULL;
> +
> +    free(dirtylimit_calc_state);
> +    dirtylimit_calc_state = NULL;
> +}
> +
>  static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>  {
>      int64_t current_time;
> @@ -396,16 +546,6 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
>      return true;
>  }
>  
> -static inline void record_dirtypages(DirtyPageRecord *dirty_pages,
> -                                     CPUState *cpu, bool start)
> -{
> -    if (start) {
> -        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
> -    } else {
> -        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
> -    }
> -}
> -
>  static void dirtyrate_global_dirty_log_start(void)
>  {
>      qemu_mutex_lock_iothread();
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 69d4c5b..e96acdc 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -70,6 +70,8 @@ typedef struct VcpuStat {
>      DirtyRateVcpu *rates; /* array of dirty rate for each vcpu */
>  } VcpuStat;
>  
> +typedef struct VcpuStat DirtyRatesData;
> +
>  /*
>   * Store calculation statistics for each measure.
>   */
> -- 
> 1.8.3.1
> 

-- 
Peter Xu


