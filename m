Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1203AA1CD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:49:34 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYjN-0002CQ-GL
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltYhr-0000nz-6N
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltYhn-0001mS-7J
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623862073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9X9lP45hzAjb6CVZrvsoxIGYx7NXyNDz1zRwU+/ZPI=;
 b=V2FlGy+JMDJ6T++c52cccmDN+T+l8FX5gawXwv9PsLMpp0zL9I7g3VZlYJdmqN7TUeTTBO
 F2GOT2Nq9cW/34cN/Z2s00ctIlFJKNLKoh4d4/sqeQPla/PBoe7t5TTZtVH22c//M6xd4b
 0qnjTwMrt41cPoI8Ll2ZlfIUWKTYz1k=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-W5BqLbo2PgeFw66xwzWTlg-1; Wed, 16 Jun 2021 12:47:52 -0400
X-MC-Unique: W5BqLbo2PgeFw66xwzWTlg-1
Received: by mail-qv1-f72.google.com with SMTP id
 eb2-20020ad44e420000b029025a58adfc6bso30296qvb.9
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=a9X9lP45hzAjb6CVZrvsoxIGYx7NXyNDz1zRwU+/ZPI=;
 b=TAZjN0x6du1JpWh/Fqp90XzMwMLFcHFxZefeGhh5ibWpzjAhbnzTu1qdxm5h5qVTqu
 cV6jur1Y4KlrlJrkheF0KrFDu9alPtDi2BCaPf+uydLdKP9P3hOlx8ddn9Wzq5H0tald
 OYG8Bi6TokaFSLVjSxX4srmNXhVSsRKuyOVvsIYRdOjadW2CtwbZtW/Zu2RRifgvXR50
 2BpDtv1PdQe2oVA+sQPxsqv+MgONphLBp9sWgHGcqkq9VlqScUX/3x62pMN8VFFDnOVD
 P+bE72s/HTaFf0iVMYD2wos7DVMdPPd9ggBTtRJF8U7G65O9rEoevjNaq5aGDsKVNBI0
 J4qA==
X-Gm-Message-State: AOAM532ux40HxDg4Og+tRZVKkjlJzlX+KaL6oLOKjifMCxraKF1OjNNL
 CWl54h+6GEf81kNFIGmEitjiXhfD8krjhAEyHLrNNkxL2/0XiIZYZeYkD0/Ylf9aRrZ0HLWhIr/
 88UTaA5uxH5UAygM=
X-Received: by 2002:ac8:7301:: with SMTP id x1mr787193qto.56.1623862072363;
 Wed, 16 Jun 2021 09:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2LA1xXHQxNMn6hLjhfmaNNBzL0NgREYJZEGkDcwPdVB3odZwKKGYfVmRDv9TqaWj5ukGCTQ==
X-Received: by 2002:ac8:7301:: with SMTP id x1mr787171qto.56.1623862072078;
 Wed, 16 Jun 2021 09:47:52 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id h4sm1525296qth.66.2021.06.16.09.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:47:51 -0700 (PDT)
Date: Wed, 16 Jun 2021 12:47:50 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v4 5/6] migration/dirtyrate: move init step of
 calculation to main thread
Message-ID: <YMorNl7Di4u8TjKd@t490s>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
 <0e5ece3a7a2c235611e398086334a908bc63c4de.1623804189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <0e5ece3a7a2c235611e398086334a908bc63c4de.1623804189.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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

On Wed, Jun 16, 2021 at 09:12:31AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> since main thread could "query dirty rate" at any time, then it's
> better to move init step into main thead so that synchronization
> overhead of dirty stat can be reduced.
> 
> since not sure whether "only one QMP iothread" will still keep true
> forever, always introduce a mutex and protect dirty stat.

Sorry to have misguided you on that "only one QMP iothread" statement - that's
partly a joke.. I still think it's possible but let's not worry too much on
that now. :)

What I really wanted to suggest is moving the init data phase into main thread
(which you did in this patch, thanks!), then it's very safe already even
without mutex, afaict.. so we never do partial read DirtyStat anymore, which is
already a "safe race" since it doesn't crash anything anyways.

