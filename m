Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EA36B84C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:50:16 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5N9-000805-G4
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Lj-0006jp-Db
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5Ld-00085U-Rp
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619459320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6TP1l8y7oxOvqf1vkxiEnBHQBfjgu5QNl1vvmW9Qas=;
 b=XKHMZ9faJsEdXsoDkfaI9Yvw3X817pTPiZhisHt1EPlvgksjjIVfqSr8GUuHfILh3Pdi6q
 PcK5MwaasfX+IeDmBWHTmaJTXuM0Y3NgWTnhcZDhoMmt9x2QjJCBlrhb3t6sqDYFkthqbs
 YLcbFeVoeTkKkBB3jKSn0oUroZvvLRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-LiQNUKkgOnuxLZLt0WDa5g-1; Mon, 26 Apr 2021 13:48:38 -0400
X-MC-Unique: LiQNUKkgOnuxLZLt0WDa5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9579B107ACCA;
 Mon, 26 Apr 2021 17:48:37 +0000 (UTC)
Received: from [10.10.120.13] (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FA875D9CD;
 Mon, 26 Apr 2021 17:48:36 +0000 (UTC)
Subject: Re: [PATCH 09/22] qapi: add match_nofail helper
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-10-jsnow@redhat.com>
 <871ray94un.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d955bda6-9b22-8e20-e6bd-90a777f833ab@redhat.com>
Date: Mon, 26 Apr 2021 13:48:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871ray94un.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 3:54 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Mypy cannot generally understand that these regex functions cannot
>> possibly fail. Add a _nofail helper that clarifies this for mypy.
> 
> Convention wants a blank line here.
> 

Tooling failure.

stg pop -a
while stg push; and stg edit --sign; done

(Will fix, but not so sure about fixing the tool...)

>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/common.py |  8 +++++++-
>>   scripts/qapi/main.py   |  6 ++----
>>   scripts/qapi/parser.py | 13 +++++++------
>>   3 files changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index cbd3fd81d36..d38c1746767 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -12,7 +12,7 @@
>>   # See the COPYING file in the top-level directory.
>>   
>>   import re
>> -from typing import Optional, Sequence
>> +from typing import Match, Optional, Sequence
>>   
>>   
>>   #: Magic string that gets removed along with all space to its right.
>> @@ -210,3 +210,9 @@ def gen_endif(ifcond: Sequence[str]) -> str:
>>   #endif /* %(cond)s */
>>   ''', cond=ifc)
>>       return ret
>> +
>> +
>> +def match_nofail(pattern: str, string: str) -> Match[str]:
>> +    match = re.match(pattern, string)
>> +    assert match is not None
>> +    return match
> 
> Name it must_match()?  You choose.
> 

If you think it reads genuinely better, sure.

> I wish we could have more stating typing with less notational overhead,
> but no free lunch...
> 
> [...]
> 


