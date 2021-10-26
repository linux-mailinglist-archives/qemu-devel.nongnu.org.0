Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE143B77B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:43:37 +0200 (CEST)
Received: from localhost ([::1]:51060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPY0-0002nO-CI
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfPPU-0006uJ-Ea
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfPPQ-0004Sf-9f
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635266082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UmOTWZBtLbauT1tecQK5nxzap3hD9JT8fpn/buxCcuU=;
 b=CQ4/h0BmZlWBIZPzsrZUGFUn5W1yylIGrkHeYiu98X8X1jat6IKTSK2oWEiMiZVmECcgWG
 D9h5EbQC9mjCosuah3xXDhTC7nS2tLauvm0zLpyf7SGM0ZCstN7+VGhVKnflAqZJwre/41
 GTUJ11DxlXDOrHKoKXpAosxkPdmWvGk=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-Xyg8gfNBNEedGnXPkGe2xQ-1; Tue, 26 Oct 2021 12:34:39 -0400
X-MC-Unique: Xyg8gfNBNEedGnXPkGe2xQ-1
Received: by mail-vk1-f200.google.com with SMTP id
 q28-20020a056122003c00b002dc89c07882so11983vkd.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmOTWZBtLbauT1tecQK5nxzap3hD9JT8fpn/buxCcuU=;
 b=aPRmr8EsZAlm8jp+XDKyVtq3gGWVhHcmkf4JzOX+FBHupjxaGZa8i0rZQGv/zqIhkc
 vjex2QKI8mHvWlsSX5l3Ec7f6tV3kFozSzxl2wafsTehhGRvoi+m3UvNF0vf2xHtQY11
 Xg4XPr/ja8+T3yrQRaqipu1XC5rvh0rUAT6pHW7H656Kzmdjepb+eWHLoes2U4nVJZDy
 9IPvYOo5xOsWe5LNeAfx6ZmvhTxz1O0t6hW9YIwO5dITCHDj8Rol3Z0OsW1rGf5IUC/o
 Hato5K25PyQfrk4qFNp6KBRnvDBg96tyoJ/HaMHfx+7Eytu24vhVhqJH6NoZHB3kx8Ug
 I7Wg==
X-Gm-Message-State: AOAM531gONsIao4auZf5PhIV3rf578SAVwR96AM87HSzO0SDTwZlmNqW
 e3Qtk67/7m1dtyJ+UfLz/XQBK2oG1fT3PGxYzEMBi+Rx9AyJWG7Czj/S5p4z882/v0Jk9nQHDao
 kQCaCw1wcoRw8vFT+sCbDoFPybpZe24k=
X-Received: by 2002:a05:6122:2214:: with SMTP id
 bb20mr24059048vkb.9.1635266077787; 
 Tue, 26 Oct 2021 09:34:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN9/bF8rECguiTzBA+Q7iOzLkxN0RYA2Qv9zSD42s4J0JMRN/5dppdBp/luprKzmK6flXoGIlnqyXnQkB+kLY=
X-Received: by 2002:a05:6122:2214:: with SMTP id
 bb20mr24059003vkb.9.1635266077464; 
 Tue, 26 Oct 2021 09:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-3-armbru@redhat.com>
 <CAFn=p-bkEhAMknmKm_242Yb6RkDyhjuPtWxmQUEfsexgx9PHaw@mail.gmail.com>
 <877de06wyx.fsf@dusky.pond.sub.org>
In-Reply-To: <877de06wyx.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 12:34:26 -0400
Message-ID: <CAFn=p-ZmMud31jvaLbp_D3vsKxEyGBDSbhMX_YXLDf3nb-0Z6w@mail.gmail.com>
Subject: Re: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a9347e05cf440d0e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a9347e05cf440d0e
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 3:56 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> Add special feature 'unstable' everywhere the name starts with 'x-',
> >> except for InputBarrierProperties member x-origin and
> >> MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
> >> because these two are actually stable.
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  qapi/block-core.json | 123 +++++++++++++++++++++++++++++++------------
> >>  qapi/migration.json  |  35 +++++++++---
> >>  qapi/misc.json       |   6 ++-
> >>  qapi/qom.json        |  11 ++--
> >>  4 files changed, 130 insertions(+), 45 deletions(-)
> >>
> >> diff --git a/qapi/block-core.json b/qapi/block-core.json
> >> index 6d3217abb6..ce2c1352cb 100644
> >> --- a/qapi/block-core.json
> >> +++ b/qapi/block-core.json
> >> @@ -1438,6 +1438,9 @@
> >>  #
> >>  # @x-perf: Performance options. (Since 6.0)
> >>  #
> >> +# Features:
> >> +# @unstable: Member @x-perf is experimental.
> >> +#
> >>
> >
> > It'd be a lot cooler if we could annotate the unstable member directly
> > instead of confusing it with the syntax that might describe the entire
> > struct/union/command/etc, but ... eh, it's just a doc field, so I'm not
> > gonna press on this. I don't have the energy to get into a doc formatting
> > standard discussion right now, so: sure, why not?
>
> By design, we have a single doc comment block for the entire definition.
>
> When Kevin invented feature flags (merge commit 4747524f9f2), he added
> them just to struct types.  He added "feature sections" for documenting
> features.  It mirrors the "argument sections" for documenting members.
> Makes sense.
>
> Aside: he neglected to update qapi-code-gen.rst section "Definition
> documentation", and I failed to catch it.  I'll make up for it.
>
> Peter and I then added feature flags to the remaining definitions
> (commit 23394b4c39 and 013b4efc9b).  Feature sections make sense there,
> too.
>
> I then added them to struct members (commit 84ab008687).  Instead of
> doing something fancy for documenting feature flags of members, I simply
> used the existing feature sections.  This conflates member features with
> struct features.
>
>
Yeah, that's the part I don't like. If this isn't the first instance of
breaking the seal, though, this is the wrong time for me to comment on it.
Don't worry about it for this series.


> What could "something fancy" be?  All we have for members is "argument
> sections", which are basically a name plus descriptive text.  We'd have
> to add structure to that, say nest feature sections into argument
> sections.  I have no appetite for that right now.
>
>
(Tangent below, unrelated to acceptance of this series)

Yeah, I don't have an appetite for it at the moment either. I'll have to
read Marc-Andre's recent sphinx patches and see if I want to do more work
-- I had a bigger prototype a few months back I didn't bring all the way
home, but I am still thinking about reworking our QAPIDoc format. It's ...
well. I don't really want to, but I am not sure how else to bring some of
the features I want home, and I think I need some more time to think
carefully through exactly what I want to do and why.

I wouldn't mind chatting about it with you sometime soon -- there's a few
things to balance here, such as:

(1) Reworking the doc format would be an obnoxious amount of churn, ...
(2) ...but the Sphinx internals are really not meant to be used the way
we're using them right now, ...
(3) ...but I also don't want to write our QAPI docstrings in a way that
*targets* Sphinx. Not that I think we'll be dropping it any time soon, but
it still feels like the wrong idea to tie them so closely together.

I'm hoping there's an opportunity to make the parsing nicer with minimal
changes to the parsing and format, though. It just might require enforcing
a *pinch* more structure. I could see how I feel about per-field
annotations at that point. I consider them interesting for things like the
Python SDK where I may want to enable/disable warnings for using deprecated
stuff at the client-level. (e.g., let's say you're using Python SDK 6.2 to
talk to a 6.1 client. Nothing stops you from doing this, but some commands
will simply be rejected by QEMU as it won't know what you're talking about.
Using deprecated fields or commands to talk to an older client will produce
no visible warning from QEMU either, as it wasn't deprecated at that point
in time. Still, the client may wish to know that they're asking for future
trouble -- so it's a thought that client-side warnings have some play here.)

Ehhhhhhhhhhhhhhhh don't worry about it for now, I guess I'll plow forward a
bit with the Sphinx stuff I'm thinking of at some point Soon:tm: and worry
about where the immovable objects are when I get there. This is foot-based
landmine-detection, and it works 100% of the time.

>
> >
> >>  # Note: @on-source-error and @on-target-error only affect background
> >>  #       I/O.  If an error occurs during a guest write request, the
> >> device's
> >>  #       rerror/werror actions will be used.
> >> @@ -1452,7 +1455,9 @@
> >>              '*on-source-error': 'BlockdevOnError',
> >>              '*on-target-error': 'BlockdevOnError',
> >>              '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
> >> -            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
> >> +            '*filter-node-name': 'str',
> >> +            '*x-perf': { 'type': 'BackupPerf',
> >> +                         'features': [ 'unstable' ] } } }
> >>
> >>  ##
> >>  # @DriveBackup:
>
> [...]
>
> > Seems OK, but I didn't audit for false positives/negatives. Trusting your
> > judgment here. (It looks like Phil started to audit this in his reply to
> > your previous commit, so I'll trust that.)
>
> I'm pretty sure the x- names that don't get feature 'unstable' are
> actually stable; see my reply to Kashyap.
>
> I did check git history for each that does get feature 'unstable'.
> Double-checking is of course welcome.
>
>
Yeh, just explaining why it's not an R-B. I'm trying to be a bit better
about reviews by not forcing myself to do "all or nothing". I trust your
work, of course -- I just also did not double check it :)

