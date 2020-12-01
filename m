Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEA82C976D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 07:08:37 +0100 (CET)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjyq5-0007E0-2C
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 01:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kjypM-0006oD-6J
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:07:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kjypJ-0003az-6w
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:07:51 -0500
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ClWpf6V27zQmX4;
 Tue,  1 Dec 2020 14:07:22 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 1 Dec 2020 14:07:44 +0800
Received: from [10.174.187.211] (10.174.187.211) by
 dggemi758-chm.china.huawei.com (10.1.198.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 1 Dec 2020 14:07:44 +0800
From: Zeyu Jin <jinzeyu@huawei.com>
Subject: Re: [PATCH 1/6] migration: Add multi-thread compress method
To: Markus Armbruster <armbru@redhat.com>
References: <20201127074116.2061-1-jinzeyu@huawei.com>
 <87zh33ruzd.fsf@dusky.pond.sub.org>
 <8dfb932a-929b-7c7f-d675-c330166099fc@huawei.com>
 <875z5njl82.fsf@dusky.pond.sub.org>
Message-ID: <be97a13d-5426-04c1-c92b-a9b08b52ce99@huawei.com>
Date: Tue, 1 Dec 2020 14:07:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <875z5njl82.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=jinzeyu@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ying Fang <fangying1@huawei.com>, quintela@redhat.com,
 zhang.zhanghailiang@huawei.com, dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/30 16:35, Markus Armbruster wrote:
> Zeyu Jin <jinzeyu@huawei.com> writes:
> 
>> On 2020/11/27 17:48, Markus Armbruster wrote:
>>> Kevin, Max, suggest to skip right to Qcow2CompressionType.
>>>
>>> Zeyu Jin <jinzeyu@huawei.com> writes:
>>>
>>>> A multi-thread compress method parameter is added to hold the method we
>>>> are going to use. By default the 'zlib' method is used to maintain the
>>>> compatibility as before.
>>>>
>>>> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
>>>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>>> [...]
>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>> index 3c75820527..2ed6a55b92 100644
>>>> --- a/qapi/migration.json
>>>> +++ b/qapi/migration.json
>>>> @@ -525,6 +525,19 @@
>>>>    'data': [ 'none', 'zlib',
>>>>              { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>>>  
>>>> +##
>>>> +# @CompressMethod:
>>>> +#
>>>> +# An enumeration of multi-thread compression methods.
>>>> +#
>>>> +# @zlib: use zlib compression method.
>>>> +#
>>>> +# Since: 6.0
>>>> +#
>>>> +##
>>>> +{ 'enum': 'CompressMethod',
>>>> +  'data': [ 'zlib' ] }
>>>> +
>>>>  ##
>>>>  # @BitmapMigrationBitmapAlias:
>>>>  #
>>>> @@ -599,6 +612,9 @@
>>>>  #                      compression, so set the decompress-threads to the number about 1/4
>>>>  #                      of compress-threads is adequate.
>>>>  #
>>>> +# @compress-method: Set compression method to use in multi-thread compression.
>>>> +#                   Defaults to zlib. (Since 6.0)
>>>
>>> We already have @multifd-compression.  Why do we need to control the two
>>> separately?  Can you give a use case for different settings?
>>>
>>
>> Generally, mulit-thread compression deals with the situation
>> where network bandwith is limited but cpu resource is adequate. Multifd
>> instead aims to situation where single fd cannot take full advantage of
>> network bandwith. So compression based on multifd cannot fully cover the
>> cases for multi-thread compression.
>>
>> For example, for migration with a bandwith limitation of 10M
>> bytes/second, single fd is enough for data delivery. This is the case
>> for multi-thread compression.
> 
> Let me rephrase my question.
> 
> According to query-migrate-parameters, we default to
> 
>     "compress-level": 1
>     "compress-threads": 8
>     "compress-wait-thread": true
>     "decompress-threads": 2
>     "multifd-channels": 2
>     "multifd-compression": "none"
>     "multifd-zlib-level": 1
>     "multifd-zstd-level": 1
> 
> Your patch adds
> 
>     "compress-method": "zlib"
> 
> I have several basic questions I can't answer from the documentation:
> 
> 1. We appear to have two distinct sets of compression parameters:
> 
>    * Traditional: compress-level, compress-threads,
>      compress-wait-thread, decompress-threads.
> 
>      These parameters all apply to the same compression.  Correct?
> 
>      What data is being compressed by it?
> 
>    * Multi-fd: multifd-channels, multifd-compression,
>      multifd-zlib-level, multifd-std-level
> 
>      These parameters all apply to the same compression.  Correct?
> 
>      What data is being compressed by it?
> 
>    * Why do we want *two*?  I understand why multi-fd is optional, but
>      why do we need the capability to compress differently there?  Use
>      case?
> 
>    All of these questions predate your patch.  David, Juan?
>

I see. The problem is that the parameter sets seem to be redundant and
maybe there is an overlap between these two compression capabilities.

As you said, the questions predate my patch, so maybe we can have a
discussion here. What do you think, David, Juan?

> 2. Does compress-method belong to "traditional"?
>

Yes.

>>> If we do want two parameters: the names @compress-method and
>>> @multifd-compression are inconsistent.  According to your comment,
>>> @compress-method applies only to multi-thread compression.  That leads
>>> me to suggest renaming it to @multi-thread-compression.
>>>
>>
>> For the names, my original idea is to make 'CompressMethod' consistent
>> with other multi-thread compression parameters, like 'compress-threads'
>> and 'compress-level'. There is truly some inconsistency here, between
>> multifd-compression params and old multi-thread compression params.
> 
> I see.
> 
>> For now, I agree with you that 'multi-thread-compression' is better. It
>> is more specific and clear. I will rename the params in next version.
>> Thanks for the suggestion.
> 
> Please wait until we've sorted out the documentation mess.
> 
>>> After PATCH 4, CompressMethod is almost the same as MultiFDCompression:
>>>
>>>    { 'enum': 'CompressMethod',
>>>      'data': [ 'zlib' ] }
>>>      'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>>
>>>    { 'enum': 'MultiFDCompression',
>>>      'data': [ 'none', 'zlib',
>>>                { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>>
>>> The difference is member 'none'.  Why does compression 'none' make sense
>>> for multi-fd, but not for multi-thread?
>>>
>>
>> When you set 'none'in multi-fd compression, you would not use the
>> compression capability in multi-fd.
>>
>> In comparison, once you turn on multi-thread compression capability, you
>> have already admitted to use compression. In this case, member 'none' is
>> meaningless.
> 
> Let me rephrase my question:
> 
> How do you select zlib, zstd and no compression for "traditional"?
> 

By parameter "compress-method". And there is no need to support "no
compression" in "traditional" compression.

> If zlib, how do you set the compression level (0 = none, 1 = fastest
> compression, 9 = best compression)?
> 
> If zstd, how do you set the compression level (0 = none, 1 = fastest
> compression, 20 = best compression)?
>

In "traditional", zlib and zstd use the same parameter "compress_level".
For each compression method, we will use different parameter check to
make sure the level number is correct.

> How do you select zlib, zstd and no compression for "multi-fd"?
> 

By parameter "multifd-compression".

> If zlib, how do you set the compression level (0 = none, 1 = fastest
> compression, 9 = best compression)?
> 
> If zstd, how do you set the compression level (0 = none, 1 = fastest
> compression, 20 = best compression)?
>

In "multi-fd", the compress level for each method is separated, which
means, you use "multifd-zlib-level" for zlib, "multifd-zstd-level" for
zstd.

The way to set level is different.

>>> If the difference is wanted: the names are inconsistent.  Less of an
>>> issue than member names, because type names are not externally visible.
>>> Let's make them consistent anyway.
>>>
>>> Hmm, there's also Qcow2CompressionType.  That's another conversation;
>>> I'll start a new thread for it.
>>>
>>> [...]
>>>
>>> .
>>>
> 
> .
> 


