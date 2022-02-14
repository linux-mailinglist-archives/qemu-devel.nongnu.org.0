Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E99B4B44B2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 09:46:53 +0100 (CET)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJX0S-0001bC-4L
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 03:46:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nJWut-0008DK-1V
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:41:04 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:41889
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nJWuq-0005EV-2i
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 03:41:02 -0500
HMM_SOURCE_IP: 172.18.0.48:40818.2006315065
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id A9B37280137;
 Mon, 14 Feb 2022 16:40:33 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 7fbdb136936c4a3c8b239635bb055cb8 for
 peterx@redhat.com; Mon, 14 Feb 2022 16:40:41 CST
X-Transaction-ID: 7fbdb136936c4a3c8b239635bb055cb8
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <7ea51695-9590-bd9b-1d7d-49e8e5571f88@chinatelecom.cn>
Date: Mon, 14 Feb 2022 16:40:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v14 3/7] migration/dirtyrate: Refactor dirty page rate
 calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1644509582.git.huangy81@chinatelecom.cn>
 <5984c1faf2de00df1a4add819fdab5cbe4014746.1644509582.git.huangy81@chinatelecom.cn>
 <YgoLa4B7Eq8OOJq7@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YgoLa4B7Eq8OOJq7@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/2/14 15:57, Peter Xu 写道:
> Mostly good, one trivial nit below:
> 
> On Fri, Feb 11, 2022 at 12:17:37AM +0800, huangy81@chinatelecom.cn wrote:
>> +int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
>> +                                 int64_t init_time_ms,
>> +                                 VcpuStat *stat,
>> +                                 unsigned int flag,
>> +                                 bool one_shot)
>> +{
>> +    DirtyPageRecord *records;
>> +    int64_t duration;
>> +    int64_t dirtyrate;
>> +    int i = 0;
>> +    unsigned int gen_id;
>> +
>> +retry:
>> +    cpu_list_lock();
>> +    gen_id = cpu_list_generation_id_get();
>> +    records = vcpu_dirty_stat_alloc(stat);
>> +    vcpu_dirty_stat_collect(stat, records, true);
>> +    cpu_list_unlock();
>> +
>> +    duration = dirty_stat_wait(calc_time_ms, init_time_ms);
> 
> Is it a must to pass in init_time_ms rather than always sleep in
> dirty_stat_wait()?  Could we simply drop it?
> 
Indeed, the parameter 'init_time_ms' seems kind of weird :(, we 
introduce 'init_time_ms' just becasue the calculate_dirtyrate_dirty_ring 
will call the function, see the following block:


  static void calculate_dirtyrate_dirty_ring(struct DirtyRateConfig config)
  {
-    CPUState *cpu;
-    int64_t msec = 0;
      int64_t start_time;
+    int64_t duration;
      uint64_t dirtyrate = 0;
      uint64_t dirtyrate_sum = 0;
-    DirtyPageRecord *dirty_pages;
-    int nvcpu = 0;
      int i = 0;

-    CPU_FOREACH(cpu) {
-        nvcpu++;
-    }
-
-    dirty_pages = malloc(sizeof(*dirty_pages) * nvcpu);
-
-    DirtyStat.dirty_ring.nvcpu = nvcpu;
-    DirtyStat.dirty_ring.rates = malloc(sizeof(DirtyRateVcpu) * nvcpu);
-
-    dirtyrate_global_dirty_log_start();
-
-    CPU_FOREACH(cpu) {
-        record_dirtypages(dirty_pages, cpu, true);
-    }
+    /* start log sync */
+    global_dirty_log_change(GLOBAL_DIRTY_DIRTY_RATE, true);

      start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
      DirtyStat.start_time = start_time / 1000;

The reason why we introduce the 'init_time_ms' is wanting to store the
start_time info and display.

Dropping this parameter is fine from my point view if we ignore the 
duration error result from the delay between caller and callee of
'vcpu_calculate_dirtyrate’

-    msec = config.sample_period_seconds * 1000;
-    msec = set_sample_page_period(msec, start_time);
-    DirtyStat.calc_time = msec / 1000;
+    /* calculate vcpu dirtyrate */
+    duration = vcpu_calculate_dirtyrate(config.sample_period_seconds * 
1000,
+                                        start_time,
+                                        &DirtyStat.dirty_ring,
+                                        GLOBAL_DIRTY_DIRTY_RATE,
+                                        true);

-    dirtyrate_global_dirty_log_stop();
-
-    CPU_FOREACH(cpu) {
-        record_dirtypages(dirty_pages, cpu, false);
-    }
+    DirtyStat.calc_time = duration / 1000;




-- 
Best regard

Hyman Huang(黄勇)

