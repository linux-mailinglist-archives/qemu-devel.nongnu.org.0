Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C2349439
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:35:15 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPR4s-0007xR-V7
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPR3W-00072I-Kj
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:33:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPR3S-0003xf-8k
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616682824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CrNaFuGbYd/PX0IbfcEIdvvfXNuPwmycEzKhkP7uCJU=;
 b=P1ayVd0bISisREkE5uFZ4Pqt72L5N4iAF3xf8vWqI/edDl3LCvV3TlRqsyjEANYz+6jThn
 JhGA0/+DcyrWNYY7zJ5tGvXe7drELJ9blH7dQUvk36hXHUBb0nrMJgI71T9waFnhm6Kg3r
 bKSd4yJe6e9CHqAot4CBQWJFNmEGu9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-K-7htMZrOMO379SV-_lJeA-1; Thu, 25 Mar 2021 10:33:42 -0400
X-MC-Unique: K-7htMZrOMO379SV-_lJeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C16108BD08;
 Thu, 25 Mar 2021 14:33:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 205755C241;
 Thu, 25 Mar 2021 14:33:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA55311327E1; Thu, 25 Mar 2021 15:33:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 10/19] qapi/expr.py: Add casts in a few select cases
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-11-jsnow@redhat.com>
Date: Thu, 25 Mar 2021 15:33:39 +0100
In-Reply-To: <20210325060356.4040114-11-jsnow@redhat.com> (John Snow's message
 of "Thu, 25 Mar 2021 02:03:47 -0400")
Message-ID: <87mturs3p8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Casts are instructions to the type checker only, they aren't "safe" and
> should probably be avoided in general. In this case, when we perform
> type checking on a nested structure, the type of each field does not
> "stick".
>
> (See PEP 647 for an example of "type narrowing" that does "stick".
>  It is available in Python 3.10, so we can't use it yet.)
>
> We don't need to assert that something is a str if we've already checked
> or asserted that it is -- use a cast instead for these cases.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index ca5ab7bfda..505e67bd21 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -15,7 +15,7 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> -from typing import Dict, Optional
> +from typing import Dict, Optional, cast
>  
>  from .common import c_name
>  from .error import QAPISemError
> @@ -259,7 +259,7 @@ def check_enum(expr, info):
>  
>  
>  def check_struct(expr, info):
> -    name = expr['struct']
> +    name = cast(str, expr['struct'])  # Asserted in check_exprs

"Asserted" suggests an an assert statement.  It's actually the
check_name_is_str() visible in the last hunk.  What about "Checked in
check_exprs()" or "Ensured by check_exprs()"?

>      members = expr['data']
>  
>      check_type(members, info, "'data'", allow_dict=name)
> @@ -267,7 +267,7 @@ def check_struct(expr, info):
>  
>  
>  def check_union(expr, info):
> -    name = expr['union']
> +    name = cast(str, expr['union'])  # Asserted in check_exprs
>      base = expr.get('base')
>      discriminator = expr.get('discriminator')
>      members = expr['data']
> @@ -366,8 +366,8 @@ def check_exprs(exprs):
>          else:
>              raise QAPISemError(info, "expression is missing metatype")
>  
> -        name = expr[meta]
> -        check_name_is_str(name, info, "'%s'" % meta)
> +        check_name_is_str(expr[meta], info, "'%s'" % meta)
> +        name = cast(str, expr[meta])
>          info.set_defn(meta, name)
>          check_defn_name_str(name, info, meta)


