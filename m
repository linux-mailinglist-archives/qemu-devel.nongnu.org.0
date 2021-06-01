Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6E2397304
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 14:10:55 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo3EU-0005xI-Kk
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 08:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lo3DS-0005Gf-Rf
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:09:50 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:52498
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lo3DP-0001b1-Vr
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 08:09:50 -0400
HMM_SOURCE_IP: 172.18.0.218:50736.2139574055
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-110.184.66.8?logid-f4060329b10f482bb59066f425ced550
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 8235E280029;
 Tue,  1 Jun 2021 20:09:38 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f4060329b10f482bb59066f425ced550 for
 peterx@redhat.com; Tue Jun  1 20:09:36 2021
X-Transaction-ID: f4060329b10f482bb59066f425ced550
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v3] migration/dirtyrate: make sample page count
 configurable
To: qemu-devel <qemu-devel@nongnu.org>
References: <cover.1620742417.git.huangy81@chinatelecom.cn>
 <1fc52dd5abfa7590f516c3e97878ee263bff105a.1620742417.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <74bd3755-9e38-6e00-8cd1-4bb9ae3af71c@chinatelecom.cn>
Date: Tue, 1 Jun 2021 20:09:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1fc52dd5abfa7590f516c3e97878ee263bff105a.1620742417.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.613,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

though dirtyrate by sampling page may kind of be inaccurate,
it still valuable for those who run qemu on non-x86 or kernel
which does not support dirty ring, this patch is necessary i
think, what would you think of it ?

在 2021/5/11 22:21, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> introduce optional sample-pages argument in calc-dirty-rate,
> making sample page count per GB configurable so that more
> accurate dirtyrate can be calculated.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   migration/dirtyrate.c | 31 +++++++++++++++++++++++++++----
>   migration/dirtyrate.h |  8 +++++++-
>   qapi/migration.json   | 13 ++++++++++---
>   3 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ccb9814..2ee3890 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -48,6 +48,12 @@ static bool is_sample_period_valid(int64_t sec)
>       return true;
>   }
>   
> +static bool is_sample_pages_valid(int64_t pages)
> +{
> +    return pages >= MIN_SAMPLE_PAGE_COUNT &&
> +           pages <= MAX_SAMPLE_PAGE_COUNT;
> +}
> +
>   static int dirtyrate_set_state(int *state, int old_state, int new_state)
>   {
>       assert(new_state < DIRTY_RATE_STATUS__MAX);
> @@ -72,13 +78,15 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>       info->status = CalculatingState;
>       info->start_time = DirtyStat.start_time;
>       info->calc_time = DirtyStat.calc_time;
> +    info->sample_pages = DirtyStat.sample_pages;
>   
>       trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
>   
>       return info;
>   }
>   
> -static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
> +static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
> +                                uint64_t sample_pages)
>   {
>       DirtyStat.total_dirty_samples = 0;
>       DirtyStat.total_sample_count = 0;
> @@ -86,6 +94,7 @@ static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
>       DirtyStat.dirty_rate = -1;
>       DirtyStat.start_time = start_time;
>       DirtyStat.calc_time = calc_time;
> +    DirtyStat.sample_pages = sample_pages;
>   }
>   
>   static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> @@ -361,6 +370,7 @@ void *get_dirtyrate_thread(void *arg)
>       int ret;
>       int64_t start_time;
>       int64_t calc_time;
> +    uint64_t sample_pages;
>   
>       ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
>                                 DIRTY_RATE_STATUS_MEASURING);
> @@ -371,7 +381,8 @@ void *get_dirtyrate_thread(void *arg)
>   
>       start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>       calc_time = config.sample_period_seconds;
> -    init_dirtyrate_stat(start_time, calc_time);
> +    sample_pages = config.sample_pages_per_gigabytes;
> +    init_dirtyrate_stat(start_time, calc_time, sample_pages);
>   
>       calculate_dirtyrate(config);
>   
> @@ -383,7 +394,8 @@ void *get_dirtyrate_thread(void *arg)
>       return NULL;
>   }
>   
> -void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
> +void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
> +                         int64_t sample_pages, Error **errp)
>   {
>       static struct DirtyRateConfig config;
>       QemuThread thread;
> @@ -404,6 +416,17 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>           return;
>       }
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
>       /*
>        * Init calculation state as unstarted.
>        */
> @@ -415,7 +438,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>       }
>   
>       config.sample_period_seconds = calc_time;
> -    config.sample_pages_per_gigabytes = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
> +    config.sample_pages_per_gigabytes = sample_pages;
>       qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
>                          (void *)&config, QEMU_THREAD_DETACHED);
>   }
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 6ec4295..e1fd290 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -15,7 +15,6 @@
>   
>   /*
>    * Sample 512 pages per GB as default.
> - * TODO: Make it configurable.
>    */
>   #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
>   
> @@ -35,6 +34,12 @@
>   #define MIN_FETCH_DIRTYRATE_TIME_SEC              1
>   #define MAX_FETCH_DIRTYRATE_TIME_SEC              60
>   
> +/*
> + * Take 1/16 pages in 1G as the maxmum sample page count
> + */
> +#define MIN_SAMPLE_PAGE_COUNT                     128
> +#define MAX_SAMPLE_PAGE_COUNT                     16384
> +
>   struct DirtyRateConfig {
>       uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
>       int64_t sample_period_seconds; /* time duration between two sampling */
> @@ -63,6 +68,7 @@ struct DirtyRateStat {
>       int64_t dirty_rate; /* dirty rate in MB/s */
>       int64_t start_time; /* calculation start time in units of second */
>       int64_t calc_time; /* time duration of two sampling in units of second */
> +    uint64_t sample_pages; /* sample pages per GB */
>   };
>   
>   void *get_dirtyrate_thread(void *arg);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 0b17cce..890e745 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1746,6 +1746,9 @@
>   #
>   # @calc-time: time in units of second for sample dirty pages
>   #
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512 (since 6.1)
> +#
>   # Since: 5.2
>   #
>   ##
> @@ -1753,7 +1756,8 @@
>     'data': {'*dirty-rate': 'int64',
>              'status': 'DirtyRateStatus',
>              'start-time': 'int64',
> -           'calc-time': 'int64'} }
> +           'calc-time': 'int64',
> +           'sample-pages': 'uint64'} }
>   
>   ##
>   # @calc-dirty-rate:
> @@ -1762,13 +1766,16 @@
>   #
>   # @calc-time: time in units of second for sample dirty pages
>   #
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512 (since 6.1)
> +#
>   # Since: 5.2
>   #
>   # Example:
> -#   {"command": "calc-dirty-rate", "data": {"calc-time": 1} }
> +#   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-pages': 512} }
>   #
>   ##
> -{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64'} }
> +{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-pages': 'int'} }
>   
>   ##
>   # @query-dirty-rate:
> 

-- 
Best regard

Hyman Huang(黄勇)

