Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E8C16C235
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 14:25:39 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6aDS-000115-H5
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 08:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j6Zhh-0007QJ-4c
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:52:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j6Zha-0001Hh-93
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:52:49 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36524
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j6ZhZ-0001DU-ID
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582635154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1H5OPfKRh44KkyAsiRb48VNd1UWqDOE2wt/zeMaIJQc=;
 b=aPxvAm3tBcGIIDfQL/u6HOCMCwJrCbC9M9F5vqQa7FmMbOt+f9+ajxhl0V/GRDtGnZMwUP
 OQgFcczkRgUMHHitu8u6E7Ox3oo2UQ9etpfusNinKVpMnYb3tNqKXwhPfZOARwBaWn4FJr
 swFMmMNnpIAETKyY9OLHjslrqFINWUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-2e9ZiuggOryDCa0mSFpFLw-1; Tue, 25 Feb 2020 07:52:29 -0500
X-MC-Unique: 2e9ZiuggOryDCa0mSFpFLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5F111005F70;
 Tue, 25 Feb 2020 12:52:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 654275C1D6;
 Tue, 25 Feb 2020 12:52:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E117711386A6; Tue, 25 Feb 2020 13:52:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v7 03/11] scripts: add coccinelle script to use auto
 propagated errp
References: <20200131130118.1716-1-vsementsov@virtuozzo.com>
 <20200131130118.1716-4-vsementsov@virtuozzo.com>
 <87v9nxwulz.fsf@dusky.pond.sub.org>
 <cff01a02-f99a-574d-c750-200da0c1d925@virtuozzo.com>
