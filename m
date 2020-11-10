Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04392ACAE7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 03:09:34 +0100 (CET)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcJ6D-0004iM-W2
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 21:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kcJ4d-00042m-Rs
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:07:56 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kcJ4Y-0004qZ-BZ
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 21:07:55 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CVWTT1fsJzVmb4;
 Tue, 10 Nov 2020 10:07:25 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 10 Nov 2020 10:07:40 +0800
Received: from [10.174.187.211] (10.174.187.211) by
 dggemi758-chm.china.huawei.com (10.1.198.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 10 Nov 2020 10:07:39 +0800
Subject: Re: [RFC PATCH 1/6] migration: Add multi-thread compress method
To: Eric Blake <eblake@redhat.com>, <quintela@redhat.com>,
 <dgilbert@redhat.com>
References: <20201109090850.2424-1-jinzeyu@huawei.com>
 <20201109090850.2424-2-jinzeyu@huawei.com>
 <91524faf-9a68-8f9c-dd87-16718d8782a1@redhat.com>
From: Zeyu Jin <jinzeyu@huawei.com>
Message-ID: <c2581d35-1cd3-15df-22d8-919b37da74df@huawei.com>
Date: Tue, 10 Nov 2020 10:07:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <91524faf-9a68-8f9c-dd87-16718d8782a1@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi704-chm.china.huawei.com (10.3.20.103) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=jinzeyu@huawei.com;
 helo=szxga01-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 21:07:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/9 23:57, Eric Blake wrote:
> On 11/9/20 3:08 AM, Zeyu Jin wrote:
>> A multi-thread compress method parameter is added to hold the method we
>> are going to use. By default the 'zlib' method is used to maintain the
>> compatibility as before.
>>
>> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
> 
> Focusing on just the UI:
> 
>> +++ b/qapi/migration.json
>> @@ -525,6 +525,19 @@
>>    'data': [ 'none', 'zlib',
>>              { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>  
>> +##
>> +# @CompressMethod:
>> +#
>> +# An enumeration of multi-thread compression methods.
>> +#
>> +# @zlib: use zlib compression method.
>> +#
>> +# Since: 5.0
> 
> This will have to be Since: 6.0, as it has missed feature freeze for 5.2.
> 

Thank you for noticing. I will fix that.

>> +#
>> +##
>> +{ 'enum': 'CompressMethod',
>> +  'data': [ 'zlib' ] }
>> +
>>  ##
>>  # @BitmapMigrationBitmapAlias:
>>  #
>> @@ -599,6 +612,9 @@
>>  #                      compression, so set the decompress-threads to the number about 1/4
>>  #                      of compress-threads is adequate.
>>  #
>> +# @compress-method: Set compression method to use in multi-thread compression.
>> +#                   Defaults to none. (Since 5.0)
> 
> Looks like it will be a recurring issue in the series, so I'll quit
> pointing it out.
> 
> CompressMethod above does not have a 'none' option, so how can it
> default to none?  Did you forget an enum option?
> 

Actually this is a comment mistake. The default option is expected to
be 'zlib'. I will fix the comment.

