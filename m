Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A92DA8A9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 08:41:17 +0100 (CET)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp4xQ-0004oi-8P
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 02:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kp4wM-0004Kh-Ay
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:40:10 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kp4wH-0007Ed-SH
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:40:10 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cw9BM5pw4zhsjt;
 Tue, 15 Dec 2020 15:39:23 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 15:39:52 +0800
Subject: Re: [PATCH] kvm: Take into account the unaligned section size when
 preparing bitmap
To: zhukeqian <zhukeqian1@huawei.com>, Peter Xu <peterx@redhat.com>
References: <20201208114013.875-1-yuzenghui@huawei.com>
 <20201208151654.GA6432@xz-x1>
 <bb4bcc8b-1d36-9529-d7cd-4d93162d092f@huawei.com>
 <6dc82702-9246-4684-4f28-e104abc0c11d@huawei.com>
 <20201210020843.GB3211@xz-x1>
 <7d46e5ca-24ab-7c44-201c-77e8fc6a2ace@huawei.com>
 <20201210145006.GD3211@xz-x1>
 <2607b4cd-524c-2360-6261-224736861fc4@huawei.com>
 <20201211152518.GD6520@xz-x1>
 <41d9ac96-83af-e8c3-6e54-c702f5527f5e@huawei.com>
 <20201214153625.GF6520@xz-x1>
 <fa46e21a-5b5e-749f-216b-17c7c99d98a2@huawei.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <a816d0d5-ac0b-d9d4-684d-f553bc601309@huawei.com>
Date: Tue, 15 Dec 2020 15:39:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fa46e21a-5b5e-749f-216b-17c7c99d98a2@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Keqian, Peter,

On 2020/12/15 15:23, zhukeqian wrote:
> 
> On 2020/12/14 23:36, Peter Xu wrote:
>> On Mon, Dec 14, 2020 at 10:14:11AM +0800, zhukeqian wrote:
>>
>> [...]
>>
>>>>>> Though indeed I must confess I don't know how it worked in general when host
>>>>>> page size != target page size, at least for migration.  For example, I believe
>>>>>> kvm dirty logging is host page size based, though migration should be migrating
>>>>>> pages in guest page size granule when it spots a dirty bit set.
>>
>> [1]
>>
>>> Hi Peter,
>>
>> Keqian,
>>
>>>> OTOH I'm more worried on the other question on how we handle guest psize !=
>>>> host psize case for migration now...
>>> I think it does not matter when guest_psize != host_psize, as we only need to interact with
>>> stage2 page tables during migration. Stage2 is enough to tracking guest dirty memory, and even
>>> if guest close stage1, we also can do a successful migration.
>>
>> I don't know why 2-stage matters here, since I believe KVM can track dirty
>> pages either using two dimentional paging or shadowing, however it's always
>> done in host small page size.  The question I'm confused is there seems to have
>> a size mismatch between qemu migration and what kvm does [1].  For example, how
>> migration works on ARM64 where host has psize==4K while guest has psize=64K.
>>
> Hi Peter,
> 
> OK, I got it ;-) Do you mean qemu_real_host_page_size != TARGET_PAGE_SIZE?
> After my analysis, I see that when qemu_real_host_page_size != TARGET_PAGE_SIZE,
> there are some problems indeed. I have send out some patches, please check whether they solve this
> problem, thanks!

Now I see what your concern is :) Thanks both for the explanation and
the further fix!


Zenghui

