Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1282FBC30
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:15:22 +0100 (CET)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tf7-0006uc-HU
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1taZ-000484-9W
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l1taU-00036g-OQ
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611072633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u15rdKUDEHg1bUia8M1CQ049W1gXHOdU/mykuDLHtWE=;
 b=OUufcIcNmBbqzwbRpiiwrkBhguI4P2X8u70UjJrV16lW6pIL12GxqaqeQ6G9Gv2n6bq4Jp
 qaFa6Bx41x5FhFizCUxxqWUP4sbPiDJ9DIXiBr8/n84SC4SwKNRWYVGy50aaLx6GJJ9Y+P
 mKhkQzHgTKUgJcaBBW37uQNv+zuFDDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-MZX-O_SCMjih_iUMDzCqeA-1; Tue, 19 Jan 2021 11:10:28 -0500
X-MC-Unique: MZX-O_SCMjih_iUMDzCqeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D86EC745D;
 Tue, 19 Jan 2021 16:10:06 +0000 (UTC)
Received: from localhost (ovpn-118-239.rdu2.redhat.com [10.10.118.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E71F819C84;
 Tue, 19 Jan 2021 16:10:05 +0000 (UTC)
Date: Tue, 19 Jan 2021 11:10:04 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 06/12] qapi/source: Add builtin null-object sentinel
Message-ID: <20210119161004.GF1227584@habkost.net>
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-7-jsnow@redhat.com>
 <878s8wyhgc.fsf@dusky.pond.sub.org>
 <a486ba8b-3250-93d5-fb7f-b6a6d74d62d6@redhat.com>
 <87eeinab8o.fsf@dusky.pond.sub.org>
 <20210118183608.GB1227584@habkost.net>
 <87ft2xxm5f.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87ft2xxm5f.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 11:21:16AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Jan 14, 2021 at 02:39:35PM +0100, Markus Armbruster wrote:
> >> John Snow <jsnow@redhat.com> writes:
> >> 
> >> > On 1/13/21 10:39 AM, Markus Armbruster wrote:
> >> >> Spelling nitpick: s/builtin/built-in/ in the title.
> >> >> 
> >> >
> >> > Sure.
> >> >
> >> >> John Snow <jsnow@redhat.com> writes:
> >> >> 
> >> >>> We use None to represent an object that has no source information
> >> >>> because it's a builtin. This complicates interface typing, since many
> >> >>> interfaces expect that there is an info object available to print errors
> >> >>> with.
> >> >>>
> >> >>> Introduce a special QAPISourceInfo that represents these built-ins so
> >> >>> that if an error should so happen to occur relating to one of these
> >> >>> builtins that we will be able to print its information, and interface
> >> >>> typing becomes simpler: you will always have a source info object.
> >> >>>
> >> >>> This object will evaluate as False, so "if info" remains a valid
> >> >>> idiomatic construct.
> >> >>>
> >> >>> NB: It was intentional to not allow empty constructors or similar to
> >> >>> create "empty" source info objects; callers must explicitly invoke
> >> >>> 'builtin()' to pro-actively opt into using the sentinel. This should
> >> >>> prevent use-by-accident.
> >> >>>
> >> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >> >> 
> >> >> As I pointed out in review of v1, this patch has two aspects mixed up:
> >> >> 
> >> >> 1. Represent "no source info" as special QAPISourceInfo instead of
> >> >>     None
> >> >> 
> >> >> 2. On error with "no source info", don't crash.
> >> >> 
> >> >> The first one is what de-complicates interface typing.  It's clearly
> >> >> serving this patch series' stated purpose: "static typing conversion".
> >> >> 
> >> >> The second one is not.  It sidetracks us into a design discussion that
> >> >> isn't related to static typing.  Maybe it's something we should discuss.
> >> >> Maybe the discussion will make us conclude we want to do this.  But
> >> >> letting the static typing work get delayed by that discussion would be
> >> >> stupid, and I'll do what I can to prevent that.
> >> >> 
> >> >
> >> > It's not unrelated. It's about finding the most tactical incision to 
> >> > make the types as we actually use them correct from a static analysis 
> >> > context.
> >> >
> >> > Maybe there's another tactical incision to make that's "smaller", for 
> >> > some perception of "smaller", but it's not unrelated.
> >> 
> >> We don't have to debate, let alone agree on relatedness.
> >> 
> >> >> The stupidest possible solution that preserves the crash is adding an
> >> >> assertion right where it crashes before this patch: in
> >> >> QAPISourceInfo.__str__().  Yes, crashing in a __str__() method is not
> >> >> nice, but it's no worse than before.  Making it better than before is a
> >> >> good idea, and you're quite welcome to try, but please not in this
> >> >> series.  Add a TODO comment asking for "make it better", then sit on
> >> >> your hands.
> >> >
> >> > I'm recently back from a fairly long PTO, so forgive me if I am 
> >> > forgetting something, but I am not really sure I fundamentally 
> >> > understand the nature of this critique.
> >> >
> >> > Making functions not "crash" is a side-effect of making the types 
> >> > correct. I don't see it as scope-creep, it's a solution to a problem 
> >> > under active consideration.
> >> 
> >> I disagree.
> >> 
> >> The crash you "fix" is *intentional*.  I was too lazy to write something
> >> like
> >> 
> >>     assert self.info
> >> 
> >> and instead relied in self.info.whatever to crash.  I don't care how it
> >> crashes, as long as it does crash.
> >> 
> >> I *like* qapi-gen to crash on such internal errors.  It's easy, and
> >> makes "this is a bug, go report it" perfectly clear.
> >> 
> >> I'd also be fine with reporting "internal error, this is a bug, go
> >> report it".  Not in this series, unless it's utterly trivial, which I
> >> doubt.
> >> 
> >> I'm *not* fine with feeding made-up info objects to the user error
> >> reporting machinery without proof that it'll actually produce a useful
> >> error message.  Definitely not trivial, thus not in this series.
> >
> > If you really don't want to change the existing behavior of the
> > code, I believe we have only two options:
> >
> > 1) Annotate self.info as QAPISourceInfo (not Optional),
> >    and add a hack to make the expression `self.info` crash if the
> >    argument to __init__() was None.
> 
> I figure you mean
> 
> * Represent "no info" as a special QAPISourceInfo (instead of None), so
>   we can annotate .info as QAPISourceInfo (not Optional).
> 
> * When we report a QAPIError, assert .info is not this special value.

