Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BD43C254
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 07:47:19 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfbmP-0003tq-U7
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 01:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbjt-00032X-2E
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:44:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfbjr-00007f-4N
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 01:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635313477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SfqAWffwv2HBCwrl8pZ+BS7ZqMWWzYRYj/GhvMrvfKA=;
 b=chcCfH6TPT3wrhKL7Wqn0t9M7GRrLlSMfKkCQrG+AwJMmVUlSD6b8pWHtKBRiEDHa8o3GN
 KoT3bthErSCUGU+BiE8wlNHt8s6pz7uHvg0U7t+MLhPZAii5dlJgib35vgKWjJqTqKQrze
 NyQBrEhfdfrNPrm94LcVr8lVsuM4nT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-zWL-4HgUNTu3FPuaKXC5mA-1; Wed, 27 Oct 2021 01:44:35 -0400
X-MC-Unique: zWL-4HgUNTu3FPuaKXC5mA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0941922036;
 Wed, 27 Oct 2021 05:44:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4D060BF1;
 Wed, 27 Oct 2021 05:44:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E7B8D11380A7; Wed, 27 Oct 2021 07:44:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-3-armbru@redhat.com>
 <CAFn=p-bkEhAMknmKm_242Yb6RkDyhjuPtWxmQUEfsexgx9PHaw@mail.gmail.com>
 <877de06wyx.fsf@dusky.pond.sub.org>
 <CAFn=p-ZmMud31jvaLbp_D3vsKxEyGBDSbhMX_YXLDf3nb-0Z6w@mail.gmail.com>
