Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D1C397DC6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 02:53:23 +0200 (CEST)
Received: from localhost ([::1]:40330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loF8L-0001HL-GF
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 20:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1loF6y-0000aw-SW
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 20:51:56 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:33142
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1loF6v-00049Q-KK
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 20:51:56 -0400
HMM_SOURCE_IP: 172.18.0.218:53632.467187551
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-110.184.66.8?logid-285d7faceae64942affe03b7f11c6ff3
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 22AEE280097;
 Wed,  2 Jun 2021 08:51:46 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 285d7faceae64942affe03b7f11c6ff3 for
 zhangzijian@chinatelecom.cn; Wed Jun  2 08:51:46 2021
X-Transaction-ID: 285d7faceae64942affe03b7f11c6ff3
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v1 0/6] support dirtyrate at the granualrity of vcpu
To: Peter Xu <peterx@redhat.com>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
 <YLase9l34N7i1C6S@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <a0a70d25-9b3c-3ef0-85d6-c6b7e7453075@chinatelecom.cn>
Date: Wed, 2 Jun 2021 08:51:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YLase9l34N7i1C6S@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.613,
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
Cc: kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Chuan Zheng <zhengchuan@huawei.com>,
 =?UTF-8?B?5byg5a2Q5YGl?= <zhangzijian@chinatelecom.cn>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/2 5:54, Peter Xu 写道:
> On Tue, Jun 01, 2021 at 01:02:45AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> Since the Dirty Ring on QEMU part has been merged recently, how to use
>> this feature is under consideration.
>>
>> In the scene of migration, it is valuable to provide a more accurante
>> interface to track dirty memory than existing one, so that the upper
>> layer application can make a wise decision, or whatever. More importantly,
>> dirtyrate info at the granualrity of vcpu could provide a possibility to
>> make migration convergent by imposing restriction on vcpu. With Dirty
>> Ring, we can calculate dirtyrate efficiently and cheaply.
>>
>> The old interface implemented by sampling pages, it consumes cpu
>> resource, and the larger guest memory size become, the more cpu resource
>> it consumes, namely, hard to scale. New interface has no such drawback.
> 
> Yong,
> 
> Thanks for working on this!
> 
> Some high-level comments:
> 
> - The layout of the patch looks a bit odd.  E.g., you introduced the new "vcpu"
>    qmp parameter in patch 3, however it's not yet implemented, meanwhile I feel
>    like you squashed mostly all the rest into patch 6.  It's okay to use a
>    single big patch, but IMHO better to not declare that flag in QMP before it's
>    working, so ideally that should be the last patch to do that.
> 
>    From that POV: patch 1/2/4 look ok to be separated; perhaps squash patch
>    3/5/6 into one single patch to enable the new method as the last one?
> 
Yeah previously the concern is make the patch clear and small, however 
with the comment of each commit, it seems ok. As you said, it's okay to 
use a single big patch, i'll adjust the patch set style base on your advice.
> - You used "vcpu" across the patchset to show the per-vcpu new method.  Shall
>    we rename it globally to "per_vcpu" or "vcpu_based"?  A raw "vcpu" looks more
>    like a struct pointer not a boolean.
> 
Indeed, actually the initial name of the option is "per_vcpu". : ). i'll 
fix this.
> - Using memory_global_dirty_log_start|stop() may not be wise too IMHO, at least
>    we need to make sure it's not during migration, otherwise we could call the
>    stop() before migration ends then that'll be a problem..
Yeah, this may be a serious problem, thanks for your timely advice.
> 
>    Maybe we can start to make global_dirty_log a bitmask? Then we define:
> 
>      GLOBAL_DIRTY_MIGRATION
>      GLOBAL_DIRTY_DIRTY_RATE
> 
>    All references to global_dirty_log should mostly be untouched because any bit
>    set there should justify that global dirty logging is enabled (either for
>    migration or for dirty rate measurement).
> 
>    Migration starting half-way of dirty rate measurement seems okay too even
>    taking things like init-all-set into account, afaict.. as long as dirty rate
>    code never touches the qemu dirty bitmap, but only do the accounting when
>    collecting the pages...
> 
>    Feel free to think more about it on any other potential conflict with
>    migration, but in general seems working to me.
> 
I'll apply this on the next version.
> - Would you consider picking up my HMP patch and let HMP work from the 1st day?
> 
> - Please Cc the author of dirty rate too (Chuan Zheng <zhengchuan@huawei.com>),
>    while I already started to do so in this email.
> 
I'd be glad to do this above two.
> Thanks,
> 

Thanks Peter!

-- 
Best regard

Hyman Huang(黄勇)

