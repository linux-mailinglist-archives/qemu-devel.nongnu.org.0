Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AC7401D90
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:25:16 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGUl-0006fB-EK
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGTp-0005qg-0M
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNGTk-0003k3-J1
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630941851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+CnIUpH0Uelf4OK8Koc5cF/5SNKcG+gLtzOjcwVe4e8=;
 b=NNZ1ipDD0lSCcsx3slLD8ndWDf+53s/NDE5vLFqqyXiMn27GRK6Ob0W3/E4X+anwGBbbUV
 aA5Jai/uQeD3CgJh4NRzph1foladq8TagvX9jtidjCMhGqVVrn8AQ+mxMn10qF6lGYD765
 6DBnPMc11XuZ9a/lhZL7tBVUs1VngRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-fZQNBc_bPFyMew6TFqyy1g-1; Mon, 06 Sep 2021 11:24:06 -0400
X-MC-Unique: fZQNBc_bPFyMew6TFqyy1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CDC51883520
 for <qemu-devel@nongnu.org>; Mon,  6 Sep 2021 15:24:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F15C5D9F0;
 Mon,  6 Sep 2021 15:24:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7BB71138606; Mon,  6 Sep 2021 17:24:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 5/6] qapi: Add support for aliases
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-6-kwolf@redhat.com>
Date: Mon, 06 Sep 2021 17:24:03 +0200
In-Reply-To: <20210812161131.92017-6-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Aug 2021 18:11:30 +0200")
Message-ID: <87eea1d8x8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
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

Explaining intended use would be nice.  From your cover letter:

    This allows using the same QAPI type and visitor even when the syntax
    has some variations between different external interfaces such as QMP
    and the command line.

    It also provides a new tool for evolving the schema while maintaining
    backwards compatibility (possibly during a deprecation period).

For the second use, we need to be able to tack feature 'deprecated' to
exactly one of the two.

We can already tack it to the "real" member.  The real member's
'deprecated' must not apply to its aliases.

