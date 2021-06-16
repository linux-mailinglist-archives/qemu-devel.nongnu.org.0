Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580ED3AA21B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 19:06:01 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYzI-0001Zy-CA
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 13:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltYqL-0006Mt-IJ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltYqH-0007as-I2
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623862600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEbhfzoJiXYd2udyxTQo06fkzMn8d7pRtCV3qQzjpGg=;
 b=LB+OFPwF10E3LfIyTc9OODm9CA9sQv81+xhRO269NuWYSixb3U7hDKwuJTPgRpmZNRtksD
 AEfATMQjry25QHxPn9nqytDMykmUNmODy/Er1tY07XG3RJLe6uofEc4U6gzjEz1UwJax/b
 c5S9Qjqgz6z+3Ny51ZFEbuDBu0tqnWM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-99wytLijPHiruZZ0D8cFqQ-1; Wed, 16 Jun 2021 12:56:39 -0400
X-MC-Unique: 99wytLijPHiruZZ0D8cFqQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 t131-20020a37aa890000b02903a9f6c1e8bfso30205qke.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BEbhfzoJiXYd2udyxTQo06fkzMn8d7pRtCV3qQzjpGg=;
 b=aimlKeYHs9oCGFTXQgypIi9B6bewcGPuEtc7RO9U1svs6wt6j/tpoZ9z2GNrdeFGVQ
 SNoC4QNT73mWs4KJ8IpUhaW/olZuVsPBELbD+B5yp+cx+VU2wfaXGDMusW9Vhf4nOOuG
 EuVB6a6YtoPTbnBNHfWefmx/Ec7lQlZMA+8gZsf3iuJQQXkk73KTHcVXJeejD1oHGsQu
 tTDMTc+qKhKN98pPuZbrJ7l89oSokb5irnVgJZzY2Pw7wMQH3ROJZCIfim56hSF3Zncq
 Sc0Cd5klV3Wjq09kLXHh2nXHM0qBWNGYdrk3CX6FvGbTHFDPU8shFLTA0WA3zyzP0H+B
 xIHA==
X-Gm-Message-State: AOAM5319tqHabbnfV3gnSZlSBD6YWF55V4QsQ1Bvf9dFZ6ipIPzBole5
 OhUNWJwRh4cjsg14HkpJ3vtmvZotE6//Bt31UWh1+Wl9bO/nLP0a34ioRyFCbXun6+OHA9E3Mpn
 oil32F/l71kPgiDI=
X-Received: by 2002:a05:6214:14aa:: with SMTP id
 bo10mr1026167qvb.24.1623862598862; 
 Wed, 16 Jun 2021 09:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzV5SjfXRld+hH/PQIjwGgw0VsVhtbocWbYz9Fpdj7LJEcTYI+jlE22YcSlEacmU4hzhaZ/cw==
X-Received: by 2002:a05:6214:14aa:: with SMTP id
 bo10mr1026139qvb.24.1623862598584; 
 Wed, 16 Jun 2021 09:56:38 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id n12sm1532619qtl.14.2021.06.16.09.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:56:38 -0700 (PDT)
Date: Wed, 16 Jun 2021 12:56:36 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v4 6/6] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
Message-ID: <YMotRAerhGZTQCMu@t490s>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
 <c8f3da653448bbfc388ca5629ba6cc0c663b9441.1623804189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <c8f3da653448bbfc388ca5629ba6cc0c663b9441.1623804189.git.huangy81@chinatelecom.cn>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 09:12:32AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> use dirty ring feature to implement dirtyrate calculation.
> 
> introduce mode option in qmp calc_dirty_rate to specify what
> method should be used when calculating dirtyrate, either
> page-sampling or dirty-ring should be passed.
> 
> introduce "dirty_ring:-r" option in hmp calc_dirty_rate to
> indicate dirty ring method should be used for calculation.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Mostly good to me, thanks; still some more comments below.

