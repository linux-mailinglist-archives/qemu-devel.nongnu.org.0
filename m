Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56A437A3E4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:40:07 +0200 (CEST)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOs2-0007Ku-KU
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOnb-0000M4-Pi
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOnZ-0004a4-6N
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620725728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDoK/KESNoNxdWY7PwY8bdEAia/yj963lNvrYjewCLs=;
 b=ZeXIDIK3+KYrOl4qUzRRl407wwtlJfZE7KVLe5IicmbXwein0JSHnJA6+gfDIO8mxylsB9
 BJEoVQ+VztkngOxdZxch6eS3iSBqHMs3rllELe4leX1DMjBFw1oRCv52891QGvJAd+9kkY
 PXr8InZuRAV7PChp+FYXO6F+TY45V44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-9rXk9lQpMd-G73urBuPM3Q-1; Tue, 11 May 2021 05:35:26 -0400
X-MC-Unique: 9rXk9lQpMd-G73urBuPM3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 979B9800FF0;
 Tue, 11 May 2021 09:35:25 +0000 (UTC)
Received: from work-vm (ovpn-113-51.ams2.redhat.com [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 262C75D6A8;
 Tue, 11 May 2021 09:35:23 +0000 (UTC)
Date: Tue, 11 May 2021 10:35:21 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v2] migration/dirtyrate: make sample page count
 configurable
Message-ID: <YJpP2SUrkZcNirES@work-vm>
References: <cover.1620536022.git.huangy81@chinatelecom.cn>
 <255a27d0f05053d56ae9e5920e815ab9b2bfdeee.1620536022.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <255a27d0f05053d56ae9e5920e815ab9b2bfdeee.1620536022.git.huangy81@chinatelecom.cn>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: armbru@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> introduce optional sample-pages argument in calc-dirty-rate,
> making sample page count per GB configurable so that more
> accurate dirtyrate can be calculated.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

The json change is a bit bigger now than the previous version, and it shouldn't be.

> ---
>  migration/dirtyrate.c | 31 ++++++++++++++++---
>  migration/dirtyrate.h |  8 ++++-
>  qapi/migration.json   | 85 ++++++++++++++++++++++++++++-----------------------
>  3 files changed, 80 insertions(+), 44 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ccb9814..2ee3890 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -48,6 +48,12 @@ static bool is_sample_period_valid(int64_t sec)
>      return true;
>  }
>  
> +static bool is_sample_pages_valid(int64_t pages)
> +{
> +    return pages >= MIN_SAMPLE_PAGE_COUNT &&
> +           pages <= MAX_SAMPLE_PAGE_COUNT;
> +}
> +
>  static int dirtyrate_set_state(int *state, int old_state, int new_state)
>  {
>      assert(new_state < DIRTY_RATE_STATUS__MAX);
> @@ -72,13 +78,15 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>      info->status = CalculatingState;
>      info->start_time = DirtyStat.start_time;
>      info->calc_time = DirtyStat.calc_time;
> +    info->sample_pages = DirtyStat.sample_pages;
>  
>      trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
>  
>      return info;
>  }
>  
> -static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
> +static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
> +                                uint64_t sample_pages)
>  {
>      DirtyStat.total_dirty_samples = 0;
>      DirtyStat.total_sample_count = 0;
> @@ -86,6 +94,7 @@ static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
>      DirtyStat.dirty_rate = -1;
>      DirtyStat.start_time = start_time;
>      DirtyStat.calc_time = calc_time;
> +    DirtyStat.sample_pages = sample_pages;
>  }
>  
>  static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> @@ -361,6 +370,7 @@ void *get_dirtyrate_thread(void *arg)
>      int ret;
>      int64_t start_time;
>      int64_t calc_time;
> +    uint64_t sample_pages;
>  
>      ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
>                                DIRTY_RATE_STATUS_MEASURING);
> @@ -371,7 +381,8 @@ void *get_dirtyrate_thread(void *arg)
>  
>      start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>      calc_time = config.sample_period_seconds;
> -    init_dirtyrate_stat(start_time, calc_time);
> +    sample_pages = config.sample_pages_per_gigabytes;
> +    init_dirtyrate_stat(start_time, calc_time, sample_pages);
>  
>      calculate_dirtyrate(config);
>  
> @@ -383,7 +394,8 @@ void *get_dirtyrate_thread(void *arg)
>      return NULL;
>  }
>  
> -void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
> +void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
> +                         int64_t sample_pages, Error **errp)
>  {
>      static struct DirtyRateConfig config;
>      QemuThread thread;
> @@ -404,6 +416,17 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>          return;
>      }
>  
> +    if (has_sample_pages) {
> +        if (!is_sample_pages_valid(sample_pages)) {
> +            error_setg(errp, "sample-pages is out of range[%d, %d].",
> +                            MIN_SAMPLE_PAGE_COUNT,
> +                            MAX_SAMPLE_PAGE_COUNT);
> +            return;
> +        }
> +    } else {
> +        sample_pages = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
> +    }
> +
>      /*
>       * Init calculation state as unstarted.
>       */
> @@ -415,7 +438,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>      }
>  
>      config.sample_period_seconds = calc_time;
> -    config.sample_pages_per_gigabytes = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
> +    config.sample_pages_per_gigabytes = sample_pages;
>      qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
>                         (void *)&config, QEMU_THREAD_DETACHED);
>  }
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 6ec4295..e1fd290 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -15,7 +15,6 @@
>  
>  /*
>   * Sample 512 pages per GB as default.
> - * TODO: Make it configurable.
>   */
>  #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
>  
> @@ -35,6 +34,12 @@
>  #define MIN_FETCH_DIRTYRATE_TIME_SEC              1
>  #define MAX_FETCH_DIRTYRATE_TIME_SEC              60
>  
> +/*
> + * Take 1/16 pages in 1G as the maxmum sample page count
> + */
> +#define MIN_SAMPLE_PAGE_COUNT                     128
> +#define MAX_SAMPLE_PAGE_COUNT                     16384
> +
>  struct DirtyRateConfig {
>      uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
>      int64_t sample_period_seconds; /* time duration between two sampling */
> @@ -63,6 +68,7 @@ struct DirtyRateStat {
>      int64_t dirty_rate; /* dirty rate in MB/s */
>      int64_t start_time; /* calculation start time in units of second */
>      int64_t calc_time; /* time duration of two sampling in units of second */
> +    uint64_t sample_pages; /* sample pages per GB */
>  };
>  
>  void *get_dirtyrate_thread(void *arg);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 0b17cce..b8f0bb5 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1732,45 +1732,6 @@
>    'data': [ 'unstarted', 'measuring', 'measured'] }
>  
>  ##
> -# @DirtyRateInfo:
> -#
> -# Information about current dirty page rate of vm.
> -#
> -# @dirty-rate: an estimate of the dirty page rate of the VM in units of
> -#              MB/s, present only when estimating the rate has completed.
> -#
> -# @status: status containing dirtyrate query status includes
> -#          'unstarted' or 'measuring' or 'measured'
> -#
> -# @start-time: start time in units of second for calculation
> -#
> -# @calc-time: time in units of second for sample dirty pages
> -#
> -# Since: 5.2
> -#
> -##
> -{ 'struct': 'DirtyRateInfo',
> -  'data': {'*dirty-rate': 'int64',
> -           'status': 'DirtyRateStatus',
> -           'start-time': 'int64',
> -           'calc-time': 'int64'} }
> -
> -##
> -# @calc-dirty-rate:
> -#
> -# start calculating dirty page rate for vm
> -#
> -# @calc-time: time in units of second for sample dirty pages
> -#
> -# Since: 5.2
> -#
> -# Example:
> -#   {"command": "calc-dirty-rate", "data": {"calc-time": 1} }
> -#
> -##
> -{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64'} }
> -
> -##

I don't see why you're moving the exisitn DirtyRateInfoa nd
calc-dirty-rate.

>  # @query-dirty-rate:
>  #
>  # query dirty page rate in units of MB/s for vm
> @@ -1951,3 +1912,49 @@
>    'data': { 'job-id': 'str',
>              'tag': 'str',
>              'devices': ['str'] } }
> +
> +##
> +# @DirtyRateInfo:
> +#
> +# Information about current dirty page rate of vm.
> +#
> +# @dirty-rate: an estimate of the dirty page rate of the VM in units of
> +#              MB/s, present only when estimating the rate has completed.
> +#
> +# @status: status containing dirtyrate query status includes
> +#          'unstarted' or 'measuring' or 'measured'
> +#
> +# @start-time: start time in units of second for calculation
> +#
> +# @calc-time: time in units of second for sample dirty pages
> +#
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512
> +#
> +# Since: 6.1

These are still since 5.2;  the only difference is the new
 @sample-pages,  so it should be something like:

+# @calc-time: time in units of second for sample dirty pages
+#
+# @sample-pages: page count per GB for sample dirty pages
+#                the default value is 512 (since 6.1)
+#
+# Since: 5.2

to indicate just that field has been added.

> +##
> +{ 'struct': 'DirtyRateInfo',
> +  'data': {'*dirty-rate': 'int64',
> +           'status': 'DirtyRateStatus',
> +           'start-time': 'int64',
> +           'calc-time': 'int64',
> +           'sample-pages': 'uint64'} }
> +
> +##
> +# @calc-dirty-rate:
> +#
> +# start calculating dirty page rate for vm
> +#
> +# @calc-time: time in units of second for sample dirty pages
> +#
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-pages': 512} }
> +#
> +##
> +{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-pages': 'int'} }
> -- 
> 1.8.3.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


