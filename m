Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9858522F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:16:46 +0200 (CEST)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRjJ-0001EV-Af
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oHRhA-00085x-LP
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:14:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:51594
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oHRh8-0007zd-5c
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:14:32 -0400
HMM_SOURCE_IP: 172.18.0.48:38068.1505294054
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-125.69.43.72 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 99113280098;
 Fri, 29 Jul 2022 23:14:05 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id ea1893e137d049c892fc6180aa567616 for
 richard.henderson@linaro.org; Fri, 29 Jul 2022 23:14:08 CST
X-Transaction-ID: ea1893e137d049c892fc6180aa567616
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <b4d36f1b-47e3-f03c-eb00-15eef981fa6d@chinatelecom.cn>
Date: Fri, 29 Jul 2022 23:14:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 06/30] softmmu/dirtylimit: Implement virtual CPU throttle
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com,
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com
References: <20220720111926.107055-1-dgilbert@redhat.com>
 <20220720111926.107055-7-dgilbert@redhat.com>
 <CAFEAcA_mkeE6cKwmauTLV4c7k_=gCaPSfOM92eX6_3rnd8L+Wg@mail.gmail.com>
 <2de87bc5-a7a5-53a9-1458-35269fd0df9c@linaro.org>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <2de87bc5-a7a5-53a9-1458-35269fd0df9c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/7/29 22:14, Richard Henderson 写道:
> On 7/29/22 06:31, Peter Maydell wrote:
>> On Wed, 20 Jul 2022 at 12:30, Dr. David Alan Gilbert (git)
>> <dgilbert@redhat.com> wrote:
>>>
>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>
>>> Setup a negative feedback system when vCPU thread
>>> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
>>> throttle_us_per_full field in struct CPUState. Sleep
>>> throttle_us_per_full microseconds to throttle vCPU
>>> if dirtylimit is in service.
>>>
>>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>> Message-Id: 
>>> <977e808e03a1cef5151cae75984658b6821be618.1656177590.git.huangy81@chinatelecom.cn> 
>>>
>>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>
>>
>> Hi; Coverity points out a problem with this code (CID 1490787):
Thanks for pointing out this bug.  I'm making a access request for
https://scan.coverity.com so that coverity problem can be found once new
series be posted. Hoping this bug doesn't appear anymore. :)
>>
>>> +static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t 
>>> dirtyrate)
>>> +{
>>> +    static uint64_t max_dirtyrate;
>>> +    uint32_t dirty_ring_size = kvm_dirty_ring_size();
>>> +    uint64_t dirty_ring_size_meory_MB =
>>> +        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
>>
>> Because dirty_ring_size and TARGET_PAGE_SIZE are both 32 bits,
>> this multiplication will be done as a 32-bit operation,
>> which could overflow. You should cast one of the operands
>> to uint64_t to ensure that the operation is done as a 64 bit
>> multiplication.
> 
> To compute MB, you don't need multiplication:
> 
>    dirty_ring_size >> (20 - TARGET_PAGE_BITS)
> 
> In addition, why the mismatch in type?  dirty_ring_size_memory_MB can 
> never be larger than dirty_ring_size.
> 
> 
> r~
> 
I'll post bugfix patch later as your suggestion, please review, thanks.
>>
>> Side note: typo in the variable name: should be 'memory'.
>>
>>
>>> +    if (max_dirtyrate < dirtyrate) {
>>> +        max_dirtyrate = dirtyrate;
>>> +    }
>>> +
>>> +    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
>>> +}
>>
>> thanks
>> -- PMM
>>
> 

