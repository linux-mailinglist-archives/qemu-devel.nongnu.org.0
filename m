Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721E349CED
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 00:34:33 +0100 (CET)
Received: from localhost ([::1]:57524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPZUm-0004wZ-HA
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 19:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPZTE-0004AK-3Q
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPZT9-00041B-V0
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 19:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616715168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4yngWWBir7exyAFsPwgl75UVzW72Eac1Oq3PYNY1JMc=;
 b=EjjEf7+Uz4Tmk6X/WnP318THQTmFpY0L4kOQZA03ypyNgCZU+Dq4dYFeBYGSTXWCCQRT4f
 0cR/j5e33hWDqKDnE0bV08waWCNNuoXgF6VauBfqj+ha0xdiSdQLYefgWW5CAmV7dWUX0o
 b5Wdh93cFBvn05xpTzAeiqDg7moDvjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-H4Q4Tx_sNjqbGhVCSEzsbg-1; Thu, 25 Mar 2021 19:32:46 -0400
X-MC-Unique: H4Q4Tx_sNjqbGhVCSEzsbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92D06501E0;
 Thu, 25 Mar 2021 23:32:45 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CAFE5D9CA;
 Thu, 25 Mar 2021 23:32:45 +0000 (UTC)
Subject: Re: [PATCH v4 10/19] qapi/expr.py: Add casts in a few select cases
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-11-jsnow@redhat.com>
 <87mturs3p8.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <5ee87276-ed28-30dd-ff51-b81443d71b7b@redhat.com>
Date: Thu, 25 Mar 2021 19:32:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87mturs3p8.fsf@dusky.pond.sub.org>
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

On 3/25/21 10:33 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Casts are instructions to the type checker only, they aren't "safe" and
>> should probably be avoided in general. In this case, when we perform
>> type checking on a nested structure, the type of each field does not
>> "stick".
>>
>> (See PEP 647 for an example of "type narrowing" that does "stick".
>>   It is available in Python 3.10, so we can't use it yet.)
>>
>> We don't need to assert that something is a str if we've already checked
>> or asserted that it is -- use a cast instead for these cases.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index ca5ab7bfda..505e67bd21 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -15,7 +15,7 @@
>>   # See the COPYING file in the top-level directory.
>>   
>>   import re
>> -from typing import Dict, Optional
>> +from typing import Dict, Optional, cast
>>   
>>   from .common import c_name
>>   from .error import QAPISemError
>> @@ -259,7 +259,7 @@ def check_enum(expr, info):
>>   
>>   
>>   def check_struct(expr, info):
>> -    name = expr['struct']
>> +    name = cast(str, expr['struct'])  # Asserted in check_exprs
> 
> "Asserted" suggests an an assert statement.  It's actually the
> check_name_is_str() visible in the last hunk.  What about "Checked in
> check_exprs()" or "Ensured by check_exprs()"?
> 

I missed these. "Checked" is fine.