Btw, I think the mutex will lose it's most usefulness too if you don't take it
in the dirty rate thread (which I think is missing in this patch).  But before
looking into that, please see below..

> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  migration/dirtyrate.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index b97f6a5..d7b41bd 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -26,6 +26,8 @@
>  
>  static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
>  static struct DirtyRateStat DirtyStat;
> +static QemuMutex dirtyrate_lock;
> +static DirtyRateMeasureMode dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_NONE;
>  
>  static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>  {
> @@ -70,6 +72,7 @@ static int dirtyrate_set_state(int *state, int old_state, int new_state)
>  
>  static struct DirtyRateInfo *query_dirty_rate_info(void)
>  {
> +    qemu_mutex_lock(&dirtyrate_lock);
>      int64_t dirty_rate = DirtyStat.dirty_rate;
>      struct DirtyRateInfo *info = g_malloc0(sizeof(DirtyRateInfo));
>  
> @@ -83,6 +86,8 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>      info->calc_time = DirtyStat.calc_time;
>      info->sample_pages = DirtyStat.sample_pages;
>  
> +    qemu_mutex_unlock(&dirtyrate_lock);
> +
>      trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
>  
>      return info;
> @@ -91,6 +96,7 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>  static void init_dirtyrate_stat(int64_t start_time,
>                                  struct DirtyRateConfig config)
>  {
> +    qemu_mutex_lock(&dirtyrate_lock);
>      DirtyStat.dirty_rate = -1;
>      DirtyStat.start_time = start_time;
>      DirtyStat.calc_time = config.sample_period_seconds;
> @@ -108,6 +114,12 @@ static void init_dirtyrate_stat(int64_t start_time,
>      default:
>          break;
>      }
> +    qemu_mutex_unlock(&dirtyrate_lock);
> +}
> +
> +static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
> +{
> +    /* TODO */
>  }
>  
>  static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> @@ -379,7 +391,6 @@ void *get_dirtyrate_thread(void *arg)
>  {
>      struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
>      int ret;
> -    int64_t start_time;
>      rcu_register_thread();
>  
>      ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
> @@ -389,9 +400,6 @@ void *get_dirtyrate_thread(void *arg)
>          return NULL;
>      }
>  
> -    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
> -    init_dirtyrate_stat(start_time, config);
> -
>      calculate_dirtyrate(config);
>  
>      ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_MEASURING,
> @@ -410,6 +418,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>      static struct DirtyRateConfig config;
>      QemuThread thread;
>      int ret;
> +    int64_t start_time;
>  
>      /*
>       * If the dirty rate is already being measured, don't attempt to start.
> @@ -450,6 +459,23 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>      config.sample_period_seconds = calc_time;
>      config.sample_pages_per_gigabytes = sample_pages;
>      config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
> +
> +    if (unlikely(dirtyrate_mode == DIRTY_RATE_MEASURE_MODE_NONE)) {
> +        /* first time to calculate dirty rate */
> +        qemu_mutex_init(&dirtyrate_lock);
> +    }

Is the 'none' mode only for init the mutex?  If so, I'd suggest we drop the
"none" mode.  A side note is that if you want to init a mutex, AFAIU the best
way is define this:

static void __attribute__((__constructor__)) dirty_rate_init(void)
{
        qemu_mutex_init(...);
}

But hold on..

I see the mutex seems to already have brought even more trouble than benefits,
maybe let's drop the mutex too along with "none" mode?  Let's keep this patch
"moving init to main thread" only, and IMHO it's good enough.

There's a special care we need to look for with dirty ring measurements, that
we need to make sure to not reference the *vcpu pointer unless the state is
DIRTY_RATE_STATUS_MEASURED.  I'll comment in the next patch for that soon.

> +
> +    cleanup_dirtyrate_stat(config);
> +
> +    /*
> +     * update dirty rate mode so that we can figure out what mode has
> +     * been used in last calculation
> +     **/
> +    dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
> +
> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
> +    init_dirtyrate_stat(start_time, config);
> +
>      qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
>                         (void *)&config, QEMU_THREAD_DETACHED);
>  }
> -- 
> 1.8.3.1
> 

-- 
Peter Xu


