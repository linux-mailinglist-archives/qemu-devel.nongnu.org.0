Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19903A42E4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:16:58 +0200 (CEST)
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrh1t-00040q-Bs
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lrh0x-0003IS-5t
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:15:59 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:55951
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lrh0i-0004G3-E0
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:15:51 -0400
HMM_SOURCE_IP: 172.18.0.218:59066.2002918236
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-124.205.116.130?logid-38667851938248da99447304c520a18a
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 394BB280096;
 Fri, 11 Jun 2021 21:15:34 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 38667851938248da99447304c520a18a for
 zhengchuan@huawei.com; Fri Jun 11 21:15:35 2021
X-Transaction-ID: 38667851938248da99447304c520a18a
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v3 7/7] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
To: Peter Xu <peterx@redhat.com>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <a930f410178862fda49ae2c613a0757c7e07e006.1623027729.git.huangy81@chinatelecom.cn>
 <YMEFqfYZVhsinNN+@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <13fb0dec-a16c-1bfa-4cbe-c92063f85049@chinatelecom.cn>
Date: Fri, 11 Jun 2021 21:15:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMEFqfYZVhsinNN+@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/10 2:17, Peter Xu 写道:
> On Mon, Jun 07, 2021 at 09:15:20AM +0800, huangy81@chinatelecom.cn wrote:
>> +static void calculate_dirtyrate_vcpu(struct DirtyRateConfig config)
>> +{
>> +    CPUState *cpu;
>> +    int64_t msec = 0;
>> +    int64_t start_time;
>> +    uint64_t dirtyrate = 0;
>> +    uint64_t dirtyrate_sum = 0;
>> +    int nvcpu = 0;
>> +    int i = 0;
>> +
>> +    CPU_FOREACH(cpu) {
>> +        nvcpu++;
>> +    }
>> +
>> +    dirty_pages = g_malloc0(sizeof(*dirty_pages) * nvcpu);
>> +
>> +    dirtyrate_global_dirty_log_start();
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(cpu, true);
>> +    }
>> +
>> +    DirtyStat.method.vcpu.nvcpu = nvcpu;
>> +    if (last_method != CALC_DIRTY_RING) {
>> +        DirtyStat.method.vcpu.rates =
>> +            g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
>> +    }
>> +
>> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    DirtyStat.start_time = start_time / 1000;
>> +
>> +    msec = config.sample_period_seconds * 1000;
>> +    msec = set_sample_page_period(msec, start_time);
>> +    DirtyStat.calc_time = msec / 1000;
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(cpu, false);
>> +    }
>> +
>> +    dirtyrate_global_dirty_log_stop();
>> +
>> +    for (i = 0; i < DirtyStat.method.vcpu.nvcpu; i++) {
>> +        dirtyrate = do_calculate_dirtyrate_vcpu(i);
>> +        DirtyStat.method.vcpu.rates[i].id = i;
>> +        DirtyStat.method.vcpu.rates[i].dirty_rate = dirtyrate;
>> +        dirtyrate_sum += dirtyrate;
>> +    }
>> +
>> +    DirtyStat.dirty_rate = dirtyrate_sum / DirtyStat.method.vcpu.nvcpu;
> 
> Why you'd like to divide with nvcpu?  Isn't dirtyrate_sum exactly what we want?
> As I don't think we care about average per-vcpu dirty rate, but total here.
> 
the initial idea of mine is that the qmp output dirty rate represent the 
average dirty rate, my mistake.indeed, the vm dirty rate should not be 
the average of vcpu's, i'll fix it the next version.
>> +    g_free(dirty_pages);
>> +}
> 
> I did a run with 4G mem VM, alloc 1G and dirty it with 500MB/s, then
> 
>    - With old way: I got 95MB/s
>    - With new way: I got 128MB/s
> 
> The new way has the output with:
> 
> Dirty rate: 128 (MB/s)
> vcpu[0], Dirty rate: 0
> vcpu[1], Dirty rate: 1
> vcpu[2], Dirty rate: 0
> vcpu[3], Dirty rate: 511
> 
> I think if without the division, it'll be 512MB/s, which is matching the dirty
> workload I initiated.
> 

-- 
Best regard

Hyman Huang(黄勇)