I need to change the way in which I read and discuss code so that I can be
more responsive.


> > Acked-by: John Snow <jsnow@redhat.com>
>
> Thanks!
>
>

--000000000000a9347e05cf440d0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 3:56 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Add special feature &#39;unstable&#39; everywhere the name starts =
with &#39;x-&#39;,<br>
&gt;&gt; except for InputBarrierProperties member x-origin and<br>
&gt;&gt; MemoryBackendProperties member x-use-canonical-path-for-ramblock-i=
d,<br>
&gt;&gt; because these two are actually stable.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 qapi/block-core.json | 123 +++++++++++++++++++++++++++++++--=
----------<br>
&gt;&gt;=C2=A0 qapi/migration.json=C2=A0 |=C2=A0 35 +++++++++---<br>
&gt;&gt;=C2=A0 qapi/misc.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 ++-=
<br>
&gt;&gt;=C2=A0 qapi/qom.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 ++--<br>
&gt;&gt;=C2=A0 4 files changed, 130 insertions(+), 45 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/qapi/block-core.json b/qapi/block-core.json<br>
&gt;&gt; index 6d3217abb6..ce2c1352cb 100644<br>
&gt;&gt; --- a/qapi/block-core.json<br>
&gt;&gt; +++ b/qapi/block-core.json<br>
&gt;&gt; @@ -1438,6 +1438,9 @@<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt;=C2=A0 # @x-perf: Performance options. (Since 6.0)<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt; +# Features:<br>
&gt;&gt; +# @unstable: Member @x-perf is experimental.<br>
&gt;&gt; +#<br>
&gt;&gt;<br>
&gt;<br>
&gt; It&#39;d be a lot cooler if we could annotate the unstable member dire=
ctly<br>
&gt; instead of confusing it with the syntax that might describe the entire=
<br>
&gt; struct/union/command/etc, but ... eh, it&#39;s just a doc field, so I&=
#39;m not<br>
&gt; gonna press on this. I don&#39;t have the energy to get into a doc for=
matting<br>
&gt; standard discussion right now, so: sure, why not?<br>
<br>
By design, we have a single doc comment block for the entire definition.<br=
>
<br>
When Kevin invented feature flags (merge commit 4747524f9f2), he added<br>
them just to struct types.=C2=A0 He added &quot;feature sections&quot; for =
documenting<br>
features.=C2=A0 It mirrors the &quot;argument sections&quot; for documentin=
g members.<br>
Makes sense.<br>
<br>
Aside: he neglected to update qapi-code-gen.rst section &quot;Definition<br=
>
documentation&quot;, and I failed to catch it.=C2=A0 I&#39;ll make up for i=
t.<br>
<br>
Peter and I then added feature flags to the remaining definitions<br>
(commit 23394b4c39 and 013b4efc9b).=C2=A0 Feature sections make sense there=
,<br>
too.<br>
<br>
I then added them to struct members (commit 84ab008687).=C2=A0 Instead of<b=
r>
doing something fancy for documenting feature flags of members, I simply<br=
>
used the existing feature sections.=C2=A0 This conflates member features wi=
th<br>
struct features.<br>
<br></blockquote><div><br></div><div>Yeah, that&#39;s the part I don&#39;t =
like. If this isn&#39;t the first instance of breaking the seal, though, th=
is is the wrong time for me to comment on it. Don&#39;t worry about it for =
this series.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
What could &quot;something fancy&quot; be?=C2=A0 All we have for members is=
 &quot;argument<br>
