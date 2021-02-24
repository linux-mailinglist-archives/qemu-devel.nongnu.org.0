Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993D3245FD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:55:58 +0100 (CET)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF28S-0002cP-Jr
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF27b-0002A1-2K
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:55:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lF27Y-0007VC-Is
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614203698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bl9ktKfGDtnQRbqhdEdqJS572XeYYRVC1qU7UUIYybo=;
 b=TNHBtDMhevJS5Ne9SIMKEZ0pZR48mIyQ1ssFc66T2GNvEghFki75XAnKu4tQJWijAufrIY
 wOfOw7h23RPJROwfs7KUPlXtVEQipralqsqadfihv5SxPLXkrTy5Q36+4gKhWqETCTAJ6I
 /HlXKQB6tuBpy2RTRYyK2W7SJ+fDjpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-FbanCl-UOo-zHEaYCcoKDQ-1; Wed, 24 Feb 2021 16:54:56 -0500
X-MC-Unique: FbanCl-UOo-zHEaYCcoKDQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5B9519E;
 Wed, 24 Feb 2021 21:54:54 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 390EE5D9D7;
 Wed, 24 Feb 2021 21:54:54 +0000 (UTC)
Subject: Re: [PATCH v3 04/16] qapi/expr.py: Add assertion for union type
 'check_dict'
To: Markus Armbruster <armbru@redhat.com>
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-5-jsnow@redhat.com>
 <874ki169dg.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <7674da9a-2f71-7ec9-6a36-82826fc43e70@redhat.com>
Date: Wed, 24 Feb 2021 16:54:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <874ki169dg.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:35 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> mypy isn't fond of allowing you to check for bool membership in a
>> collection of str elements. Guard this lookup for precisely when we were
>> given a name.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 783282b53ce..138fab0711f 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -173,7 +173,9 @@ def check_type(value, info, source,
>>           raise QAPISemError(info,
>>                              "%s should be an object or type name" % source)
>>   
>> -    permit_upper = allow_dict in info.pragma.name_case_whitelist
>> +    permit_upper = False
>> +    if isinstance(allow_dict, str):
>> +        permit_upper = allow_dict in info.pragma.name_case_whitelist
>>   
>>       # value is a dictionary, check that each member is okay
>>       for (key, arg) in value.items():
> 
> Busy-work like this can make me doubt typing is worth the notational
> overhead.
> 

Or it's a good exercise in finding weird code smells. It was strange to 
promote an argument named "allow_dict" to actually store a name value, 
but it weren't me who did that.

> There must a less awkward way to plumb "upper case okay" through
> check_type() to check_name_is_str().  But we're typing what we have.
> 

I rather suspect that Schema is the place to do it instead of in 
expr.py, but I've been focused on getting the typing in instead of doing 
my weirder cleanups.

I'd like to remove Pragma stuff from expr.py entirely. Not a now-thing.

--js


