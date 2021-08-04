Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E253DFA69
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 06:30:47 +0200 (CEST)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB8YI-00037J-2f
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 00:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mB8Wk-0001EW-0J
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 00:29:10 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mB8Wh-0001d8-II
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 00:29:09 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GfdvV1lPXzZwyJ;
 Wed,  4 Aug 2021 12:25:26 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 12:28:59 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 12:28:59 +0800
Subject: Re: [Question] Reduce the msix_load cost for VFIO device
To: Alex Williamson <alex.williamson@redhat.com>
References: <61e3fdd1-13a1-0675-b5c8-f7bfe3e6a042@huawei.com>
 <20210803081941.66cccf40.alex.williamson@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <aca0f09c-9ffc-5f50-3fae-64918db7ee80@huawei.com>
Date: Wed, 4 Aug 2021 12:28:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210803081941.66cccf40.alex.williamson@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



ÔÚ 2021/8/3 22:19, Alex Williamson Ð´µÀ:
> On Tue, 3 Aug 2021 16:43:07 +0800
> "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
> <longpeng2@huawei.com> wrote:
> 
>> Hi Alex,
>>
>> We found that the msix_load() will cost 40~50ms if the VF has 60+ interrupts,
>> the following code cost too much for each interrupt:
>>
>> msix_load:
>>   for (vector = 0; vector < 60; vector++)
>>     msix_handle_mask_update
>>       vfio_msix_vector_do_use
>>         vfio_add_kvm_msi_virq
>>           kvm_irqchip_add_msi_route
>>             kvm_irqchip_commit_routes <-- cost 0.8ms each time
>>
>> In irq remapping mode, the VF interrupts are not routed through KVM irqchip
> 
> I'm not sure what this means.  Your MSIX interrupts are going through
> QEMU anyway?  Why?
> 

Um ... I made a mistake, the KVM irqchip commit operation can not be skip, it
cause the VF interrupts pass to the QEMU, it's harmful for the performance.

>> in fact, so maybe we can reduce this cost by "x-no-kvm-msix=ture", right?
>> Are there any risks if we do in this way ?
> 
> You're obviously free to configure your device this way, but the
> expectation is that any sort of startup latency is more than offset by
> improved runtime latency through the KVM route.  This option is usually
> reserved for debugging, when we want to see all interaction with the
> device in QEMU.
> 
> If there's a case where we're not detecting that a KVM route is
> ineffective, then we should figure out how to detect that and skip this
> code, but again the expectation is that the KVM route is worthwhile.
> 
> If this is specifically about kvm_irqchip_commit_routes(), maybe the
> setup path needs a way to batch multiple routes and defer the commit,
> if that's possible.  Thanks,

Agree.

I had wrote a draft that defer to commit, it works. In addition, the
vfio_disable_irqindex/vfio_enable_vectors are called N times in msix_load path,
they cost much more than kvm_irqchip_commit, it's also worth to optimize.

> 
> Alex
> 
> .
> 

