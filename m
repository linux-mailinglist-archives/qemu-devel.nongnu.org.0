Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D16483AF9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 04:28:59 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4aVO-0006da-BO
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 22:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n4aUQ-0005yB-Rz
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 22:27:58 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:34331
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n4aUN-0003ZQ-OF
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 22:27:58 -0500
HMM_SOURCE_IP: 172.18.0.218:46002.520218403
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.40.99 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id A9D63280176;
 Tue,  4 Jan 2022 11:27:41 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id efac33985a544adfa0fd1f2670d5d20a for
 peterx@redhat.com; Tue, 04 Jan 2022 11:27:47 CST
X-Transaction-ID: efac33985a544adfa0fd1f2670d5d20a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <22c2a5fa-270d-f424-555b-6a9963cb565f@chinatelecom.cn>
Date: Tue, 4 Jan 2022 11:27:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v10 2/3] cpu-throttle: implement virtual CPU throttle
To: Peter Xu <peterx@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <671e8a25261262085b998a08ef8dafdcdc9e0ae9.1639479557.git.huangy81@chinatelecom.cn>
 <YcVWzuPDawXtXGIX@xz-m1.local>
 <98211637-b2ad-d99b-9dc2-23c5d3566b24@chinatelecom.cn>
 <YdOxDRvCaXutEmOx@xz-m1.local>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <YdOxDRvCaXutEmOx@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



在 2022/1/4 10:32, Peter Xu 写道:
> On Fri, Dec 31, 2021 at 12:36:40AM +0800, Hyman Huang wrote:
>>>> +struct {
>>>> +    DirtyLimitState *states;
>>>> +    int max_cpus;
>>>> +    unsigned long *bmap; /* running thread bitmap */
>>>> +    unsigned long nr;
>>>> +    QemuThread thread;
>>>> +} *dirtylimit_state;
>>>> +
>>>> +static bool dirtylimit_quit = true;
>>>
>>> Again, I think "quit" is not a good wording to show "whether dirtylimit is in
>>> service".  How about "dirtylimit_global_enabled"?
>>>
>>> You can actually use "dirtylimit_state" to show whether it's enabled already
>>> (then drop the global value) since it's a pointer.  It shouldn't need to be
>>> init-once-for-all, but we can alloc the strucuture wAhen dirty limit enabled
>>> globally, and destroy it (and reset it to NULL) when globally disabled.
>>>
>>> Then "whether it's enabled" is simply to check "!!dirtylimit_state" under BQL.
>> Yes, checking pointer is fairly straightforword, but since dirtylimit thread
>> also access the dirtylimit_state when doing the limit, if we free
>> dirtylimit_state after last limited vcpu be canceled, dirtylimit thread
>> would crash when reference null pointer. And this method turn out to
>> introduce a mutex lock to protect dirtylimit_state, comparing with qatomic
>> operation, which is better ?
> 
> I don't see much difference here on using either atomic or mutex, because it's
> not a hot path.
> 
> If to use mutex and not overload BQL we can use a dirtylimit_mutex then before
> referencing the pointer anywhere we need to fetch it, and release when sleep.
Ok, i'm already try this in the next version :)
> 
> The only thing confusing to me about the global variable way is having
> quit=true as initial value, and clearing it when start.  I think it'll work,
> but just reads weird.
> 
> How about having "enabled" and "quit" as a normal threaded app?  Then:
> 
>    - When init: enabled=0 quit=0
>    - When start: enabled=1 quit=0
>    - When stop
>      - main thread set enabled=1 quit=1
>      - dirtylimit sees quit=1, goes to join()
>      - main thread reset enable=quit=0
> 
> dirtylimit_in_service() should reference "enabled", and "quit" should be only
> used for sync on exit.
> 
Ok, no problem
> Thanks,
> 

-- 
Best regard

Hyman Huang(黄勇)

