Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2780680E04
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:49:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMTaf-0003Ez-Ff; Mon, 30 Jan 2023 07:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pMTac-00038k-5K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:48:50 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pMTaZ-0007U0-DR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:48:49 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P57GR5Tr8zRrJ6;
 Mon, 30 Jan 2023 20:46:23 +0800 (CST)
Received: from [10.174.187.239] (10.174.187.239) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 30 Jan 2023 20:48:33 +0800
Message-ID: <4bd655fa-7e3c-4dfe-4154-d1fe59e5643c@huawei.com>
Date: Mon, 30 Jan 2023 20:48:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/3] migration: report migration thread name to libvirt
To: <quintela@redhat.com>
CC: <qemu-devel@nongnu.org>, <berrange@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-2-jiangjiacheng@huawei.com>
 <87tu08odr7.fsf@secure.mitica>
In-Reply-To: <87tu08odr7.fsf@secure.mitica>
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



On 2023/1/30 12:19, Juan Quintela wrote:
> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>> Report migration thread name to libvirt in order to
>> support query migration thread infomation by its name.
>>
>> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
>> ---
>>  migration/migration.c |  3 +++
>>  migration/multifd.c   |  5 ++++-
>>  qapi/migration.json   | 12 ++++++++++++
>>  3 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 52b5d39244..b4ce458bb9 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3955,6 +3955,9 @@ static void *migration_thread(void *opaque)
>>      MigThrError thr_error;
>>      bool urgent = false;
>>  
>> +    /* report migration thread name to libvirt */
>> +    qapi_event_send_migration_name("live_migration");
>> +
>>      rcu_register_thread();
>>  
>>      object_ref(OBJECT(s));
> 
> I am not sure about this.
> This is not an event, in my point of view.
> 
> What is the problem adding it to info migrate or similar?
> Looks more logical to me.

I want to implement an interface for libvirt to proactively query
information about migration threads. And this event is used to notify
libvirt that the thread has been created and to provide the thread name
for subsequent operations of querying specified thread's information.

Thanks, Jiang Jiacheng

> 
> Later, Juan.
> 

