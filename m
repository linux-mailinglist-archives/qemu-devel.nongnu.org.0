Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182083DD417
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 12:42:29 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAVOt-0002dc-JA
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 06:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAVNz-0001XZ-DQ
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAVNu-0001ds-A8
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627900885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guA+9SAVMxMHFBA31wUOCz8DUcujEgxtuSrCtCr3nfc=;
 b=VY4cuUODbf7VshuFSd/QbN9wfi1SR6Amce8T/sAmINrA5tIMCkb7Msz5sD5GkEIexvjK0m
 rMztP4y6deqkd0GRbtBNTA+4fFsMuu4i0oUrIGr9xalVo0u2MeWkpmL/noxZvtVZPb83OJ
 kZkZUo4KOP8gYUpXaanQNQHoxfik09o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-IicX8xkbMxqs8IlZvgcAQQ-1; Mon, 02 Aug 2021 06:41:23 -0400
X-MC-Unique: IicX8xkbMxqs8IlZvgcAQQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E597100A606
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 10:41:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B92161057F59;
 Mon,  2 Aug 2021 10:41:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F2C5911380A0; Mon,  2 Aug 2021 12:41:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v6 04/11] qapi: _make_enum_members() to work with
 pre-built QAPISchemaIfCond
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
 <20210618102507.3761128-5-marcandre.lureau@redhat.com>
Date: Mon, 02 Aug 2021 12:41:12 +0200
In-Reply-To: <20210618102507.3761128-5-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Fri, 18 Jun 2021 14:25:00 +0400")
Message-ID: <874kc8ruwn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Instead of lowering the expression back to its original form, and having
> to convert it again, special-case the 'if' condition to be pre-built.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/qapi/schema.py | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index e3bd8f8720..c35fa3bf51 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -982,8 +982,13 @@ def _make_features(self, features, info):
>                  for f in features]
> =20
>      def _make_enum_members(self, values, info):
> -        return [QAPISchemaEnumMember(v['name'], info,
> -                                     QAPISchemaIfCond(v.get('if')))
> +        def _get_if(v):
> +            ifcond =3D v.get('if')
> +            if isinstance(ifcond, QAPISchemaIfCond):
> +                return ifcond
> +            else:
> +                return QAPISchemaIfCond(ifcond)
> +        return [QAPISchemaEnumMember(v['name'], info, _get_if(v))
>                  for v in values]
> =20
>      def _make_implicit_enum_type(self, name, info, ifcond, values):
> @@ -1103,7 +1108,7 @@ def _def_union_type(self, expr, info, doc):
>                                            QAPISchemaIfCond(value.get('if=
')),
>                                            info)
>                  for (key, value) in data.items()]
> -            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in v=
ariants]
> +            enum =3D [{'name': v.name, 'if': v.ifcond} for v in variants=
]
>              typ =3D self._make_implicit_enum_type(name, info, ifcond, en=
um)
>              tag_member =3D QAPISchemaObjectTypeMember('type', info, typ,=
 False)
>              members =3D [tag_member]

I'm afraid I don't like this one.

Mapping from QAPISchemaIfCond back to the AST happens to be easy with
the current data structures, but you're right, it's not nice.

Stuffing the QAPISchemaIfCond into the AST is (in my opinion) worse:
it's a layering violation.

Let's take a step back and review what needs to be done here:

    for each simple union branch:
        create a simple variant
        create an implicit enum member
    and
        collect the variants in a list
        collect the enum members in a list

The code splits this work.  It first creates the list of variants from
the AST's simple union branches in @data:

            variants =3D [
                self._make_simple_variant(key, value['type'],
                                          QAPISchemaIfCond(value.get('if'))=
,
                                          info)
                for (key, value) in data.items()]

It then creates the list of enum of enum members from the list of
variants, *not* from the AST:

            enum =3D [{'name': v.name, 'if': v.ifcond.ifcond} for v in vari=
ants]

This dots into the QAPISchemaVariant.  Your patch makes this dotting
less deep.

Two solutions I'd dislike less:

1. Create the enum members from the AST, too.

2. Do nothing, and bank on the eventual removal of simple unions.

Minimizing ripple effects on the remainder of the series is of course a
concern.


