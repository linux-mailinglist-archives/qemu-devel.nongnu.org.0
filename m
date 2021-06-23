Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E33B19C0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:19:23 +0200 (CEST)
Received: from localhost ([::1]:33826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1qk-0003CH-Gf
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lw1oW-0000Qk-Ef
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lw1oU-0003k6-Dx
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624450621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P610PfzP7valeeEGLXaDEuwqD1AMewvLsUYdegKoKZA=;
 b=FcDOpPzEo9yfHrIN5xeZkmQz+E8+VyMktM3LHpRhAdrK+WbXRyfFb94wz8AAvjHXeKw0Lf
 b7myJ1Bmc+oaYqTJ3X+0ga6VSugfEjSf0uIVOLDklL0a3px3aAjIcRP4NGN0bcmM+gBQJQ
 /cHFmhnsvtQ9wqQQBYpGQw4P1H6iy8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-zGGF2PwJM6yVXjaQ5NdVNg-1; Wed, 23 Jun 2021 08:16:58 -0400
X-MC-Unique: zGGF2PwJM6yVXjaQ5NdVNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA7D010C1ADC
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 12:16:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-99.ams2.redhat.com
 [10.36.112.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62ACD19D9D;
 Wed, 23 Jun 2021 12:16:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D954A112D587; Wed, 23 Jun 2021 14:16:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Auditing QEMU to replace NULL with &error_abort
References: <7132e6a4-8d3a-828e-1c08-b17954445341@redhat.com>
Date: Wed, 23 Jun 2021 14:16:55 +0200
In-Reply-To: <7132e6a4-8d3a-828e-1c08-b17954445341@redhat.com> (John Snow's
 message of "Tue, 22 Jun 2021 11:20:44 -0400")
Message-ID: <87k0mk4vyg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> One of our Bite-Sized tasks on the wiki was to audit QEMU and, where
> applicable, replace NULL with &error_abort.

Context: NULL argument means "do not pass back an error object".

This has two uses:

1. When the function permits detecting failure in another way (typically
   by returning distinct error value(s)), and the caller is not
   interested in additional detail an error object provides.

2. When the caller ignores errors.

In both cases, the caller can pass NULL to save itself the trouble of
receiving and freeing a (useless) error object.

Our most common *actual* use, however, is

3. When the call site assumes errors can't happen (and breaks when they
do).

This is wrong.  The caller should pass &error_abort instead.

> Everywhere else where it is intentional, we ought to add a comment or
> some other indication explaining why it's the right thing to do in
> that case.
>
> That task was ported to GitLab here:
> https://gitlab.com/qemu-project/qemu/-/issues/414
>
> mreitz and thuth have chimed in with excellent clarifications. Phil
> suggests that we should replace the intentional cases of NULL with=20
> &error_ignore, to possibly log squelched errors in debugging
> mode. This sounds like a great idea to me:
>
> - It allows us to remove NULL entirely, which as mreitz states "is
>   fishy", but sometimes valid.

It's perfectly valid when all you'd do with an error object was to throw
it away.

Whether you do that by passing NULL or some other special value doesn't
matter all that much.  NULL is what GError uses.  It has turned out to
be prone to misuse, but I suspect any other value would be just as
prone.

> - It annotates callsites where we have decided the ignore is
>   intentional and correct.

A fresh special value like &error_ignore can serve as "we really mean to
ignore the error object here" signal, but only until people start
misusing it the same way NULL is being misused.

> - It gives us a review opportunity to require good comments at those
>   callsites.

Requiring a use of &error_ignore to come with a comment may be a
workable way to ensure &error_ignore remains a reliable "we mean it".
It may also tempt people to add more NULL arguments, because that's
easier.

Nothing stops us from add good comments to calls passing NULL.

> - It gives us a good way to measure progress of the audit by making
>   the removal of NULL a concrete goal.

Yes, this is far easier to measure than "has a good comment".

>                                        (Can we use coccinelle to find
>  all instances of the literal NULL being passed to a variable named
> errp?)

Maybe.

> From a brief chat on IRC, Markus is "reluctant to deviate from GError
> even more". It sounds like there isn't consensus here. We should=20
> probably reach consensus on this point before trying to pass the task
> off to a neophyte, though -- so I'm raising this discussion on the
> list and CC'ing Markus to see if we can define the task better or not.

QEMU's Error preceded the adoption of GLib.  It is "loosely patterned
after Glib's GError" (quoting error.h's big comment).

We've discussed replacing Error by GError a couple of times.
Non-trivial due to differences between the two, in particular
&error_abort, &error_fatal, and error_propagate(()'s "multiple
propagations are fine, first one wins" vs. g_propagate_error()'s
"propagate at most once".

The latter difference seems rather pointless now, but removing it safely
would be a substantial amount of work[1].

&error_abort has been a clear win for us.  &error_fatal too, when used
judiciously.  Marc-Andr=C3=A9 tried to get both into GLib, unsuccessfully[2=
].

Nevertheless, I'm reluctant to add more differeneces.  That's not a
"no".  It's a "you need to make a compelling case".

> --js
>
>
> (Personally, I've got no horse in the race beyond moving these tasks
> off the wiki and onto the tracker. Since I moved the issue, though, I
> might as well make sure the filing is accurate.)


[1] Converting old code to ERRP_GUARD() may reduce the use of
error_propagate() to a point where removing becomes easy.

[2] https://gitlab.gnome.org/GNOME/glib/-/issues/2288


