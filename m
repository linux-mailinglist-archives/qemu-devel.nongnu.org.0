Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7F6EE1A7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:10:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHTj-0000nt-EO; Tue, 25 Apr 2023 08:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prHTg-0000nE-HL
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prHTe-0001Um-Io
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682424529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:resent-to:
 resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references; 
 bh=GDvnadVPpEzrC3qMNGyLeVAeNob+n655pOBx4DP6yQ8=;
 b=JakyAFYLyGYwgviRHoJpJLxlzSJ45xIxEWRVGa8IpaecL4uId/Zlti5r+zbg46cVHQY0LU
 E0G2I+3zl0tlPdYK1Morn1ZOn1G6RlkPjmys/gKv9gv9v+ElwqahKVtB7AJy1vPAJ2wxTb
 7nWJnjtbq2jf2NMZffHzxuri2uSQX/4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-DMRNrO7gO0KCQoRkWQhEXg-1; Tue, 25 Apr 2023 08:08:46 -0400
X-MC-Unique: DMRNrO7gO0KCQoRkWQhEXg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF9A0280A32A;
 Tue, 25 Apr 2023 12:08:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89CC42027043;
 Tue, 25 Apr 2023 12:08:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9458321F1672; Tue, 25 Apr 2023 14:08:44 +0200 (CEST)
Resent-To: berrange@redhat.com, qemu-devel@nongnu.org, het.gala@nutanix.com,
 eblake@redhat.com, michael.roth@amd.com
Resent-From: Markus Armbruster <armbru@redhat.com>
Resent-Date: Tue, 25 Apr 2023 14:08:44 +0200
Resent-Message-ID: <87h6t4w4dv.fsf@pond.sub.org>
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  Het Gala <het.gala@nutanix.com>,  Eric Blake
 <eblake@redhat.com>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 2/3] qapi: improve specificity of type/member
 descriptions
References: <20230420102619.348173-1-berrange@redhat.com>
 <20230420102619.348173-3-berrange@redhat.com>
Date: Mon, 24 Apr 2023 13:38:21 +0200
In-Reply-To: <20230420102619.348173-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Thu, 20 Apr 2023 11:26:18
 +0100")
Message-ID: <87a5yxa4sy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Lines: 80
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> When describing member types always include the context of the
> containing type. Although this is often redundant, in some cases
> it will help to reduce ambiguity.

This is no longer true.  It was in v2.  Suggest:

  Error messages describe object members, enumeration values, features,
  and variants like ROLE 'NAME', where ROLE is "member", "value",
  "feature", or "branch", respectively.  When the member is defined in
  another type, e.g. inherited from a base type, we add "of type
  'TYPE'".  Example: test case struct-base-clash-deep reports a member
  of type 'Sub' clashing with a member of its base type 'Base' as

      struct-base-clash-deep.json: In struct 'Sub':
      struct-base-clash-deep.json:10: member 'name' collides with member 'n=
ame' of type 'Base'

  Members of implicitly defined types need special treatment.  We don't
  want to add "of type 'TYPE'" for them, because their named are made up
  and mean nothing to the user.  Instead, we describe members of an
  implicitly defined base type as "base member 'NAME'", and command and
  event parameters as "parameter 'NAME'".  Example: test case
  union-bad-base reports member of a variant's type clashing with a
  member of its implicitly defined base type as

      union-bad-base.json: In union 'TestUnion':
      union-bad-base.json:8: member 'string' of type 'TestTypeA' collides w=
ith base member 'string'

  The next commit will permit unions as variant types.  "base member
  'NAME' would then be ambigious: is it the union's base, or is it the
  union's variant's base?  One of its test cases would report a clash
  between two such bases as "base member 'type' collides with base
  member 'type'".  Confusing.

  Refine the special treatment: add "of TYPE" even for implicitly
  defined types, but massage TYPE and ROLE so they make sense for the
  user.

> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  scripts/qapi/schema.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 207e4d71f3..da04b97ded 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -697,6 +697,7 @@ def connect_doc(self, doc):
>=20=20
>      def describe(self, info):
>          role =3D self.role
> +        meta =3D 'type'
>          defined_in =3D self.defined_in
>          assert defined_in
>=20=20
> @@ -708,13 +709,17 @@ def describe(self, info):
>                  # Implicit type created for a command's dict 'data'
>                  assert role =3D=3D 'member'
>                  role =3D 'parameter'
> +                meta =3D 'command'
> +                defined_in =3D defined_in[:-4]
>              elif defined_in.endswith('-base'):
>                  # Implicit type created for a union's dict 'base'
>                  role =3D 'base ' + role
> +                defined_in =3D defined_in[:-5]
>              else:
>                  assert False
> -        elif defined_in !=3D info.defn_name:
> -            return "%s '%s' of type '%s'" % (role, self.name, defined_in)
> +
> +        if defined_in !=3D info.defn_name:
> +            return "%s '%s' of %s '%s'" % (role, self.name, meta, define=
d_in)
>          return "%s '%s'" % (role, self.name)

Since I rewrote both the patch and the commit message, would you like me
to take the blame and claim authorship?