sections&quot;, which are basically a name plus descriptive text.=C2=A0 We&=
#39;d have<br>
to add structure to that, say nest feature sections into argument<br>
sections.=C2=A0 I have no appetite for that right now.<br>
<br></blockquote><div><br></div><div>(Tangent below, unrelated to acceptanc=
e of this series)</div><div><br></div><div>Yeah, I don&#39;t have an appeti=
te for it at the moment either. I&#39;ll have to read Marc-Andre&#39;s rece=
nt sphinx patches and see if I want to do more work -- I had a bigger proto=
type a few months back I didn&#39;t bring all the way home, but I am still =
thinking about reworking our QAPIDoc format. It&#39;s ... well. I don&#39;t=
 really want to, but I am not sure how else to bring some of the features I=
 want home, and I think I need some more time to think carefully through ex=
actly what I want to do and why.</div><div><br></div><div>I wouldn&#39;t mi=
nd chatting about it with you sometime soon -- there&#39;s a few things to =
balance here, such as:<br></div><div><br></div><div>(1) Reworking the doc f=
ormat would be an obnoxious amount of churn, ...<br></div><div>(2) ...but t=
he Sphinx internals are really not meant to be used the way we&#39;re using=
 them right now, ...<br></div><div>(3) ...but I also don&#39;t want to writ=
