Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D564A323A18
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:03:28 +0100 (CET)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEr0x-0006SH-RB
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEqzT-0005Ck-DQ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:01:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lEqzR-0003sG-O2
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614160911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ejVudsJXspqUxTOAYbn3n9SXMyQuEZ7//JZ4/7B7EMQ=;
 b=RWmgIHiYTlq8NruS+gDpPrksKlcC7m3MSHqG15fUZpZOLCxB9kyzlyzqQfo97k0zvAl3D4
 A4D6ChQ5eHYcZ+gDlb2JwZA+MA1bJyNakFRXn5jSFG2B1n7n/VqpiSNRHIM01tkVK3oTV5
 fzYfgwneZUeT3OTrCjxAWHt5QEpV/lc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-Z3snQ3kZMxyyzrswY0Q-Zw-1; Wed, 24 Feb 2021 05:01:49 -0500
X-MC-Unique: Z3snQ3kZMxyyzrswY0Q-Zw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6299618BA28A;
 Wed, 24 Feb 2021 10:01:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE4619C46;
 Wed, 24 Feb 2021 10:01:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A000D113860F; Wed, 24 Feb 2021 11:01:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 03/16] qapi/expr.py: constrain incoming expression types
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-4-jsnow@redhat.com>
Date: Wed, 24 Feb 2021 11:01:46 +0100
In-Reply-To: <20210223003408.964543-4-jsnow@redhat.com> (John Snow's message
 of "Mon, 22 Feb 2021 19:33:55 -0500")
Message-ID: <8735xl7pit.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> mypy does not know the types of values stored in Dicts that masquerade
> as objects. Help the type checker out by constraining the type.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> ---
>  scripts/qapi/expr.py | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 5694c501fa3..783282b53ce 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -15,9 +15,17 @@
>  # See the COPYING file in the top-level directory.
>  
>  import re
> +from typing import MutableMapping, Optional
>  
>  from .common import c_name
>  from .error import QAPISemError
> +from .parser import QAPIDoc
> +from .source import QAPISourceInfo
> +
> +
> +# Expressions in their raw form are JSON-like structures with arbitrary forms.
> +# Minimally, their top-level form must be a mapping of strings to values.
> +Expression = MutableMapping[str, object]

MutableMapping, fancy.  It's only ever dict.  Why abstract from that?

The use of object is again owed to mypy's inability to do recursive
types.  What we really have here is something like

   Expression = Union[bool, str, dict[str, Expression], list[Expression]]

with the root further constrained to the Union's dict branch.  Spell
that out in a bit more detail, like you did in introspect.py?

Hmm, there you used Any, not object.  I guess that's because mypy lets
you get away with object here, but not there.  Correct?

Also, PEP 8 comment line length.

>  
>  
>  # Names must be letters, numbers, -, and _.  They must start with letter,
> @@ -287,9 +295,20 @@ def check_event(expr, info):
>  
>  def check_exprs(exprs):
>      for expr_elem in exprs:
> -        expr = expr_elem['expr']
> -        info = expr_elem['info']
> -        doc = expr_elem.get('doc')
> +        # Expression
> +        assert isinstance(expr_elem['expr'], dict)
> +        for key in expr_elem['expr'].keys():
> +            assert isinstance(key, str)
> +        expr: Expression = expr_elem['expr']

You're fine with repeating exp_elem['expr'] here, and ...

> +
> +        # QAPISourceInfo
> +        assert isinstance(expr_elem['info'], QAPISourceInfo)
> +        info: QAPISourceInfo = expr_elem['info']

... expr_elem['info'] here, but ...

> +
> +        # Optional[QAPIDoc]
> +        tmp = expr_elem.get('doc')
> +        assert tmp is None or isinstance(tmp, QAPIDoc)
> +        doc: Optional[QAPIDoc] = tmp

... you avoid repetition of expr_elem.get('doc') here.  Any particular
reason?

>  
>          if 'include' in expr:
>              continue


