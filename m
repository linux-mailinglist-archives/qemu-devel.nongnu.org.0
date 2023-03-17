Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4826BE0B1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 06:37:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd2lF-0001dF-2n; Fri, 17 Mar 2023 01:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd2lA-0001bf-RS
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pd2l8-0002hQ-JX
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 01:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679031368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iniah2iqu1HNbT36rL2B65yvZMU47HenOeuglc0fU+8=;
 b=Itgyhg+FFbNx/EFqCAxH2DgGYB40whFZUNu+OFTyGf5tnkW1NsGok1nLF/Ao/REQmfbUd9
 Jn0hXs04Pn3oMCIZ7FkKjYvmAC/piEaFv2rP3pYrf0mWBcreXovZRR9uCpTqzJpa98PGHb
 XMpMYBGXbwMLRyhlux25ET9ZNNmZfd4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-3P1vIEJhNSOf5tFblve6Tw-1; Fri, 17 Mar 2023 01:36:05 -0400
X-MC-Unique: 3P1vIEJhNSOf5tFblve6Tw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE0A2185A78B;
 Fri, 17 Mar 2023 05:36:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D1A7492B00;
 Fri, 17 Mar 2023 05:36:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9036021E681C; Fri, 17 Mar 2023 06:36:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,
 marcandre.lureau@redhat.com,  berrange@redhat.com,  jsnow@redhat.com
Subject: Re: [PATCH 04/14] qapi: Split up check_type()
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-5-armbru@redhat.com>
 <20230317005358.54jculbr5h46u7xg@redhat.com>
Date: Fri, 17 Mar 2023 06:36:03 +0100
In-Reply-To: <20230317005358.54jculbr5h46u7xg@redhat.com> (Eric Blake's
 message of "Thu, 16 Mar 2023 19:53:58 -0500")
Message-ID: <873564os70.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Eric Blake <eblake@redhat.com> writes:

> On Thu, Mar 16, 2023 at 08:13:15AM +0100, Markus Armbruster wrote:
>> check_type() can check type names, arrays, and implicit struct types.
>> Callers pass flags to select from this menu.  This makes the function
>> somewhat hard to read.  Moreover, a few minor bugs are hiding in
>> there, as we'll see shortly.
>> 
>> Split it into check_type_name(), check_type_name_or_implicit().  Each
>
> You omitted check_type_name_or_array() in this summary

Oops!

>> of them is a copy of the original specialized to a certain set of
>> flags.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  scripts/qapi/expr.py | 116 +++++++++++++++++++++++++------------------
>>  1 file changed, 67 insertions(+), 49 deletions(-)
>
>> 
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 59bdd86024..bc04bf34c2 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -333,62 +333,74 @@ def normalize_members(members: object) -> None:
>>              members[key] = {'type': arg}
>>  
>>  
>> -def check_type(value: Optional[object],
>> -               info: QAPISourceInfo,
>> -               source: str,
>> -               allow_array: bool = False,
>> -               allow_dict: Union[bool, str] = False) -> None:
>
> There are few enough callers to see that they do indeed have exactly
> one of (nearly) three call patterns.
>
>> -    """
>> -    Normalize and validate the QAPI type of ``value``.
>> -
>> -    Python types of ``str`` or ``None`` are always allowed.
>> -
>> -    :param value: The value to check.
>> -    :param info: QAPI schema source file information.
>> -    :param source: Error string describing this ``value``.
>> -    :param allow_array:
>> -        Allow a ``List[str]`` of length 1, which indicates an array of
>> -        the type named by the list element.
>> -    :param allow_dict:
>> -        Allow a dict.  Its members can be struct type members or union
>> -        branches.  When the value of ``allow_dict`` is in pragma
>> -        ``member-name-exceptions``, the dict's keys may violate the
>> -        member naming rules.  The dict members are normalized in place.
>> -
>> -    :raise QAPISemError: When ``value`` fails validation.
>> -    :return: None, ``value`` is normalized in-place as needed.
>> -    """
>> +def check_type_name(value: Optional[object],
>> +                    info: QAPISourceInfo, source: str) -> None:
>
> check_type_name() replaces callers that relied on the default for
> allow_array and allow_dict

Yes.

>> +    if value is None:
>
> Loses out on the documentation.  Not sure how much that matters to
> you?

You mean the doc string?

I could copy and specialize it along with the code, but the new function
is so simple...  not sure it's worth explaining.

>> +        return
>> +
>> +    if isinstance(value, str):
>> +        return
>> +
>> +    if isinstance(value, list):
>> +        raise QAPISemError(info, "%s cannot be an array" % source)
>> +
>> +    raise QAPISemError(info, "%s should be a type name" % source)
>> +
>> +
>> +def check_type_name_or_array(value: Optional[object],
>> +                             info: QAPISourceInfo, source: str) -> None:
>
> check_type_name_or_array() replaces all callers that passed
> allow_array=True.

Yes.

>>      if value is None:
>
> Another copy without documentation.

Same doubts.

>>          return
>>  
>> -    # Type name
>>      if isinstance(value, str):
>>          return
>>  
>> -    # Array type
>>      if isinstance(value, list):
>> -        if not allow_array:
>> -            raise QAPISemError(info, "%s cannot be an array" % source)
>>          if len(value) != 1 or not isinstance(value[0], str):
>>              raise QAPISemError(info,
>>                                 "%s: array type must contain single type name" %
>>                                 source)
>>          return
>>  
>> -    # Anonymous type
>> +    raise QAPISemError(info,
>> +                       "%s should be a type name" % source)
>>  
>> -    if not allow_dict:
>> -        raise QAPISemError(info, "%s should be a type name" % source)
>> +
>> +def check_type_name_or_implicit(value: Optional[object],
>> +                                info: QAPISourceInfo, source: str,
>> +                                parent_name: Optional[str]) -> None:
>
> And check_type_name_or_implicit replaces all callers that passed
> allow_dict=str, where str is now the parent_name.

Yes.

>                                                    (Wow, that was an
> odd overload of the parameter name - I like the split version better).

It was less bad than what it replaced :)

Commit 638c4af9310 (qapi: Clean up member name case checking)

> ...
>> @@ -560,10 +572,13 @@ def check_command(expr: QAPIExpression) -> None:
>>      rets = expr.get('returns')
>>      boxed = expr.get('boxed', False)
>>  
>> -    if boxed and args is None:
>> -        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
>> -    check_type(args, expr.info, "'data'", allow_dict=not boxed)
>> -    check_type(rets, expr.info, "'returns'", allow_array=True)
>> +    if boxed:
>> +        if args is None:
>> +            raise QAPISemError(expr.info, "'boxed': true requires 'data'")
>> +        check_type_name(args, expr.info, "'data'")
>> +    else:
>> +        check_type_name_or_implicit(args, expr.info, "'data'", None)
>
> And this use of allow_dict was the weirdest, where it really does fit
> better as calls into two separate functions.
>
> With the fixed commit message, and with or without more function docs,
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


