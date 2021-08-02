Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914C3DD36F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:54:16 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAUeD-0006Kd-Rz
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAUcu-0005bN-2r
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAUcs-0002Fc-Ay
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627897969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFgVNMyrS1V6tPQUHRpt3fm0CkSZfc7Xy9KoGkCnTB4=;
 b=hF2ItxgCwXK+TxpLmTpimLPfpGn/n7SOwFcOwZPwBVbB6U1OrVrhzipd9eCTKtHyQYGbcY
 LXwUF2zTNn0A1mD/RVG7+g3dz86MYX+6YVRJyCT7GEcKasUfwkdJksnbfgfT6M3P5x5+mn
 CrapY6BbUesCGabQDmD/JKQERvKUtZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-8aqB9WlXNi-Zsmb57oZOLg-1; Mon, 02 Aug 2021 05:52:45 -0400
X-MC-Unique: 8aqB9WlXNi-Zsmb57oZOLg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BB168042EB
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 09:52:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C6D65F707;
 Mon,  2 Aug 2021 09:52:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9C0DA11380A0; Mon,  2 Aug 2021 11:52:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 03/11] qapi: add QAPISchemaIfCond.is_present()
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-4-marcandre.lureau@redhat.com>
Date: Mon, 02 Aug 2021 11:52:35 +0200
In-Reply-To: <20210618102507.3761128-4-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 18 Jun 2021 14:24:59 +0400")
Message-ID: <87pmuwrx5o.fsf@dusky.pond.sub.org>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/sphinx/qapidoc.py         | 8 ++++----
>  scripts/qapi/schema.py         | 7 +++++--
>  tests/qapi-schema/test-qapi.py | 2 +-
>  3 files changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index 0eac3308b2..511520f33f 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):
>              term.append(nodes.literal('', member.type.doc_type()))
>          if member.optional:
>              term.append(nodes.Text(' (optional)'))
> -        if member.ifcond.ifcond:
> +        if member.ifcond.is_present():
>              term.extend(self._nodes_for_ifcond(member.ifcond))
>          return term
> =20
> @@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, variant):
>                  nodes.literal('', variants.tag_member.name),
>                  nodes.Text(' is '),
>                  nodes.literal('', '"%s"' % variant.name)]
> -        if variant.ifcond.ifcond:
> +        if variant.ifcond.is_present():
>              term.extend(self._nodes_for_ifcond(variant.ifcond))
>          return term
> =20
> @@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):
>          dlnode =3D nodes.definition_list()
>          for section in doc.args.values():
>              termtext =3D [nodes.literal('', section.member.name)]
> -            if section.member.ifcond.ifcond:
> +            if section.member.ifcond.is_present():
>                  termtext.extend(self._nodes_for_ifcond(section.member.if=
cond))
>              # TODO drop fallbacks when undocumented members are outlawed
>              if section.text:
> @@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):
>      def _nodes_for_if_section(self, ifcond):
>          """Return list of doctree nodes for the "If" section"""
>          nodelist =3D []
> -        if ifcond.ifcond:
> +        if ifcond.is_present():
>              snode =3D self._make_section('If')
>              snode +=3D nodes.paragraph(
>                  '', '', *self._nodes_for_ifcond(ifcond, with_if=3DFalse)
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 5e44164bd1..e3bd8f8720 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -29,6 +29,9 @@ class QAPISchemaIfCond:
>      def __init__(self, ifcond=3DNone):
>          self.ifcond =3D ifcond or []
> =20
> +    def is_present(self):
> +        return bool(self.ifcond)
> +
> =20
>  class QAPISchemaEntity:
>      meta: Optional[str] =3D None
> @@ -599,7 +602,7 @@ def check(self, schema, seen):
>                      self.info,
>                      "discriminator member '%s' of %s must not be optiona=
l"
>                      % (self._tag_name, base))
> -            if self.tag_member.ifcond.ifcond:
> +            if self.tag_member.ifcond.is_present():
>                  raise QAPISemError(
>                      self.info,
>                      "discriminator member '%s' of %s must not be conditi=
onal"
> @@ -607,7 +610,7 @@ def check(self, schema, seen):
>          else:                   # simple union
>              assert isinstance(self.tag_member.type, QAPISchemaEnumType)
>              assert not self.tag_member.optional
> -            assert self.tag_member.ifcond.ifcond =3D=3D []
> +            assert not self.tag_member.ifcond.is_present()
>          if self._tag_name:    # flat union
>              # branches that are not explicitly covered get an empty type
>              cases =3D {v.name for v in self.variants}
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi=
.py
> index 7907b4ac3a..c92be2d086 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -94,7 +94,7 @@ def _print_variants(variants):
> =20
>      @staticmethod
>      def _print_if(ifcond, indent=3D4):
> -        if ifcond.ifcond:
> +        if ifcond.is_present():
>              print('%sif %s' % (' ' * indent, ifcond.ifcond))
> =20
>      @classmethod

In introspect.py:

        if obj.ifcond:
            ret +=3D gen_if(obj.ifcond.ifcond)
        ret +=3D _tree_to_qlit(obj.value, level)
        if obj.ifcond:
            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)

I believe the previous patch should change it to

        if obj.ifcond.ifcond:
            ret +=3D gen_if(obj.ifcond.ifcond)
        ret +=3D _tree_to_qlit(obj.value, level)
        if obj.ifcond.ifcond:
            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)

and this one to

        if obj.ifcond.is_present():
            ret +=3D gen_if(obj.ifcond.ifcond)
        ret +=3D _tree_to_qlit(obj.value, level)
        if obj.ifcond.is_present():
            ret +=3D '\n' + gen_endif(obj.ifcond.ifcond)

Other than that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


