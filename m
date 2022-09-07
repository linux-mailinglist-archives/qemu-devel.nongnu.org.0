Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257805B0798
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 16:54:21 +0200 (CEST)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVwRX-0001Kc-Q5
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 10:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oVwPt-0007Y3-5Z
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:52:37 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.219]:53590
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oVwPq-0002jR-76
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 10:52:36 -0400
HMM_SOURCE_IP: 172.18.0.188:53774.274498724
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.96.92 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id D700828009F;
 Wed,  7 Sep 2022 22:52:05 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id b2d7ed4ff67345ae8e8549b9e0a3274a for
 peterx@redhat.com; Wed, 07 Sep 2022 22:52:18 CST
X-Transaction-ID: b2d7ed4ff67345ae8e8549b9e0a3274a
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <300bcc2c-d589-d21e-6d4c-4f6a91afdb8c@chinatelecom.cn>
Date: Wed, 7 Sep 2022 22:52:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 0/8] migration: introduce dirtylimit capability
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <YxexnENbRsHlcMgt@xz-m1.local>
From: Hyman <huangy81@chinatelecom.cn>
In-Reply-To: <YxexnENbRsHlcMgt@xz-m1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
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



在 2022/9/7 4:46, Peter Xu 写道:
> On Fri, Sep 02, 2022 at 01:22:28AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> v1:
>> - make parameter vcpu-dirty-limit experimental
>> - switch dirty limit off when cancel migrate
>> - add cancel logic in migration test
>>
>> Please review, thanks,
>>
>> Yong
>>
>> Abstract
>> ========
>>
>> This series added a new migration capability called "dirtylimit".  It can
>> be enabled when dirty ring is enabled, and it'll improve the vCPU performance
>> during the process of migration. It is based on the previous patchset:
>> https://lore.kernel.org/qemu-devel/cover.1656177590.git.huangy81@chinatelecom.cn/
>>
>> As mentioned in patchset "support dirty restraint on vCPU", dirtylimit way of
>> migration can make the read-process not be penalized. This series wires up the
>> vcpu dirty limit and wrappers as dirtylimit capability of migration. I introduce
>> two parameters vcpu-dirtylimit-period and vcpu-dirtylimit to implement the setup
>> of dirtylimit during live migration.
>>
>> To validate the implementation, i tested a 32 vCPU vm live migration with such
>> model:
>> Only dirty vcpu0, vcpu1 with heavy memory workoad and leave the rest vcpus
>> untouched, running unixbench on the vpcu8-vcpu15 by setup the cpu affinity as
>> the following command:
>> taskset -c 8-15 ./Run -i 2 -c 8 {unixbench test item}
>>
>> The following are results:
>>
>> host cpu: Intel(R) Xeon(R) Platinum 8378A
>> host interface speed: 1000Mb/s
>>    |---------------------+--------+------------+---------------|
>>    | UnixBench test item | Normal | Dirtylimit | Auto-converge |
>>    |---------------------+--------+------------+---------------|
>>    | dhry2reg            | 32800  | 32786      | 25292         |
>>    | whetstone-double    | 10326  | 10315      | 9847          |
>>    | pipe                | 15442  | 15271      | 14506         |
>>    | context1            | 7260   | 6235       | 4514          |
>>    | spawn               | 3663   | 3317       | 3249          |
>>    | syscall             | 4669   | 4667       | 3841          |
>>    |---------------------+--------+------------+---------------|
>>  From the data above we can draw a conclusion that vcpus that do not dirty memory
>> in vm are almost unaffected during the dirtylimit migration, but the auto converge
>> way does.
>>
>> I also tested the total time of dirtylimit migration with variable dirty memory
>> size in vm.
>>
>> senario 1:
>> host cpu: Intel(R) Xeon(R) Platinum 8378A
>> host interface speed: 1000Mb/s
>>    |-----------------------+----------------+-------------------|
>>    | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>>    |-----------------------+----------------+-------------------|
>>    | 60                    | 2014           | 2131              |
>>    | 70                    | 5381           | 12590             |
>>    | 90                    | 6037           | 33545             |
>>    | 110                   | 7660           | [*]               |
>>    |-----------------------+----------------+-------------------|
>>    [*]: This case means migration is not convergent.
>>
>> senario 2:
>> host cpu: Intel(R) Xeon(R) CPU E5-2650
>> host interface speed: 10000Mb/s
>>    |-----------------------+----------------+-------------------|
>>    | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>>    |-----------------------+----------------+-------------------|
>>    | 1600                  | 15842          | 27548             |
>>    | 2000                  | 19026          | 38447             |
>>    | 2400                  | 19897          | 46381             |
>>    | 2800                  | 22338          | 57149             |
>>    |-----------------------+----------------+-------------------|
>> Above data shows that dirtylimit way of migration can also reduce the total
>> time of migration and it achieves convergence more easily in some case.
>>
>> In addition to implement dirtylimit capability itself, this series
>> add 3 tests for migration, aiming at playing around for developer simply:
>>   1. qtest for dirty limit migration
>>   2. support dirty ring way of migration for guestperf tool
>>   3. support dirty limit migration for guestperf tool
> 
> Yong,
> 
> I should have asked even earlier - just curious whether you have started
> using this in production systems?  It's definitely not required for any
> patchset to be merged, but it'll be very useful (and supportive)
> information to have if there's proper testing beds applied already.
> 
Actually no when i posted the cover letter above, the qemu version in 
our production is much lower than upstream, and the patchset is 
different from here, i built test mode and did the test on my own in the 
first time. But this feature is in the process of test conducted by 
another professional test team, so once report is ready, i'll post it. :)
> Thanks,
> 

