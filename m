Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A12B40D41D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 09:51:21 +0200 (CEST)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQmAy-0005Ni-DJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 03:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQm9c-0004gr-CV
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 03:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQm9Z-0001tn-Qq
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 03:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631778592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3yWc3CH2d5r6o3/fHsmek+d9n47GD1QQQrpIe1UOhsM=;
 b=GJ/vEDTSh8WneV/hr2Z5R5UqSeYGDuAsX2PsK+zU+H+LXm/ANRJMEWzULa3Dugp2DOa/nX
 Xkbz6e3ApQtFdyP9/v5ELTiAni+WWrKalu3QcmxcfPj1AA4w3iYWESrG5hiJNq+rVyQxT+
 2y+GoQt59SOOu9xLcb6vMm+M9KL5mcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-F23BfjcOPZCc1UUFXEIP1Q-1; Thu, 16 Sep 2021 03:49:50 -0400
X-MC-Unique: F23BfjcOPZCc1UUFXEIP1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 284731006AA0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:49:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9F3A1001281;
 Thu, 16 Sep 2021 07:49:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49CCF113865F; Thu, 16 Sep 2021 09:49:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 5/6] qapi: Add support for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-6-kwolf@redhat.com>
Date: Thu, 16 Sep 2021 09:49:48 +0200
In-Reply-To: <20210812161131.92017-6-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Aug 2021 18:11:30 +0200")
Message-ID: <87ee9pyn6r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Introduce alias definitions for object types (structs and unions). This
> allows using the same QAPI type and visitor for many syntax variations
> that exist in the external representation, like between QMP and the
> command line. It also provides a new tool for evolving the schema while
> maintaining backwards compatibility during a deprecation period.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst           | 104 +++++++++++++++++++++-
>  docs/sphinx/qapidoc.py                 |   2 +-
>  scripts/qapi/expr.py                   |  47 +++++++++-
>  scripts/qapi/schema.py                 | 116 +++++++++++++++++++++++--
>  scripts/qapi/types.py                  |   4 +-
>  scripts/qapi/visit.py                  |  34 +++++++-
>  tests/qapi-schema/test-qapi.py         |   7 +-
>  tests/qapi-schema/double-type.err      |   2 +-
>  tests/qapi-schema/unknown-expr-key.err |   2 +-
>  9 files changed, 297 insertions(+), 21 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index 26c62b0e7b..c0883507a8 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -262,7 +262,8 @@ Syntax::
>                 'data': MEMBERS,
>                 '*base': STRING,
>                 '*if': COND,
> -               '*features': FEATURES }
> +               '*features': FEATURES,
> +               '*aliases': ALIASES }
>      MEMBERS = { MEMBER, ... }
>      MEMBER = STRING : TYPE-REF
>             | STRING : { 'type': TYPE-REF,
> @@ -312,6 +313,9 @@ the schema`_ below for more on this.
>  The optional 'features' member specifies features.  See Features_
>  below for more on this.
>  
> +The optional 'aliases' member specifies aliases.  See Aliases_ below
> +for more on this.
> +
>  
>  Union types
>  -----------
> @@ -321,13 +325,15 @@ Syntax::
>      UNION = { 'union': STRING,
>                'data': BRANCHES,
>                '*if': COND,
> -              '*features': FEATURES }
> +              '*features': FEATURES,
> +              '*aliases': ALIASES }
>            | { 'union': STRING,
>                'data': BRANCHES,
>                'base': ( MEMBERS | STRING ),
>                'discriminator': STRING,
>                '*if': COND,
> -              '*features': FEATURES }
> +              '*features': FEATURES,
> +              '*aliases': ALIASES }
>      BRANCHES = { BRANCH, ... }
>      BRANCH = STRING : TYPE-REF
>             | STRING : { 'type': TYPE-REF, '*if': COND }
> @@ -437,6 +443,9 @@ the schema`_ below for more on this.
>  The optional 'features' member specifies features.  See Features_
>  below for more on this.
>  
> +The optional 'aliases' member specifies aliases.  See Aliases_ below
> +for more on this.
> +
>  
>  Alternate types
>  ---------------
> @@ -888,6 +897,95 @@ shows a conditional entity only when the condition is satisfied in
>  this particular build.
>  
>  
> +Aliases
> +-------
> +
> +Object types, including structs and unions, can contain alias
> +definitions.
> +
> +Aliases define alternative member names that may be used in wire input
> +to provide a value for a member in the same object or in a nested
> +object.
> +
> +Syntax::
> +
> +    ALIASES = [ ALIAS, ... ]
> +    ALIAS = { '*name': STRING,
> +              'source': [ STRING, ... ] }
> +
> +If ``name`` is present, then the single member referred to by ``source``
> +is made accessible with the name given by ``name`` in the type where the
> +alias definition is specified.
> +
> +If ``name`` is not present, then this is a wildcard alias and all
> +members in the object referred to by ``source`` are made accessible in
> +the type where the alias definition is specified with the same name as
> +they have in ``source``.
> +
> +``source`` is a non-empty list of member names representing the path to
> +an object member. The first name is resolved in the same object.  Each
> +subsequent member is resolved in the object named by the preceding
> +member.
> +
> +Do not use optional objects in the path of a wildcard alias unless there
> +is no semantic difference between an empty object and an absent object.
> +Absent objects are implicitly turned into empty ones if an alias could
> +apply and provide a value in the nested object, which is always the case
> +for wildcard aliases.

Is this still correct?

> +
> +Example: Alternative name for a member in the same object ::
> +
> + { 'struct': 'File',
> +   'data': { 'path': 'str' },
> +   'aliases': [ { 'name': 'filename', 'source': ['path'] } ] }
> +
> +The member ``path`` may instead be given through its alias ``filename``
> +in input.
> +
> +Example: Alias for a member in a nested object ::
> +
> + { 'struct': 'A',
> +   'data': { 'zahl': 'int' } }
> + { 'struct': 'B',
> +   'data': { 'drei': 'A' } }
> + { 'struct': 'C',
> +   'data': { 'zwei': 'B' } }
> + { 'struct': 'D',
> +   'data': { 'eins': 'C' },
> +   'aliases': [ { 'name': 'number',
> +                  'source': ['eins', 'zwei', 'drei', 'zahl' ] },
> +                { 'name': 'the_B',
> +                  'source': ['eins','zwei'] } ] }
> +
> +With this definition, each of the following inputs for ``D`` mean the
> +same::
> +
> + { 'eins': { 'zwei': { 'drei': { 'zahl': 42 } } } }
> +
> + { 'the_B': { 'drei': { 'zahl': 42 } } }
> +
> + { 'number': 42 }
> +
> +Example: Flattening a simple union with a wildcard alias that maps all
> +members of ``data`` to the top level ::
> +
> + { 'union': 'SocketAddress',
> +   'data': {
> +     'inet': 'InetSocketAddress',
> +     'unix': 'UnixSocketAddress' },
> +   'aliases': [ { 'source': ['data'] } ] }
> +
> +Aliases are transitive: ``source`` may refer to another alias name.  In
> +this case, the alias is effectively an alternative name for the source
> +of the other alias.
> +
> +In order to accommodate unions where variants differ in structure, it
> +is allowed to use a path that doesn't necessarily match an existing
> +member in every variant; in this case, the alias remains unused.  The
> +QAPI generator checks that there is at least one branch for which an
> +alias could match.
> +
> +
>  Documentation comments
>  ----------------------
>  
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index 87c67ab23f..68340b8529 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -313,7 +313,7 @@ def visit_enum_type(self, name, info, ifcond, features, members, prefix):
>                        + self._nodes_for_if_section(ifcond))
>  
>      def visit_object_type(self, name, info, ifcond, features,
> -                          base, members, variants):
> +                          base, members, variants, aliases):
>          doc = self._cur_doc
>          if base and base.is_implicit():
>              base = None

[...]


