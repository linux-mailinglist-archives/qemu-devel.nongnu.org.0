Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9634A9739
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:57:44 +0100 (CET)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvLb-0007mU-H7
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:57:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFunW-0000NY-4j
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:22:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nFunR-00007O-8W
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643966530;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvuNWKANAJzR8cE3oULlbzWvynTtW5037MxqQmdUnlE=;
 b=TI9qErM5Fbq+E7EDuUj6uGJPmyAEop6rEooE/P2sx6YMOg9vOKxNuBh3IRuQ2cjsfRyhsN
 BF+1Mv7DROtMTajzNn+N4ZWwtdx/VBm4x5ldbgfNjb/iZU9194D1gEuve9ZdNyi98t2vMf
 grO8BK7U0a33VP3H6fZpnHK/6ymztxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-AarNKFwvNF6wRmQkdQypNw-1; Fri, 04 Feb 2022 04:22:09 -0500
X-MC-Unique: AarNKFwvNF6wRmQkdQypNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B62F1091DA1
 for <qemu-devel@nongnu.org>; Fri,  4 Feb 2022 09:22:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E39F478DFA;
 Fri,  4 Feb 2022 09:21:40 +0000 (UTC)
Date: Fri, 4 Feb 2022 09:21:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
Message-ID: <YfzwIfAYQub5LjdG@redhat.com>
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
 <Yfuw1gGPPf8IPzLB@redhat.com>
 <CAFn=p-Yq_-MDW3kWXW+D9NNHXtunYREEMxjW5mfVtM48Hcj0AA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-Yq_-MDW3kWXW+D9NNHXtunYREEMxjW5mfVtM48Hcj0AA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 05:52:10PM -0500, John Snow wrote:
> On Thu, Feb 3, 2022 at 5:40 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Jan 26, 2022 at 01:58:19PM -0500, John Snow wrote:
> >
> > As you mention though, bear in mind that a command returning
> > nothing today, might return something tomorrow. IOW, we'd be
> > going from a empty dict to a non-empty dict. If you use "None"
> > then it'd be gonig from None to a non-empty dict.
> >
> > I think you can argue both of these approaches are backwards
> > compatible. The python app is not likely to be looking at
> > the return type at all initially - unlike C, errors get
> > raised as exceptions, so you don't need to look at return
> > type to distinguish succes from failure.
> >
> > So I'd consider it merely a documentation problem to say
> > that a "None" return type might later change to a dict.
> > Dunno how you represent that in python type annotations,
> > but I presume there's a way.
> 
> I don't think type hints offer a temporal dimension to them yet :)
> 
> I started writing a much lengthier response, but the subject of
> compatibility is really complex and I am not prepared to give a
> comprehensive response to some of the issues you raise ... so instead
> I will say "Wow, good points!" and I will get back to you on some of
> it. A lot of things will only make sense if we are talking about a
> very specific type of project, with very specific goals that are
> clearly established. I don't really have that ready, here; I am just
> experimenting to learn where some of the pain points are, still.
> 
> So... I'll get back to you on this.
> 
> > We do allow fields to be deleted, which is a *non-compatible*
> > evolution, but they MUST have been marked as deprecated for
> > 2 cycles first.
> 
> Good point.
> 
> > I'd say sorting required vs optional arguments is doomed as
> > a strategy. Stuff that is mandatory today can be made optional
> > tomorrow and I think that's reasonable to want todo as we
> > evolve an API design.
> 
> Also a good point. Python requires all mandatory arguments precede all
> optional ones, so you're probably right that in order to maximize
> cross-version compatibility, keyword-only arguments for *all*
> arguments both mandatory and optional is the only real way to fly.
> 
> I think this might cause problems for Marc-Andre in rust/dbus land,
> but it's tractable in Python. I am unclear on the ramifications for
> golang. (Victor, Marc-Andre, any input here?)

Well as a general point, if we consider usage outside of
qemu.git, I'm far from convinced that generating code from
the schema as it exists today is going to be broadly usable
enough to make it worthwhile.

The problem is precisely that the code that is generated is
only ensured to work with the specific version of QEMU that
it was generated from. The key problem here is the removal
of features after deprecation.  That removal is fine if you
only ever need an API to talk to the current QEMU, or only
need to be able to introspect the current QEMU.

Management apps are likely to want to write code that works
with more than 1 version of QEMU, and be able to decide
whether they provide the params needed by the old command
or the new command.   The introspection data lets them
make the decision about which command needs to be invoked,
but it can't be used to generate the code needed for the
old command.

I don't know how exactly you're dealing with the Python
mapping. If you're literally statically generating Python
code you'll face this same problem. If on the other hand
you've just got a stub object that does dynamic dispatch
then it can dynamically adapt at runtime to work with
whatever version of the schema it queried from the QEMU
it is talking to. I'm hoping you're doing the latter
for this reason.

One strategy for compiled languages is to generate multiple
copies of the APIs, one for each QEMU version. This could
be made to work but I feel it is pretty horrific as an
approach.  Libvirt has one set of client APIs that we've
extended over time so they can be used to call both old
and new variants of commands - we just need to use the
introspected schema to decide which to use.

To make the latter viable for generating compiled code
though, we need to change how we deal with removals, by
essentially never removing things at all. Instead we
would need some way to express that "field A" or "type T"
is not present after some point in time / release.

Overall I don't think we're really in a position to use
compiled auto generated bindings, except for QMP clients
that are released in lockstep with specific QEMU versions,
and I don't think lockstep releases are a viable strategy
in general.

> > It sounds like you need a wrapper type.  This StrOrNull scenario
> > is QMP's "alternate" type IIUC, but you're trying to avoid
> > expressing the existance fo the "alternate" type in the API
> 
> Yes. This is a very clean way to type it, but it is a little more
> laborious for the user to have to remember to wrap certain strings in
> a special constructor first. Still, this is a good trick that I hadn't
> considered. I'll keep it in mind for future experiments.

Bear in mind that this situation is pretty rare, so I don't think
the user is especially burdened by needing an extra level of
indirection for using 'alternate' types

$ git grep "'alternate'" qapi
qapi/block-core.json:{ 'alternate': 'BlockDirtyBitmapMergeSource',
qapi/block-core.json:{ 'alternate': 'Qcow2OverlapChecks',
qapi/block-core.json:{ 'alternate': 'BlockdevRef',
qapi/block-core.json:{ 'alternate': 'BlockdevRefOrNull',
qapi/common.json:{ 'alternate': 'StrOrNull',

$ git grep "'StrOrNull'" qapi
qapi/block-core.json:             'iothread': 'StrOrNull',
qapi/common.json:{ 'alternate': 'StrOrNull',
qapi/migration.json:            '*tls-creds': 'StrOrNull',
qapi/migration.json:            '*tls-hostname': 'StrOrNull',
qapi/migration.json:            '*tls-authz': 'StrOrNull',


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


