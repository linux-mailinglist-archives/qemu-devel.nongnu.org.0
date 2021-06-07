Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768E439E2D1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:18:46 +0200 (CEST)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHxd-0002XZ-Fn
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lqHvJ-0000JY-NZ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:16:21 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:56021
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lqHvF-0006hK-Gn
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:16:20 -0400
HMM_SOURCE_IP: 172.18.0.218:48676.972016347
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-124.205.116.132?logid-ff34ff97b3d6421f9271ba9d6f28443a
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 4343C28008E;
 Tue,  8 Jun 2021 00:16:05 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id ff34ff97b3d6421f9271ba9d6f28443a for
 marcel.apfelbaum@gmail.com; Tue Jun  8 00:16:05 2021
X-Transaction-ID: ff34ff97b3d6421f9271ba9d6f28443a
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH v3 4/7] migration/dirtyrate: add per-vcpu option for
 calc-dirty-rate
To: Peter Xu <peterx@redhat.com>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <19ad91782f5798844c42e34683fda833f9d1928a.1623027729.git.huangy81@chinatelecom.cn>
 <YL4/U2Kjojyr2wcT@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <5ce0a796-f261-6a13-1dc9-27bc52ba033d@chinatelecom.cn>
Date: Tue, 8 Jun 2021 00:16:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YL4/U2Kjojyr2wcT@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/6/7 23:46, Peter Xu 写道:
> On Mon, Jun 07, 2021 at 09:12:36AM +0800, huangy81@chinatelecom.cn wrote:
>> @@ -1751,7 +1770,9 @@
>>              'status': 'DirtyRateStatus',
>>              'start-time': 'int64',
>>              'calc-time': 'int64',
>> -           'sample-pages': 'uint64'} }
>> +           '*sample-pages': 'uint64',
>> +           'per-vcpu': 'bool',
>> +           '*vcpu-dirty-rate': [ 'DirtyRateVcpu' ] } }
> 
> Ideally we shouldn't touch existing exported fields?  I know it's not a problem
> since it's just introduced and together with the series..  The other
> alternative is to keep it as is but just ignore it in the result (or set it to
> zero for per-vcpu sampling)?  No strong opinion.
i'll change 'sample-pages' to '*sample-pages' in the first commit 
"migration/dirtyrate: make sample page count configurable" so that the 
following patch won't touch existing exported field.
> 
>>   
>>   ##
>>   # @calc-dirty-rate:
>> @@ -1760,6 +1781,10 @@
>>   #
>>   # @calc-time: time in units of second for sample dirty pages
>>   #
>> +# @per-vcpu: calculate vcpu dirty rate if true, the default value is
>> +#            false, note that the per-vcpu and sample-pages are mutually
>> +#            exclusive (since 6.1)
>> +#
>>   # @sample-pages: page count per GB for sample dirty pages
>>   #                the default value is 512 (since 6.1)
>>   #
>> @@ -1769,7 +1794,7 @@
>>   #   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-pages': 512} }
>>   #
>>   ##
>> -{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-pages': 'int'} }
>> +{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', 'per-vcpu': 'bool', '*sample-pages': 'int'} }
> 
> I still think exporting this new feature should happen as/in the last patch.
indeed, the last version ignore this advice, i'll introduce the 
"per-vcpu" in the last patch, before it implemented.
> 
> Also, wondering whether the name "per-vcpu" would let people think of "samping
> pages per-vcpu only", not showing that it's a completely new mechanism inside.
> How about make it a new parameter "*mode" (and I think even with per-vcpu it
> should be optional as "*per-vcpu") default to "page-sampling" and add a new
> "dirty-ring"?
i prefer the "*mode" parameter to show the different dirty rate method.
> 
> Actually I'm also wondering whether dirty log could be anything useful here in
> the future as a 3rd mode (then the "*mode" idea should be more useful if so),
> basically for old kernels where dirty ring is not there, we can timely call
> memory_global_dirty_log_sync() and calculate dirty pages there just like what
> we do with dirty rings (without calling migration_bitmap_sync(), so we don't
> need to deliver dirty bits from kvmslots to ramblocks, just pick them up from
> kvm and do the accounting for pure dirty rate measurement).  That's a wild idea
> though, so just raise it up.  Would that be anything useful?
uh, actually this idea is what i'm working on to stat the memory 
heat(trying to reduce the transferred memory in migration), 
theoretically it can be used for dirty rate measurement also, maybe i 
could try it after this patchset work having done.
> 

-- 
Best regard

Hyman Huang(黄勇)