We can't tack it to the alias, yet.  More on that in review of PATCH 6.

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
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index cf98923fa6..054fef8d8e 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -430,6 +430,45 @@ def check_features(features: Optional[object],
>          check_if(feat, info, source)
>  
>  
> +def check_aliases(aliases: Optional[object],
> +                  info: QAPISourceInfo) -> None:
> +    """
> +    Normalize and validate the ``aliases`` member.
> +
> +    :param aliases: The aliases member value to validate.
> +    :param info: QAPI schema source file information.
> +
> +    :raise QAPISemError: When ``aliases`` fails validation.
> +    :return: None, ``aliases`` is normalized in-place as needed.
> +    """
> +
> +    if aliases is None:
> +        return
> +    if not isinstance(aliases, list):
> +        raise QAPISemError(info, "'aliases' must be an array")

Covered by PATCH 6's aliases-bad-type.  Good.

> +    for a in aliases:
> +        if not isinstance(a, dict):
> +            raise QAPISemError(info, "'aliases' members must be objects")

Convered by alias-bad-type.

Doesn't identify the offending member.  Same for all errors reported in
this loop.  Users should have no trouble identifying this one
themselves.  Less obvious ones might be confusing.

Class QAPISchemaAlias identifies like 'alias ' + a['name'] and 'wildcard
alias', as several test results show, e.g. alias-name-conflict.err and
alias-source-non-object-wildcard.err.  Could be improved on top.

> +        check_keys(a, info, "'aliases' member", ['source'], ['name'])

Covered by alias-missing-source and alias-unknown-key.

> +
> +        if 'name' in a:
> +            source = "alias member 'name'"
> +            check_name_is_str(a['name'], info, source)

Covered by alias-name-bad-type.

I understand the desire to reuse an existing check, but the resulting
error message feels awkward: "alias member 'name' requires a string
name".  We can improve suboptimal error messages on top.

> +            check_name_str(a['name'], info, source)

Not covered.  Tolerable.

However, aliases are like members, and we therefore need
check_name_lower() here.  Necessary to reject

    'aliases': [{'name': 'Bar', 'source': ['foo']}]

Can fix in my tree.

Note: if we simply replace check_name_str by check_name_lower here, we
don't support pragma member-name-exceptions.  We can address that when
we need it.  Worth a comment, though.

> +
> +        if not isinstance(a['source'], list):
> +            raise QAPISemError(info,
> +                "alias member 'source' must be an array")

Covered by alias-source-bad-type.

pycodestyle-3 gripes:

    scripts/qapi/expr.py:461:17: E128 continuation line under-indented for visual indent

Obvious fix:

               raise QAPISemError(
                   info, "alias member 'source' must be an array")

> +        if not a['source']:
> +            raise QAPISemError(info,
> +                "alias member 'source' must not be empty")

Covered by alias-source-empty.

pycodestyle-3:

    scripts/qapi/expr.py:464:17: E128 continuation line under-indented for visual indent

> +
> +        source = "member of alias member 'source'"
> +        for s in a['source']:
> +            check_name_is_str(s, info, source)

Covered by alias-source-elem-bad-type.

> +            check_name_str(s, info, source)

Not covered.  Tolerable, but should we check at all?  We also check that
the alias can resolve, don't we?  If it resolves, then the elements of
@source match names that are checked elsewhere.

In short, we enforce naming conventions for definitions, not uses, and
this is a use.

If I'm wrong and we need to check, then check_name_lower().  Adding
support for pragma member-name-exceptions could be hairy.

> +
> +
>  def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
>      """
>      Normalize and validate this expression as an ``enum`` definition.
> @@ -483,6 +522,7 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>      check_type(members, info, "'data'", allow_dict=name)
>      check_type(expr.get('base'), info, "'base'")
> +    check_aliases(expr.get('aliases'), info)
>  
>  
>  def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
> @@ -509,6 +549,8 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
>              raise QAPISemError(info, "'discriminator' requires 'base'")
>          check_name_is_str(discriminator, info, "'discriminator'")
>  
> +    check_aliases(expr.get('aliases'), info)
> +
>      if not isinstance(members, dict):
>          raise QAPISemError(info, "'data' must be an object")
>  
> @@ -653,7 +695,7 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
>          elif meta == 'union':
>              check_keys(expr, info, meta,
>                         ['union', 'data'],
> -                       ['base', 'discriminator', 'if', 'features'])
> +                       ['base', 'discriminator', 'if', 'features', 'aliases'])

I'll break this line if you don't mind.

>              normalize_members(expr.get('base'))
>              normalize_members(expr['data'])
>              check_union(expr, info)
> @@ -664,7 +706,8 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
>              check_alternate(expr, info)
>          elif meta == 'struct':
>              check_keys(expr, info, meta,
> -                       ['struct', 'data'], ['base', 'if', 'features'])
> +                       ['struct', 'data'],
> +                       ['base', 'if', 'features', 'aliases'])
>              normalize_members(expr['data'])
>              check_struct(expr, info)
>          elif meta == 'command':
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index d1d27ff7ee..fc75635f4e 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -118,7 +118,7 @@ def visit_array_type(self, name, info, ifcond, element_type):
>          pass
>  
>      def visit_object_type(self, name, info, ifcond, features,
> -                          base, members, variants):
> +                          base, members, variants, aliases):
>          pass
>  
>      def visit_object_type_flat(self, name, info, ifcond, features,
> @@ -364,7 +364,7 @@ def describe(self):
>  
>  class QAPISchemaObjectType(QAPISchemaType):
>      def __init__(self, name, info, doc, ifcond, features,
> -                 base, local_members, variants):
> +                 base, local_members, variants, aliases=None):
>          # struct has local_members, optional base, and no variants
>          # flat union has base, variants, and no local_members
>          # simple union has local_members, variants, and no base
> @@ -382,6 +382,9 @@ def __init__(self, name, info, doc, ifcond, features,
>          self.local_members = local_members
>          self.variants = variants
>          self.members = None
> +        self.aliases = aliases or []
> +        for a in self.aliases:
> +            a.set_defined_in(name)
>  
>      def check(self, schema):
>          # This calls another type T's .check() exactly when the C
> @@ -413,12 +416,16 @@ def check(self, schema):
>          for m in self.local_members:
>              m.check(schema)
>              m.check_clash(self.info, seen)
> -        members = seen.values()
> +        members = list(seen.values())

Uh, why do you need this?  If I back it out, .check_path()'s assert
isinstance(members, list) fails.  If I take that out as well, "make
check" passes.  So does asserting isinstance(members, ValuesView).

For what it's worth: when this code was written, we still used Python2,
where .values() returns a list.  The switch to Python3 silently made
@members and self.members (assigned below) track changes of @seen.  It
only ever changes in QAPISchemaMember.check_clash().

Hmmm, does your patch add such changes after this point?

>  
>          if self.variants:
>              self.variants.check(schema, seen)
>              self.variants.check_clash(self.info, seen)
>  
> +        for a in self.aliases:
> +            a.check_clash(self.info, seen)

Covered by alias-name-conflict.

Is such a change to @seen hiding behind a.check_clash()?

> +            self.check_path(a, list(a.source), members)
> +
>          self.members = members  # mark completed
>  
>      # Check that the members of this type do not cause duplicate JSON members,
> @@ -430,6 +437,68 @@ def check_clash(self, info, seen):
>          for m in self.members:
>              m.check_clash(info, seen)
>  
> +    # Deletes elements from path, so pass a copy if you still need them

Suggest "from @path", to make it immediately obvious what you're talking
about.

The side effect is a bit ugly.  We can tidy it up later if we care.

> +    def check_path(self, alias, path, members=None, local_aliases_seen=()):

Hmm, @local_aliases_seen is a tuple, whereas the @seen elsewhere are
dict mapping name to QAPISchemaEntity, so we can .describe().
Observation, not demand.

> +        assert isinstance(path, list)
> +
> +        if not path:
> +            return
> +        first = path.pop(0)
> +
> +        for a in self.aliases:
> +            if a.name == first:
> +                if a in local_aliases_seen:
> +                    raise QAPISemError(
> +                        self.info,
> +                        "%s resolving to '%s' makes '%s' an alias for itself"
> +                        % (a.describe(self.info), a.source[0], a.source[0]))

Covered by alias-recursive.

Suggest to call the test case alias-loop.

The error message shows just one arc of the loop:

    alias-recursive.json: In struct 'AliasStruct0':
    alias-recursive.json:1: alias 'baz' resolving to 'bar' makes 'bar' an alias for itself

Showing the complete loop would be nice.  Not a demand.  Might require
turning @local_aliases_seen into a dict.

> +
> +                path = a.source + path
> +                return self.check_path(alias, path, members,
> +                                       (*local_aliases_seen, a))
> +
> +        if members is None:
> +            assert self.members is not None
> +            members = self.members
> +        else:
> +            assert isinstance(members, list)
> +
> +        for m in members:
> +            if m.name == first:
> +                # Wildcard aliases can only accept object types in the whole
> +                # path; for single-member aliases, the last element can be
> +                # any type
> +                need_obj = (alias.name is None) or path
> +                if need_obj and not isinstance(m.type, QAPISchemaObjectType):
> +                    raise QAPISemError(
> +                        self.info,
> +                        "%s has non-object '%s' in its source path"
> +                        % (alias.describe(self.info), m.name))

Covered by alias-source-non-object-path and
alias-source-non-object-wildcard.

> +                if alias.name is None and m.optional:
> +                    raise QAPISemError(
> +                        self.info,
> +                        "%s has optional object %s in its source path"
> +                        % (alias.describe(self.info), m.describe(self.info)))

Covered by alias-source-optional-wildcard-indirect and
alias-source-optional-wildcard.

> +                if path:
> +                    m.type.check_path(alias, path)
> +                return
> +
> +        # It is sufficient that the path is valid in at least one variant
> +        if self.variants:
> +            for v in self.variants.variants:
> +                try:
> +                    return v.type.check_path(alias, [first, *path])
> +                except QAPISemError:
> +                    pass

Code smell: abuse of exception for perfectly non-exceptional control
flow.  I'm willing to tolerate this for now.

> +            raise QAPISemError(
> +                self.info,
> +                "%s has a source path that does not exist in any variant of %s"
> +                % (alias.describe(self.info), self.describe()))

Covered by alias-source-inexistent-variants.

> +
> +        raise QAPISemError(
> +            self.info,
> +            "%s has inexistent source" % alias.describe(self.info))

Covered by alias-source-inexistent.

pycodestyle-3 points out:

    scripts/qapi/schema.py:441:4: R1710: Either all return statements in a function should return an expression, or none of them should. (inconsistent-return-statements)

Obvious fix: replace

    return FOO.check_path(..)

by
 
    FOO.check_path(..)
    return

Now let's see what this function does.  It detects the following errors:

1. Alias loop

2. Alias "dotting through" a non-object

3. Wildcard alias "dotting through" an optional object

4. Alias must resolve to something (common or variant member, possibly
   nested)

Lovely!  But how does it work?

The first loop takes care of 1.  Looks like we try to resolve the alias,
then recurse, keeping track of things meanwhile so we can detect loops.
Isn't this more complicated than it needs to be?

Aliases can only resolve to the same or deeper nesting levels.

An alias that resolves to a deeper level cannot be part of a loop
(because we can't resolve to back to the alias's level).

So this should do:

    local_aliases_seen = {}
    for all aliases that resolve to the same level:
        if local_aliases_seen[alias.name]:
            # loop!  we can retrace it using @local_aliases_seen if we
            # care
            raise ...
        local_aliases_seen[alias.name] = alias

Or am I missing something?

Moving on.

To do 2. and 3., we try to resolve the alias, one element of source
after the other.

The first element can match either a common member, or a member of any
number of variants.

We first look for a common member, by searching @members for a match.
If there is one, we check it, then recurse to check the remaining
elements of source, and are done.

Else, we try variant members.  We reduce the problem to "common member"
by recursing into the variant types.  Neat!  If this doesn't find any,
the alias doesn't resolve, taking care of 4.

Works.  Searching @members is kind of brutish, though.  We do have a map
from member name to QAPISchemaObjectTypeMember: @seen.  To use it, we'd
have to fuse .check_path() into .check_clash().  Let's not worry about
that right now.

> +
>      def connect_doc(self, doc=None):
>          super().connect_doc(doc)
>          doc = doc or self.doc
> @@ -474,7 +543,7 @@ def visit(self, visitor):
>          super().visit(visitor)
>          visitor.visit_object_type(
>              self.name, self.info, self.ifcond, self.features,
> -            self.base, self.local_members, self.variants)
> +            self.base, self.local_members, self.variants, self.aliases)
>          visitor.visit_object_type_flat(
>              self.name, self.info, self.ifcond, self.features,
>              self.members, self.variants)
> @@ -639,7 +708,7 @@ def check_clash(self, info, seen):
>  
>  
>  class QAPISchemaMember:
> -    """ Represents object members, enum members and features """
> +    """ Represents object members, enum members, features and aliases """
>      role = 'member'
>  
>      def __init__(self, name, info, ifcond=None):
> @@ -705,6 +774,30 @@ class QAPISchemaFeature(QAPISchemaMember):
>      role = 'feature'
>  
>  
> +class QAPISchemaAlias(QAPISchemaMember):
> +    role = 'alias'

I like this :)

> +
> +    def __init__(self, name, info, source):
> +        assert name is None or isinstance(name, str)
> +        assert source
> +        for member in source:
> +            assert isinstance(member, str)
> +
> +        super().__init__(name or '*', info)
> +        self.name = name
> +        self.source = source
> +
> +    def check_clash(self, info, seen):
> +        if self.name:
> +            super().check_clash(info, seen)
> +
> +    def describe(self, info):
> +        if self.name:
> +            return super().describe(info)
> +        else:
> +            return "wildcard alias"

pycodestyle-3 gripes:

    scripts/qapi/schema.py:795:8: R1705: Unnecessary "else" after "return" (no-else-return)

> +
> +
>  class QAPISchemaObjectTypeMember(QAPISchemaMember):
>      def __init__(self, name, info, typ, optional, ifcond=None, features=None):
>          super().__init__(name, info, ifcond)
> @@ -971,6 +1064,12 @@ def _make_features(self, features, info):
>          return [QAPISchemaFeature(f['name'], info, f.get('if'))
>                  for f in features]
>  
> +    def _make_aliases(self, aliases, info):
> +        if aliases is None:
> +            return []
> +        return [QAPISchemaAlias(a.get('name'), info, a['source'])
> +                for a in aliases]
> +
>      def _make_enum_members(self, values, info):
>          return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
>                  for v in values]
> @@ -1045,11 +1144,12 @@ def _def_struct_type(self, expr, info, doc):
>          base = expr.get('base')
>          data = expr['data']
>          ifcond = expr.get('if')
> +        aliases = self._make_aliases(expr.get('aliases'), info)
>          features = self._make_features(expr.get('features'), info)
>          self._def_entity(QAPISchemaObjectType(
>              name, info, doc, ifcond, features, base,
>              self._make_members(data, info),
> -            None))
> +            None, aliases))
>  
>      def _make_variant(self, case, typ, ifcond, info):
>          return QAPISchemaVariant(case, info, typ, ifcond)
> @@ -1068,6 +1168,7 @@ def _def_union_type(self, expr, info, doc):
>          data = expr['data']
>          base = expr.get('base')
>          ifcond = expr.get('if')
> +        aliases = self._make_aliases(expr.get('aliases'), info)
>          features = self._make_features(expr.get('features'), info)
>          tag_name = expr.get('discriminator')
>          tag_member = None
> @@ -1092,7 +1193,8 @@ def _def_union_type(self, expr, info, doc):
>              QAPISchemaObjectType(name, info, doc, ifcond, features,
>                                   base, members,
>                                   QAPISchemaVariants(
> -                                     tag_name, info, tag_member, variants)))
> +                                     tag_name, info, tag_member, variants),
> +                                 aliases))
>  
>      def _def_alternate_type(self, expr, info, doc):
>          name = expr['alternate']
> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> index 20d572a23a..3bc451baa9 100644
> --- a/scripts/qapi/types.py
> +++ b/scripts/qapi/types.py
> @@ -25,6 +25,7 @@
>  from .gen import QAPISchemaModularCVisitor, ifcontext
>  from .schema import (
>      QAPISchema,
> +    QAPISchemaAlias,
>      QAPISchemaEnumMember,
>      QAPISchemaFeature,
>      QAPISchemaObjectType,
> @@ -332,7 +333,8 @@ def visit_object_type(self,
>                            features: List[QAPISchemaFeature],
>                            base: Optional[QAPISchemaObjectType],
>                            members: List[QAPISchemaObjectTypeMember],
> -                          variants: Optional[QAPISchemaVariants]) -> None:
> +                          variants: Optional[QAPISchemaVariants],
> +                          aliases: List[QAPISchemaAlias]) -> None:
>          # Nothing to do for the special empty builtin
>          if name == 'q_empty':
>              return
> diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
> index 9e96f3c566..0aa0764755 100644
> --- a/scripts/qapi/visit.py
> +++ b/scripts/qapi/visit.py
> @@ -26,6 +26,7 @@
>  from .gen import QAPISchemaModularCVisitor, ifcontext
>  from .schema import (
>      QAPISchema,
> +    QAPISchemaAlias,
>      QAPISchemaEnumMember,
>      QAPISchemaEnumType,
>      QAPISchemaFeature,
> @@ -60,7 +61,8 @@ def gen_visit_members_decl(name: str) -> str:
>  def gen_visit_object_members(name: str,
>                               base: Optional[QAPISchemaObjectType],
>                               members: List[QAPISchemaObjectTypeMember],
> -                             variants: Optional[QAPISchemaVariants]) -> str:
> +                             variants: Optional[QAPISchemaVariants],
> +                             aliases: List[QAPISchemaAlias]) -> str:
>      ret = mcgen('''
>  
>  bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
> @@ -68,6 +70,24 @@ def gen_visit_object_members(name: str,
>  ''',
>                  c_name=c_name(name))
>  
> +    if aliases:
> +        ret += mcgen('''
> +    visit_start_alias_scope(v);
> +''')
> +
> +    for a in aliases:
> +        if a.name:
> +            name = '"%s"' % a.name
> +        else:
> +            name = "NULL"
> +
> +        source = ", ".join('"%s"' % x for x in a.source)

@x is a poor choice for a loop control variable.  @elt?

> +
> +        ret += mcgen('''
> +    visit_define_alias(v, %(name)s, (const char * []) { %(source)s, NULL });
> +''',
> +                     name=name, source=source)
> +
>      if base:
>          ret += mcgen('''
>      if (!visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, errp)) {
> @@ -148,6 +168,11 @@ def gen_visit_object_members(name: str,
>      }
>  ''')
>  
> +    if aliases:
> +        ret += mcgen('''
> +    visit_end_alias_scope(v);
> +''')
> +
>      ret += mcgen('''
>      return true;
>  }
> @@ -376,14 +401,15 @@ def visit_object_type(self,
>                            features: List[QAPISchemaFeature],
>                            base: Optional[QAPISchemaObjectType],
>                            members: List[QAPISchemaObjectTypeMember],
> -                          variants: Optional[QAPISchemaVariants]) -> None:
> +                          variants: Optional[QAPISchemaVariants],
> +                          aliases: List[QAPISchemaAlias]) -> None:
>          # Nothing to do for the special empty builtin
>          if name == 'q_empty':
>              return
>          with ifcontext(ifcond, self._genh, self._genc):
>              self._genh.add(gen_visit_members_decl(name))
> -            self._genc.add(gen_visit_object_members(name, base,
> -                                                    members, variants))
> +            self._genc.add(gen_visit_object_members(
> +                name, base, members, variants, aliases))
>              # TODO Worth changing the visitor signature, so we could
>              # directly use rather than repeat type.is_implicit()?
>              if not name.startswith('q_'):
> diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
> index f1c4deb9a5..376630901b 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -47,7 +47,7 @@ def visit_array_type(self, name, info, ifcond, element_type):
>          self._print_if(ifcond)
>  
>      def visit_object_type(self, name, info, ifcond, features,
> -                          base, members, variants):
> +                          base, members, variants, aliases):
>          print('object %s' % name)
>          if base:
>              print('    base %s' % base.name)
> @@ -56,6 +56,11 @@ def visit_object_type(self, name, info, ifcond, features,
>                    % (m.name, m.type.name, m.optional))
>              self._print_if(m.ifcond, 8)
>              self._print_features(m.features, indent=8)
> +        for a in aliases:
> +            if a.name:
> +                print('    alias %s -> %s' % (a.name, '.'.join(a.source)))
> +            else:
> +                print('    alias * -> %s.*' % '.'.join(a.source))
>          self._print_variants(variants)
>          self._print_if(ifcond)
>          self._print_features(features)
> diff --git a/tests/qapi-schema/double-type.err b/tests/qapi-schema/double-type.err
> index 576e716197..c382e61d88 100644
> --- a/tests/qapi-schema/double-type.err
> +++ b/tests/qapi-schema/double-type.err
> @@ -1,3 +1,3 @@
>  double-type.json: In struct 'Bar':
>  double-type.json:2: struct has unknown key 'command'
> -Valid keys are 'base', 'data', 'features', 'if', 'struct'.
> +Valid keys are 'aliases', 'base', 'data', 'features', 'if', 'struct'.
> diff --git a/tests/qapi-schema/unknown-expr-key.err b/tests/qapi-schema/unknown-expr-key.err
> index f2538e3ce7..354916968f 100644
> --- a/tests/qapi-schema/unknown-expr-key.err
> +++ b/tests/qapi-schema/unknown-expr-key.err
> @@ -1,3 +1,3 @@
>  unknown-expr-key.json: In struct 'Bar':
>  unknown-expr-key.json:2: struct has unknown keys 'bogus', 'phony'
> -Valid keys are 'base', 'data', 'features', 'if', 'struct'.
> +Valid keys are 'aliases', 'base', 'data', 'features', 'if', 'struct'.


