Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228A6682FEE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:57:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqNh-0001Kc-GE; Tue, 31 Jan 2023 08:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pMqNc-0001KD-Ce
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:08:56 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pMqM6-0000wm-VP
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:08:56 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P5lTZ6HCSzRr5J;
 Tue, 31 Jan 2023 20:58:10 +0800 (CST)
Received: from [10.174.187.239] (10.174.187.239) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 31 Jan 2023 21:00:22 +0800
Message-ID: <4ff6dbd2-5365-8e51-c621-640ada913f2e@huawei.com>
Date: Tue, 31 Jan 2023 21:00:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] migration: save/delete migration thread info
To: <quintela@redhat.com>
CC: <qemu-devel@nongnu.org>, <berrange@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-4-jiangjiacheng@huawei.com>
 <87k014odby.fsf@secure.mitica>
 <b059cf27-73dd-addf-58bb-2078c3aa985f@huawei.com>
 <87357sp18l.fsf@secure.mitica>
In-Reply-To: <87357sp18l.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.239]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangjiacheng@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jiang Jiacheng <jiangjiacheng@huawei.com>
From:  Jiang Jiacheng via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2023/1/30 22:04, Juan Quintela wrote:
> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>> On 2023/1/30 12:28, Juan Quintela wrote:
>>> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>>>> To support query migration thread infomation, save and delete
>>>> thread information at thread creation and end.
>>>>
>>>> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
>>>
>>> Don't disagree with this, but if we create this on the sending side, why
>>> this is not needed for the multifd_recv_threads?
>>>
>>
>> I only add several threads which i'm interested in into the list till
>> now, whose information will be used for setting cpu affinity for
>> migration thread.
>> For consistency, we can add other threads to the list, but those
>> information won't be used so far.
> 
> It is just curiosity, why do you want to set cpu affinity on the source
> but not on destination?
> 

Mainly considering the application scenarios. To improve the migration
performance, I want to set cpu affinity for migration thread when
migration a VM whose service threads preempt most of the CPU resources.
So the source side can benefit more from cpu affinity.
And on the destination side, the pressure is lighter (generally),
setting cpu affinity may not be so much useful as source side.

Thanks, Jiang Jiacheng

> Later, Juan.
> 
> 