> ---
>  hmp-commands.hx        |   7 +-
>  migration/dirtyrate.c  | 183 ++++++++++++++++++++++++++++++++++++++++++++++---
>  migration/trace-events |   2 +
>  qapi/migration.json    |  16 ++++-
>  4 files changed, 195 insertions(+), 13 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8e45bce..f7fc9d7 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1738,8 +1738,9 @@ ERST
>  
>      {
>          .name       = "calc_dirty_rate",
> -        .args_type  = "second:l,sample_pages_per_GB:l?",
> -        .params     = "second [sample_pages_per_GB]",
> -        .help       = "start a round of guest dirty rate measurement",
> +        .args_type  = "dirty_ring:-r,second:l,sample_pages_per_GB:l?",
> +        .params     = "[-r] second [sample_pages_per_GB]",
> +        .help       = "start a round of guest dirty rate measurement (using -d to"
> +                      "\n\t\t\t specify dirty ring as the method of calculation)",
>          .cmd        = hmp_calc_dirty_rate,
>      },
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index d7b41bd..7c9515b 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -16,6 +16,7 @@
>  #include "cpu.h"
>  #include "exec/ramblock.h"
>  #include "qemu/rcu_queue.h"
> +#include "qemu/main-loop.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "ram.h"
>  #include "trace.h"
> @@ -23,11 +24,20 @@
>  #include "monitor/hmp.h"
>  #include "monitor/monitor.h"
>  #include "qapi/qmp/qdict.h"
> +#include "sysemu/kvm.h"
> +#include "sysemu/runstate.h"
> +#include "exec/memory.h"
> +
> +typedef struct DirtyPageRecord {
> +    uint64_t start_pages;
> +    uint64_t end_pages;
> +} DirtyPageRecord;
>  
>  static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
>  static struct DirtyRateStat DirtyStat;
>  static QemuMutex dirtyrate_lock;
>  static DirtyRateMeasureMode dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_NONE;
> +static DirtyPageRecord *dirty_pages;

I think this can be a local var.  See below.

>  
>  static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>  {
> @@ -72,9 +82,11 @@ static int dirtyrate_set_state(int *state, int old_state, int new_state)
>  
>  static struct DirtyRateInfo *query_dirty_rate_info(void)
>  {
> +    int i;
>      qemu_mutex_lock(&dirtyrate_lock);
>      int64_t dirty_rate = DirtyStat.dirty_rate;
>      struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
> +    DirtyRateVcpuList *head = NULL, **tail = &head;
>  
>      if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
>          info->has_dirty_rate = true;
> @@ -85,9 +97,22 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>      info->start_time = DirtyStat.start_time;
>      info->calc_time = DirtyStat.calc_time;
>      info->sample_pages = DirtyStat.sample_pages;
> +    info->mode = dirtyrate_mode;
> +
> +    if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
> +        /* set sample_pages with 0 to indicate page sampling isn't enabled */
> +        info->sample_pages = 0;
> +        info->has_vcpu_dirty_rate = true;
> +        for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
> +            DirtyRateVcpu *rate = g_malloc0(sizeof(DirtyRateVcpu));
> +            rate->id = DirtyStat.dirty_ring.rates[i].id;
> +            rate->dirty_rate = DirtyStat.dirty_ring.rates[i].dirty_rate;
> +            QAPI_LIST_APPEND(tail, rate);
> +        }
> +        info->vcpu_dirty_rate = head;
> +    }

I think it's nicer to move this chunk into the previous block:

    if (qatomic_read(&CalculatingState) == DIRTY_RATE_STATUS_MEASURED) {
        ...
    }

Then as mentioned previously I think we can drop the mutex in previous patch.

