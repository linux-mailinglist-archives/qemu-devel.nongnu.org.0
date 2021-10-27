Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F243C310
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 08:36:02 +0200 (CEST)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfcXY-000084-Ss
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 02:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mfcTT-0007Fa-7I
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:31:47 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mfcTD-0005Ac-47
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 02:31:46 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HfJk173tkz90TR;
 Wed, 27 Oct 2021 14:31:21 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 14:31:22 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 27 Oct 2021 14:31:21 +0800
Subject: Re: [PATCH v12 0/6] support dirtyrate at the granualrity of vcpu
To: Hyman Huang <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>
References: <cover.1624982116.git.huangy81@chinatelecom.cn>
 <YWjaQ80LZGvPPoeX@t490s>
 <78929c64-ca4d-6c6a-f371-99cd508e958a@chinatelecom.cn>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <c5c179f1-6b3c-0aa5-7f69-f8d7ad554373@huawei.com>
Date: Wed, 27 Oct 2021 14:31:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <78929c64-ca4d-6c6a-f371-99cd508e958a@chinatelecom.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=zhengchuan@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.215,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Xiexiangyou <xiexiangyou@huawei.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi.
I have no objection for the implement code itself.
But we should know or let the user know the performance penalty and conflicted with migration compared to the hash method, especially for the performance of vm with hugepages.

On 2021/10/15 10:07, Hyman Huang wrote:
> 
> 
> 在 2021/10/15 9:32, Peter Xu 写道:
>> On Wed, Jun 30, 2021 at 12:01:17AM +0800, huangy81@chinatelecom.cn wrote:
>>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>>
>>> v12
>>> - adjust the order of calculating dirty rate
>>>    let memory_global_dirty_log_sync before calculating as
>>>    v11 version description.
>>
>> Ping for Yong. >
>> Dave/Juan, any plan to review/merge this series (along with the other series of
>> dirty logging)?
>>
>> I found it useful when I wanted to modify the program I used to generate
>> constant dirty workload - this series can help me to verify the change.
>>
>> I still keep thinking this series is something good to have.  Thanks,
> the dirtyrate calculation has already been used to estimate time of live migration in "e cloud" production of chinatelecom, it also predict the migration success ratio, which provide valuable information for the cloud management plane when selecting which vm should be migrated.
>>
> 

-- 
Regards.
Chuan

