Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927383E1435
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 13:55:09 +0200 (CEST)
Received: from localhost ([::1]:40508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBbxs-0004Lm-M4
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 07:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBbwS-0002i6-Rk
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBbwP-00043O-L0
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 07:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628164416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLOR0MM5L5TePTpto0g3qhgiTtA2O6GHcrhX3nnhF/w=;
 b=YXoFhh65SkgaSJ5UykRFJPypjVCpSv3UP7lmHyb6TjIsHdLurv3pX2a+Zjv4sH5IfVzA+V
 R8ln3eTGlz511eXA9gzZwVAwIBUse5alSzMVgCRYfz5jqNleoRZBM10rzhAPbmocJNgbIs
 ZzgQ598t4/W0KgnvxUwM/YO1tQ6fzRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-DCSIWsyZMWad8sL5MtdmqQ-1; Thu, 05 Aug 2021 07:53:35 -0400
X-MC-Unique: DCSIWsyZMWad8sL5MtdmqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738E11008060
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 11:53:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0BBD5C1C5;
 Thu,  5 Aug 2021 11:53:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5C0FF11380A0; Thu,  5 Aug 2021 13:53:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 04/10] qapi: introduce QAPISchemaIfCond.cgen()
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-5-marcandre.lureau@redhat.com>
Date: Thu, 05 Aug 2021 13:53:29 +0200
In-Reply-To: <20210804083105.97531-5-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 4 Aug 2021 12:30:59 +0400")
Message-ID: <87o8ac9kg6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Instead of building prepocessor conditions from a list of string, use
> the result generated from QAPISchemaIfCond.cgen() and hide the
> implementation details.
>
> Note: this patch introduces a minor regression, generating a redundant
> pair of parenthesis. This is fixed in a later patch in this
> series ("qapi: replace if condition list with dict [..]")

Fixed in most, but not all instances, actually.  I can see some 50
remaining in generated qapi-*.[ch] at the end of this series.  Let's
s/fixed/mostly fixed/, and move on.

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/common.py     | 35 ++++++++++++++++++++++-------------
>  scripts/qapi/gen.py        |  4 ++--
>  scripts/qapi/introspect.py |  4 ++--
>  scripts/qapi/schema.py     |  5 ++++-
>  scripts/qapi/types.py      | 20 ++++++++++----------
>  scripts/qapi/visit.py      | 12 ++++++------
>  6 files changed, 46 insertions(+), 34 deletions(-)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 6ad1eeb61d..ba9fe14e4b 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -12,7 +12,12 @@
>  # See the COPYING file in the top-level directory.
> =20
>  import re
> -from typing import Match, Optional, Sequence
> +from typing import (
> +    List,
> +    Match,
> +    Optional,
> +    Union,
> +)
> =20
> =20
>  #: Magic string that gets removed along with all space to its right.
> @@ -194,22 +199,26 @@ def guardend(name: str) -> str:
>                   name=3Dc_fname(name).upper())
> =20
> =20
> -def gen_if(ifcond: Sequence[str]) -> str:
> -    ret =3D ''
> -    for ifc in ifcond:
> -        ret +=3D mcgen('''
> +def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
> +    if not ifcond:
> +        return ''
> +    return '(' + ') && ('.join(ifcond) + ')'
> +
> +
> +def gen_if(cond: str) -> str:
> +    if not cond:
> +        return ''
> +    return mcgen('''
>  #if %(cond)s
> -''', cond=3Difc)
> -    return ret
> +''', cond=3Dcond)
> =20
> =20
> -def gen_endif(ifcond: Sequence[str]) -> str:
> -    ret =3D ''
> -    for ifc in reversed(ifcond):
> -        ret +=3D mcgen('''
> +def gen_endif(cond: str) -> str:
> +    if not cond:
> +        return ''
> +    return mcgen('''
>  #endif /* %(cond)s */
> -''', cond=3Difc)
> -    return ret
> +''', cond=3Dcond)
> =20
> =20
>  def must_match(pattern: str, string: str) -> Match[str]:
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 1c5b190276..51a597a025 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str,=
 after: str) -> str:
>      if added[0] =3D=3D '\n':
>          out +=3D '\n'
>          added =3D added[1:]
> -    out +=3D gen_if(ifcond.ifcond)
> +    out +=3D gen_if(ifcond.cgen())
>      out +=3D added
> -    out +=3D gen_endif(ifcond.ifcond)
> +    out +=3D gen_endif(ifcond.cgen())
>      return out
> =20
> =20
> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
> index e23725e2f9..bd4233ecee 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -124,10 +124,10 @@ def indent(level: int) -> str:
>          if obj.comment:
>              ret +=3D indent(level) + f"/* {obj.comment} */\n"
>          if obj.ifcond.is_present():
> -            ret +=3D gen_if(obj.ifcond.ifcond)
> +            ret +=3D gen_if(obj.ifcond.cgen())
>          ret +=3D _tree_to_qlit(obj.value, level)
>          if obj.ifcond.is_present():
> -            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
> +            ret +=3D '\n' + gen_endif(obj.ifcond.cgen())
>          return ret
> =20
>      ret =3D ''
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 24caa4ad43..f018cfc511 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -19,7 +19,7 @@
>  import re
>  from typing import Optional
> =20
> -from .common import POINTER_SUFFIX, c_name
> +from .common import POINTER_SUFFIX, c_name, cgen_ifcond
>  from .error import QAPIError, QAPISemError, QAPISourceError
>  from .expr import check_exprs
>  from .parser import QAPISchemaParser
> @@ -29,6 +29,9 @@ class QAPISchemaIfCond:
>      def __init__(self, ifcond=3DNone):
>          self.ifcond =3D ifcond or []
> =20
> +    def cgen(self):
> +        return cgen_ifcond(self.ifcond)
> +
>      def is_present(self):
>          return bool(self.ifcond)
> =20

Possible improvement: have methods gen_if() and gen_endif(), so we can
replace

    gen_if(IFCOND.cgen())

and

    gen_endif(IFCOND.cgen())

by

    IFCOND.gen_if()

and

    IFCOND.gen_endif()

Can be done on top.

[...]


