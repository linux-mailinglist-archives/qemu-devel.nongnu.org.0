Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B794136636A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:41:43 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1s6-0001RH-Qa
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lZ1qm-0000vD-KI
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:40:20 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:35743
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lZ1qi-0001RN-QH
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:40:19 -0400
HMM_SOURCE_IP: 172.18.0.48:36880.278743712
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.21?logid-1b6724e0bfc445828bfd1fba5c38b336
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 94C2D2800A4;
 Wed, 21 Apr 2021 09:40:10 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 1b6724e0bfc445828bfd1fba5c38b336 for
 dgilbert@redhat.com; Wed Apr 21 09:40:08 2021
X-Transaction-ID: 1b6724e0bfc445828bfd1fba5c38b336
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v1] migration/dirtyrate: make sample page count
 configurable
To: qemu-devel <qemu-devel@nongnu.org>
References: <76153f1cea1ba01997b2b6944ffbb69083d4f7db.1618420974.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <0538e2c8-e06f-605c-bbed-15b3262a47f2@chinatelecom.cn>
Date: Wed, 21 Apr 2021 09:40:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <76153f1cea1ba01997b2b6944ffbb69083d4f7db.1618420974.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/4/15 1:23, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> introduce optional sample-pages argument in calc-dirty-rate,
> making sample page count per GB configurable so that more
> accurate dirtyrate can be calculated.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>   migration/dirtyrate.c | 32 ++++++++++++++++++++++++++++----
>   migration/dirtyrate.h |  8 +++++++-
>   qapi/migration.json   | 13 ++++++++++---
>   3 files changed, 45 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ccb9814..43a531c 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -48,6 +48,16 @@ static bool is_sample_period_valid(int64_t sec)
>       return true;
>   }
>   
> +static bool is_sample_pages_valid(int64_t pages)
> +{
> +    if (pages < MIN_SAMPLE_PAGE_COUNT ||
> +        pages > MAX_SAMPLE_PAGE_COUNT) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static int dirtyrate_set_state(int *state, int old_state, int new_state)
>   {
>       assert(new_state < DIRTY_RATE_STATUS__MAX);
> @@ -72,13 +82,15 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
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
> @@ -86,6 +98,7 @@ static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
>       DirtyStat.dirty_rate = -1;
>       DirtyStat.start_time = start_time;
>       DirtyStat.calc_time = calc_time;
> +    DirtyStat.sample_pages = sample_pages;
>   }
>   
>   static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> @@ -361,6 +374,7 @@ void *get_dirtyrate_thread(void *arg)
>       int ret;
>       int64_t start_time;
>       int64_t calc_time;
> +    uint64_t sample_pages;
>   
>       ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
>                                 DIRTY_RATE_STATUS_MEASURING);
> @@ -371,7 +385,8 @@ void *get_dirtyrate_thread(void *arg)
>   
>       start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>       calc_time = config.sample_period_seconds;
> -    init_dirtyrate_stat(start_time, calc_time);
> +    sample_pages = config.sample_pages_per_gigabytes;
> +    init_dirtyrate_stat(start_time, calc_time, sample_pages);
>   
>       calculate_dirtyrate(config);
>   
> @@ -383,7 +398,8 @@ void *get_dirtyrate_thread(void *arg)
>       return NULL;
>   }
>   
> -void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
> +void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
> +                         int64_t sample_pages, Error **errp)
>   {
>       static struct DirtyRateConfig config;
>       QemuThread thread;
> @@ -404,6 +420,13 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>           return;
>       }
>   
> +    if (has_sample_pages && !is_sample_pages_valid(sample_pages)) {
> +        error_setg(errp, "sample-pages is out of range[%d, %d].",
> +                         MIN_SAMPLE_PAGE_COUNT,
> +                         MAX_SAMPLE_PAGE_COUNT);
> +        return;
> +    }
> +
>       /*
>        * Init calculation state as unstarted.
>        */
> @@ -415,7 +438,8 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>       }
>   
>       config.sample_period_seconds = calc_time;
> -    config.sample_pages_per_gigabytes = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
> +    config.sample_pages_per_gigabytes =
> +        has_sample_pages ? sample_pages : DIRTYRATE_DEFAULT_SAMPLE_PAGES;
>       qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
>                          (void *)&config, QEMU_THREAD_DETACHED);
>   }
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 6ec4295..5f987e2 100644
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
> + * Take 128 as minimum for sample dirty pages
> + */
> +#define MIN_SAMPLE_PAGE_COUNT                     128
> +#define MAX_SAMPLE_PAGE_COUNT                     4096
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
> index 9bf0bc4..868a867 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1741,6 +1741,9 @@
>   #
>   # @calc-time: time in units of second for sample dirty pages
>   #
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512
> +#
>   # Since: 5.2
>   #
>   ##
> @@ -1748,7 +1751,8 @@
>     'data': {'*dirty-rate': 'int64',
>              'status': 'DirtyRateStatus',
>              'start-time': 'int64',
> -           'calc-time': 'int64'} }
> +           'calc-time': 'int64',
> +           'sample-pages': 'uint64'} }
>   
>   ##
>   # @calc-dirty-rate:
> @@ -1757,13 +1761,16 @@
>   #
>   # @calc-time: time in units of second for sample dirty pages
>   #
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512
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

Ping - Hi, What would you think about this patch?

-- 
Best regard

Hyman Huang(黄勇)

