Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB336BDDE5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 02:03:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcyUu-00021N-B4; Thu, 16 Mar 2023 21:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyUr-000210-Qd
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:03:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pcyUq-0006Yy-5r
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 21:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679014983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xqf41vW3/ZnNUHgajPcYeqjKtIKgPp25cbsBqx1Zb1g=;
 b=aZeCEahqZBCDrb7agPO7qooROqx0vHWz7B2JEQwRWqd3lHJMQ13Rp1pe42y0V3ACriM4lt
 XUIhb8KHHZWOeYJULISmllhsANcMRmRRU5zT4Lc30mvggrsBQ85WqzwP1qTs4UlQtpKO76
 nzFqKox1pgd9c9cD4gdMiR6Xsq5o02M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-mpwSF3_gNDucZy3UPsN06A-1; Thu, 16 Mar 2023 21:03:01 -0400
X-MC-Unique: mpwSF3_gNDucZy3UPsN06A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E27D21C0782B;
 Fri, 17 Mar 2023 01:03:00 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FFDE1121315;
 Fri, 17 Mar 2023 01:03:00 +0000 (UTC)
Date: Thu, 16 Mar 2023 20:02:58 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, jsnow@redhat.com
Subject: Re: [PATCH 08/14] qapi: Fix to reject 'data': 'mumble' in struct
Message-ID: <20230317010258.c3nlbx3og26prfu3@redhat.com>
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-9-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316071325.492471-9-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Thu, Mar 16, 2023 at 08:13:19AM +0100, Markus Armbruster wrote:
> A struct's 'data' must be a JSON object defining the struct's members.
> The QAPI code generator incorrectly accepts a JSON string instead, and
> then crashes in QAPISchema._make_members() called from
> ._def_struct_type().
> 
> Fix to reject it, and add a test case.

Nice catch; I see why the split into three functions earlier on
foreshadowed some subtle bug fixes to come.

> +++ b/scripts/qapi/expr.py
> @@ -354,14 +354,14 @@ def check_type_name_or_array(value: Optional[object],
>                             source)
>  
>  
> -def check_type_name_or_implicit(value: Optional[object],
> -                                info: QAPISourceInfo, source: str,
> -                                parent_name: Optional[str]) -> None:
> +def check_type_implicit(value: Optional[object],
> +                        info: QAPISourceInfo, source: str,
> +                        parent_name: Optional[str]) -> None:

At first I thought this was a straight rename...

>      """
>      Normalize and validate an optional implicit struct type.
>  
> -    Accept ``None``, ``str``, or a ``dict`` defining an implicit
> -    struct type.  The latter is normalized in place.
> +    Accept ``None`` or a ``dict`` defining an implicit struct type.
> +    The latter is normalized in place.
>  
>      :param value: The value to check.
>      :param info: QAPI schema source file information.
> @@ -377,9 +377,6 @@ def check_type_name_or_implicit(value: Optional[object],
>      if value is None:
>          return
>  
> -    if isinstance(value, str):
> -        return
> -
>      if not isinstance(value, dict):
>          raise QAPISemError(info,
>                             "%s should be an object or type name" % source)
> @@ -401,6 +398,15 @@ def check_type_name_or_implicit(value: Optional[object],
>          check_type_name_or_array(arg['type'], info, key_source)
>  
>  
> +def check_type_name_or_implicit(value: Optional[object],
> +                                info: QAPISourceInfo, source: str,
> +                                parent_name: Optional[str]) -> None:
> +    if value is None or isinstance(value, str):

...until I got here and saw that you kept the original name, and added
a new helper.  Worth calling out the new function name
check_type_implicit() in the commit message?  It would have spared me
a minute.

As earlier, you lost the doc comment.  I'll leave it to your
discretion if it is important to copy one back in.

> +        return
> +
> +    check_type_implicit(value, info, source, parent_name)
> +
> +
>  def check_features(features: Optional[object],
>                     info: QAPISourceInfo) -> None:
>      """
> @@ -486,7 +492,7 @@ def check_struct(expr: QAPIExpression) -> None:
>      name = cast(str, expr['struct'])  # Checked in check_exprs
>      members = expr['data']
>  
> -    check_type_name_or_implicit(members, expr.info, "'data'", name)
> +    check_type_implicit(members, expr.info, "'data'", name)
>      check_type_name(expr.get('base'), expr.info, "'base'")
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


