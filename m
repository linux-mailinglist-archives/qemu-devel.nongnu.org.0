Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DED4969F0
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 04:56:11 +0100 (CET)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB7Va-0001ux-7w
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 22:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nB7Tz-0001C1-Sx
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 22:54:31 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:34486
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nB7Tp-0003Na-3P
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 22:54:23 -0500
HMM_SOURCE_IP: 172.18.0.48:57344.1866282846
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.59 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id BB12F280029;
 Sat, 22 Jan 2022 11:54:08 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 9b80e71bd6c84c63bcb62715168597b8 for
 peterx@redhat.com; Sat, 22 Jan 2022 11:54:11 CST
X-Transaction-ID: 9b80e71bd6c84c63bcb62715168597b8
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <1a7103b2-a070-6e08-cd03-f4186caca9c1@chinatelecom.cn>
Date: Sat, 22 Jan 2022 11:54:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 3/4] softmmu/dirtylimit: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1641316375.git.huangy81@chinatelecom.cn>
 <0381e32c2cc70613613aaa284b8e8c9760d6932f.1641316375.git.huangy81@chinatelecom.cn>
 <YeUbhC7MG32K9pxu@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YeUbhC7MG32K9pxu@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus ArmBruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> +static void *dirtylimit_thread(void *opaque)
>> +{
>> +    CPUState *cpu;
>> +
>> +    rcu_register_thread();
>> +
>> +    while (!qatomic_read(&dirtylimit_quit)) {
>> +        sleep(DIRTYLIMIT_CALC_TIME_MS / 1000);
> 
> Sorry to have not mentioned this: I think we probably don't even need this
> dirtylimit thread.
> 
> It'll be hard to make the "sleep" right here.. you could read two identical
> values from the dirty calc thread because the 1sec sleep is not accurate, so
> even after this sleep() the calc thread may not have provided the latest number
> yet.
> 
> It'll be much cleaner (and most importantly, accurate..) to me if we could make
> this a hook function being passed over to the vcpu_dirty_rate_stat_thread()
> thread, then after each vcpu_dirty_rate_stat_collect() we call the hook.
> 
Ok, i remove the dirtylimit_thread and implemtment throttle in bottom 
half instead, indeed, it become more accurate. Anyway, how do you think 
of it?
>> +
>> +        dirtylimit_state_lock();
>> +
>> +        if (!dirtylimit_in_service()) {
>> +            dirtylimit_state_unlock();
>> +            break;
>> +        }
>> +
>> +        CPU_FOREACH(cpu) {
>> +            if (!dirtylimit_vcpu_get_state(cpu->cpu_index)->enabled) {
>> +                continue;
>> +            }
>> +            dirtylimit_adjust_throttle(cpu);
>> +        }
>> +        dirtylimit_state_unlock();
>> +    }
>> +
>> +    rcu_unregister_thread();
>> +
>> +    return NULL;
>> +}
>> +



-- 
Best regard

Hyman Huang(黄勇)