Not necessarily.  Creating a special QAPISourceInfo would be one
solution to let us annotate self.info as non-Optional, but not
the only one.

Possibly the simplest way to declare self.info as non-Optional is
to make it a property that hides an Optional attribute.  e.g.:

    class ...:
        _info: Optional[QAPISourceInfo]

        @property
        def info(self) -> QAPISourceInfo:
            assert self._info is not None
            return self._info

> 
> This preserves the existing (and intentional) behavior: we crash when we
> dot into QAPISourceInfo, and we do that only when we report a QAPIError
> with that info.

I'm not sure about the "only when we report a QAPIError" part.
We seem to have multiple places in the code where self.info is
assumed to never be None, and I'm not sure all of them involve
QAPIError.

> 
> The only change in behavior is AssertionError instead of AttributeError.
> Minor improvement.
> 
> We could replace the AssertionError crash by a fatal error with suitably
> worded error message.  I'd prefer not to, because I'd rather keep the
> stack backtrace.  Admittedly not something I'd fight for.
> 
> > 2) Annotate self.info as Optional[QAPISourceInfo], and adding
> >    manual asserts everywhere self.info is used.
> >
> > Which of those two options do you find acceptable, Markus?
> 
> I think John prefers (1), because the typing gets simpler.  I'm inclined
> to leave the decision to him.

-- 
Eduardo