Date: Tue, 25 Feb 2020 13:52:19 +0100
In-Reply-To: <cff01a02-f99a-574d-c750-200da0c1d925@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 25 Feb 2020 12:08:37 +0300")
Message-ID: <87wo8aesn0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 23.02.2020 11:55, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>
>>> Script adds ERRP_AUTO_PROPAGATE macro invocation where appropriate and
>>> does corresponding changes in code (look for details in
>>> include/qapi/error.h)
>>>
>>> Usage example:
>>> spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>>>   --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
>>>   blockdev-nbd.c qemu-nbd.c {block/nbd*,nbd/*,include/block/nbd*}.[hc]
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>
>>> CC: Eric Blake <eblake@redhat.com>
>>> CC: Kevin Wolf <kwolf@redhat.com>
>>> CC: Max Reitz <mreitz@redhat.com>
>>> CC: Greg Kurz <groug@kaod.org>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Anthony Perard <anthony.perard@citrix.com>
>>> CC: Paul Durrant <paul@xen.org>
>>> CC: Stefan Hajnoczi <stefanha@redhat.com>
>>> CC: "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com>
>>> CC: Laszlo Ersek <lersek@redhat.com>
>>> CC: Gerd Hoffmann <kraxel@redhat.com>
>>> CC: Stefan Berger <stefanb@linux.ibm.com>
>>> CC: Markus Armbruster <armbru@redhat.com>
>>> CC: Michael Roth <mdroth@linux.vnet.ibm.com>
>>> CC: qemu-block@nongnu.org
>>> CC: xen-devel@lists.xenproject.org
>>>
>>>   include/qapi/error.h                          |   3 +
>>>   scripts/coccinelle/auto-propagated-errp.cocci | 158 +++++++++++++++++=
+
>>>   2 files changed, 161 insertions(+)
>>>   create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci
>>>
>>> diff --git a/include/qapi/error.h b/include/qapi/error.h
>>> index b9452d4806..79f8e95214 100644
>>> --- a/include/qapi/error.h
>>> +++ b/include/qapi/error.h
>>> @@ -141,6 +141,9 @@
>>>    *         ...
>>>    *     }
>>>    *
>>> + * For mass conversion use script
>>> + *   scripts/coccinelle/auto-propagated-errp.cocci
>>> + *
>>>    *
>>>    * Receive and accumulate multiple errors (first one wins):
>>>    *     Error *err =3D NULL, *local_err =3D NULL;
>>
>> Extra blank line.
>>
>>> diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/co=
ccinelle/auto-propagated-errp.cocci
>>> new file mode 100644
>>> index 0000000000..fb03c871cb
>>> --- /dev/null
>>> +++ b/scripts/coccinelle/auto-propagated-errp.cocci
>>> @@ -0,0 +1,158 @@
>>> +// Use ERRP_AUTO_PROPAGATE (see include/qapi/error.h)
>>> +//
>>> +// Copyright (c) 2020 Virtuozzo International GmbH.
>>> +//
>>> +// This program is free software; you can redistribute it and/or modif=
y
>>> +// it under the terms of the GNU General Public License as published b=
y
>>> +// the Free Software Foundation; either version 2 of the License, or
>>> +// (at your option) any later version.
>>> +//
>>> +// This program is distributed in the hope that it will be useful,
>>> +// but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> +// GNU General Public License for more details.
>>> +//
>>> +// You should have received a copy of the GNU General Public License
>>> +// along with this program.  If not, see <http://www.gnu.org/licenses/=
>.
>>> +//
>>> +// Usage example:
>>> +// spatch --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>>> +//  --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff =
\
>>> +//  blockdev-nbd.c qemu-nbd.c {block/nbd*,nbd/*,include/block/nbd*}.[h=
c]
>>> +
>>> +@rule0@
>>> +// Add invocation to errp-functions where necessary
>>> +// We should skip functions with "Error *const *errp"
>>> +// parameter, but how to do it with coccinelle?
>>> +// I don't know, so, I skip them by function name regex.
>>> +// It's safe: if we did not skip some functions with
>>> +// "Error *const *errp", ERRP_AUTO_PROPAGATE invocation
>>> +// will fail to compile, because of const violation.
>>
>> Not skipping a function we should skip fails to compile.
>>
>> What about skipping a function we should not skip?
>
> Then it will not be updated.. Not good but I don't have better solution.
> Still, I hope, function called *error_append_*_hint will not return error
> through errp pointer.

Seems likely.  I just dislike inferring behavior from name patterns.

Ideally, we recognize the true exceptional pattern instead, i.e. the
presence of const.  But figuring out how to make Coccinelle do that for
us may be more trouble than it's worth.

Hmm...  Coccinelle matches the parameter even with const due to what it
calls "isomorphism".  Can I disable it?  *Tinker* *tinker*

diff --git a/scripts/coccinelle/auto-propagated-errp.cocci b/scripts/coccin=
elle/auto-propagated-errp.cocci
index fb03c871cb..0c4414bff3 100644
--- a/scripts/coccinelle/auto-propagated-errp.cocci
+++ b/scripts/coccinelle/auto-propagated-errp.cocci
@@ -20,15 +20,11 @@
 //  --macro-file scripts/cocci-macro-file.h --in-place --no-show-diff \
 //  blockdev-nbd.c qemu-nbd.c {block/nbd*,nbd/*,include/block/nbd*}.[hc]
=20
-@rule0@
+@rule0 disable optional_qualifier@
 // Add invocation to errp-functions where necessary
-// We should skip functions with "Error *const *errp"
-// parameter, but how to do it with coccinelle?
-// I don't know, so, I skip them by function name regex.
-// It's safe: if we did not skip some functions with
-// "Error *const *errp", ERRP_AUTO_PROPAGATE invocation
-// will fail to compile, because of const violation.
-identifier fn !~ "error_append_.*_hint";
+// Disable optional_qualifier to skip functions with "Error *const *errp"
+// parameter,=20
+identifier fn;
 identifier local_err, ERRP;
 @@

Could you verify this results in the same tree-wide change as your
version?

>>> +identifier fn !~ "error_append_.*_hint";
>>> +identifier local_err, ERRP;
>>
>> A few of our coccinelle scripts use ALL_CAPS for meta-variables.  Most
>> don't.  Either is fine with me.  Mixing the two styles feels a bit
>> confusing, though.
>>
>>> +@@
>>> +
>>> + fn(..., Error **ERRP, ...)
>>> + {
>>> ++   ERRP_AUTO_PROPAGATE();
>>> +    <+...
>>> +        when !=3D ERRP_AUTO_PROPAGATE();
>>> +(
>>> +    error_append_hint(ERRP, ...);
>>> +|
>>> +    error_prepend(ERRP, ...);
>>> +|
>>> +    Error *local_err =3D NULL;
>>> +)
>>> +    ...+>
>>> + }
>>
>> Misses error_vprepend().  Currently harmless, but as long as we commit
>> the script, we better make it as robust as we reasonably can.
>>
>> The previous patch explains this Coccinelle script's intent:
>>
>>    To achieve these goals, later patches will add invocations
>>    of this macro at the start of functions with either use
>>    error_prepend/error_append_hint (solving 1) or which use
>>    local_err+error_propagate to check errors, switching those
>>    functions to use *errp instead (solving 2 and 3).
>>
>> This rule matches "use error_prepend/error_append_hint" directly.  It
>> appears to use presence of a local Error * variable as proxy for "use
>> local_err+error_propagate to check errors".  Hmm.
>>
>> We obviously have such a variable when we use "local_err+error_propagate
>> to check errors".  But we could also have such variables without use of
>> error_propagate().  In fact, error.h documents such use:
>>
>>   * Call a function and receive an error from it:
>>   *     Error *err =3D NULL;
>>   *     foo(arg, &err);
>>   *     if (err) {
>>   *         handle the error...
>>   *     }
>>
>> where "handle the error" frees it.
>>
>> I figure such uses typically occur in functions without an Error **errp
>> parameter.  This rule doesn't apply then.  But they could occur even in
>> functions with such a parameter.  Consider:
>>
>>      void foo(Error **errp)
>>      {
>>          Error *err =3D NULL;
>>
>>          bar(&err);
>>          if (err) {
>>              error_free(err);
>>              error_setg(errp, "completely different error");
>>          }
>>      }
>>
>> Reasonable enough when bar() gives us an error that's misleading in this
>> context, isn't it?
>>
>> The script transforms it like this:
>>
>>      void foo(Error **errp)
>>      {
>>     -    Error *err =3D NULL;
>>     +    ERRP_AUTO_PROPAGATE();
>>
>>     -    bar(&err);
>>     -    if (err) {
>>     -        error_free(err);
>>     +    bar(errp);
>>     +    if (*errp) {
>>     +        error_free_errp(errp);
>>              error_setg(errp, "completely different error");
>>          }
>>      }
>>
>> Unwanted.
>
> What is the problem with it? Updated code just use "new usual notation"
> for handling error of sub-calls in function which reports errors through
> errp pointer.

error.h's big comment asks for use of ERRP_AUTO_PROPAGATE() to "Receive
an error and pass it on to the caller".  We're not doing that here.  We
"Call a function and receive an error from it", then "Handle an error
without reporting it".

The updated code works anyway, but it's needlessly complicated.

>> Now, if this script applied in just a few dozen places, we could rely on
>> eyeballing its output to catch unwanted transformations.  Since it
>> applies in so many more, I don't feel comfortable relying on reviewer
>> eyeballs.
>>
>> Can we make rule0 directly match error_propagate(errp, local_err)
>> somehow?
>
> I think it is possible, still I'm not sure we need it.

We don't need it in the sense of "must have to avoid a buggy
transformation".  It's more like "I'd like to have it to stay close to
the documented usage of ERRP_AUTO_PROPAGATE(), and to avoid complicating
cases like the one above".

>> Another observation: the rule does not match error_reportf_err() and
>> warn_reportf_err().  These combine error_prepend(),
>> error_report()/warn_report() and error_free(), for convenience.  Don't
>> their users need ERRP_AUTO_PROPAGATE() just like error_prepend()'s
>> users?
>
> Right. These functions want to add information, which will not work
> for error_fatal without wrapping.

A simple improvement, I hope.

>>> +
>>> +@@
>>> +// Switch unusual (Error **) parameter names to errp
>>> +// (this is necessary to use ERRP_AUTO_PROPAGATE).
>>
>> Please put your rule comments right before the rule, i.e. before the
>> @-line introducing metavariable declarations, not after.  Same
>> elsewhere.
>>
>>> +identifier rule0.fn;
>>> +identifier rule0.ERRP !=3D errp;
>>> +@@
>>> +
>>> + fn(...,
>>> +-   Error **ERRP
>>> ++   Error **errp
>>> +    ,...)
>>> + {
>>> +     <...
>>> +-    ERRP
>>> ++    errp
>>> +     ...>
>>> + }
>>
>> This normalizes errp parameter naming.  It matches exactly when rule0
>> matches (and inserts ERRP_AUTO_PROPAGATE()) and the Error ** parameter
>> is unusual.  Good.
>>
>>> +
>>> +@rule1@
>>> +// We want to patch error propagation in functions regardless of
>>> +// whether the function already uses ERRP_AUTO_PROPAGATE prior to
>>> +// applying rule0, hence this one does not inherit from it.
>>
>> I'm not sure I get this comment.  Let's see what the rule does.
>>
>>> +identifier fn !~ "error_append_.*_hint";
>>> +identifier local_err;
>>> +symbol errp;
>>> +@@
>>> +
>>> + fn(..., Error **errp, ...)
>>> + {
>>> +     <...
>>> +-    Error *local_err =3D NULL;
>>> +     ...>
>>> + }
>>
>> rule1 matches like rule0, except the Error ** parameter match is
>> tightened from any C identifier to the C identifier errp, and the
>> function body match tightened from "either use
>> error_prepend/error_append_hint or which use local_err+error_propagate
>> to check errors" to just the latter.
>>
>> I figure tightening the Error ** parameter match has no effect, because
>> we already normalized the parameter name.
>>
>> So rule1 deletes variable local_err where rule0 applied.  Correct?
>
> The difference with rule0 is that rule0 contains
>  "when !=3D ERRP_AUTO_PROPAGATE()", so rule0 is not applied where
> we already have macro invocation.

Ah, I missed the when clause.

> This is why we can't inherit from rule0.
>
> No we believe that we have ERRP_AUTO_PROPAGATE invocation in all
> corresponding places (added by rule0 or before script run) and want to
> update all usage of local_err objects.

Let's see whether I got it:

* The first rule (rule0) adds ERRP_AUTO_PROPAGATE() to all functions
  that take an Error ** parameter, and either pass it error_prepend() or
  error_append_hint(), or use local_err, and don't have
  ERRP_AUTO_PROPAGATE() already, except it skips the ones named
  error_append_FOO_hint().  Uff.

  The "use local_err" part is an approximation of "use local_err +
  error_propagate()".

  The "except for the ones named error_append_FOO_hint()" part is an
  approximation of "except for the ones taking an Error *const *
  parameter".

  ERRP_AUTO_PROPAGATE() requires the Error ** parameter to be named
  @errp, which need not be the case.  The next rule fixes it up:

* The second rule ensures the parameter is named @errp wherever the
  first rule applied, renaming if necessary.

  Correct?

  Incorrect transformation followed by fixup is not ideal, because it
  can trip up reviewers.  But ideal is too expensive; this is good
  enough.

* The third rule (rule1) ensures functions that take an Error **errp
  parameter don't declare local_err, except it skips the ones named
  error_append_FOO_hint().

  In isolation, this rule makes no sense.  To make sense of it, we need
  context:

  * Subsequent rules remove all uses of @errp from any function where
    rule1 matches.

  * Preceding rules ensure any function where rule1 matches has
    ERRP_AUTO_PROPAGATE().

  Correct?

  The need for this much context is hard on reviewers.  Good enough for
  transforming the tree now, but I'd hate having to make sense of this
  again in six months.

>>> +
>>> +@@
>>> +// Handle pattern with goto, otherwise we'll finish up
>>> +// with labels at function end which will not compile.
>>> +identifier rule1.fn, rule1.local_err;
>>> +identifier OUT;
>>> +@@
>>> +
>>> + fn(...)
>>> + {
>>> +     <...
>>> +-    goto OUT;
>>> ++    return;
>>> +     ...>
>>> +- OUT:
>>> +-    error_propagate(errp, local_err);
>>> + }
>>
>> This is one special case of error_propagate() deletion.  It additionally
>> gets rid of a goto we no longer want.  For the general case, see below.
>>
>> The rule applies only where rule1 just deleted the variable.  Thus, the
>> two rules work in tandem.  Makes sense.
>>
>>> +
>>> +@@
>>> +identifier rule1.fn, rule1.local_err;
>>
>> This rule also works in tandem with rule1.
>>
>>> +expression list args; // to reindent error_propagate_prepend
>>
>> What is the comment trying to tell me?
>
> Hmm, we can safely drop it. It's about the following:
>
> instead of
>
>  -    error_propagate_prepend(errp, local_err, args);
>  +    error_prepend(errp, args);
>
> we can use "...", like
>
>  - error_propagate_prepend(errp, local_err
>  + error_prepend(errp
>    , ...);
>
> but with metavar in use, coccinelle will correctly reindent the
> whole call, which looks a lot better.

Let's drop the comment.

>>> +@@
>>> +
>>> + fn(...)
>>> + {
>>> +     <...
>>> +(
>>> +-    error_free(local_err);
>>> +-    local_err =3D NULL;
>>> ++    error_free_errp(errp);
>>
>> Reminder:
>>
>>      static inline void error_free_errp(Error **errp)
>>      {
>>          assert(errp && *errp);
>>          error_free(*errp);
>>          *errp =3D NULL;
>>      }
>>
>> Now let's examine the actual change.
>>
>> The assertion's first half trivially holds, ERRP_AUTO_PROPAGATE()
>> ensures it.
>>
>> The second half is new.  We now crash when we haven't set an error.  Why
>> is this safe?  Note that error_free(local_err) does nothing when
>> !local_err.
>
> Hmm. Looks like we should tighten this restriction, and follow error_free
> interface, which allows freeing unset errp.
>
>>
>> The zapping of the variable pointing to the Error just freed is
>> unchanged.
>>
>>> +|
>>> +-    error_free(local_err);
>>> ++    error_free_errp(errp);
>>
>> Here, the zapping is new.  Zapping dangling pointers is obviously safe.
>> Needed, or else the automatic error_propagate() due to
>> ERRP_AUTO_PROPAGATE() would propagate the dangling pointer.
>>
>>> +|
>>> +-    error_report_err(local_err);
>>> ++    error_report_errp(errp);
>>
>> The only difference to the previous case is that we also report the
>> error.
>>
>> The previous case has a buddy that additionally matches *errp =3D NULL.
>> Why not this one?
>
> Probably because no matches in code. But should be added here for
> better case coverage.

Either that or a comment pointing out what's missing, and why, namely
because the pattern doesn't exist in the tree.

>>
>>> +|
>>> +-    warn_report_err(local_err);
>>> ++    warn_report_errp(errp);
>>
>> Likewise.
>>
>> What about error_reportf_err(), warn_reportf_err()?
>>
>> Up to here, this rule transforms the various forms of error_free().
>> Next: error_propagate().
>>
>>> +|
>>> +-    error_propagate_prepend(errp, local_err, args);
>>> ++    error_prepend(errp, args);
>>> +|
>>> +-    error_propagate(errp, local_err);
>>
>> rule0's adding of ERRP_AUTO_PROPAGATE() made error_propagate()
>> redundant.
>>
>> This is the general case of error_propagate() deletion.
>>
>> I'd put the plain error_propagate() first, variations second, like you
>> do with error_free().
>>
>> If neither of these two patterns match on a path from
>> ERRP_AUTO_PROPAGATE() to return, we effectively insert error_propagate()
>> where it wasn't before.  Does nothing when the local error is null
>> there.  Bug fix when it isn't: it's at least a memory leak, and quite
>> possibly worse.
>
> Hmm. How can it be memory leak after any of error_free variants?

Consider nfs_options_qdict_to_qapi() right before commit 54b7af4369a
fixed it:

    static BlockdevOptionsNfs *nfs_options_qdict_to_qapi(QDict *options,
                                                         Error **errp)
    {
        BlockdevOptionsNfs *opts =3D NULL;
        QObject *crumpled =3D NULL;
        Visitor *v;
        Error *local_err =3D NULL;

        crumpled =3D qdict_crumple(options, errp);
        if (crumpled =3D=3D NULL) {
            return NULL;
        }

        v =3D qobject_input_visitor_new_keyval(crumpled);
        visit_type_BlockdevOptionsNfs(v, NULL, &opts, &local_err);
        visit_free(v);
        qobject_unref(crumpled);

        if (local_err) {
            return NULL;
        }

        return opts;
    }

When visit_type_BlockdevOptionsNfs() fails, we return null without
setting an error.  We also leak the error we got from
visit_type_BlockdevOptionsNfs().

Commit 54b7af4369a fixed this:

    --- a/block/nfs.c
    +++ b/block/nfs.c
    @@ -570,6 +570,7 @@ static BlockdevOptionsNfs *nfs_options_qdict_to_qap=
i(QDict *
    options,
         qobject_unref(crumpled);

         if (local_err) {
    +        error_propagate(errp, local_err);
             return NULL;
         }

If it was still broken, then your transformation would *also* fix it,
wouldn't it?

My point is: your transformation might fix actual bugs!

>> Identifying these bug fixes would be nice, but I don't have practical
>> ideas on how to do that.
>>
>> Can we explain this in the commit message?
>>
>>> +)
>>> +     ...>
>>> + }
>>> +
>>> +@@
>>> +identifier rule1.fn, rule1.local_err;
>>> +@@
>>> +
>>> + fn(...)
>>> + {
>>> +     <...
>>> +(
>>> +-    &local_err
>>> ++    errp
>>> +|
>>> +-    local_err
>>> ++    *errp
>>> +)
>>> +     ...>
>>> + }
>>
>> Also in tandem with rule1, fixes up uses of local_err.  Good.
>>
>>> +
>>> +@@
>>> +identifier rule1.fn;
>>> +@@
>>> +
>>> + fn(...)
>>> + {
>>> +     <...
>>> +- *errp !=3D NULL
>>> ++ *errp
>>> +     ...>
>>> + }
>>
>> Still in tandem with rule1, normalizes style.  Good.
>>


