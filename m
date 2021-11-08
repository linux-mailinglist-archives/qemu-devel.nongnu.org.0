Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458BC447F44
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 13:07:34 +0100 (CET)
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk3Qz-0003uR-Co
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 07:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mk3Ov-0002j4-CJ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 07:05:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mk3Or-0007gl-UN
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 07:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636373120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=opn8sffqi4s2KWz9l3MNcpIcG1cR70M8ffylNJPDzYI=;
 b=PgTdV/uZRS7x0z+M0Wfrn0PUSePjnAZ+fAbdw0yQzYeJ2CqATe1KSwF1UWFrjwl0e5U2Lr
 23TFUk7UaxxKGhODqzp992VrJUpBFjazGhQgEyTQTM7QIOxscuATjSoUntuHx9muHs2KXv
 zDjqozJ42i18vvC8lWoE29BF/Ir5Mwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Op1kIM3kPueNNs559A2pfw-1; Mon, 08 Nov 2021 07:05:16 -0500
X-MC-Unique: Op1kIM3kPueNNs559A2pfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21D0987D54C;
 Mon,  8 Nov 2021 12:05:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAD05C23A;
 Mon,  8 Nov 2021 12:05:11 +0000 (UTC)
Date: Mon, 8 Nov 2021 13:05:10 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YYkSdrGhWmIL3ZLB@redhat.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org> <YYPwogn87tMf0p7s@redhat.com>
 <87y2623of6.fsf@dusky.pond.sub.org> <YYUvZjg0lmaWE223@redhat.com>
 <87fss9vlla.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87fss9vlla.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, pkrempa@redhat.com,
 Jag Raman <jag.raman@oracle.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.11.2021 um 07:34 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 05.11.2021 um 11:08 hat Markus Armbruster geschrieben:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> 
> >> > Am 04.11.2021 um 13:13 hat Markus Armbruster geschrieben:
> >> >> The old syntax almost always has its quirks.  Ideally, we'd somehow get
> >> >> from quirky old to boring new in an orderly manner.  Sadly, we still
> >> >> don't have good solutions for that.  To make progress, we commonly
> >> >> combine JSON new with quirky old.
> >> >> 
> >> >> qemu-system-FOO -object works that way.  object_option_parse() parses
> >> >> either JSON or QemuOpts.  It wraps the former in a QObject visitor, and
> >> >> the latter in an opts visitor.
> >> >> 
> >> >> QemuOpts is flat by design[*], so the opts visitor parses flat QemuOpts
> >> >> from a (possibly non-flat) QAPI type.  How exactly it flattens, and how
> >> >> it handles clashes I don't remember.
> >> >> 
> >> >> Sadly, this means that we get quirky old even for new object types.
> >> >
> >> > For -object in the system emulator (the tools all use the keyval
> >> > visitor, so there it would work as expected), the only reason that we
> >> > need to keep the quirky old code path around is the list handling in
> >> > memory-backend.host-nodes.
> >> >
> >> > The main difficulty there is that the old QemuOpts based code path
> >> > allows specifying the option twice and both of them would effectively be
> >> > combined. Do we have any idea how to replicate this in a keyval parser
> >> > based world?
> >> 
> >> I can see just two clean solutions, but both involve upending a lot of
> >> code.
> >> 
> >> We can fuse keyval parser and visitor to get a schema-directed parser.
> >> 
> >> We can change the abstract keyval syntax to permit repeated keys.  This
> >> means replacing QDict in in the abstract syntax tree, with fallout in
> >> the visitor.
> >> 
> >> Even if we find a practical solution, I don't like the combination of
> >> "you may give the same parameter multiple times, and the last one wins"
> >> and "for a list-valued parameter, the values of repeated parameters are
> >> collected into a list".  Each makes sense on its own.  The combination
> >> not so much.  Inheriting "last one wins" from QemuOpts may have been a
> >> mistake.
> >> 
> >> The keyval way of doing lists (inherited from the block layer's usage of
> >> dotted keys?  I don't remember) requires the user to count, which isn't
> >> exactly nice, either.
> >
> > Yes. If we didn't have to maintain compatibility (or actually as soon as
> > we degrade non-JSON option lists to HMP-level support), I would
> > introduce [] and {} syntax for lists and dicts, even if that means that
> > use of these characters in strings doesn't work any more or only in a
> > limited way. I think this would be the best compromise for usability.
> >
> > Anyway, this doesn't help us with the compatibility problem we're
> > discussing here.
> >
> >> > If not, do we want to use the remaining time until 6.2 to deprecate
> >> > this? The nasty part is that the only syntax that works both now and in
> >> > the future is JSON. We can't easily accept the new keyval syntax while
> >> > still using the QemuOpts based code.
> >> 
> >> What exactly do you propose to deprecate?
> >
> > We can deprecate on two different levels. I think it's useful to do
> > both:
> >
> > 1. Broad deprecation: Stable non-JSON interfaces are degraded to
> >    a HMP-like compatibility promise.
> 
> Calling it "deprecation" might be confusing.  HMP isn't deprecated, it's
> merely not a stable interface.  That's kind of like "deprecated when you
> need stable", but saying "not a stable interface" is clearer.
> 
> When I write "deprecate" below, I mean something like "go use something
> else (no conditions)".  When I mean "use something else when you need
> stable", I write "degrade" (short for "degrade to an HMP-like
> compatibility promise").
> 
> >                                      Obviously, this can only be done
> >    for options that support JSON.
> 
> We can also degrade or even deprecate sugar options in favor of the real
> ones.  Case by case, I guess.

