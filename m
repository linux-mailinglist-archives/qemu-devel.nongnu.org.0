Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86501184AED
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 16:43:45 +0100 (CET)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCmTQ-0005er-41
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 11:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jCmSC-0004Z2-Eo
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 11:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jCmS8-0007V4-SO
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 11:42:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44271
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jCmS8-0007Sh-Kg
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 11:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584114143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94Sycfl330r1aCfTuhQe7zg0tmAQmY4ElXgjmDS9Yak=;
 b=d5WT5TygC+/zrmgEQSQXdaQkc2vuZ4AwOqTdpI/gvLLtOfdAxqJjGY6ZlhkdUZkH7iusrD
 LTDJHccwFFtPIVavBA0ggVKUTpWlhGXaTtt1SiR2XTk/R8TkDpMbTcqa2S8TCvQ9mqrdtR
 Hz9GvHaypFidLrBV2c9uLkWw7iEevNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-3V_n4mVFPwaTBIlmXG0C7A-1; Fri, 13 Mar 2020 11:42:20 -0400
X-MC-Unique: 3V_n4mVFPwaTBIlmXG0C7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C198018A2;
 Fri, 13 Mar 2020 15:42:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D61B388;
 Fri, 13 Mar 2020 15:42:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E6C411386A6; Fri, 13 Mar 2020 16:42:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v9 02/10] scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()
References: <20200312085936.9552-1-vsementsov@virtuozzo.com>
 <20200312085936.9552-3-vsementsov@virtuozzo.com>
 <874kuto7hq.fsf@dusky.pond.sub.org>
 <4a70c6ee-10a2-fdc3-f8df-88c05340398b@virtuozzo.com>