Date: Wed, 27 Oct 2021 07:44:24 +0200
In-Reply-To: <CAFn=p-ZmMud31jvaLbp_D3vsKxEyGBDSbhMX_YXLDf3nb-0Z6w@mail.gmail.com>
 (John Snow's message of "Tue, 26 Oct 2021 12:34:26 -0400")
Message-ID: <87h7d3c98n.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, mdroth@linux.vnet.ibm.com,
 Markus Armbruster <armbru@redhat.com>, libvir-list@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc?= =?utf-8?Q?-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Tue, Oct 26, 2021 at 3:56 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com>
>> wrote:
>> >
>> >> Add special feature 'unstable' everywhere the name starts with 'x-',
>> >> except for InputBarrierProperties member x-origin and
>> >> MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
>> >> because these two are actually stable.
>> >>
>> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> ---
>> >>  qapi/block-core.json | 123 +++++++++++++++++++++++++++++++------------
>> >>  qapi/migration.json  |  35 +++++++++---
>> >>  qapi/misc.json       |   6 ++-
>> >>  qapi/qom.json        |  11 ++--
>> >>  4 files changed, 130 insertions(+), 45 deletions(-)
>> >>
>> >> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> >> index 6d3217abb6..ce2c1352cb 100644
>> >> --- a/qapi/block-core.json
>> >> +++ b/qapi/block-core.json
>> >> @@ -1438,6 +1438,9 @@
>> >>  #
>> >>  # @x-perf: Performance options. (Since 6.0)
>> >>  #
>> >> +# Features:
>> >> +# @unstable: Member @x-perf is experimental.
>> >> +#
>> >>
>> >
>> > It'd be a lot cooler if we could annotate the unstable member directly
>> > instead of confusing it with the syntax that might describe the entire
>> > struct/union/command/etc, but ... eh, it's just a doc field, so I'm not
>> > gonna press on this. I don't have the energy to get into a doc formatting
>> > standard discussion right now, so: sure, why not?
>>
>> By design, we have a single doc comment block for the entire definition.
>>
>> When Kevin invented feature flags (merge commit 4747524f9f2), he added
>> them just to struct types.  He added "feature sections" for documenting
>> features.  It mirrors the "argument sections" for documenting members.
>> Makes sense.
>>
>> Aside: he neglected to update qapi-code-gen.rst section "Definition
>> documentation", and I failed to catch it.  I'll make up for it.
>>
>> Peter and I then added feature flags to the remaining definitions
>> (commit 23394b4c39 and 013b4efc9b).  Feature sections make sense there,
>> too.
>>
>> I then added them to struct members (commit 84ab008687).  Instead of
>> doing something fancy for documenting feature flags of members, I simply
>> used the existing feature sections.  This conflates member features with
>> struct features.
>>
>>
> Yeah, that's the part I don't like. If this isn't the first instance of
> breaking the seal, though, this is the wrong time for me to comment on it.
> Don't worry about it for this series.

Okay.

>> What could "something fancy" be?  All we have for members is "argument
>> sections", which are basically a name plus descriptive text.  We'd have
>> to add structure to that, say nest feature sections into argument
>> sections.  I have no appetite for that right now.
>>
>>
> (Tangent below, unrelated to acceptance of this series)
>
> Yeah, I don't have an appetite for it at the moment either. I'll have to
> read Marc-Andre's recent sphinx patches and see if I want to do more work
> -- I had a bigger prototype a few months back I didn't bring all the way
> home, but I am still thinking about reworking our QAPIDoc format. It's ...
> well. I don't really want to, but I am not sure how else to bring some of
> the features I want home, and I think I need some more time to think
> carefully through exactly what I want to do and why.
>
> I wouldn't mind chatting about it with you sometime soon -- there's a few
> things to balance here, such as:
>
> (1) Reworking the doc format would be an obnoxious amount of churn, ...

Yes.  But that need not be the end of the argument, it may be the
beginning of one.

> (2) ...but the Sphinx internals are really not meant to be used the way
> we're using them right now, ...

Happy to trust you on this one.

> (3) ...but I also don't want to write our QAPI docstrings in a way that
> *targets* Sphinx. Not that I think we'll be dropping it any time soon, but
> it still feels like the wrong idea to tie them so closely together.

Maybe.  Depends on what we get for it.

> I'm hoping there's an opportunity to make the parsing nicer with minimal
> changes to the parsing and format, though. It just might require enforcing
> a *pinch* more structure. I could see how I feel about per-field
> annotations at that point.

The doc comment language is the result of a series of pragmatic
decisions that got us from semi-accidental comment conventions to where
we are now.  Each of the decisions made sense at the time.  The result
is messy to describe and to parse.  It's limiting and hard to grow
further.

>                            I consider them interesting for things like the
> Python SDK where I may want to enable/disable warnings for using deprecated
> stuff at the client-level. (e.g., let's say you're using Python SDK 6.2 to
> talk to a 6.1 client. Nothing stops you from doing this, but some commands
> will simply be rejected by QEMU as it won't know what you're talking about.
> Using deprecated fields or commands to talk to an older client will produce
> no visible warning from QEMU either, as it wasn't deprecated at that point
> in time. Still, the client may wish to know that they're asking for future
> trouble -- so it's a thought that client-side warnings have some play here.)
>
> Ehhhhhhhhhhhhhhhh don't worry about it for now, I guess I'll plow forward a
> bit with the Sphinx stuff I'm thinking of at some point Soon:tm: and worry
> about where the immovable objects are when I get there. This is foot-based
> landmine-detection, and it works 100% of the time.

Soldier, hand me the binoculars before you enter the minefield.  Good
luck!

Back to serious: I feel we need to wrap the typing hints work before we
start the next big QAPI schema language project.

>> >>  # Note: @on-source-error and @on-target-error only affect background
>> >>  #       I/O.  If an error occurs during a guest write request, the
>> >> device's
>> >>  #       rerror/werror actions will be used.
>> >> @@ -1452,7 +1455,9 @@
>> >>              '*on-source-error': 'BlockdevOnError',
>> >>              '*on-target-error': 'BlockdevOnError',
>> >>              '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
>> >> -            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
>> >> +            '*filter-node-name': 'str',
>> >> +            '*x-perf': { 'type': 'BackupPerf',
>> >> +                         'features': [ 'unstable' ] } } }
>> >>
>> >>  ##
>> >>  # @DriveBackup:
>>
>> [...]
>>
>> > Seems OK, but I didn't audit for false positives/negatives. Trusting your
>> > judgment here. (It looks like Phil started to audit this in his reply to
>> > your previous commit, so I'll trust that.)
>>
>> I'm pretty sure the x- names that don't get feature 'unstable' are
>> actually stable; see my reply to Kashyap.
>>
>> I did check git history for each that does get feature 'unstable'.
>> Double-checking is of course welcome.
>>
>>
> Yeh, just explaining why it's not an R-B. I'm trying to be a bit better
> about reviews by not forcing myself to do "all or nothing". I trust your
> work, of course -- I just also did not double check it :)

You stating the limits of your review is useful.

Me stating the limits of my own research is also useful :)

> I need to change the way in which I read and discuss code so that I can be
> more responsive.
>
>
>> > Acked-by: John Snow <jsnow@redhat.com>
>>
>> Thanks!
>>
>>


