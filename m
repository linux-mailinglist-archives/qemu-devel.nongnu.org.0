Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A442DC535
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:21:12 +0100 (CET)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaUB-0006ez-U9
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpaLF-0004TF-Na
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:11:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpaLD-0006hM-UY
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:11:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608138714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5n+ZFOJFcHLySEQPSH7MmT6ymb546jCzjAoUnkQxz4=;
 b=X/jNQJEXXck4RZMe9DZDmYfeS2rG3SzDVaEaBHK/W6ZPxMkIkqoRL7ReI3xO/ZoAGHlrMS
 ECduZTn84N3xIUvsg5gvKAtF25Kmq6dMegYHdupJXSapx3KXLXvDhayx29Z8GJuqmyjFz8
 Wg+N/GUyNGRUrN4Qm7rloLmWuphLRkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-dVkifm7RMQyyDKQ3RHrkDw-1; Wed, 16 Dec 2020 12:11:52 -0500
X-MC-Unique: dVkifm7RMQyyDKQ3RHrkDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D71A18C9F41
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:11:51 +0000 (UTC)
Received: from [10.10.116.117] (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15FEC5D71B;
 Wed, 16 Dec 2020 17:11:46 +0000 (UTC)
Subject: Re: [PATCH 03/12] qapi/main: handle theoretical None-return from
 re.match()
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-4-jsnow@redhat.com>
 <87eejqtb0u.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b8b6bc3b-7525-8087-83b3-f3d240b778cd@redhat.com>
Date: Wed, 16 Dec 2020 12:11:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87eejqtb0u.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 3:23 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Mypy cannot understand that this match can never be None, so help it
>> along.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/main.py | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
>> index 42517210b805..271d9e84da94 100644
>> --- a/scripts/qapi/main.py
>> +++ b/scripts/qapi/main.py
>> @@ -23,7 +23,8 @@
>>   
>>   def invalid_prefix_char(prefix: str) -> Optional[str]:
>>       match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
> 
> @match can't be None because the regexp always matches a prefix,
> possibly the empty prefix.
> 
>> -    if match.end() != len(prefix):
>> +    # match cannot be None, but mypy cannot infer that.
>> +    if match and match.end() != len(prefix):
>>           return prefix[match.end()]
>>       return None
> 
> High-level logic:
> 
>         if there is an invalid prefix character:
>             return it
>         return None
> 
> The actual code takes the return None when the match fails.  If this
> could happen, it would be wrong.  I can't, so it doesn't matter, but I
> dislike it anyway.
> 
> Alternative 1: turn "match cannot be None" from comment to code
> 
>         match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
>    +    assert match
>         if match.end() != len(prefix):
>             return prefix[match.end()]
>         return None
> 
> Alternative 2: turn empty prefix into a special case
> 
>    -    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
>    +    match = re.match(r'[A-Za-z_.-][A-Za-z0-9_.-]*', prefix)
>    +    if not match:
>    +        return prefix[0]
>         if match.end() != len(prefix):
>             return prefix[match.end()]
>         return None
> 
> I'd prefer alternative 1.
> 

OK, no problem.