Date: Fri, 13 Mar 2020 16:42:09 +0100
In-Reply-To: <4a70c6ee-10a2-fdc3-f8df-88c05340398b@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 13 Mar 2020 09:38:21 +0300")
Message-ID: <875zf8gt2m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 12.03.2020 19:36, Markus Armbruster wrote:
>> I may have a second look tomorrow with fresher eyes, but let's get this
>> out now as is.
>>
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>
>>> Script adds ERRP_AUTO_PROPAGATE macro invocation where appropriate and
>>> does corresponding changes in code (look for details in
>>> include/qapi/error.h)
>>>
>>> Usage example:
>>> spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>>>   --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
>>>   --max-width 80 FILES...
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>
>>> Cc: Eric Blake <eblake@redhat.com>
>>> Cc: Kevin Wolf <kwolf@redhat.com>
>>> Cc: Max Reitz <mreitz@redhat.com>
>>> Cc: Greg Kurz <groug@kaod.org>
>>> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: Anthony Perard <anthony.perard@citrix.com>
>>> Cc: Paul Durrant <paul@xen.org>
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> Cc: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
>>> Cc: Laszlo Ersek <lersek@redhat.com>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Stefan Berger <stefanb@linux.ibm.com>
>>> Cc: Markus Armbruster <armbru@redhat.com>
>>> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
>>> Cc: qemu-devel@nongnu.org
>>> Cc: qemu-block@nongnu.org
>>> Cc: xen-devel@lists.xenproject.org
>>>
>>>   scripts/coccinelle/auto-propagated-errp.cocci | 327 +++++++++++++++++=
+
>>>   include/qapi/error.h                          |   3 +
>>>   MAINTAINERS                                   |   1 +
>>>   3 files changed, 331 insertions(+)
>>>   create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci
>>>
>>> diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/co=
ccinelle/auto-propagated-errp.cocci
>>> new file mode 100644
>>> index 0000000000..7dac2dcfa4
>>> --- /dev/null
>>> +++ b/scripts/coccinelle/auto-propagated-errp.cocci
>>> @@ -0,0 +1,327 @@
>>> +// Use ERRP_AUTO_PROPAGATE (see include/qapi/error.h)
>>> +//
>>> +// Copyright (c) 2020 Virtuozzo International GmbH.
>>> +//
>>> +// This program is free software; you can redistribute it and/or
>>> +// modify it under the terms of the GNU General Public License as
>>> +// published by the Free Software Foundation; either version 2 of the
>>> +// License, or (at your option) any later version.
>>> +//
>>> +// This program is distributed in the hope that it will be useful,
>>> +// but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> +// GNU General Public License for more details.
>>> +//
>>> +// You should have received a copy of the GNU General Public License
>>> +// along with this program.  If not, see
>>> +// <http://www.gnu.org/licenses/>.
>>> +//
>>> +// Usage example:
>>> +// spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>>> +//  --macro-file scripts/cocci-macro-file.h --in-place \
>>> +//  --no-show-diff --max-width 80 FILES...
>>> +//
>>> +// Note: --max-width 80 is needed because coccinelle default is less
>>> +// than 80, and without this parameter coccinelle may reindent some
>>> +// lines which fit into 80 characters but not to coccinelle default,
>>> +// which in turn produces extra patch hunks for no reason.
>>
>> This is about unwanted reformatting of parameter lists due to the ___
>> chaining hack.  --max-width 80 makes that less likely, but not
>> impossible.
>>
>> We can search for unwanted reformatting of parameter lists.  I think
>> grepping diffs for '^\+.*Error \*\*' should do the trick.  For the whole
>> tree, I get one false positive (not a parameter list), and one hit:
>>
>>      @@ -388,8 +388,10 @@ static void object_post_init_with_type(O
>>           }
>>       }
>>
>>      -void object_apply_global_props(Object *obj, const GPtrArray *props=
, Error **errp)
>>      +void object_apply_global_props(Object *obj, const GPtrArray *props=
,
>>      +                               Error **errp)
>>       {
>>      +    ERRP_AUTO_PROPAGATE();
>>           int i;
>>
>>           if (!props) {
>>
>> Reformatting, but not unwanted.
>
> Yes, I saw it. This line is 81 character length, so it's OK to fix it in =
one hunk with
> ERRP_AUTO_PROPAGATE addition even for non-automatic patch.

Agree.

>>
>> The --max-width 80 hack is good enough for me.
>>
>> It does result in slightly long transformed lines, e.g. this one in
>> replication.c:
>>
>>      @@ -113,7 +113,7 @@ static int replication_open(BlockDriverS
>>               s->mode =3D REPLICATION_MODE_PRIMARY;
>>               top_id =3D qemu_opt_get(opts, REPLICATION_TOP_ID);
>>               if (top_id) {
>>      -            error_setg(&local_err, "The primary side does not supp=
ort option top-id");
>>      +            error_setg(errp, "The primary side does not support op=
tion top-id");
>>                   goto fail;
>>               }
>>           } else if (!strcmp(mode, "secondary")) {
>>
>> v8 did break this line (that's how I found it).  However, v9 still
>> shortens the line, just not below the target.  All your + lines look
>> quite unlikely to lengthen lines.  Let's not worry about this.
>>
>>> +// Switch unusual Error ** parameter names to errp
>>> +// (this is necessary to use ERRP_AUTO_PROPAGATE).
>>> +//
>>> +// Disable optional_qualifier to skip functions with
>>> +// "Error *const *errp" parameter.
>>> +//
>>> +// Skip functions with "assert(_errp && *_errp)" statement, because
>>> +// that signals unusual semantics, and the parameter name may well
>>> +// serve a purpose. (like nbd_iter_channel_error()).
>>> +//
>>> +// Skip util/error.c to not touch, for example, error_propagate() and
>>> +// error_propagate_prepend().
>>> +@ depends on !(file in "util/error.c") disable optional_qualifier@
>>> +identifier fn;
>>> +identifier _errp !=3D errp;
>>> +@@
>>> +
>>> + fn(...,
>>> +-   Error **_errp
>>> ++   Error **errp
>>> +    ,...)
>>> + {
>>> +(
>>> +     ... when !=3D assert(_errp && *_errp)
>>> +&
>>> +     <...
>>> +-    _errp
>>> ++    errp
>>> +     ...>
>>> +)
>>> + }
>>> +
>>> +// Add invocation of ERRP_AUTO_PROPAGATE to errp-functions where
>>> +// necessary
>>> +//
>>> +// Note, that without "when any" the final "..." does not mach
>>> +// something matched by previous pattern, i.e. the rule will not match
>>> +// double error_prepend in control flow like in
>>> +// vfio_set_irq_signaling().
>>> +//
>>> +// Note, "exists" says that we want apply rule even if it matches not
>>> +// on all possible control flows (otherwise, it will not match
>>> +// standard pattern when error_propagate() call is in if branch).
>>> +@ disable optional_qualifier exists@
>>> +identifier fn, local_err;
>>> +symbol errp;
>>> +@@
>>> +
>>> + fn(..., Error **errp, ...)
>>> + {
>>> ++   ERRP_AUTO_PROPAGATE();
>>> +    ...  when !=3D ERRP_AUTO_PROPAGATE();
>>> +(
>>> +(
>>> +    error_append_hint(errp, ...);
>>> +|
>>> +    error_prepend(errp, ...);
>>> +|
>>> +    error_vprepend(errp, ...);
>>> +)
>>> +    ... when any
>>> +|
>>> +    Error *local_err =3D NULL;
>>> +    ...
>>> +(
>>> +    error_propagate_prepend(errp, local_err, ...);
>>> +|
>>> +    error_propagate(errp, local_err);
>>> +)
>>> +    ...
>>> +)
>>> + }
>>> +
>>> +
>>> +// Match functions with propagation of local error to errp.
>>> +// We want to refer these functions in several following rules, but I
>>> +// don't know a proper way to inherit a function, not just its name
>>> +// (to not match another functions with same name in following rules).
>>> +// Not-proper way is as follows: rename errp parameter in functions
>>> +// header and match it in following rules. Rename it back after all
>>> +// transformations.
>>> +//
>>> +// The simplest case of propagation scheme is single definition of
>>> +// local_err with at most one error_propagate_prepend or
>>> +// error_propagate on each control-flow. Still, we want to match more
>>> +// complex schemes too. We'll warn them with help of further rules.
>>
>> I think what we actually want is to examine instances of this pattern to
>> figure out whether and how we want to transform them.  Perhaps:
>>
>>      // The common case is a single definition of local_err with at most=
 one
>>      // error_propagate_prepend() or error_propagate() on each control-f=
low
>>      // path. Instances of this case we convert with this script. Functi=
ons
>
> For me, sounds a bit like "other things we don't convert".
> Actually we convert other things too.

What other patterns of error propagation do we convert?

>>      // with multiple definitions or propagates we want to examine
>>      // manually. Later rules emit warnings to guide us to them.
>>
>>> +@rule1 disable optional_qualifier exists@
>>> +identifier fn, local_err;
>>> +symbol errp;
>>> +@@
>>> +
>>> + fn(..., Error **
>>> +-    errp
>>> ++    ____
>>> +    , ...)
>>> + {
>>> +     ...
>>> +     Error *local_err =3D NULL;
>>> +     ...
>>> +(
>>> +     error_propagate_prepend(errp, local_err, ...);
>>> +|
>>> +     error_propagate(errp, local_err);
>>> +)
>>> +     ...
>>> + }
>>> +
>>> +
>>> +// Warn several Error * definitions.
>>> +@check1 disable optional_qualifier exists@
>>> +identifier fn =3D rule1.fn, local_err, local_err2;
>>
>> Elsewhere, you use just rule.fn instead of fn =3D rule1.fn.  Any
>> particular reason for the difference?
>
> I didn't find other way to ref check1.fn in next python rule. It just don=
't
> work if I write here just rule1.fn.
>
>>
>> With the ___ chaining hack, I doubt we still need "=3D rule1.fn" or
>> "rule1.fn".  If I replace "fn =3D rule1.fn" and "rule.fn" by just "fn"
>> everywhere, then apply the script to the complete tree, I get the same
>> result.
>
> I think, it's more efficient to reuse names from previous rules. I think =
it should
> work faster (more information, less extra matching).

Nope.  With my hacked up script (patch appended) Coccinelle is actually
*faster* for the .[ch] touched by this series: with your unmodified
script, it takes a bit over 12s on my box, with mine around 7s.  Output
is identical.

Never guess performance, always measure it :)

Two notes on my script:

* Unlike yours, it recognizes double-propagation in my test case.
  Discussed below.

* Its "several definitions of" warning includes positions.  That turned
  out to be useless, but I've been too lazy to take that out again.

>>
>>> +@@
>>> +
>>> + fn(..., Error ** ____, ...)
>>> + {
>>> +     ...
>>> +     Error *local_err =3D NULL;
>>> +     ... when any
>>> +     Error *local_err2 =3D NULL;
>>> +     ... when any
>>> + }
>>> +
>>> +@ script:python @
>>> +fn << check1.fn;
>>> +@@
>>> +
>>> +print('Warning: function {} has several definitions of '
>>> +      'Error * local variable'.format(fn))
>>> +
>>> +// Warn several propagations in control flow.
>>> +@check2 disable optional_qualifier exists@
>>> +identifier fn =3D rule1.fn;
>>> +symbol errp;
>>> +position p1, p2;
>>> +@@
>>> +
>>> + fn(..., Error ** ____, ...)
>>> + {
>>> +     ...
>>> +(
>>> +     error_propagate_prepend(errp, ...);@p1
>>> +|
>>> +     error_propagate(errp, ...);@p1
>>> +)
>>> +     ...
>>> +(
>>> +     error_propagate_prepend(errp, ...);@p2
>>> +|
>>> +     error_propagate(errp, ...);@p2
>>> +)
>>> +     ... when any
>>> + }
>>> +
>>
>> Hmm, we don't catch the example I used in review of v8:
>>
>>      extern foo(int, Error **);
>>      extern bar(int, Error **);
>>
>>      void frob(Error **errp)
>>      {
>>          Error *local_err =3D NULL;
>>          int arg;
>>
>>          foo(arg, errp);
>>          bar(arg, &local_err);
>>          error_propagate(errp, local_err);
>>          bar(arg + 1, &local_err);
>>          error_propagate(errp, local_err);
>>      }
>>
>> I believe this is because rule1 does not match here.
>
> Yes, rule1 wants at least one code flow with non-doubled propagation.
>
>>
>> If I change the rule as follows, it catches the example:
>>
>>      @@ -157,24 +157,23 @@ print('Warning: function {} has several defin=
itions of '
>>
>>       // Warn several propagations in control flow.
>>       @check2 disable optional_qualifier exists@
>>      -identifier fn =3D rule1.fn;
>>      -symbol errp;
>>      +identifier fn, _errp;
>>       position p1, p2;
>>       @@
>>
>>      - fn(..., Error ** ____, ...)
>>      + fn(..., Error **_errp, ...)
>>        {
>>            ...
>>       (
>>      -     error_propagate_prepend(errp, ...);@p1
>>      +     error_propagate_prepend(_errp, ...);@p1
>>       |
>>      -     error_propagate(errp, ...);@p1
>>      +     error_propagate(_errp, ...);@p1
>>       )
>>            ...
>>       (
>>      -     error_propagate_prepend(errp, ...);@p2
>>      +     error_propagate_prepend(_errp, ...);@p2
>>       |
>>      -     error_propagate(errp, ...);@p2
>>      +     error_propagate(_errp, ...);@p2
>>       )
>>            ... when any
>>        }
>>
>> To my mild surprise, it still doesn't find anything in our tree.
>>
>> Should we decouple the previous rule from rule1, too?  I tested the
>> following on the whole tree:
>
> I don't think so. Why to check what we are not going to convert? If we wa=
nt
> to check side things, it's better to do it in other coccinelle script..

Misunderstanding?  The rules are still chained together via the ___
hack, just not via function name, because that's unreliable and
redundant.

>>
>>      @@ -136,10 +136,10 @@ symbol errp;
>>
>>       // Warn several Error * definitions.
>>       @check1 disable optional_qualifier exists@
>>      -identifier fn =3D rule1.fn, local_err, local_err2;
>>      +identifier fn, _errp, local_err, local_err2;
>>       @@
>>
>>      - fn(..., Error ** ____, ...)
>>      + fn(..., Error **_errp, ...)
>>        {
>>            ...
>>            Error *local_err =3D NULL;
>>
>> Warnings remain unchanged.
>>
>>> +@ script:python @
>>> +fn << check2.fn;
>>> +p1 << check2.p1;
>>> +p2 << check2.p2;
>>> +@@
>>> +
>>> +print('Warning: function {} propagates to errp several times in '
>>> +      'one control flow: at {}:{} and then at {}:{}'.format(
>>> +          fn, p1[0].file, p1[0].line, p2[0].file, p2[0].line))
>>> +
>>> +// Convert special case with goto separately.
>>> +// I tried merging this into the following rule the obvious way, but
>>> +// it made Coccinelle hang on block.c
>>> +//
>>> +// Note interesting thing: if we don't do it here, and try to fixup
>>> +// "out: }" things later after all transformations (the rule will be
>>> +// the same, just without error_propagate() call), coccinelle fails to
>>> +// match this "out: }".
>>> +@ disable optional_qualifier@
>>> +identifier rule1.fn, rule1.local_err, out;
>>
>> As explained above, I doubt the need for rule1.fn.  We do need
>> rule1.local_err to avoid unwanted transformations.  More of the same
>> below.
>
> Logically, I want to inherit from rule1. So why not to stress it by inher=
iting
> fn variable? It's just a correct thing to do.
> And I hope it helps coccinelle to work more efficiently.
>
>>
>>> +symbol errp;
>>> +@@
>>> +
>>> + fn(..., Error ** ____, ...)
>>> + {
>>> +     <...
>>> +-    goto out;
>>> ++    return;
>>> +     ...>
>>> +- out:
>>> +-    error_propagate(errp, local_err);
>>> + }
>>> +
>>> +// Convert most of local_err related stuff.
>>> +//
>>> +// Note, that we update everything related to matched by rule1
>>> +// function name and local_err name. We may match something not
>>> +// related to the pattern matched by rule1. For example, local_err may
>>> +// be defined with the same name in different blocks inside one
>>> +// function, and in one block follow the propagation pattern and in
>>> +// other block doesn't. Or we may have several functions with the same
>>> +// name (for different configurations).
>>> +//
>>> +// Note also that errp-cleaning functions
>>> +//   error_free_errp
>>> +//   error_report_errp
>>> +//   error_reportf_errp
>>> +//   warn_report_errp
>>> +//   warn_reportf_errp
>>> +// are not yet implemented. They must call corresponding Error* -
>>> +// freeing function and then set *errp to NULL, to avoid further
>>> +// propagation to original errp (consider ERRP_AUTO_PROPAGATE in use).
>>> +// For example, error_free_errp may look like this:
>>> +//
>>> +//    void error_free_errp(Error **errp)
>>> +//    {
>>> +//        error_free(*errp);
>>> +//        *errp =3D NULL;
>>> +//    }
>>> +@ disable optional_qualifier exists@
>>> +identifier rule1.fn, rule1.local_err;
>>> +expression list args;
>>> +symbol errp;
>>> +@@
>>> +
>>> + fn(..., Error ** ____, ...)
>>> + {
>>> +     <...
>>> +(
>>> +-    Error *local_err =3D NULL;
>>> +|
>>> +
>>> +// Convert error clearing functions
>>> +(
>>> +-    error_free(local_err);
>>> ++    error_free_errp(errp);
>>> +|
>>> +-    error_report_err(local_err);
>>> ++    error_report_errp(errp);
>>> +|
>>> +-    error_reportf_err(local_err, args);
>>> ++    error_reportf_errp(errp, args);
>>> +|
>>> +-    warn_report_err(local_err);
>>> ++    warn_report_errp(errp);
>>> +|
>>> +-    warn_reportf_err(local_err, args);
>>> ++    warn_reportf_errp(errp, args);
>>> +)
>>> +?-    local_err =3D NULL;
>>> +
>>> +|
>>> +-    error_propagate_prepend(errp, local_err, args);
>>> ++    error_prepend(errp, args);
>>> +|
>>> +-    error_propagate(errp, local_err);
>>> +|
>>> +-    &local_err
>>> ++    errp
>>> +)
>>> +     ...>
>>> + }
>>> +
>>> +// Convert remaining local_err usage. For example, different kinds of
>>> +// error checking in if conditionals. We can't merge this into
>>> +// previous hunk, as this conflicts with other substitutions in it (at
>>> +// least with "- local_err =3D NULL").
>>> +@ disable optional_qualifier@
>>> +identifier rule1.fn, rule1.local_err;
>>> +symbol errp;
>>> +@@
>>> +
>>> + fn(..., Error ** ____, ...)
>>> + {
>>> +     <...
>>> +-    local_err
>>> ++    *errp
>>> +     ...>
>>> + }
>>> +
>>> +// Always use the same pattern for checking error
>>> +@ disable optional_qualifier@
>>> +identifier rule1.fn;
>>> +symbol errp;
>>> +@@
>>> +
>>> + fn(..., Error ** ____, ...)
>>> + {
>>> +     <...
>>> +-    *errp !=3D NULL
>>> ++    *errp
>>> +     ...>
>>> + }
>>> +
>>> +// Revert temporary ___ identifier.
>>> +@ disable optional_qualifier@
>>> +identifier rule1.fn;
>>> +@@
>>> +
>>> + fn(..., Error **
>>> +-   ____
>>> ++   errp
>>> +    , ...)
>>> + {
>>> +     ...
>>> + }
>>> diff --git a/include/qapi/error.h b/include/qapi/error.h
>>> index 30140d9bfe..56c133520d 100644
>>> --- a/include/qapi/error.h
>>> +++ b/include/qapi/error.h
>>> @@ -214,6 +214,9 @@
>>>    *         }
>>>    *         ...
>>>    *     }
>>> + *
>>> + * For mass-conversion use script
>>> + *   scripts/coccinelle/auto-propagated-errp.cocci
>>>    */
>>>     #ifndef ERROR_H
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 857f969aa1..047f1b9714 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1998,6 +1998,7 @@ F: include/qemu/error-report.h
>>>   F: qapi/error.json
>>>   F: util/error.c
>>>   F: util/qemu-error.c
>>> +F: scripts/coccinelle/*err*.cocci
>>>     GDB stub
>>>   M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>


From 42a08c529024337d1b859839c9ce7f797f784555 Mon Sep 17 00:00:00 2001
From: Markus Armbruster <armbru@redhat.com>
Date: Fri, 13 Mar 2020 14:27:57 +0100
Subject: [PATCH] fixup! scripts: Coccinelle script to use
 ERRP_AUTO_PROPAGATE()

---
 scripts/coccinelle/auto-propagated-errp.cocci | 37 ++++++++++---------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccin=
elle/auto-propagated-errp.cocci
index 7dac2dcfa4..43b0b0e63b 100644
--- a/scripts/coccinelle/auto-propagated-errp.cocci
+++ b/scripts/coccinelle/auto-propagated-errp.cocci
@@ -136,45 +136,48 @@ symbol errp;
=20
 // Warn several Error * definitions.
 @check1 disable optional_qualifier exists@
-identifier fn =3D rule1.fn, local_err, local_err2;
+identifier fn, _errp, local_err, local_err2;
+position p1, p2;
 @@
=20
- fn(..., Error ** ____, ...)
+ fn(..., Error **_errp, ...)
  {
      ...
-     Error *local_err =3D NULL;
+     Error *local_err =3D NULL;@p1
      ... when any
-     Error *local_err2 =3D NULL;
+     Error *local_err2 =3D NULL;@p2
      ... when any
  }
=20
 @ script:python @
 fn << check1.fn;
+p1 << check1.p1;
+p2 << check1.p2;
 @@
=20
 print('Warning: function {} has several definitions of '
-      'Error * local variable'.format(fn))
+      'Error * local variable: at {}:{} and then at {}:{}'.format(
+          fn, p1[0].file, p1[0].line, p2[0].file, p2[0].line))
=20
 // Warn several propagations in control flow.
 @check2 disable optional_qualifier exists@
-identifier fn =3D rule1.fn;
-symbol errp;
+identifier fn, _errp;
 position p1, p2;
 @@
=20
- fn(..., Error ** ____, ...)
+ fn(..., Error **_errp, ...)
  {
      ...
 (
-     error_propagate_prepend(errp, ...);@p1
+     error_propagate_prepend(_errp, ...);@p1
 |
-     error_propagate(errp, ...);@p1
+     error_propagate(_errp, ...);@p1
 )
      ...
 (
-     error_propagate_prepend(errp, ...);@p2
+     error_propagate_prepend(_errp, ...);@p2
 |
-     error_propagate(errp, ...);@p2
+     error_propagate(_errp, ...);@p2
 )
      ... when any
  }
@@ -198,7 +201,7 @@ print('Warning: function {} propagates to errp several =
times in '
 // the same, just without error_propagate() call), coccinelle fails to
 // match this "out: }".
 @ disable optional_qualifier@
-identifier rule1.fn, rule1.local_err, out;
+identifier fn, rule1.local_err, out;
 symbol errp;
 @@
=20
@@ -239,7 +242,7 @@ symbol errp;
 //        *errp =3D NULL;
 //    }
 @ disable optional_qualifier exists@
-identifier rule1.fn, rule1.local_err;
+identifier fn, rule1.local_err;
 expression list args;
 symbol errp;
 @@
@@ -287,7 +290,7 @@ symbol errp;
 // previous hunk, as this conflicts with other substitutions in it (at
 // least with "- local_err =3D NULL").
 @ disable optional_qualifier@
-identifier rule1.fn, rule1.local_err;
+identifier fn, rule1.local_err;
 symbol errp;
 @@
=20
@@ -301,7 +304,7 @@ symbol errp;
=20
 // Always use the same pattern for checking error
 @ disable optional_qualifier@
-identifier rule1.fn;
+identifier fn;
 symbol errp;
 @@
=20
@@ -315,7 +318,7 @@ symbol errp;
=20
 // Revert temporary ___ identifier.
 @ disable optional_qualifier@
-identifier rule1.fn;
+identifier fn;
 @@
=20
  fn(..., Error **
--=20
2.21.1