Right. And essentially, the non-JSON form would be considered a sugar
option, even if the option string is the same.

> >                                   Peter Maydell also wants to do this
> >    only after a big user (read: libvirt) has implemented and is
> >    using JSON, basically as a proof that the alternative is working.
> >
> >    So this can certainly be done for -object. I believe libvirt also
> >    uses JSON for -device now, so this should be fine now, too.
> 
> The non-sugar options supporting JSON are -audiodev, -blockdev, -compat,
> -display (partially), -machine (I think), -object.
> 
> -netdev is QAPIfied, but still uses QemuOpts.  Too late for 6.2, I'm
> afraid.

Ok. Not sure about the libvirt status for some of these, but -object and
-device are the ones that I know are going to be in the way in the
future, so degrading their non-JSON form would already be helpful.

> >                                                                Possibly
> >    -drive (in favour of -blockdev), though I'm not completely sure if we
> >    have gotten rid of the final users of -drive. (CCing Peter Krempa for
> >    details.)
> 
> The problem with deprecating -drive is configuring onboard block
> devices.  We need a stable interface for that, and it must be usable
> together with -blockdev.
> 
> We provided such an interface (machine properties) for some onboard
> block devices starting with commit ebc29e1bea "pc: Support firmware
> configuration with -blockdev".  Many more remain, I believe.

So maybe we need to define a form of -drive (or a new option) that would
stay stable and can just take a block node and create a DriveInfo for
it.

Anyway, not for 6.2, so let's ignore this for now.

> >    This degradation of the compatibility promise doesn't tell users what
> >    exactly is going to change, which is why doing the second one, too,
> >    might be nice.
> >
> > 2. Narrow deprecation: We can just deprecate the non-JSON form, or
> >    certain aspects of it, of memory-backend.host-nodes. This is the
> >    specific things that stops us from switching -object to keyval.
> >
> >    a. Deprecate the whole option. If you want to use it and need a
> >       stable interface, you have to use JSON. We'll just switch the
> >       non-JSON form on a flag day. Before it, you need to use QemuOpts +
> >       OptsVisitor syntax for the list; after it, you need to use keyval
> >       syntax.
> 
> I parse "the whole option" as "-object with dotted keys argument".
> Correct?

No, degrading non-JSON -object (it's still QemuOpts, so "dotted keys"
aren't even supported) is already option 1.

This one is specifically "memory-backend.host-nodes on the CLI".

> >    b. Deprecate only repeating the option. memory-backend is changed to
> >       first try visiting a list, and if that fails, it visits a string
> >       and goes through a string visitor locally to keep supporting the
> >       integer range syntax.
> 
> Possible problem: integer range syntax must not leak into the JSON form.
> 
> >    c. Deprecate all list values, but keep supporting a single integer
> >       value by using an alternate between list and int.
> 
> Single int should also not leak into JSON.

Honestly, I don't care about them leaking into JSON and QMP, and I don't
think you should either.

If we insist on a perfectly idiomatic QAPI schema as if we were writing
the objects today, we won't have made any progress even in 10 years.
Many QOM objects have properties that are a mess and it will show in the
schema. Strings that are parsed, alternates to provide different syntax
for the same thing, etc. I don't like any of this, but we're not
designing new interfaces here, but describing existing ones.

I do understand and agree that you want to keep the core infrastructure
reasonably clean from hacks, because it affects everything and we're
touching it a lot. But if an individual property in some QOM object is
in the way, we should just hack around it. Spending a lot of thought on
how to get it cleaned up would have a much higher cost than maintaining
a small hack.

Kevin


