Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B933A66F3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 14:49:25 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsm1s-00013U-Qe
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 08:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lslyb-0005oY-QS
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lslyY-00035R-BD
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 08:46:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623674756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qtfZqD70BOg9OvwWNTm38Wki8kIeTyL6q30k5k0alY=;
 b=DA7ZFz7lbFz2sCi0+IpcBPu3pgcyPo09BvsktkK63Jt1Xk1JQoR820WjNqRutDU7NdeDjt
 w+nlwaAgJI8UE2BO/on2/gy3BivjLuCq7hwW2Cqcl8g4jd6IaEa9ope6yTZAj2iQov6h20
 EBaPLitqE78VBVLj3vr4oNq9S9FPYz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-ZRBdrYr4MVGfIvU9JZNj9g-1; Mon, 14 Jun 2021 08:45:54 -0400
X-MC-Unique: ZRBdrYr4MVGfIvU9JZNj9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D002980ED8D
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:45:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70AE060C0F;
 Mon, 14 Jun 2021 12:45:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F2190113865F; Mon, 14 Jun 2021 14:45:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 3/9] qapi: make gen_if/gen_endif take a simple string
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-4-marcandre.lureau@redhat.com>
Date: Mon, 14 Jun 2021 14:45:47 +0200
In-Reply-To: <20210608120723.2268181-4-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 8 Jun 2021 16:07:17 +0400")
Message-ID: <87zgvszkas.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Instead of building prepocessor conditions from a list of string, use
> the result generated from QAPISchemaIfCond.cgen().

I understand why you're doing this, but only because I know where you're
headed.  By itself, it is not an improvement: you move C generation out
of common.py into schema.py.  You need to explain why that's useful.

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/common.py     | 24 +++++++++++-------------
>  scripts/qapi/gen.py        |  4 ++--
>  scripts/qapi/introspect.py |  4 ++--
>  scripts/qapi/schema.py     |  3 +++
>  scripts/qapi/types.py      | 20 ++++++++++----------
>  scripts/qapi/visit.py      | 12 ++++++------
>  6 files changed, 34 insertions(+), 33 deletions(-)

Missing: qapi-code-gen.txt section "Configuring the schema" has an
example, which needs to be updated.

When the generated code changes, always check the examples, and always
consider describing the change in the commit message.

>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 6ad1eeb61d..c305aaf2f1 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -12,7 +12,7 @@
>  # See the COPYING file in the top-level directory.
> =20
>  import re
> -from typing import Match, Optional, Sequence
> +from typing import Match, Optional
> =20
> =20
>  #: Magic string that gets removed along with all space to its right.
> @@ -194,22 +194,20 @@ def guardend(name: str) -> str:
>                   name=3Dc_fname(name).upper())
> =20
> =20
> -def gen_if(ifcond: Sequence[str]) -> str:
> -    ret =3D ''
> -    for ifc in ifcond:
> -        ret +=3D mcgen('''
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
> index 77a8c33ad4..474b08fd4d 100644
> --- a/scripts/qapi/introspect.py
> +++ b/scripts/qapi/introspect.py
> @@ -124,10 +124,10 @@ def indent(level: int) -> str:
>          if obj.comment:
>              ret +=3D indent(level) + f"/* {obj.comment} */\n"
>          if obj.ifcond:
> -            ret +=3D gen_if(obj.ifcond.ifcond)
> +            ret +=3D gen_if(obj.ifcond.cgen())
>          ret +=3D _tree_to_qlit(obj.value, level)
>          if obj.ifcond:
> -            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)
> +            ret +=3D '\n' + gen_endif(obj.ifcond.cgen())
>          return ret
> =20
>      ret =3D ''
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index bc357ebbfa..aa4715c519 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -29,6 +29,9 @@ class QAPISchemaIfCond:
>      def __init__(self, ifcond=3DNone):
>          self.ifcond =3D ifcond or []
> =20
> +    def cgen(self):
> +        return ' && '.join(self.ifcond)

Fragile.  Better:

           return '(' + ') && ('.join(self.ifcond) + ')'

If we want to keep C generation details out of schema.py, we need a
helper mapping self.ifcond: Sequence[str] to C code, similar to how
QAPISchemaEntity.c_name() works with helper c_name().

> +
>      # Returns true if the condition is not void
>      def __bool__(self):
>          return bool(self.ifcond)
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 3673cf0f49..db9ff95bd1 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -51,13 +51,13 @@ def gen_enum_lookup(name: str,
>  ''',
>                  c_name=3Dc_name(name))
>      for memb in members:
> -        ret +=3D gen_if(memb.ifcond.ifcond)
> +        ret +=3D gen_if(memb.ifcond.cgen())
>          index =3D c_enum_const(name, memb.name, prefix)
>          ret +=3D mcgen('''
>          [%(index)s] =3D "%(name)s",
>  ''',
>                       index=3Dindex, name=3Dmemb.name)
> -        ret +=3D gen_endif(memb.ifcond.ifcond)
> +        ret +=3D gen_endif(memb.ifcond.cgen())
> =20
>      ret +=3D mcgen('''
>      },
[More of the same snipped...]


