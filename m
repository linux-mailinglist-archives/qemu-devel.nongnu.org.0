Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1751D446409
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:21:04 +0100 (CET)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miz9R-00039w-3E
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miz8T-0002Tn-VG
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miz8Q-0008Ld-Ry
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636118397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5TDE3uoiojWh5fvRjsOBkSwbr71O7j1vcItySC9INfM=;
 b=BYNiE9CvB4PK1IT9uPZiM/NWk6jd5NWRGbgCaY4bTXcADTjCa2Bnbe0Jl6ocfTpxHaNTNa
 MZ7qxyc04rqj/7gUfFcIsTWqkfIHtrTntD8tXvpWE6BhzHvYMumHD+dtEScHEM1VuZQ5w3
 sCxKcrMT/pIMQIKUK/UR/AXcb0SruGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Pgb69iL5MHCtexyD5EMgJw-1; Fri, 05 Nov 2021 09:19:56 -0400
X-MC-Unique: Pgb69iL5MHCtexyD5EMgJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FCD1100CCC0;
 Fri,  5 Nov 2021 13:19:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC92C101E591;
 Fri,  5 Nov 2021 13:19:35 +0000 (UTC)
Date: Fri, 5 Nov 2021 14:19:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Message-ID: <YYUvZjg0lmaWE223@redhat.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
 <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
 <YX/Cx7g0D5o8dVtp@stefanha-x1.localdomain>
 <87wnloce5t.fsf@dusky.pond.sub.org> <YYPwogn87tMf0p7s@redhat.com>
 <87y2623of6.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2623of6.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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

Am 05.11.2021 um 11:08 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 04.11.2021 um 13:13 hat Markus Armbruster geschrieben:
> >> The old syntax almost always has its quirks.  Ideally, we'd somehow get
> >> from quirky old to boring new in an orderly manner.  Sadly, we still
> >> don't have good solutions for that.  To make progress, we commonly
> >> combine JSON new with quirky old.
> >> 
> >> qemu-system-FOO -object works that way.  object_option_parse() parses
> >> either JSON or QemuOpts.  It wraps the former in a QObject visitor, and
> >> the latter in an opts visitor.
> >> 
> >> QemuOpts is flat by design[*], so the opts visitor parses flat QemuOpts
> >> from a (possibly non-flat) QAPI type.  How exactly it flattens, and how
> >> it handles clashes I don't remember.
> >> 
> >> Sadly, this means that we get quirky old even for new object types.
> >
> > For -object in the system emulator (the tools all use the keyval
> > visitor, so there it would work as expected), the only reason that we
> > need to keep the quirky old code path around is the list handling in
> > memory-backend.host-nodes.
> >
> > The main difficulty there is that the old QemuOpts based code path
> > allows specifying the option twice and both of them would effectively be
> > combined. Do we have any idea how to replicate this in a keyval parser
> > based world?
> 
> I can see just two clean solutions, but both involve upending a lot of
> code.
> 
> We can fuse keyval parser and visitor to get a schema-directed parser.
> 
> We can change the abstract keyval syntax to permit repeated keys.  This
> means replacing QDict in in the abstract syntax tree, with fallout in
> the visitor.
> 
> Even if we find a practical solution, I don't like the combination of
> "you may give the same parameter multiple times, and the last one wins"
> and "for a list-valued parameter, the values of repeated parameters are
> collected into a list".  Each makes sense on its own.  The combination
> not so much.  Inheriting "last one wins" from QemuOpts may have been a
> mistake.
> 
> The keyval way of doing lists (inherited from the block layer's usage of
> dotted keys?  I don't remember) requires the user to count, which isn't
> exactly nice, either.

Yes. If we didn't have to maintain compatibility (or actually as soon as
we degrade non-JSON option lists to HMP-level support), I would
introduce [] and {} syntax for lists and dicts, even if that means that
use of these characters in strings doesn't work any more or only in a
limited way. I think this would be the best compromise for usability.

Anyway, this doesn't help us with the compatibility problem we're
discussing here.

> > If not, do we want to use the remaining time until 6.2 to deprecate
> > this? The nasty part is that the only syntax that works both now and in
> > the future is JSON. We can't easily accept the new keyval syntax while
> > still using the QemuOpts based code.
> 
> What exactly do you propose to deprecate?

We can deprecate on two different levels. I think it's useful to do
both:

1. Broad deprecation: Stable non-JSON interfaces are degraded to
   a HMP-like compatibility promise. Obviously, this can only be done
   for options that support JSON. Peter Maydell also wants to do this
   only after a big user (read: libvirt) has implemented and is
   using JSON, basically as a proof that the alternative is working.

   So this can certainly be done for -object. I believe libvirt also
   uses JSON for -device now, so this should be fine now, too. Possibly
   -drive (in favour of -blockdev), though I'm not completely sure if we
   have gotten rid of the final users of -drive. (CCing Peter Krempa for
   details.)

   This degradation of the compatibility promise doesn't tell users what
   exactly is going to change, which is why doing the second one, too,
   might be nice.

2. Narrow deprecation: We can just deprecate the non-JSON form, or
   certain aspects of it, of memory-backend.host-nodes. This is the
   specific things that stops us from switching -object to keyval.

   a. Deprecate the whole option. If you want to use it and need a
      stable interface, you have to use JSON. We'll just switch the
      non-JSON form on a flag day. Before it, you need to use QemuOpts +
      OptsVisitor syntax for the list; after it, you need to use keyval
      syntax.

   b. Deprecate only repeating the option. memory-backend is changed to
      first try visiting a list, and if that fails, it visits a string
      and goes through a string visitor locally to keep supporting the
      integer range syntax.

   c. Deprecate all list values, but keep supporting a single integer
      value by using an alternate between list and int.

Picking one of these four options is enough to convert -object to
keyval. I would suggest doing both 1. and one of the options in 2.

Kevin


