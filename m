Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF296BDDD2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 01:55:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcyMD-0007C1-JJ; Thu, 16 Mar 2023 20:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyMB-0007Bt-5D
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 20:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyM8-0001mh-CI
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 20:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679014443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XFBTcZaDLZGBJHrtxU5zvBsSQuTxNg4CUcr/EPE0XTQ=;
 b=PgteEfiTogNcfz70a8FJk+KXYQIMAoVsRhfms81dl3SYZMIwJPs2Dhho2tbkrHNGhCyNBn
 fjOz1HZTqBI5Cs/zlCPjZQl9JMpIAxyDdhxQB4Z0QyixXLbYz1Ss6l253TM/nD6ExOM8uk
 zgWlkRImMok2xS09Qjy30QhJcP+/OAY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-tnzfQgjOMbCeyi0Qtu5syg-1; Thu, 16 Mar 2023 20:54:02 -0400
X-MC-Unique: tnzfQgjOMbCeyi0Qtu5syg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8F332814251;
 Fri, 17 Mar 2023 00:54:01 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CEE935453;
 Fri, 17 Mar 2023 00:54:00 +0000 (UTC)
Date: Thu, 16 Mar 2023 19:53:58 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 04/14] qapi: Split up check_type()
Message-ID: <20230317005358.54jculbr5h46u7xg@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-5-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316071325.492471-5-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Thu, Mar 16, 2023 at 08:13:15AM +0100, Markus Armbruster wrote:
> check_type() can check type names, arrays, and implicit struct types.
> Callers pass flags to select from this menu.  This makes the function
> somewhat hard to read.  Moreover, a few minor bugs are hiding in
> there, as we'll see shortly.
> 
> Split it into check_type_name(), check_type_name_or_implicit().  Each

You omitted check_type_name_or_array() in this summary

> of them is a copy of the original specialized to a certain set of
> flags.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/expr.py | 116 +++++++++++++++++++++++++------------------
>  1 file changed, 67 insertions(+), 49 deletions(-)

> 
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 59bdd86024..bc04bf34c2 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -333,62 +333,74 @@ def normalize_members(members: object) -> None:
>              members[key] = {'type': arg}
>  
>  
> -def check_type(value: Optional[object],
> -               info: QAPISourceInfo,
> -               source: str,
> -               allow_array: bool = False,
> -               allow_dict: Union[bool, str] = False) -> None:

There are few enough callers to see that they do indeed have exactly
one of (nearly) three call patterns.

> -    """
> -    Normalize and validate the QAPI type of ``value``.
> -
> -    Python types of ``str`` or ``None`` are always allowed.
> -
> -    :param value: The value to check.
> -    :param info: QAPI schema source file information.
> -    :param source: Error string describing this ``value``.
> -    :param allow_array:
> -        Allow a ``List[str]`` of length 1, which indicates an array of
> -        the type named by the list element.
> -    :param allow_dict:
> -        Allow a dict.  Its members can be struct type members or union
> -        branches.  When the value of ``allow_dict`` is in pragma
> -        ``member-name-exceptions``, the dict's keys may violate the
> -        member naming rules.  The dict members are normalized in place.
> -
> -    :raise QAPISemError: When ``value`` fails validation.
> -    :return: None, ``value`` is normalized in-place as needed.
> -    """
> +def check_type_name(value: Optional[object],
> +                    info: QAPISourceInfo, source: str) -> None:

check_type_name() replaces callers that relied on the default for
allow_array and allow_dict

> +    if value is None:

Loses out on the documentation.  Not sure how much that matters to
you?

> +        return
> +
> +    if isinstance(value, str):
> +        return
> +
> +    if isinstance(value, list):
> +        raise QAPISemError(info, "%s cannot be an array" % source)
> +
> +    raise QAPISemError(info, "%s should be a type name" % source)
> +
> +
> +def check_type_name_or_array(value: Optional[object],
> +                             info: QAPISourceInfo, source: str) -> None:

check_type_name_or_array() replaces all callers that passed
allow_array=True.

>      if value is None:

Another copy without documentation.

>          return
>  
> -    # Type name
>      if isinstance(value, str):
>          return
>  
> -    # Array type
>      if isinstance(value, list):
> -        if not allow_array:
> -            raise QAPISemError(info, "%s cannot be an array" % source)
>          if len(value) != 1 or not isinstance(value[0], str):
>              raise QAPISemError(info,
>                                 "%s: array type must contain single type name" %
>                                 source)
>          return
>  
> -    # Anonymous type
> +    raise QAPISemError(info,
> +                       "%s should be a type name" % source)
>  
> -    if not allow_dict:
> -        raise QAPISemError(info, "%s should be a type name" % source)
> +
> +def check_type_name_or_implicit(value: Optional[object],
> +                                info: QAPISourceInfo, source: str,
> +                                parent_name: Optional[str]) -> None:

And check_type_name_or_implicit replaces all callers that passed
allow_dict=str, where str is now the parent_name.  (Wow, that was an
odd overload of the parameter name - I like the split version better).

...
> @@ -560,10 +572,13 @@ def check_command(expr: QAPIExpression) -> None:
>      rets = expr.get('returns')
>      boxed = expr.get('boxed', False)
>  
> -    if boxed and args is None:
> -        raise QAPISemError(expr.info, "'boxed': true requires 'data'")
> -    check_type(args, expr.info, "'data'", allow_dict=not boxed)
> -    check_type(rets, expr.info, "'returns'", allow_array=True)
> +    if boxed:
> +        if args is None:
> +            raise QAPISemError(expr.info, "'boxed': true requires 'data'")
> +        check_type_name(args, expr.info, "'data'")
> +    else:
> +        check_type_name_or_implicit(args, expr.info, "'data'", None)

And this use of allow_dict was the weirdest, where it really does fit
better as calls into two separate functions.

With the fixed commit message, and with or without more function docs,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


