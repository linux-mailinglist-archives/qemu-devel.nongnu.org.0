Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB57469E61
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 16:37:59 +0100 (CET)
Received: from localhost ([::1]:47734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muG3y-0008N9-Al
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 10:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1muG2K-0006z6-2n
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:36:16 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:59761
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1muG2H-0005JO-7c
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:36:15 -0500
HMM_SOURCE_IP: 172.18.0.218:41846.1604960553
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 970292800FE;
 Mon,  6 Dec 2021 23:35:59 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f80ae7080afe4abb904439f4bcb88258 for
 peterx@redhat.com; Mon, 06 Dec 2021 23:36:06 CST
X-Transaction-ID: f80ae7080afe4abb904439f4bcb88258
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <8cc87993-c907-ce6c-f09d-f9b00a187e3d@chinatelecom.cn>
Date: Mon, 6 Dec 2021 23:36:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v9 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
To: Peter Xu <peterx@redhat.com>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <db19021e4c0ef3d253723a299f8e626f09a1b121.1638495274.git.huangy81@chinatelecom.cn>
 <Ya3je9/6ff89adp4@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Ya3je9/6ff89adp4@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, Markus ArmBruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/12/6 18:18, Peter Xu 写道:
> On Fri, Dec 03, 2021 at 09:39:45AM +0800, huangy81@chinatelecom.cn wrote:
>> +static void dirtylimit_calc_func(void)
>> +{
>> +    CPUState *cpu;
>> +    DirtyPageRecord *dirty_pages;
>> +    int64_t start_time, end_time, calc_time;
>> +    DirtyRateVcpu rate;
>> +    int i = 0;
>> +
>> +    dirty_pages = g_malloc0(sizeof(*dirty_pages) *
>> +        dirtylimit_calc_state->data.nvcpu);
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(dirty_pages, cpu, true);
>> +    }
>> +
>> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    g_usleep(DIRTYLIMIT_CALC_TIME_MS * 1000);
>> +    end_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>> +    calc_time = end_time - start_time;
>> +
>> +    qemu_mutex_lock_iothread();
>> +    memory_global_dirty_log_sync();
>> +    qemu_mutex_unlock_iothread();
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(dirty_pages, cpu, false);
>> +    }
>> +
>> +    for (i = 0; i < dirtylimit_calc_state->data.nvcpu; i++) {
>> +        uint64_t increased_dirty_pages =
>> +            dirty_pages[i].end_pages - dirty_pages[i].start_pages;
>> +        uint64_t memory_size_MB =
>> +            (increased_dirty_pages * TARGET_PAGE_SIZE) >> 20;
>> +        int64_t dirtyrate = (memory_size_MB * 1000) / calc_time;
>> +
>> +        rate.id = i;
>> +        rate.dirty_rate  = dirtyrate;
>> +        dirtylimit_calc_state->data.rates[i] = rate;
>> +
>> +        trace_dirtyrate_do_calculate_vcpu(i,
>> +            dirtylimit_calc_state->data.rates[i].dirty_rate);
>> +    }
>> +}
> 
> This looks so like the calc-dirty-rate code already.
> 
> I think adding a new resion (GLOBAL_DIRTY_LIMIT) is fine, however still, any
Ok.
> chance to merge the code?
I'm not sure about merging but i'll try it. :)
> 


