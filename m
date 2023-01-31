Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6DE682EBD
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:03:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMr9P-0005fU-6U; Tue, 31 Jan 2023 08:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pMr9M-0005eZ-DA
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:58:16 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangjiacheng@huawei.com>)
 id 1pMr9J-00013Z-9P
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:58:16 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4P5lQp4PlKzJqpt;
 Tue, 31 Jan 2023 20:55:46 +0800 (CST)
Received: from [10.174.187.239] (10.174.187.239) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 31 Jan 2023 21:00:14 +0800
Message-ID: <07cad820-0755-2da9-e4d7-4e00f7b3a8f7@huawei.com>
Date: Tue, 31 Jan 2023 21:00:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/3] migration: implement query migration threadinfo by
 name
To: <quintela@redhat.com>
CC: <qemu-devel@nongnu.org>, <berrange@redhat.com>, <dgilbert@redhat.com>,
 <yubihong@huawei.com>, <xiexiangyou@huawei.com>, <zhengchuan@huawei.com>,
 <linyilu@huawei.com>
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-3-jiangjiacheng@huawei.com>
 <87o7qgode5.fsf@secure.mitica>
 <9b3fc9df-d273-4008-36c2-c779a40132c2@huawei.com>
 <877cx4p1ai.fsf@secure.mitica>
In-Reply-To: <877cx4p1ai.fsf@secure.mitica>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.239]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangjiacheng@huawei.com; helo=szxga03-in.huawei.com
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



On 2023/1/30 22:03, Juan Quintela wrote:
> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>> On 2023/1/30 12:27, Juan Quintela wrote:
>>> Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
>>>> Introduce interface query-migrationthreads. The interface is use
>>>> with the migration thread name reported by qemu and returns with
>>>> migration thread name and its pid.
>>>> Introduce threadinfo.c to manage threads with migration.
>>>>
>>>> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>
>>>
>>> I like this query interface better than the way you expose the thread
>>> name in the 1st place.
>>
>> The event in patch1 is used to pass the thread name since libvirt
>> doesn't know the name of the migration thread but the interface below
>> need its name.
>> I think the event can be dropped if we store the thread name in
>> libvirt(if the migration thread name is fixed in qemu) or using the
>> 'query-migrationthreads' you mentioned below.
> 
> I preffer the query migrationthreads, thanks.
>>
>>>
>>> But once that we are here, why don't we just "tweak" abit the interface:
>>>
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index b0cf366ac0..e93c3e560a 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -1970,6 +1970,36 @@
>>>>  { 'command': 'query-vcpu-dirty-limit',
>>>>    'returns': [ 'DirtyLimitInfo' ] }
>>>>  
>>>> +##
>>>> +# @MigrationThreadInfo:
>>>> +#
>>>> +# Information about migrationthreads
>>>> +#
>>>> +# @name: the name of migration thread
>>>> +#
>>>> +# @thread-id: ID of the underlying host thread
>>>> +#
>>>> +# Since: 7.2
>>>> +##
>>>> +{ 'struct': 'MigrationThreadInfo',
>>>> +  'data': {'name': 'str',
>>>> +           'thread-id': 'int'} }
>>>
>>> 1st, it is an int enough for all architectures?  I know that for linux
>>> and friends it is, but not sure about windows and other weird systems.
>>>
>>
>> It is only enough for migration pin which I want to implement. But I
>> think this struct can be easily expand if we need other information
>> about migration thread.
> 
> I mean that pthread_t (what you are passing here) is an int on linux.
> Not sure on other OS's.
> 

I'm sorry about my misunderstanding. I use 'int' for thread-id just like
cpu or iothread's thread-id, and it is get from 'qemu_get_thread_id'. So
I think it is enough.

>>>> +##
>>>> +# @query-migrationthreads:
>>>
>>> What about renaming this to:
>>>
>>> @query-migrationthread (I removed the last 's')
>>>
>>> because it returns the info of a single thread.
>>>
>>>> +#
>>>> +# Returns threadInfo about the thread specified by name
>>>> +#
>>>> +# data: migration thread name
>>>> +#
>>>> +# returns: information about the specified thread
>>>> +#
>>>> +# Since: 7.2
>>>> +##
>>>> +{ 'command': 'query-migrationthreads',
>>>> +  'data': { 'name': 'str' },
>>>> +  'returns': 'MigrationThreadInfo' }
>>>> +
>>>>  ##
>>>>  # @snapshot-save:
>>>>  #
>>>
>>> And leaves the @query-migrationthreads name for something in the spirit of
>>>
>>>> +{ 'command': 'query-migrationthreads',
>>>> +  'returns': ['str'] }
>>>
>>> That returns all the migration threads names.
>>>
>>> Or perhaps even
>>>
>>>> +{ 'command': 'query-migrationthreads',
>>>> +  'returns': ['MigrationThreadInfo'] }
>>>
>>> And call it a day?
>>
>> I think it's the best. If in this way, should we keep the interface to
>> query specified thread?
> 
> I wouldn't do it, but it is up to you.
> 
> My (little) understanding of what you want to do is that you want all
> the threads, so I see no reason to have a query for a single one.
> 

Thanks for your suggestion. As you said, I need all the threads info,
and the specified thread info can be got easily from the new interface.
The old interface seems to be redundant indeed.

Thanks, Jiang Jiacheng

> Later, Juan.
> 

