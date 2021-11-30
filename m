Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3753B463987
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:12:40 +0100 (CET)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms4oA-0002Kj-6J
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:12:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ms4mX-0001fq-I3
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:10:57 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:34824
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ms4mN-0000Cq-6W
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:10:57 -0500
HMM_SOURCE_IP: 172.18.0.48:35862.1922239739
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.33 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id B804D2800A0;
 Tue, 30 Nov 2021 23:10:29 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 1cb4555beecd4497aeb9aa94546f3fe8 for
 peterx@redhat.com; Tue, 30 Nov 2021 23:10:35 CST
X-Transaction-ID: 1cb4555beecd4497aeb9aa94546f3fe8
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <b4f91603-1897-33e3-92da-04183a75910f@chinatelecom.cn>
Date: Tue, 30 Nov 2021 23:10:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 1/3] migration/dirtyrate: implement vCPU dirtyrate
 calculation periodically
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
References: <cover.1638267948.git.huangy81@chinatelecom.cn>
 <d7fbcc438d315c72227da309a00f13444d0dd718.1638267948.git.huangy81@chinatelecom.cn>
 <YaYhZP7y/Q8aFv6B@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YaYhZP7y/Q8aFv6B@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
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



On 11/30/21 21:04, Peter Xu wrote:
> On Tue, Nov 30, 2021 at 06:28:11PM +0800, huangy81@chinatelecom.cn wrote:
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
>> +    dirtylimit_global_dirty_log_start();
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
>> +    dirtylimit_global_dirty_log_stop();
> 
> I haven't looked into the details, but..  I'm wondering whether we should just
> keep the dirty ring enabled during the whole process of throttling.
> 
> start/stop can be expensive, especially when huge pages are used, start dirty
> tracking will start to do huge page split. While right after the "stop" all the
> huge pages will need to be rebuild again.
> 
> David from Google is even proposing a kernel change to eagerly splitting huge
> pages when dirty tracking is enabled.
> 
> So I think we can keep the dirty tracking enabled until all the vcpu throttles
> are stopped.
Yes, it's a good idea and i'll try this out next version.
> 
>> +
>> +    CPU_FOREACH(cpu) {
>> +        record_dirtypages(dirty_pages, cpu, false);
>> +    }
> 

-- 
Best Regards
Hyman Huang(黄勇)

