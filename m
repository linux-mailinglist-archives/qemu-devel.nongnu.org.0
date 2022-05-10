Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF852158F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 14:36:07 +0200 (CEST)
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noP5y-0002PL-0f
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 08:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noP4F-0001Te-2f
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:34:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noP4B-0008H7-UT
 for qemu-devel@nongnu.org; Tue, 10 May 2022 08:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652186049;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2/zndFovT6Gv4dasMO8tymYBjI5E5G4w5+v3A5eJ1Q=;
 b=OSmGVdjh3J69Cwn6ahYUpkRoxlIwD5bAKqcjGjA+hBkhB0vUfNr0o4NA4c9a6CwdibNvs2
 1xx/JASp6YXYP3+l4aUE6elkvR57CWTrFgnAWjULImV/0a9kZIorsJFP7s+dyA4OqL3eUI
 iMGeH2jt6S1fTmMdiYVLhoGafq8cfJI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-3CgcIa7hMc-wNlmuuHsUag-1; Tue, 10 May 2022 08:34:08 -0400
X-MC-Unique: 3CgcIa7hMc-wNlmuuHsUag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 353D438041C0
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 12:34:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5999743EA19;
 Tue, 10 May 2022 12:34:06 +0000 (UTC)
Date: Tue, 10 May 2022 13:34:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
Message-ID: <YnpbuzKo681VwDkn@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87lev9mw7j.fsf@pond.sub.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10, 2022 at 02:02:56PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Tue, Apr 26, 2022 at 01:14:28PM +0200, Markus Armbruster wrote:
> >> We need to look at "following the QEMU releases" a bit more closely.
> >> 
> >> Merging your patches gives us the capability to generate a Go interface
> >> to HEAD's version of QMP.
> >> 
> >> The obvious way for an out-of-tree Go program to use this generated Go
> >> interface is to build with a specific version of it.  It can then talk
> >> QMP to any compatible QEMU version.
> >> 
> >> Compatibility with older QEMUs is not assured: stuff added since is
> >> present on the Go QMP client end, but not on the QEMU QMP server end.
> >> 
> >> Compatibility with newer QEMUs is subject to our deprecation policy:
> >> 
> >>     In general features are intended to be supported indefinitely once
> >>     introduced into QEMU.  In the event that a feature needs to be
> >>     removed, it will be listed in this section.  The feature will remain
> >>     functional for the release in which it was deprecated and one
> >>     further release.  After these two releases, the feature is liable to
> >>     be removed.
> >> 
> >> So, if you stay away from deprecated stuff, you're good for two more
> >> releases at least.
> >> 
> >> Does this work for the projects you have in mind?
> >
> > It might work for some projects, but in the general case I find it pretty
> > unappealing as a restriction. Mixing and matching new QEMU with old libvirt,
> > or vica-verca has been an incredibly common thing todo when both developing
> > and perhaps more importantly debugging problems. For example I have one
> > libvirt build and I use it against any QEMU from Fedora / any RHEL-8.x
> > update, which spans a great many QEMU releases. 
> 
> I'd like to propose that for compatibility with a wide range of QEMU
> versions, you use or reinvent libvirt.

Implicit in that statement though is that libvirt will not be able
to make use of the QAPI code generator as proposed though. If we are
designing something to make our application consumer's lives easier,
but we exclude such a major application, is our solution actually
a good one.


> > For a minimum viable use case, this doesn't feel all that difficult, as
> > conceptually instead of deleting the field from QAPI, we just need to
> > annotate it to say when it was deleted from the QEMU side.  The QAPI
> > generator for internal QEMU usage, can omit any fields annotated as
> > deleted in QAPI schema. The QAPI generator for external app usage,
> > can (optionally) be told to include deleted fields ranging back to
> > a given version number. So apps can chooses what degree of compat
> > they wish to retain.
> 
> Consider this evolution of command block_resize

To help us understand, I'll illustrate some possible interfaces
in both Go and Python, since that covers dynamic and static
languages

> * Initially, it has a mandatory argument @device[*].

Python definition:

   def block_resize(device, size)

Caller:

  block_resize('dev0', 1*GiB)


