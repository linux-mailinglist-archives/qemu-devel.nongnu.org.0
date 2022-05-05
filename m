Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1F51BF9C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:39:35 +0200 (CEST)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmala-0005Pb-Ai
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nmahC-0002rL-Cd
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:35:02 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nmah8-0004ng-IJ
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:35:01 -0400
Received: from kwepemi500025.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KvCmK4QNmzfbHn;
 Thu,  5 May 2022 20:33:37 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi500025.china.huawei.com (7.221.188.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 5 May 2022 20:34:41 +0800
Message-ID: <f3f15ecc-6b1b-a21e-a0c1-bda78570b500@huawei.com>
Date: Thu, 5 May 2022 20:34:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
To: Stefan Hajnoczi <stefanha@gmail.com>
CC: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?=
 <ldoktor@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
 <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain>
In-Reply-To: <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500025.china.huawei.com (7.221.188.170)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>

Hi Stefan,

在 2022/5/5 18:09, Stefan Hajnoczi 写道:
> On Tue, May 03, 2022 at 09:43:15AM +0200, Lukáš Doktor wrote:
>> Hello Mike, Paolo, others,
>>
>> in my perf pipeline I noticed a regression bisected to the f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94 - "thread-posix: remove the posix semaphore support" commit and I'd like to ask you to verify it might have caused that and eventually consider fixing it. The regression is visible, reproducible and clearly bisectable to this commit with the following 2 scenarios:
> I can't parse the commit message for
> f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94, so it's not 100% clear to me
> why it was necessary to remove sem_*() calls.

We can find the previous discussion here:

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg870174.html

[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg870409.html


Because sem_timedwait() only supports absolute time and it would be 
affected

if the system time is changing. Another reason to remove sem_*() is to make

the code much neater.


> util/thread-pool.c uses qemu_sem_*() to notify worker threads when work
> becomes available. It makes sense that this operation is
> performance-critical and that's why the benchmark regressed.
>
> Maybe thread-pool.c can use qemu_cond_*() instead of qemu_sem_*(). That
> avoids the extra mutex (we already have pool->lock) and counter (we
> already have pool->request_list)?
>
>> 1. fio write 4KiB using the nbd ioengine on localhost
>> 2. fio read 4KiB using #cpu jobs and iodepth=8 on a rotational disk using qcow2 image and default virt-install
>>
>>      <disk type="file" device="disk">
>>        <driver name="qemu" type="qcow2"/>
>>        <source file="/var/lib/libvirt/images/RHEL-8.4.0-20210503.1-virtlab506.DefaultLibvirt0.qcow2"/>
>>        <target dev="vda" bus="virtio"/>
>>      </disk>
>>
>> but smaller regressions can be seen under other scenarios as well since this commit. You can find the report from bisections here:
>>
>> https://ldoktor.github.io/tmp/RedHat-virtlab506/v7.0.0/RedHat-virtlab506-f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94-RHEL-8.4.0-20210503.1-1.html
>> https://ldoktor.github.io/tmp/RedHat-virtlab506/v7.0.0/RedHat-virtlab506-f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94-RHEL-8.4.0-20210503.1-2.html
>>
>> Regards,
>> Lukáš
>
>
>
>

