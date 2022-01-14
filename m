Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42E48E227
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 02:34:26 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8BU1-0004vS-TK
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 20:34:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1n8BQs-00038y-59
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 20:31:10 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:33320
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1n8BQh-0005VV-3Q
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 20:31:02 -0500
HMM_SOURCE_IP: 172.18.0.188:50772.1406760444
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 986A9280170;
 Fri, 14 Jan 2022 09:30:42 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id 70fa52b884a149029a1d836238ca1359 for
 armbru@redhat.com; Fri, 14 Jan 2022 09:30:46 CST
X-Transaction-ID: 70fa52b884a149029a1d836238ca1359
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <38d0cc91-2995-2d73-d917-e5e1fc4e5206@chinatelecom.cn>
Date: Fri, 14 Jan 2022 09:30:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v10 2/3] cpu-throttle: implement virtual CPU throttle
To: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <cover.1639479557.git.huangy81@chinatelecom.cn>
 <671e8a25261262085b998a08ef8dafdcdc9e0ae9.1639479557.git.huangy81@chinatelecom.cn>
 <YcVWzuPDawXtXGIX@xz-m1.local>
 <98211637-b2ad-d99b-9dc2-23c5d3566b24@chinatelecom.cn>
 <YdOxDRvCaXutEmOx@xz-m1.local> <87pmov61wv.fsf@dusky.pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87pmov61wv.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
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
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/1/14 0:22, Markus Armbruster 写道:
> Peter Xu <peterx@redhat.com> writes:
> 
>> On Fri, Dec 31, 2021 at 12:36:40AM +0800, Hyman Huang wrote:
>>>>> +struct {
>>>>> +    DirtyLimitState *states;
>>>>> +    int max_cpus;
>>>>> +    unsigned long *bmap; /* running thread bitmap */
>>>>> +    unsigned long nr;
>>>>> +    QemuThread thread;
>>>>> +} *dirtylimit_state;
>>>>> +
>>>>> +static bool dirtylimit_quit = true;
>>>>
>>>> Again, I think "quit" is not a good wording to show "whether dirtylimit is in
>>>> service".  How about "dirtylimit_global_enabled"?
>>>>
>>>> You can actually use "dirtylimit_state" to show whether it's enabled already
>>>> (then drop the global value) since it's a pointer.  It shouldn't need to be
>>>> init-once-for-all, but we can alloc the strucuture wAhen dirty limit enabled
>>>> globally, and destroy it (and reset it to NULL) when globally disabled.
>>>>
>>>> Then "whether it's enabled" is simply to check "!!dirtylimit_state" under BQL.
>>> Yes, checking pointer is fairly straightforword, but since dirtylimit thread
>>> also access the dirtylimit_state when doing the limit, if we free
>>> dirtylimit_state after last limited vcpu be canceled, dirtylimit thread
>>> would crash when reference null pointer. And this method turn out to
>>> introduce a mutex lock to protect dirtylimit_state, comparing with qatomic
>>> operation, which is better ?
>>
>> I don't see much difference here on using either atomic or mutex, because it's
>> not a hot path.
> 
> Quick interjection without having bothered to understand the details:
> correct use of atomics and memory barriers is *much* harder than correct
> use of locks.  Stick to locks unless you *know* they impair performance.
> 
Ok, i get it, i removed most of atomic operations in v11 and use the 
lock instead. But still thanks for the advice :)
> [...]
> 

-- 
Best regard

Hyman Huang(黄勇)

