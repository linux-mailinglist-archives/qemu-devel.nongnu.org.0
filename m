Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9036346B1F7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 05:40:25 +0100 (CET)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muSHA-00040z-Eg
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 23:40:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1muSG5-0002ew-Ey
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 23:39:17 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:37018
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1muSFw-0006U4-M1
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 23:39:14 -0500
HMM_SOURCE_IP: 172.18.0.48:59750.552293230
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.41.245 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 678C22800B1;
 Tue,  7 Dec 2021 12:38:50 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 362c8a0bbb774193a3e38347762f0243 for
 peterx@redhat.com; Tue, 07 Dec 2021 12:38:58 CST
X-Transaction-ID: 362c8a0bbb774193a3e38347762f0243
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <f9b3c2a4-c13f-ce29-36f9-fd241667d6d0@chinatelecom.cn>
Date: Tue, 7 Dec 2021 12:38:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v9 3/3] cpus-common: implement dirty page limit on vCPU
To: Peter Xu <peterx@redhat.com>
References: <cover.1638495274.git.huangy81@chinatelecom.cn>
 <9cc3cc5377e4330cbe0e87e89f452889516a4c09.1638495274.git.huangy81@chinatelecom.cn>
 <Ya3Lc4g/I0LnXK9/@xz-m1.local>
 <51937a31-4f8e-dc80-e731-cb026e42c1c9@chinatelecom.cn>
 <Ya7NhcagnW86DBVP@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <Ya7NhcagnW86DBVP@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
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



在 2021/12/7 10:57, Peter Xu 写道:
> On Mon, Dec 06, 2021 at 11:19:21PM +0800, Hyman wrote:
>>>> +    if (has_cpu_index) {
>>>> +        info = dirtylimit_query_vcpu(cpu_index);
>>>> +        QAPI_LIST_APPEND(tail, info);
>>>> +    } else {
>>>> +        CPUState *cpu;
>>>> +        CPU_FOREACH(cpu) {
>>>> +            if (!cpu->unplug) {
>>>> +                info = dirtylimit_query_vcpu(cpu->cpu_index);
>>>> +                QAPI_LIST_APPEND(tail, info);
>>>> +            }
>>>
>>> There're special handling for unplug in a few places.  Could you explain why?
>>> E.g. if the vcpu is unplugged then dirty rate is zero, then it seems fine to
>>> even keep it there?
>>> The dirty limit logic only allow plugged vcpu to be enabled throttle, so
>> that the "dirtylimit-{cpu-index}" thread don't need to be forked and we can
>> save the overhead. So in query logic we just filter the unplugged vcpu.
> 
> I've commented similarly in the other thread - please consider not using NVCPU
> threads only for vcpu throttling, irrelevant of vcpu hot plug/unplug.
> 
> Per-vcpu throttle is totally not a cpu intensive workload, 1 thread should be
> enough globally, imho.
> 
> A guest with hundreds of vcpus are becoming more common, we shouldn't waste OS
> thread resources just for this.
> 
Ok, i'll try this out next version
>>
>> Another reason is that i thought it could make user confused when we return
>> the unplugged vcpu dirtylimit info. Uh, in most time of vm lifecycle,
>> hotplugging vcpu may never happen.
> 
> I just think if plug/unplug does not affect the throttle logic then we should
> treat them the same, it avoids unnecessary special care on those vcpus too.
> 
Indeed, i'm struggling too :), i'll remove the plug/unplug logic the 
next version.

