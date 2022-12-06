Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7D2644A52
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 18:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2bmN-0006Gw-JO; Tue, 06 Dec 2022 12:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1p2blr-0006G6-LM
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:30:21 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1p2bll-0002jq-Rb
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:30:17 -0500
HMM_SOURCE_IP: 172.18.0.188:59456.608635250
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.98.104 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 9B740280090;
 Wed,  7 Dec 2022 01:29:54 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([171.223.98.104])
 by app0023 with ESMTP id 53a93ee9b3ea417198012882ee7d874e for
 peterx@redhat.com; Wed, 07 Dec 2022 01:30:02 CST
X-Transaction-ID: 53a93ee9b3ea417198012882ee7d874e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 171.223.98.104
X-MEDUSA-Status: 0
Message-ID: <8d245f68-e830-2566-2a33-b99f206c6773@chinatelecom.cn>
Date: Wed, 7 Dec 2022 01:29:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 0/1] QEMU: Dirty quota-based throttling of vcpus
To: Peter Xu <peterx@redhat.com>, Shivam Kumar <shivam.kumar1@nutanix.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, david@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, kvm@vger.kernel.org
References: <20221120225458.144802-1-shivam.kumar1@nutanix.com>
 <0cde1cb7-7fce-c443-760c-2bb244e813fe@nutanix.com> <Y49nAjrD0uxUp+Ll@x1n>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <Y49nAjrD0uxUp+Ll@x1n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.27,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/12/7 0:00, Peter Xu 写道:
> Hi, Shivam,
> 
> On Tue, Dec 06, 2022 at 11:18:52AM +0530, Shivam Kumar wrote:
> 
> [...]
> 
>>> Note
>>> ----------
>>> ----------
>>>
>>> We understand that there is a good scope of improvement in the current
>>> implementation. Here is a list of things we are working on:
>>> 1) Adding dirty quota as a migration capability so that it can be toggled
>>> through QMP command.
>>> 2) Adding support for throttling guest DMAs.
>>> 3) Not enabling dirty quota for the first migration iteration.
> 
> Agreed.
> 
>>> 4) Falling back to current auto-converge based throttling in cases where dirty
>>> quota throttling can overthrottle.
> 
> If overthrottle happens, would auto-converge always be better?
> 
>>>
>>> Please stay tuned for the next patchset.
>>>
>>> Shivam Kumar (1):
>>>     Dirty quota-based throttling of vcpus
>>>
>>>    accel/kvm/kvm-all.c       | 91 +++++++++++++++++++++++++++++++++++++++
>>>    include/exec/memory.h     |  3 ++
>>>    include/hw/core/cpu.h     |  5 +++
>>>    include/sysemu/kvm_int.h  |  1 +
>>>    linux-headers/linux/kvm.h |  9 ++++
>>>    migration/migration.c     | 22 ++++++++++
>>>    migration/migration.h     | 31 +++++++++++++
>>>    softmmu/memory.c          | 64 +++++++++++++++++++++++++++
>>>    8 files changed, 226 insertions(+)
>>>
>>
>> It'd be great if I could get some more feedback before I send v2. Thanks.
> 
> Sorry to respond late.
> 
> What's the status of the kernel patchset?
> 
>  From high level the approach looks good at least to me.  It's just that (as
> I used to mention) we have two similar approaches now on throttling the
> guest for precopy.  I'm not sure what's the best way to move forward if
> without doing a comparison of the two.
> 
> https://lore.kernel.org/all/cover.1669047366.git.huangy81@chinatelecom.cn/
> 
> Sorry to say so, and no intention to create a contention, but merging the
> two without any thought will definitely confuse everybody.  We need to
> figure out a way.
> 
>  From what I can tell..
> 
> One way is we choose one of them which will be superior to the other and
> all of us stick with it (for either higher possibility of migrate, less
> interference to the workloads, and so on).
> 
> The other way is we take both, when each of them may be suitable for
> different scenarios.  However in this latter case, we'd better at least be
> aware of the differences (which suites what), then that'll be part of
> documentation we need for each of the features when the user wants to use
> them.
> 
> Add Yong into the loop.
> 
> Any thoughts?
> 
This is quite different from "dirtylimit capability of migration". IMHO, 
quota-based implementation seems a little complicated, because it 
depends on correctness of dirty quota and the measured data, which 
involves the patchset both in qemu and kernel. It seems that dirtylimit 
and quota-based are not mutually exclusive, at least we can figure out
which suites what firstly depending on the test results as Peter said.

-- 
Best regard

Hyman Huang(黄勇)