e our QAPI docstrings in a way that *targets* Sphinx. Not that I think we&#=
39;ll be dropping it any time soon, but it still feels like the wrong idea =
to tie them so closely together.<br></div><div><br></div><div>I&#39;m hopin=
g there&#39;s an opportunity to make the parsing nicer with minimal changes=
 to the parsing and format, though. It just might require enforcing a *pinc=
h* more structure. I could see how I feel about per-field annotations at th=
at point. I consider them interesting for things like the Python SDK where =
I may want to enable/disable warnings for using deprecated stuff at the cli=
ent-level. (e.g., let&#39;s say you&#39;re using Python SDK 6.2 to talk to =
a 6.1 client. Nothing stops you from doing this, but some commands will sim=
ply be rejected by QEMU as it won&#39;t know what you&#39;re talking about.=
 Using deprecated fields or commands to talk to an older client will produc=
e no visible warning from QEMU either, as it wasn&#39;t deprecated at that =
point in time. Still, the client may wish to know that they&#39;re asking f=
or future trouble -- so it&#39;s a thought that client-side warnings have s=
ome play here.)<br></div><div><br></div>Ehhhhhhhhhhhhhhhh don&#39;t worry a=
bout it for now, I guess I&#39;ll plow forward a bit with the Sphinx stuff =
I&#39;m thinking of at some point Soon:tm: and worry about where the immova=
ble objects are when I get there. This is foot-based landmine-detection, an=
d it works 100% of the time.<br></div><div class=3D"gmail_quote"><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;<br>
&gt;&gt;=C2=A0 # Note: @on-source-error and @on-target-error only affect ba=
ckground<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0I/O.=C2=A0 If an error occurs du=
ring a guest write request, the<br>
&gt;&gt; device&#39;s<br>
&gt;&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0rerror/werror actions will be us=
ed.<br>
&gt;&gt; @@ -1452,7 +1455,9 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*on-source-er=
ror&#39;: &#39;BlockdevOnError&#39;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*on-target-er=
ror&#39;: &#39;BlockdevOnError&#39;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*auto-finaliz=
e&#39;: &#39;bool&#39;, &#39;*auto-dismiss&#39;: &#39;bool&#39;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*filter-node-name&=
#39;: &#39;str&#39;, &#39;*x-perf&#39;: &#39;BackupPerf&#39;=C2=A0 } }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*filter-node-name&=
#39;: &#39;str&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-perf&#39;: { &#=
39;type&#39;: &#39;BackupPerf&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &#39;unstable&#39; ] } } }=
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 ##<br>
&gt;&gt;=C2=A0 # @DriveBackup:<br>
<br>
[...]<br>
<br>
&gt; Seems OK, but I didn&#39;t audit for false positives/negatives. Trusti=
ng your<br>
&gt; judgment here. (It looks like Phil started to audit this in his reply =
to<br>
&gt; your previous commit, so I&#39;ll trust that.)<br>
<br>
I&#39;m pretty sure the x- names that don&#39;t get feature &#39;unstable&#=
39; are<br>
actually stable; see my reply to Kashyap.<br>
<br>
I did check git history for each that does get feature &#39;unstable&#39;.<=
br>
Double-checking is of course welcome.<br>
<br></blockquote><div><br></div><div>Yeh, just explaining why it&#39;s not =
an R-B. I&#39;m trying to be a bit better about reviews by not forcing myse=
lf to do &quot;all or nothing&quot;. I trust your work, of course -- I just=
 also did not double check it :)</div><div><br></div><div>I need to change =
the way in which I read and discuss code so that I can be more responsive.<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; Acked-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Thanks!<br>
<br>
</blockquote></div></div>

--000000000000a9347e05cf440d0e--


