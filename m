Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B919A3AC078
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 03:17:55 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu38s-0006w6-Ec
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 21:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lu37T-0005v1-Va
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 21:16:27 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:50461
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lu37O-0002L6-MF
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 21:16:27 -0400
HMM_SOURCE_IP: 172.18.0.218:40330.768341828
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.242?logid-ff3bf385883e424e822d9f0092d3cb1f
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id A34E32800FB;
 Fri, 18 Jun 2021 09:16:12 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id ff3bf385883e424e822d9f0092d3cb1f for
 zhengchuan@huawei.com; Fri Jun 18 09:16:13 2021
X-Transaction-ID: ff3bf385883e424e822d9f0092d3cb1f
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v7 6/7] migration/dirtyrate: move init step of calculation
 to main thread
To: Peter Xu <peterx@redhat.com>
References: <cover.1623938622.git.huangy81@chinatelecom.cn>
 <deba8e91c23a20254f86e7cc1c0f24d19d64f98c.1623938622.git.huangy81@chinatelecom.cn>
 <YMtroF40NYypccdg@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <e23be263-b340-17c4-3978-2cc6e33950d1@chinatelecom.cn>
Date: Fri, 18 Jun 2021 09:16:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMtroF40NYypccdg@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.254,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/17 23:34, Peter Xu 写道:
> On Thu, Jun 17, 2021 at 10:12:07PM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> since main thread may "query dirty rate" at any time, it's better
>> to move init step into main thead so that synchronization overhead
>> between "main" and "get_dirtyrate" can be reduced.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>> ---
>>   migration/dirtyrate.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
>> index a9bdd60..8a9dcf7 100644
>> --- a/migration/dirtyrate.c
>> +++ b/migration/dirtyrate.c
>> @@ -26,6 +26,7 @@
>>   
>>   static int CalculatingState = DIRTY_RATE_STATUS_UNSTARTED;
>>   static struct DirtyRateStat DirtyStat;
>> +static DirtyRateMeasureMode dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_NONE;
>>   
>>   static int64_t set_sample_page_period(int64_t msec, int64_t initial_time)
>>   {
>> @@ -111,6 +112,11 @@ static void init_dirtyrate_stat(int64_t start_time,
>>       }
>>   }
>>   
>> +static void cleanup_dirtyrate_stat(struct DirtyRateConfig config)
>> +{
>> +    /* TODO */
>> +}
>> +
>>   static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
>>   {
>>       DirtyStat.page_sampling.total_dirty_samples += info->sample_dirty_count;
>> @@ -380,7 +386,6 @@ void *get_dirtyrate_thread(void *arg)
>>   {
>>       struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
>>       int ret;
>> -    int64_t start_time;
>>       rcu_register_thread();
>>   
>>       ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNSTARTED,
>> @@ -390,9 +395,6 @@ void *get_dirtyrate_thread(void *arg)
>>           return NULL;
>>       }
>>   
>> -    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>> -    init_dirtyrate_stat(start_time, config);
>> -
>>       calculate_dirtyrate(config);
>>   
>>       ret = dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_MEASURING,
>> @@ -411,6 +413,7 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>>       static struct DirtyRateConfig config;
>>       QemuThread thread;
>>       int ret;
>> +    int64_t start_time;
>>   
>>       /*
>>        * If the dirty rate is already being measured, don't attempt to start.
>> @@ -451,6 +454,18 @@ void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
>>       config.sample_period_seconds = calc_time;
>>       config.sample_pages_per_gigabytes = sample_pages;
>>       config.mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
>> +
>> +    cleanup_dirtyrate_stat(config);
> 
> This line should ideally be moved into the next patch, as sampling itself
> doesn't need it. >
>> +
>> +    /*
>> +     * update dirty rate mode so that we can figure out what mode has
>> +     * been used in last calculation
>> +     **/
>> +    dirtyrate_mode = DIRTY_RATE_MEASURE_MODE_PAGE_SAMPLING;
> 
> This line is odd. Would page sampling broken if without this line?  We need to
> make sure each commit keeps the old way working..
> 
yes, i'll drop this to make sure each commit keeps the old way working
> Thanks,
> 
>> +
>> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>> +    init_dirtyrate_stat(start_time, config);
>> +
>>       qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
>>                          (void *)&config, QEMU_THREAD_DETACHED);
>>   }
>> -- 
>> 1.8.3.1
>>
> 

-- 
Best regard

Hyman Huang(黄勇)

