Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD34EFDEC
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 04:15:46 +0200 (CEST)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naTIo-0006bm-2E
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 22:15:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1naTHO-0005wC-Rm
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:14:18 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:34256
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1naTHK-0007LB-P7
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 22:14:18 -0400
HMM_SOURCE_IP: 172.18.0.218:45554.1233706878
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 5AB1428009B;
 Sat,  2 Apr 2022 10:13:39 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id c1ee6e6d051d4fd3a3466c438d604b4b for
 peterx@redhat.com; Sat, 02 Apr 2022 10:14:07 CST
X-Transaction-ID: c1ee6e6d051d4fd3a3466c438d604b4b
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <4b723048-4e2d-f1c6-a1c3-b4256f95ad6c@chinatelecom.cn>
Date: Sat, 2 Apr 2022 10:13:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/4] Dirty ring and auto converge optimization
To: Peter Xu <peterx@redhat.com>
References: <cover.1648091539.git.wucy11@chinatelecom.cn>
 <Ykb6kZrGUnjpu3Pn@xz-m1.local>
From: Chongyun Wu <wucy11@chinatelecom.cn>
In-Reply-To: <Ykb6kZrGUnjpu3Pn@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=wucy11@chinatelecom.cn; helo=chinatelecom.cn
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
Cc: yuanmh12@chinatelecom.cn, tugy@chinatelecom.cn,
 David Hildenbrand <david@redhat.com>, huangy81@chinatelecom.cn,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, dengpc12@chinatelecom.cn,
 Paolo Bonzini <pbonzini@redhat.com>, baiyw2@chinatelecom.cn, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for review.

On 4/1/2022 9:13 PM, Peter Xu wrote:
> Chongyun,
> 
> On Mon, Mar 28, 2022 at 09:32:10AM +0800, wucy11@chinatelecom.cn wrote:
>> From: Chongyun Wu <wucy11@chinatelecom.cn>
>>
>> v2:
>> -patch 1: remove patch_1
>>
>> v1:
>> -rebase to qemu/master
>>
>> Overview
>> ============
>> This series of patches is to optimize the performance of
>> online migration using dirty ring and autoconverge.
>>
>> Mainly through the following aspects to do optimization:
>> 1. Dynamically adjust the dirty ring collection thread to
>> reduce the occurrence of ring full, thereby reducing the
>> impact on customers, improving the efficiency of dirty
>> page collection, and thus improving the migration efficiency.
>>
>> 2. When collecting dirty pages from KVM,
>> kvm_cpu_synchronize_kick_all is not called if the rate is
>> limited, and it is called only once before suspending the
>> virtual machine. Because kvm_cpu_synchronize_kick_all will
>> become very time-consuming when the CPU is limited, and
>> there will not be too many dirty pages, so it only needs
>> to be called once before suspending the virtual machine to
>> ensure that dirty pages will not be lost and the efficiency
>> of migration is guaranteed .
>>
>> 3. Based on the characteristic of collecting dirty pages
>> in the dirty ring, a new dirty page rate calculation method
>> is proposed to obtain a more accurate dirty page rate.
>>
>> 4. Use a more accurate dirty page rate and calculate the
>> matched speed limit throttle required to complete the
>> migration according to the current system bandwidth and
>> parameters, instead of the current time-consuming method
>> of trying to get a speed limit, greatly reducing migration
>> time.
> 
> Thanks for the patches.
> 
> I'm curious what's the relationship between this series and Yong's?
I personally think it is a complementary relationship. Yong's can limit 
per-vcpu. In the case of memory pressure threads in certain vcpu scenarios, the 
restrictions on other vcpus are very small, and the impact on customers during 
the migration process will be smaller. The auto-convergence optimization of the 
last two patches in this patch series can cope with scenarios where the memory 
pressure is balanced on each vcpu. Each has its own advantages, and customers 
can choose the appropriate mode according to their own application scenarios. 
The first two patches are for the dirty ring, and both auto converge and yong 
modes can improve performance.

> 
> If talking about throttling, I do think the old auto-converge was kind of
> inefficient comparing to the new per-vcpu ways of throttling at least in
> either granularity or on read tolerances (e.g., dirty ring based solution
> will not block vcpu readers even if the thread is heavily throttled).
Yes, I agree with that. Through the research of dirty ring and a lot of tests, 
some points that may affect the advantages of dirty ring have been found, so 
some optimizations have been made, and these optimizations are found to be 
effective through testing and verification.
In this patch series, only the last two patches are optimized for autocoverge. 
The first two patches are for all situations where the dirty ring is used, 
including Yong's, and there is no conflict with his. Among them, "kvm: 
Dynamically adjust the rate of dirty ring reaper thread" is proposed to take 
advantage of dirty ring. When the memory pressure is high, speeding up the rate 
at which the reaper thread collects dirty pages can effectively solve the 
problem that the frequent occurrence of ring full leads to the frequent exit of 
the guest and the performance of the guestperf is degraded. When the migration 
thread migrates data, it also completes the synchronization of most dirty pages. 
When the migration thread of the dirty ring synchronizes the dirty pages, it 
will take less time, which will also speed up the migration. These two patches 
will make yong's test results better, and the two optimization points are different.

> We've got quite a few techniques taking care of migration convergence
> issues (didn't mention postcopy yet..), and I'm wondering whether at some
> point we should be more focused and make a chosen one better, rather than
> building different blocks servicing the same purpose.
I'm sorry, maybe I should separate these patch series to avoid 
misunderstandings. These patches and yong's should be complementary, and two of 
them can also help yong get some performance improvements.
> 
> Thanks,
> 

-- 
Best Regard,
Chongyun Wu