>  
>      qemu_mutex_unlock(&dirtyrate_lock);
> -
>      trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
>  
>      return info;
> @@ -119,7 +144,11 @@ static void init_dirtyrate_stat(int64_t start_time,
>  
>  static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
>  {
> -    /* TODO */
> +    /* last calc-dirty-rate qmp use dirty ring mode */
> +    if (dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
> +        free(DirtyStat.dirty_ring.rates);
> +        DirtyStat.dirty_ring.rates = NULL;
> +    }
>  }
>  
>  static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> @@ -356,7 +385,97 @@ static bool compare_page_hash_info(struct RamblockDirtyInfo *info,
>      return true;
>  }
>  
> -static void calculate_dirtyrate(struct DirtyRateConfig config)
> +static void record_dirtypages(CPUState *cpu, bool start)
> +{
> +    if (start) {
> +        dirty_pages[cpu->cpu_index].start_pages = cpu->dirty_pages;
> +    } else {
> +        dirty_pages[cpu->cpu_index].end_pages = cpu->dirty_pages;
> +    }
> +}

I suggest to drop this helper and inline them.  More below.

> +
> +static void dirtyrate_global_dirty_log_start(void)
> +{
> +    qemu_mutex_lock_iothread();
> +    memory_global_dirty_log_start(GLOBAL_DIRTY_DIRTY_RATE);
> +    qemu_mutex_unlock_iothread();
> +}
> +
> +static void dirtyrate_global_dirty_log_stop(void)
> +{
> +    qemu_mutex_lock_iothread();
> +    memory_global_dirty_log_stop(GLOBAL_DIRTY_DIRTY_RATE);
> +    qemu_mutex_unlock_iothread();
> +}
> +
> +static int64_t do_calculate_dirtyrate_vcpu(int idx)
> +{
> +    uint64_t memory_size_MB;
> +    int64_t time_s;
> +    uint64_t start_pages = dirty_pages[idx].start_pages;
> +    uint64_t end_pages = dirty_pages[idx].end_pages;
> +    uint64_t dirty_pages = 0;
> +
> +    dirty_pages = end_pages - start_pages;
> +
> +    memory_size_MB = (dirty_pages * TARGET_PAGE_SIZE) >> 20;
> +    time_s = DirtyStat.calc_time;
> +
> +    trace_dirtyrate_do_calculate_vcpu(idx, dirty_pages, time_s);
> +
> +    return memory_size_MB / time_s;
> +}
> +
> +static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
> +{
> +    CPUState *cpu;
> +    int64_t msec = 0;
> +    int64_t start_time;
> +    uint64_t dirtyrate = 0;
> +    uint64_t dirtyrate_sum = 0;
> +    int nvcpu = 0;
> +    int i = 0;
> +
> +    CPU_FOREACH(cpu) {
> +        nvcpu++;
> +    }
> +
> +    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);

I think dirty_pages can be a local var in this function and should be enough.

> +
> +    DirtyStat.dirty_ring.nvcpu = nvcpu;
> +    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
> +
> +    dirtyrate_global_dirty_log_start();
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(cpu, true);

Here we expand it so reference dirty_pages will have no problem.

> +    }
> +
> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    DirtyStat.start_time = start_time / 1000;
> +
> +    msec = config.sample_period_seconds * 1000;
> +    msec = set_sample_page_period(msec, start_time);
> +    DirtyStat.calc_time = msec / 1000;
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(cpu, false);

Same here.

