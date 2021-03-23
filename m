Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971FC34658A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:42:37 +0100 (CET)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOk72-0005vu-JL
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjIP-0002Qj-Dw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjIN-0002U9-Hb
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616514614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ML7VtANVTwRHLlDUVB19le4J9ZCPFkjfw9RRPOItiE=;
 b=CmCNf/cKMsZOtjSJ0fWe2IM/mEeOuNXR8kGJu31K2oRK7UrwDywM/IXll88Cr9RpeCdSXF
 i3GA/QohmSRWp6SmBOVaX4zoQHC4B5Tey1OxffvSHMCpMvffwB0iE/1/XGoaJmRjsmj3NV
 tDkCZA2mRr+fnnq0zClqT3K6R8qtfHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-eltYDJ4zOjispJXk6LuHWg-1; Tue, 23 Mar 2021 11:50:11 -0400
X-MC-Unique: eltYDJ4zOjispJXk6LuHWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 525C210866A5;
 Tue, 23 Mar 2021 15:50:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A1B60BE5;
 Tue, 23 Mar 2021 15:50:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 271A311327E1; Tue, 23 Mar 2021 16:50:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 07/28] qapi: Fix to reject optional members with
 reserved names
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-8-armbru@redhat.com>
 <42dad810-715d-1dba-2476-b730422101c0@redhat.com>
Date: Tue, 23 Mar 2021 16:50:06 +0100
In-Reply-To: <42dad810-715d-1dba-2476-b730422101c0@redhat.com> (John Snow's
 message of "Tue, 23 Mar 2021 09:27:25 -0400")
Message-ID: <87czvpq381.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>> check_type() fails to reject optional members with reserved names,
>> because it neglects to strip off the leading '*'.  Fix that.
>> The stripping in check_name_str() is now useless.  Drop.
>> Also drop the "no leading '*'" assertion, because valid_name.match()
>> ensures it can't fail.
>> 
>
> (Yep, I noticed that, but assumed that it made someone feel safe, so I
> left it!)

I added it myself.  I guess it made me feel safer back then :)

>> Fixes: 9fb081e0b98409556d023c7193eeb68947cd1211
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   scripts/qapi/expr.py                     |  9 ++++-----
>>   tests/qapi-schema/reserved-member-u.err  |  2 ++
>>   tests/qapi-schema/reserved-member-u.json |  1 -
>>   tests/qapi-schema/reserved-member-u.out  | 14 --------------
>>   4 files changed, 6 insertions(+), 20 deletions(-)
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 2fcaaa2497..cf09fa9fd3 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -34,12 +34,10 @@ def check_name_is_str(name, info, source):
>>     
>>   def check_name_str(name, info, source,
>> -                   allow_optional=False, enum_member=False,
>> +                   enum_member=False,
>
> I guess we now assume here (in this function) that '*' is /never/ allowed.

Correct.

>>                      permit_upper=False):
>>       membername = name
>>   -    if allow_optional and name.startswith('*'):
>> -        membername = name[1:]
>>       # Enum members can start with a digit, because the generated C
>>       # code always prefixes it with the enum name
>>       if enum_member and membername[0].isdigit():
>> @@ -52,7 +50,6 @@ def check_name_str(name, info, source,
>>       if not permit_upper and name.lower() != name:
>>           raise QAPISemError(
>>               info, "%s uses uppercase in name" % source)
>> -    assert not membername.startswith('*')
>>     
>>   def check_defn_name_str(name, info, meta):
>> @@ -171,8 +168,10 @@ def check_type(value, info, source,
>>       # value is a dictionary, check that each member is okay
>>       for (key, arg) in value.items():
>>           key_source = "%s member '%s'" % (source, key)
>> +        if key.startswith('*'):
>> +            key = key[1:]
>
> And we'll strip it out up here instead...
>
>>           check_name_str(key, info, key_source,
>> -                       allow_optional=True, permit_upper=permit_upper)
>> +                       permit_upper=permit_upper)
>
> Which makes that check the same, but
>
>>           if c_name(key, False) == 'u' or c_name(key, False).startswith('has_'):
>>               raise QAPISemError(info, "%s uses reserved name" % key_source)
>
> This check now behaves differently, fixing the bug.

Right again.

> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks!

> (assuming that this was tested and didn't break something /else/ I
> haven't considered.)

Fortunately, tests/qapi-schema is reasonably comprehensive.


