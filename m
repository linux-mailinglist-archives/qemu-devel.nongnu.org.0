Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D363775B4
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 08:57:19 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfdNO-0005tD-3p
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 02:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lfdLs-00052h-Iz
 for qemu-devel@nongnu.org; Sun, 09 May 2021 02:55:44 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:41853
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lfdLp-0001Qc-Em
 for qemu-devel@nongnu.org; Sun, 09 May 2021 02:55:44 -0400
HMM_SOURCE_IP: 172.18.0.48:39558.667169733
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.42.176?logid-1f5332f3cf7e44689f1342c503ec5bab
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 4FD3628009F;
 Sun,  9 May 2021 14:55:35 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 1f5332f3cf7e44689f1342c503ec5bab for
 quintela@redhat.com; Sun May  9 14:55:34 2021
X-Transaction-ID: 1f5332f3cf7e44689f1342c503ec5bab
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v1] migration/dirtyrate: make sample page count
 configurable
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <76153f1cea1ba01997b2b6944ffbb69083d4f7db.1618420974.git.huangy81@chinatelecom.cn>
 <YJPvNCnldbLx60/J@work-vm>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <fb30ac34-266e-cc62-3d15-18c7fccc6d2a@chinatelecom.cn>
Date: Sun, 9 May 2021 14:55:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJPvNCnldbLx60/J@work-vm>
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/5/6 21:29, Dr. David Alan Gilbert 写道:
> * huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> introduce optional sample-pages argument in calc-dirty-rate,
>> making sample page count per GB configurable so that more
>> accurate dirtyrate can be calculated.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> I think this is mostly OK, so:
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> I'm curious; do you find that increasing the sample count is making much
> difference to the results?
According to the test using stress tool in tests/migration, i havn't 
found that indeed. :(

 From my point of view, this depend on guest memory dirty type:

Using stress tool in tests/migration as the overload in guest, which 
dirty fixed memory section of 1G every 0.39 seconds with 1 vcpus, if we 
set the calculate time as 1s, the default value of sample page(512) 
makes result accurate enough, increasing sample count almost make no 
difference indeed.

But if we spread memory stress across more vcpus and shrink the memory 
section, dirting random-allocated memory section, we can find the 
results not accurate if we just adjust the calculate time and use the 
default value of sample page count.

Taking all types of workload in guest into account, it is resonable to 
provide one more method to make results accurate theoretically, this may 
benefit those who works for accelerate migration base on the analysis of 
dirty rate.

-- 
Best regard

Hyman Huang(黄勇)

> 
> Dave
> 
>> ---
>>   migration/dirtyrate.c | 32 ++++++++++++++++++++++++++++----
>>   migration/dirtyrate.h |  8 +++++++-
>>   qapi/migration.json   | 13 ++++++++++---
>>   3 files changed, 45 insertions(+), 8 deletions(-)
>>
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index ccb9814..43a531c 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -48,6 +48,16 @@ static bool is_sample_period_valid(int64_t sec)
>>       return true;
>>   }
>>   
>> +static bool is_sample_pages_valid(int64_t pages)
>> +{
>> +    if (pages < MIN_SAMPLE_PAGE_COUNT ||
>> +        pages > MAX_SAMPLE_PAGE_COUNT) {
>> +        return false;
>> +    }
>> +
>> +    return true;
> 
> David is right that could be simplified; but it's OK.
> 
>> +}
>> +
>>   static int dirtyrate_set_state(int *state, int old_state, int new_state)
>>   {
>>       assert(new_state < DIRTY_RATE_STATUS__MAX);
>> @@ -72,13 +82,15 @@ static struct DirtyRateInfo *query_dirty_rate_info(void)
>>       info->status = CalculatingState;
>>       info->start_time = DirtyStat.start_time;
>>       info->calc_time = DirtyStat.calc_time;
>> +    info->sample_pages = DirtyStat.sample_pages;
>>   
>>       trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
>>   
>>       return info;
>>   }
>>   
>> -static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
>> +static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
>> +                                uint64_t sample_pages)
>>   {
>>       DirtyStat.total_dirty_samples = 0;
>>       DirtyStat.total_sample_count = 0;
>> @@ -86,6 +98,7 @@ static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
>>       DirtyStat.dirty_rate = -1;
>>       DirtyStat.start_time = start_time;
>>       DirtyStat.calc_time = calc_time;
>> +    DirtyStat.sample_pages = sample_pages;
>>   }
>>   
>>   static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
>> @@ -361,6 +374,7 @@ void *get_dirtyrate_thread(void *arg)
>>       int ret;
>>       int64_t start_time;
>>       int64_t calc_time;
>> +    uint64_t sample_pages;
>>   
>>       ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
>>                                 DIRTY_RATE_STATUS_MEASURING);
>> @@ -371,7 +385,8 @@ void *get_dirtyrate_thread(void *arg)
>>   
>>       start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>>       calc_time = config.sample_period_seconds;
>> -    init_dirtyrate_stat(start_time, calc_time);
>> +    sample_pages = config.sample_pages_per_gigabytes;
>> +    init_dirtyrate_stat(start_time, calc_time, sample_pages);
>>   
>>       calculate_dirtyrate(config);
>>   
>> @@ -383,7 +398,8 @@ void *get_dirtyrate_thread(void *arg)
>>       return NULL;
>>   }
>>   
>> -void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>> +void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>> +                         int64_t sample_pages, Error **errp)
>>   {
>>       static struct DirtyRateConfig config;
>>       QemuThread thread;
>> @@ -404,6 +420,13 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>>           return;
>>       }
>>   
>> +    if (has_sample_pages && !is_sample_pages_valid(sample_pages)) {
>> +        error_setg(errp, "sample-pages is out of range[%d, %d].",
>> +                         MIN_SAMPLE_PAGE_COUNT,
>> +                         MAX_SAMPLE_PAGE_COUNT);
>> +        return;
>> +    }
>> +
>>       /*
>>        * Init calculation state as unstarted.
>>        */
>> @@ -415,7 +438,8 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
>>       }
>>   
>>       config.sample_period_seconds = calc_time;
>> -    config.sample_pages_per_gigabytes = DIRTYRATE_DEFAULT_SAMPLE_PAGES;
>> +    config.sample_pages_per_gigabytes =
>> +        has_sample_pages ? sample_pages : DIRTYRATE_DEFAULT_SAMPLE_PAGES;
>>       qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
>>                          (void *)&config, QEMU_THREAD_DETACHED);
>>   }
>> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
>> index 6ec4295..5f987e2 100644
>> --- a/migration/dirtyrate.h
>> +++ b/migration/dirtyrate.h
>> @@ -15,7 +15,6 @@
>>   
>>   /*
>>    * Sample 512 pages per GB as default.
>> - * TODO: Make it configurable.
>>    */
>>   #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
>>   
>> @@ -35,6 +34,12 @@
>>   #define MIN_FETCH_DIRTYRATE_TIME_SEC              1
>>   #define MAX_FETCH_DIRTYRATE_TIME_SEC              60
>>   
>> +/*
>> + * Take 128 as minimum for sample dirty pages
>> + */
>> +#define MIN_SAMPLE_PAGE_COUNT                     128
>> +#define MAX_SAMPLE_PAGE_COUNT                     4096
>> +
>>   struct DirtyRateConfig {
>>       uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
>>       int64_t sample_period_seconds; /* time duration between two sampling */
>> @@ -63,6 +68,7 @@ struct DirtyRateStat {
>>       int64_t dirty_rate; /* dirty rate in MB/s */
>>       int64_t start_time; /* calculation start time in units of second */
>>       int64_t calc_time; /* time duration of two sampling in units of second */
>> +    uint64_t sample_pages; /* sample pages per GB */
>>   };
>>   
>>   void *get_dirtyrate_thread(void *arg);
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 9bf0bc4..868a867 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -1741,6 +1741,9 @@
>>   #
>>   # @calc-time: time in units of second for sample dirty pages
>>   #
>> +# @sample-pages: page count per GB for sample dirty pages
>> +#                the default value is 512
> 
> That needs a (since 6.1) adding; I can do that during the merge.
> 
>> +#
>>   # Since: 5.2
>>   #
>>   ##
>> @@ -1748,7 +1751,8 @@
>>     'data': {'*dirty-rate': 'int64',
>>              'status': 'DirtyRateStatus',
>>              'start-time': 'int64',
>> -           'calc-time': 'int64'} }
>> +           'calc-time': 'int64',
>> +           'sample-pages': 'uint64'} }
>>   
>>   ##
>>   # @calc-dirty-rate:
>> @@ -1757,13 +1761,16 @@
>>   #
>>   # @calc-time: time in units of second for sample dirty pages
>>   #
>> +# @sample-pages: page count per GB for sample dirty pages
>> +#                the default value is 512
> 
> That needs a (since 6.1) adding; I can do that during the merge; as does
> that.
> 
>> +#
>>   # Since: 5.2
>>   #
>>   # Example:
>> -#   {"command": "calc-dirty-rate", "data": {"calc-time": 1} }
>> +#   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-pages': 512} }
>>   #
>>   ##
>> -{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64'} }
>> +{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-pages': 'int'} }
>>   
>>   ##
>>   # @query-dirty-rate:
>> -- 
>> 1.8.3.1
>>

