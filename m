Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021D2C8016
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 09:37:06 +0100 (CET)
Received: from localhost ([::1]:52940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjegD-0002On-CT
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 03:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kjeel-0001wC-Mj
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:35:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kjeej-0008K3-SS
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 03:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606725332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bXoJKayXb1RGdA1JHd2u+3FqK8NB6rgAmbnbBCK+5D8=;
 b=Cq77ncqARh48GpfkZ+wYkwqtrPZnzUqMUuZ5gzygSaZtty5XX15ubZe1rc2oWpkgNC5ut5
 6qfu2eqWO7PjmHDQiopYPOgfZLb/eHtUWGLz6C8FDEYsBoLsfIXdwARY1j8BK1u6m9EZ1o
 RfVM31/IGyOJrlwz2A5rfVAKhzKbWLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-fqru9qmJNcO9xtSAgLZJjQ-1; Mon, 30 Nov 2020 03:35:28 -0500
X-MC-Unique: fqru9qmJNcO9xtSAgLZJjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 654831074651;
 Mon, 30 Nov 2020 08:35:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E566F5D9D2;
 Mon, 30 Nov 2020 08:35:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F6DB113864E; Mon, 30 Nov 2020 09:35:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zeyu Jin <jinzeyu@huawei.com>
Subject: Re: [PATCH 1/6] migration: Add multi-thread compress method
References: <20201127074116.2061-1-jinzeyu@huawei.com>
 <87zh33ruzd.fsf@dusky.pond.sub.org>
 <8dfb932a-929b-7c7f-d675-c330166099fc@huawei.com>
Date: Mon, 30 Nov 2020 09:35:25 +0100
In-Reply-To: <8dfb932a-929b-7c7f-d675-c330166099fc@huawei.com> (Zeyu Jin's
 message of "Sat, 28 Nov 2020 15:04:41 +0800")
Message-ID: <875z5njl82.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Zeyu Jin <jinzeyu@huawei.com> writes:

> On 2020/11/27 17:48, Markus Armbruster wrote:
>> Kevin, Max, suggest to skip right to Qcow2CompressionType.
>> 
>> Zeyu Jin <jinzeyu@huawei.com> writes:
>> 
>>> A multi-thread compress method parameter is added to hold the method we
>>> are going to use. By default the 'zlib' method is used to maintain the
>>> compatibility as before.
>>>
>>> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
>>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> [...]
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index 3c75820527..2ed6a55b92 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -525,6 +525,19 @@
>>>    'data': [ 'none', 'zlib',
>>>              { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>>>  
>>> +##
>>> +# @CompressMethod:
>>> +#
>>> +# An enumeration of multi-thread compression methods.
>>> +#
>>> +# @zlib: use zlib compression method.
>>> +#
>>> +# Since: 6.0
>>> +#
>>> +##
>>> +{ 'enum': 'CompressMethod',
>>> +  'data': [ 'zlib' ] }
>>> +
>>>  ##
>>>  # @BitmapMigrationBitmapAlias:
>>>  #
>>> @@ -599,6 +612,9 @@
>>>  #                      compression, so set the decompress-threads to the number about 1/4
>>>  #                      of compress-threads is adequate.
>>>  #
>>> +# @compress-method: Set compression method to use in multi-thread compression.
>>> +#                   Defaults to zlib. (Since 6.0)
>> 
>> We already have @multifd-compression.  Why do we need to control the two
>> separately?  Can you give a use case for different settings?
>> 
>
> Generally, mulit-thread compression deals with the situation
> where network bandwith is limited but cpu resource is adequate. Multifd
> instead aims to situation where single fd cannot take full advantage of
> network bandwith. So compression based on multifd cannot fully cover the
> cases for multi-thread compression.
>
> For example, for migration with a bandwith limitation of 10M
> bytes/second, single fd is enough for data delivery. This is the case
> for multi-thread compression.

Let me rephrase my question.

According to query-migrate-parameters, we default to

    "compress-level": 1
    "compress-threads": 8
    "compress-wait-thread": true
    "decompress-threads": 2
    "multifd-channels": 2
    "multifd-compression": "none"
    "multifd-zlib-level": 1
    "multifd-zstd-level": 1

Your patch adds

    "compress-method": "zlib"

I have several basic questions I can't answer from the documentation:

1. We appear to have two distinct sets of compression parameters:

   * Traditional: compress-level, compress-threads,
     compress-wait-thread, decompress-threads.

     These parameters all apply to the same compression.  Correct?

     What data is being compressed by it?

   * Multi-fd: multifd-channels, multifd-compression,
     multifd-zlib-level, multifd-std-level

     These parameters all apply to the same compression.  Correct?

     What data is being compressed by it?

   * Why do we want *two*?  I understand why multi-fd is optional, but
     why do we need the capability to compress differently there?  Use
     case?

   All of these questions predate your patch.  David, Juan?

2. Does compress-method belong to "traditional"?

>> If we do want two parameters: the names @compress-method and
>> @multifd-compression are inconsistent.  According to your comment,
>> @compress-method applies only to multi-thread compression.  That leads
>> me to suggest renaming it to @multi-thread-compression.
>>
>
> For the names, my original idea is to make 'CompressMethod' consistent
> with other multi-thread compression parameters, like 'compress-threads'
> and 'compress-level'. There is truly some inconsistency here, between
> multifd-compression params and old multi-thread compression params.

I see.

> For now, I agree with you that 'multi-thread-compression' is better. It
> is more specific and clear. I will rename the params in next version.
> Thanks for the suggestion.

Please wait until we've sorted out the documentation mess.

>> After PATCH 4, CompressMethod is almost the same as MultiFDCompression:
>> 
>>    { 'enum': 'CompressMethod',
>>      'data': [ 'zlib' ] }
>>      'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>> 
>>    { 'enum': 'MultiFDCompression',
>>      'data': [ 'none', 'zlib',
>>                { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
>> 
>> The difference is member 'none'.  Why does compression 'none' make sense
>> for multi-fd, but not for multi-thread?
>> 
>
> When you set 'none'in multi-fd compression, you would not use the
> compression capability in multi-fd.
>
> In comparison, once you turn on multi-thread compression capability, you
> have already admitted to use compression. In this case, member 'none' is
> meaningless.

Let me rephrase my question:

How do you select zlib, zstd and no compression for "traditional"?

If zlib, how do you set the compression level (0 = none, 1 = fastest
compression, 9 = best compression)?

If zstd, how do you set the compression level (0 = none, 1 = fastest
compression, 20 = best compression)?

How do you select zlib, zstd and no compression for "multi-fd"?

If zlib, how do you set the compression level (0 = none, 1 = fastest
compression, 9 = best compression)?

If zstd, how do you set the compression level (0 = none, 1 = fastest
compression, 20 = best compression)?

>> If the difference is wanted: the names are inconsistent.  Less of an
>> issue than member names, because type names are not externally visible.
>> Let's make them consistent anyway.
>> 
>> Hmm, there's also Qcow2CompressionType.  That's another conversation;
>> I'll start a new thread for it.
>> 
>> [...]
>> 
>> .
>> 


