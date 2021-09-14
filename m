Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0222740B24D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:56:39 +0200 (CEST)
Received: from localhost ([::1]:44646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9rS-0003sr-3E
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQ9MR-0006Ab-BM
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQ9MJ-0005NY-3Q
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y00R7uXorG/rvuFet2UkGSdvIx3ZMFsLp0oOvAru3VM=;
 b=DzXZzA1kXk2WPjEIgwPBHSVelYICyxhmxw3i9NPiSb0nWt8n2B+NNuxAkLp4vFZ32PvwIB
 8NDMoWA0xAE8Wgg/+CKGshzJrI464Y1q9w/u9kIctmyheVOWQlJN/uMOu0dKhAeqEugu8t
 Q7KQru4X6L/B31LHpdW3a+PuYNuF9T4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-OJfTrESyOCeFZuTPklHMcA-1; Tue, 14 Sep 2021 10:24:23 -0400
X-MC-Unique: OJfTrESyOCeFZuTPklHMcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAB0DA0CB0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 14:24:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC86F5C1BB;
 Tue, 14 Sep 2021 14:24:21 +0000 (UTC)
Date: Tue, 14 Sep 2021 16:24:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 5/6] qapi: Add support for aliases
Message-ID: <YUCwlJCOenLKMccm@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
 <20210812161131.92017-6-kwolf@redhat.com>
 <87eea1d8x8.fsf@dusky.pond.sub.org> <YTo4tZgLIj8p2EPX@redhat.com>
 <87k0jjeeg0.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87k0jjeeg0.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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

Am 14.09.2021 um 10:42 hat Markus Armbruster geschrieben:
> >>     It also provides a new tool for evolving the schema while maintaining
> >>     backwards compatibility (possibly during a deprecation period).
> >> 
> >> For the second use, we need to be able to tack feature 'deprecated' to
> >> exactly one of the two.
> >> 
> >> We can already tack it to the "real" member.  The real member's
> >> 'deprecated' must not apply to its aliases.
> >> 
> >> We can't tack it to the alias, yet.  More on that in review of PATCH 6.
> >
> > Let's ignore this part for now. It's more an idea for a future
> > direction. The first use is what I actually need now for -chardev.
> >
> > In an early version of the series, I tried to make aliases visible in
> > introspection, but as my use case doesn't need it and I soon found out
> > that it's not completely obvious how things should be exposed, I decided
> > to leave it out in this series.
> 
> Fair.  One step at a time.  We just have to be clear on limitations.  I
> think we should caution readers that aliases are not visible in
> introspection, and therefore implementing QMP input as aliases is wrong.
> 
> What uses are left then?  I figure it's just CLI, and only because it
> lacks introspection.  Thoughts?

My current use case is CLI, yes. It might be the only one that fully
works after this series.

If we have to, we could use it in QMP with the usual hacks for detecting
features that are otherwise invisible in the schema (tie it to some
visible change, or add a feature flag), but preferably, introspection
support would be added before we use it in QMP.

> >> > +    for a in aliases:
> >> > +        if not isinstance(a, dict):
> >> > +            raise QAPISemError(info, "'aliases' members must be objects")
> >> 
> >> Convered by alias-bad-type.
> >> 
> >> Doesn't identify the offending member.  Same for all errors reported in
> >> this loop.  Users should have no trouble identifying this one
> >> themselves.  Less obvious ones might be confusing.
> >> 
> >> Class QAPISchemaAlias identifies like 'alias ' + a['name'] and 'wildcard
> >> alias', as several test results show, e.g. alias-name-conflict.err and
> >> alias-source-non-object-wildcard.err.  Could be improved on top.
> >
> > We don't have a QAPISchemaAlias here, and more importantly, we don't
> > have a name because the object that should contain the name is actually
> > not an object.
> 
> You're right for this error, and as I said, this error is good enough as
> is.  I was wondering whether the loop's remaining errors would also be
> good enough.  There, we still don't have a QAPISchemaAlias.  The point I
> was trying to make is that the way QAPISchemaAlias describes itself
> would work there as well: we survived the not isinstance(a, dict) check
> visible above, so @a either has a member @name, or it is a wildcard.
> QAPISchemaAlias.describe() describes the former as "alias 'NAME'", and
> the latter as "wildcard alias".

Ok, makes sense, I'll add the alias name to the later error messages. I
was just confused because you made the point under an error where this
doesn't apply.

> >> Now let's see what this function does.  It detects the following errors:
> >> 
> >> 1. Alias loop
> >> 
> >> 2. Alias "dotting through" a non-object
> >> 
> >> 3. Wildcard alias "dotting through" an optional object
> >> 
> >> 4. Alias must resolve to something (common or variant member, possibly
> >>    nested)
> >> 
> >> Lovely!  But how does it work?
> >> 
> >> The first loop takes care of 1.  Looks like we try to resolve the alias,
> >> then recurse, keeping track of things meanwhile so we can detect loops.
> >> Isn't this more complicated than it needs to be?
> >> 
> >> Aliases can only resolve to the same or deeper nesting levels.
> >> 
> >> An alias that resolves to a deeper level cannot be part of a loop
> >> (because we can't resolve to back to the alias's level).
> >> 
> >> So this should do:
> >> 
> >>     local_aliases_seen = {}
> >>     for all aliases that resolve to the same level:
> >>         if local_aliases_seen[alias.name]:
> >>             # loop!  we can retrace it using @local_aliases_seen if we
> >>             # care
> >>             raise ...
> >>         local_aliases_seen[alias.name] = alias
> >> 
> >> Or am I missing something?
> >
> > You can change the recursion into something iterative, but the resulting
> > code would neither be shorter nor easier to understand (well, the latter
> > is subjective).
> 
> I wasn't talking about recursion vs. (equivalent) iteration.
> 
> When searching for alias loops, recursing into aliases that resolve
> "deeper" is pointless, because they can't ever be part of a loop.
> 
> What's left is a simple linear chase of alias resolutions with loop
> detection.  Slightly complicated by not using a map from member name to
> definition, but searching through the alias list instead.  We build such
> a map: @seen.

The current recursive call of the function doesn't only detect loops,
but performs all of the four checks you identified above.

So you still need to resolve non-local aliases and check the whole path
for them even if they can't be part of a loop. There are three more
error cases that could apply for them.

For a moment I thought you're right and we don't need to resolve aliases
for these cases because other aliases will be checked separately. But
consider a case with these two aliases:

    alias1 -> alias2/bar
    alias2 -> foo

Here we need to make sure that the path foo/bar exists, which
check_path() for alias2 won't do anyway. We also must not check whether
the path alias2/bar exists without resolving aliases, because it would
incorrectly fail.

In the example, alias2 was a local alias, but the same is also true if
it were in a nested object. We still need to cjeck the full path with
resolved aliases.

> > Essentially, instead of the recursive call, you would update @first and
> > then wrap the whole thing in a while loop. Either a 'while True' if
> > Python can break out of two loops (I thought it could, but doesn't look
> > like it?), or with some additional boolean variables.
> 
> If you don't bite, I can always simplify on top :)

I'll leave the code as it is for now. Feel free to simplify on top if
you find a way that is actually simple and correct.

Kevin


