Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F702469CA6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 16:21:16 +0100 (CET)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFnn-0003Ou-BT
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 10:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1muFmG-0002gD-HV
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:19:40 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:45264
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1muFmE-0006ND-4y
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:19:40 -0500
HMM_SOURCE_IP: 172.18.0.218:33584.1020412461
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 6A7022800B9;
 Mon,  6 Dec 2021 23:19:19 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id e60b5b188efc4e8e98c95a7c08a12d51 for
 peterx@redhat.com; Mon, 06 Dec 2021 23:19:27 CST
X-Transaction-ID: e60b5b188efc4e8e98c95a7c08a12d51
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <51937a31-4f8e-dc80-e731-cb026e42c1c9@chinatelecom.cn>
Date: Mon, 6 Dec 2021 23:19:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
To: Peter Xu <peterx@redhat.com>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <Ya3Lc4g/I0LnXK9/@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Ya3Lc4g/I0LnXK9/@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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



在 2021/12/6 16:36, Peter Xu 写道:
> On Fri, Dec 03, 2021 at 09:39:47AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Implement dirtyrate calculation periodically basing on
>> dirty-ring and throttle vCPU until it reachs the quota
>> dirty page rate given by user.
>>
>> Introduce qmp commands "vcpu-dirty-limit", "query-vcpu-dirty-limit"
>> to enable, disable, query dirty page limit for virtual CPU.
>>
>> Meanwhile, introduce corresponding hmp commands "vcpu_dirty_limit",
>> "info vcpu_dirty_limit" so developers can play with them easier.
> 
> Thanks.  Even if I start to use qmp-shell more recently but still in some case
> where only hmp is specified this could still be handy.
> 
>> +void qmp_vcpu_dirty_limit(int64_t cpu_index,
>> +                          bool enable,
>> +                          uint64_t dirty_rate,
>> +                          Error **errp)
>> +{
>> +    if (!kvm_enabled() || !kvm_dirty_ring_enabled()) {
>> +        error_setg(errp, "dirty page limit feature requires KVM with"
>> +                   " accelerator property 'dirty-ring-size' set'");
>> +        return;
>> +    }
>> +
>> +    if (!dirtylimit_is_vcpu_index_valid(cpu_index)) {
>> +        error_setg(errp, "cpu index out of range");
>> +        return;
>> +    }
>> +
>> +    if (enable) {
>> +        dirtylimit_calc();
>> +        dirtylimit_vcpu(cpu_index, dirty_rate);
>> +    } else {
>> +        if (!dirtylimit_enabled(cpu_index)) {
>> +            error_setg(errp, "dirty page limit for CPU %ld not set",
>> +                       cpu_index);
>> +            return;
>> +        }
> 
> We don't need to fail the user for enable=off even if vcpu is not throttled,
> imho.
Ok.
> 
>> +
>> +        if (!dirtylimit_cancel_vcpu(cpu_index)) {
>> +            dirtylimit_calc_quit();
>> +        }
>> +    }
>> +}
> 
> [...]
> 
>> +struct DirtyLimitInfoList *qmp_query_vcpu_dirty_limit(bool has_cpu_index,
>> +                                                      int64_t cpu_index,
>> +                                                      Error **errp)
>> +{
>> +    DirtyLimitInfo *info = NULL;
>> +    DirtyLimitInfoList *head = NULL, **tail = &head;
>> +
>> +    if (has_cpu_index &&
>> +        (!dirtylimit_is_vcpu_index_valid(cpu_index))) {
>> +        error_setg(errp, "cpu index out of range");
>> +        return NULL;
>> +    }
>> +
>> +    if (has_cpu_index) {
>> +        info = dirtylimit_query_vcpu(cpu_index);
>> +        QAPI_LIST_APPEND(tail, info);
>> +    } else {
>> +        CPUState *cpu;
>> +        CPU_FOREACH(cpu) {
>> +            if (!cpu->unplug) {
>> +                info = dirtylimit_query_vcpu(cpu->cpu_index);
>> +                QAPI_LIST_APPEND(tail, info);
>> +            }
> 
> There're special handling for unplug in a few places.  Could you explain why?
> E.g. if the vcpu is unplugged then dirty rate is zero, then it seems fine to
> even keep it there?
> The dirty limit logic only allow plugged vcpu to be enabled throttle, so 
that the "dirtylimit-{cpu-index}" thread don't need to be forked and we 
can save the overhead. So in query logic we just filter the unplugged vcpu.

Another reason is that i thought it could make user confused when we 
return the unplugged vcpu dirtylimit info. Uh, in most time of vm 
lifecycle, hotplugging vcpu may never happen.
>> +        }
>> +    }
>> +
>> +    return head;
>> +}
> 