> +    }
> +
> +    dirtyrate_global_dirty_log_stop();
> +
> +    for (i = 0; i < DirtyStat.dirty_ring.nvcpu; i++) {
> +        dirtyrate = do_calculate_dirtyrate_vcpu(i);

We may need to pass in dirty_pages here too, but this should be the last thing
we do to make it local.

> +        DirtyStat.dirty_ring.rates[i].id = i;
> +        DirtyStat.dirty_ring.rates[i].dirty_rate = dirtyrate;
> +        dirtyrate_sum += dirtyrate;
> +    }
> +
> +    DirtyStat.dirty_rate = dirtyrate_sum;
> +    free(dirty_pages);
> +}
> +
> +static void calculate_dirtyrate_sample_vm(struct DirtyRateConfig config)
>  {
>      struct RamblockDirtyInfo *block_dinfo = NULL;
>      int block_count = 0;
> @@ -387,6 +506,17 @@ out:
>      free_ramblock_dirty_info(block_dinfo, block_count);
>  }
>  
> +static void calculate_dirtyrate(struct DirtyRateConfig config)
> +{
> +    if (config.mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
> +        calculate_dirtyrate_dirty_ring(config);
> +    } else {
> +        calculate_dirtyrate_sample_vm(config);
> +    }
> +
> +    trace_dirtyrate_calculate(DirtyStat.dirty_rate);
> +}
> +
>  void *get_dirtyrate_thread(void *arg)
>  {
>      struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
> @@ -412,8 +542,12 @@ void *get_dirtyrate_thread(void *arg)
>      return NULL;
>  }
>  
> -void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
> -                         int64_t sample_pages, Error **errp)
> +void qmp_calc_dirty_rate(int64_t calc_time,
> +                         bool has_sample_pages,
> +                         int64_t sample_pages,
> +                         bool has_mode,
> +                         DirtyRateMeasureMode mode,
> +                         Error **errp)
>  {
>      static struct DirtyRateConfig config;
>      QemuThread thread;
> @@ -435,6 +569,15 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>          return;
>      }
>  
> +    if (!has_mode) {
> +        mode =  DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
> +    }
> +
> +    if (has_sample_pages && mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) {
> +        error_setg(errp, "either sample-pages or dirty-ring can be specified.");
> +        return;
> +    }
> +
>      if (has_sample_pages) {
>          if (!is_sample_pages_valid(sample_pages)) {
>              error_setg(errp, "sample-pages is out of range[%d, %d].",
> @@ -447,6 +590,16 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>      }
>  
>      /*
> +     * dirty ring mode only works when kvm dirty ring is enabled.
> +     */
> +    if ((mode == DIRTY_RATE_MEASURE_MODE_DIRTY_RING) &&
> +        !kvm_dirty_ring_enabled()) {
> +        error_setg(errp, "dirty ring is disabled, use sample-pages method "
> +                         "or remeasure later.");
> +        return;
> +    }
> +
> +    /*
>       * Init calculation state as unstarted.
>       */
>      ret = dirtyrate_set_state(&CalculatingState, CalculatingState,
> @@ -458,7 +611,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>  
>      config.sample_period_seconds = calc_time;
>      config.sample_pages_per_gigabytes = sample_pages;
> -    config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
> +    config.mode = mode;
>  
>      if (unlikely(dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_NONE)) {
>          /* first time to calculate dirty rate */
> @@ -471,7 +624,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>       * update dirty rate mode so that we can figure out what mode has
>       * been used in last calculation
>       **/
> -    dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
> +    dirtyrate_mode = mode;
>  
>      start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>      init_dirtyrate_stat(start_time, config);
> @@ -497,9 +650,18 @@ void hmp_info_dirty_rate(Monitor *mon, const QDict *qdict)
>                     info->sample_pages);
>      monitor_printf(mon, "Period: %"PRIi64" (sec)\n",
>                     info->calc_time);
> +    monitor_printf(mon, "Mode: %s\n",
> +                   DirtyRateMeasureMode_str(info->mode));
>      monitor_printf(mon, "Dirty rate: ");
>      if (info->has_dirty_rate) {
>          monitor_printf(mon, "%"PRIi64" (MB/s)\n", info->dirty_rate);
> +        if (info->has_vcpu_dirty_rate) {
> +            DirtyRateVcpuList *rate, *head = info->vcpu_dirty_rate;
> +            for (rate = head; rate != NULL; rate = rate->next) {
> +                monitor_printf(mon, "vcpu[%"PRIi64"], Dirty rate: %"PRIi64"\n",
> +                               rate->value->id, rate->value->dirty_rate);
> +            }
> +        }
>      } else {
>          monitor_printf(mon, "(not ready)\n");
>      }

Please be careful to not leak the list of vcpu results.. I think we need
something like qapi_free_DirtyRateVcpuList().

Thanks,

-- 
Peter Xu