Golang definition

   type BlockResizeCommand struct {
       Device string
       Size int
   }

Caller

   cmd := &BlockResizeCommand{
       Device: "dev0",
       Size: 1 * GiB,
   }

> * An alternative way to specify the command's object emerges: new
>   argument @node-name.  Both old @device and new @node-name become
>   optional, and exactly one of them must be specified.  This is commit
>   3b1dbd11a6 "qmp: Allow block_resize to manipulate bs graph nodes."

Python definition. Tricky, as non-optional params must be before
optional params, but size is naturally the last arg. One option
is to pointlessly mark 'size' as optional

   def block_resize(device=None, node_name=None, size=None)

Caller

    block_resize(device="dev0", size=1*GiB)
    block_resize(node_name="devnode0", size=1*GiB)


In golang definition

   type BlockResizeArguments struct {
       Device string
       NodeName string
       Size int
   }

Caller choice of

   cmd := &BlockResizeCommand{
       Device: "dev0",
       Size: 1 * GiB,
   }

   cmd := &BlockResizeCommand{
       NodeName: "devnode0",
       Size: 1 * GiB,
   }


Neither case can easily prevent passing Device and NodeName
at same time.

> * At some future date, the old way gets deprecated: argument @device
>   acquires feature @deprecated.

Ok, no change needed to the APIs in either case. Possibly have
code emit a warning if a deprecated field is set.

> * Still later, the old way gets removed: @device is deleted, and
>   @node-name becomes mandatory.

Again no change needed to APIs, but QEMU will throw back an
error if the wrong one is used. 

> What is the proper version-spanning interface?
> 
> I figure it's both arguments optional, must specify the right one for
> the version of QEMU actually in use.  This spans versions, but it fails
> to abstract from them.

Yep, I think that's inevitable in this scenario. THe plus side
is that apps that want to span versions can do so. The downside
is that apps that don't want smarts to span version, may loose
compile time warnings about use of the now deleted field. 

I suggested the code generator have an option to say what level
of compat to use for generated code, so that apps can request an
API without compat, which will result in compile errors. This
though assumes every consumer app is embedding their own
generated copy of the code. Not neccessarily desirable.

At the C level you can play games with __deprecated__ to get
compile time warnings in some cases. 

#define GLIB_VERSION_MIN_REQUIRED GLIB_VERSION_2_56

causes QEMU to get compile time warnings (or errors) if it
attempts to use a API feature deprecated in 2.56, even if
the API exists in the header & library. 


> Note that it's not enough to replace "delete member" by "mark member
> deleted in <version>".  You also have to keep full history for "is it
> optional".  And for types, because those can evolve compatibly, too,
> e.g. from struct to flat union, or from string to alternate of string
> and something else.  What is the proper version-spanning interface in
> all the possible cases?

I've not thought through all possible scenarios, but there may end
up being restrictions, such that changes that were previously possible
may have to be forbidden.

One example,  in the past we could do deprecate a field 'foo', then
delete 'foo' and then some time re-introduce 'foo' with a completely
different type. That would not be possible if we wanted to maintain
compat, but in this example that's probably a good thing, as it'll
be super confusing to have the same field name change type like that
over time. Easier to just use a different name.

So the question to me is not whether all our previous changes are
still possible, but whether enough of the typwes of change are
possible, such that we can cope with the ongoing maint in a
reasonable way. I don't think we've explored the possibility enough
to say one way or the other.

> > Apps that wish to have version compat, would of course need to write
> > their code to be aware of which fields they need to seend for which
> > QEMU version.
> 
> At which point we're reinventing libvirt.

The premise of the code generators is that there are applications
that want to consume QEMU that are not libvirt. With this line of
reasoning we could easily say that all such applications should
just use libvirt and then we don't need to provide any of these
code generators.  The fact that we're considering these code
generators though, says that we're accepting there are valid use
cases that don't want to use libvirt for whatever reasons. It is
reasonable that some of those applications may wish to target
a wide range of QEMU versions, just like libvirt does.

It is also reasonable to say that libvirt would be better off if
it could auto-generate a client API for QEMU too, instead of
writing it by hand from a human reading the QAPI

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


