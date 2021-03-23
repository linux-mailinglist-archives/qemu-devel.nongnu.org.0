Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03E23465BC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:56:05 +0100 (CET)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkK4-0000jK-N3
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjjc-00011W-LE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOjja-00017e-Ik
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9dqheHzJ1QuvhYZESHLqzY1lXJquGLNun1xEuevCcmQ=;
 b=Sd25pAGxT0GcFHZTyTIC1GwhUokwNslmABA0XNtGX+rWHvIQakh0DCIkW/K6mFHe+x5QLo
 CnumeeJ5tVjUMkb7DYd9bejurSgjrZCkkKc8+UjRjUU9VbSe9vLt/AdNQe0Scoqcyqavgk
 rDbzLFechn31NFPYXz+XWRC/s/nkGbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-r7G5Jh3tMT6vsCxOgvUVgA-1; Tue, 23 Mar 2021 12:18:17 -0400
X-MC-Unique: r7G5Jh3tMT6vsCxOgvUVgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3E1484B9A3;
 Tue, 23 Mar 2021 16:18:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6FF02B0D6;
 Tue, 23 Mar 2021 16:18:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4AD5611327E1; Tue, 23 Mar 2021 17:18:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 08/28] qapi: Support flat unions tag values with leading
 digit
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-9-armbru@redhat.com>
 <b84d5e36-de4a-9178-43d1-7a9e489e7b6c@redhat.com>
Date: Tue, 23 Mar 2021 17:18:11 +0100
In-Reply-To: <b84d5e36-de4a-9178-43d1-7a9e489e7b6c@redhat.com> (John Snow's
 message of "Tue, 23 Mar 2021 10:49:17 -0400")
Message-ID: <8735wlq1x8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>> Flat union tag values get checked twice: as enum member name, and as
>> union branch name.  The former accepts leading digits, the latter
>> doesn't.  The restriction feels arbitrary.  Skip the latter check.
>> This can expose c_name() to input it can't handle: a name starting
>> with a digit.  Improve it to return a valid C identifier for any
>> input.
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Anything in particular inspire this?

Just a desire for keeping things simple.  "Any enum type works as
discriminator" is simpler than "any enum works, but branches
corresponding to enum values starting with a digit cannot have members".
Let me elaborate.

This works:

    {'enum': 'Enu', 'data': ['0', 'eins', '2']}
    {'struct': 'St', 'data': {'s': 'str'}}
    {'union': 'Uni',
     'base': {'type': 'Enu'},
     'discriminator': 'type',
     'data': {
       'eins': 'St'}}

But if you change the last line to

       '0': 'St'}}

you get told off:

    scripts/qapi-gen.py: /dev/stdin: In union 'Uni':
    /dev/stdin:3: 'data' member '0' has an invalid name

>
>> ---
>>   scripts/qapi/common.py | 8 ++++----
>>   scripts/qapi/expr.py   | 4 +++-
>>   2 files changed, 7 insertions(+), 5 deletions(-)
>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index 11b86beeab..cbd3fd81d3 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -18,7 +18,6 @@
>>   #: Magic string that gets removed along with all space to its right.
>>   EATSPACE = '\033EATSPACE.'
>>   POINTER_SUFFIX = ' *' + EATSPACE
>> -_C_NAME_TRANS = str.maketrans('.-', '__')
>>     
>>   def camel_to_upper(value: str) -> str:
>> @@ -109,9 +108,10 @@ def c_name(name: str, protect: bool = True) -> str:
>>                        'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
>>       # namespace pollution:
>>       polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
>> -    name = name.translate(_C_NAME_TRANS)
>> -    if protect and (name in c89_words | c99_words | c11_words | gcc_words
>> -                    | cpp_words | polluted_words):
>> +    name = re.sub(r'[^A-Za-z0-9_]', '_', name)
>
> The regex gets a little more powerful now. Instead of just . and - we
> now translate *everything* that's not an alphanumeric to _.

Yes.

> Does this have a visible impact anywhere, or are we constrained
> somewhere else?

If it had, we'd generate C that doesn't compile.  Except when we're
unlucky.  Then it compiles, but means something different than we want.

I need to catch "C identifiers can't start with a digit" to make the
remainder of the patch work (right below).  Instead of doing just that,
I chose to do a complete job, and ensure the function always returns a
valid C identifier.

>> +    if protect and (name in (c89_words | c99_words | c11_words | gcc_words
>> +                             | cpp_words | polluted_words)
>> +                    or name[0].isdigit()):
>
> Worth touching the docstring?
>
> :param protect: If true, avoid returning certain ticklish identifiers 
>                 (like C keywords) by prepending ``q_``. 

It doesn't become wrong.  Care to suggest an improvement?

> I know the formatting is a hot mess, but I still intend to get to that
> "all at once" with an "enable sphinx" pass later, so just touching the 
> content so it gets included in that pass would be fine (to me, at least.)
>
>>           return 'q_' + name
>>       return name
>>   diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index cf09fa9fd3..507550c340 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -246,7 +246,9 @@ def check_union(expr, info):
>>         for (key, value) in members.items():
>>           source = "'data' member '%s'" % key
>> -        check_name_str(key, info, source)
>> +        if discriminator is None:
>> +            check_name_str(key, info, source)
>> +        # else: name is in discriminator enum, which gets checked
>
> I suppose the alternative would be to have allowed check_name_str to
> take an 'allow_leading_digits' parameter (instead of 'enum_member')
> and set that to true here and just deal with the mild inefficiency.
>
> I might have a slight preference to just accept the inefficiency so
> that it's obvious that it's checked regardless of the discriminator 
> condition, buuuuut not enough to be pushy about it, I think.

Sounds like a defensible idea, but this series is heading in the
opposite direction; see the next few patches.

>>           check_keys(value, info, source, ['type'], ['if'])
>>           check_if(value, info, source)
>>           check_type(value['type'], info, source, allow_array=not base)
>> 


