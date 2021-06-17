Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29DA3AB79F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:37:05 +0200 (CEST)
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltu4n-0006aw-1E
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltu2p-0004F2-I0
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:35:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltu2n-0006gG-Hs
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623944100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugVi3CZTDwSjt46rhqzfn9xAlS2g87sz3u0JxRTkXTw=;
 b=fO53JKyxkTGfTvG1ujgoHV8Zx2jo9oFmD17A1qYV8v5ZUb7ognilMeAcs16jCFlfBxueMn
 kWaghKNaU1YlGPuhMzZfKwa05imJ+4GVaX0nyjQyZfLNTXIKRRxkA4Hvo96n5I3oDSRUjS
 mUsamR7n2Z98iaL82cqjqp1LErpiF9g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-Y6c62dg4O9qTAR1QPHeMpQ-1; Thu, 17 Jun 2021 11:34:59 -0400
X-MC-Unique: Y6c62dg4O9qTAR1QPHeMpQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 h20-20020ac87d540000b0290249d0777b80so4190653qtb.13
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ugVi3CZTDwSjt46rhqzfn9xAlS2g87sz3u0JxRTkXTw=;
 b=Mz2FnX2waVlNvj93CnZcv1XvDrq+QPvEn2l7T4uscY275Ccl18n3aIZb4yCiL/4X0w
 IoFzPVTaGyJI9Bj6S6jLtZQA3kbL/wbIaf1v5V2eYfeKZ6XgO2Ssd6VhpWSL7bT73xuY
 /Y2tny1UVnfz1CIvh3PUAd9f1MaTHv9Jlj1u3EFEr/x4K4b1SNbqf5F7skZHtRTzcp+N
 0HoKILuYZ1RY0imsjf3wUxXYeTuba7Wi86LvDXqh2frb2x5zjS40VqKJrXi4K8Db9WKt
 DDgCNZUz9QgKzng6HZHZGb1Kcf1/k1u6xYsh0GS3U1GywsOcFBe5w5WVe3PlqmQii2+E
 +6Nw==
X-Gm-Message-State: AOAM533H2vfttlRdAZfcT5WM59bOa/i7tVBjRY/ZmxJ83sK61aoQgM0G
 qC4vtC4ei9gznd1BdwaY2sp1KyPiU/ESQT3XETtELlDI8S6KWReyeVqSIq0cDOOswaW44TNbAn6
 RzU9zAMFq8TGXv8k=
X-Received: by 2002:a05:620a:a83:: with SMTP id
 v3mr4385421qkg.360.1623944098893; 
 Thu, 17 Jun 2021 08:34:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSK56Uejht+XbixQYw3gjFboffI1kqt/W2naE9Yz/J9tr9zEonIxE/TS/07hZ9EFiPAd+F7g==
X-Received: by 2002:a05:620a:a83:: with SMTP id
 v3mr4385394qkg.360.1623944098519; 
 Thu, 17 Jun 2021 08:34:58 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id b10sm1962890qkh.45.2021.06.17.08.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:34:57 -0700 (PDT)
Date: Thu, 17 Jun 2021 11:34:56 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 6/7] migration/dirtyrate: move init step of
 calculation to main thread
Message-ID: <YMtroF40NYypccdg@t490s>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
 <deba8e91c23a20254f86e7cc1c0f24d19d64f98c.1623938622.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <deba8e91c23a20254f86e7cc1c0f24d19d64f98c.1623938622.git.huangy81@chinatelecom.cn>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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

On Thu, Jun 17, 2021 at 10:12:07PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> since main thread may "query dirty rate" at any time, it's better
> to move init step into main thead so that synchronization overhead
> between "main" and "get_dirtyrate" can be reduced.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  migration/dirtyrate.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index a9bdd60..8a9dcf7 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -26,6 +26,7 @@
>  
>  static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
>  static struct DirtyRateStat DirtyStat;
> +static DirtyRateMeasureMode dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_NONE;
>  
>  static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>  {
> @@ -111,6 +112,11 @@ static void init_dirtyrate_stat(int64_t start_time,
>      }
>  }
>  
> +static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
> +{
> +    /* TODO */
> +}
> +
>  static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
>  {
>      DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
> @@ -380,7 +386,6 @@ void *get_dirtyrate_thread(void *arg)
>  {
>      struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
>      int ret;
> -    int64_t start_time;
>      rcu_register_thread();
>  
>      ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
> @@ -390,9 +395,6 @@ void *get_dirtyrate_thread(void *arg)
>          return NULL;
>      }
>  
> -    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
> -    init_dirtyrate_stat(start_time, config);
> -
>      calculate_dirtyrate(config);
>  
>      ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_MEASURING,
> @@ -411,6 +413,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>      static struct DirtyRateConfig config;
>      QemuThread thread;
>      int ret;
> +    int64_t start_time;
>  
>      /*
>       * If the dirty rate is already being measured, don't attempt to start.
> @@ -451,6 +454,18 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>      config.sample_period_seconds = calc_time;
>      config.sample_pages_per_gigabytes = sample_pages;
>      config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
> +
> +    cleanup_dirtyrate_stat(config);

This line should ideally be moved into the next patch, as sampling itself
doesn't need it.

> +
> +    /*
> +     * update dirty rate mode so that we can figure out what mode has
> +     * been used in last calculation
> +     **/
> +    dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;

This line is odd. Would page sampling broken if without this line?  We need to
make sure each commit keeps the old way working..

Thanks,

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


