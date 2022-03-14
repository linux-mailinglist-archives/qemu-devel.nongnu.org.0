Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1FA4D8BEE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:52:29 +0100 (CET)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTpnv-0007fY-Qo
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:52:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTplC-0005RE-23
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nTpl8-0002hB-1J
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 14:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647283773;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lv+DayeGNg2s6RdER7xGwQRnMmH8We02/VeWhwUvo4s=;
 b=DRPt83jK540i6Cda6HjBwyVoqWB34prFl4936cqPXGp5EY8rbTjyIuRdjIWp19g7DMucLc
 Nmd/m9pcmT4t0uYrNLL8vR0UEdKqQqU8uPbfHFY0ss7jXGdVkFvieUc/zvj4A7QK74p/NG
 ZNfbANIa8SPRNoseRHqi1nZMS5npSIs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-1zuXRpTYPeS5-zDD8DCQWA-1; Mon, 14 Mar 2022 14:49:29 -0400
X-MC-Unique: 1zuXRpTYPeS5-zDD8DCQWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D11429DD985
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 18:49:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E9740C1438;
 Mon, 14 Mar 2022 18:49:27 +0000 (UTC)
Date: Mon, 14 Mar 2022 18:49:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Time to introduce a migration protocol negotiation (Re: [PATCH v2
 00/25] migration: Postcopy Preemption)
Message-ID: <Yi+ONfiZlQD2LoHX@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yh5O/eq4If4MYpTq@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:51:09PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Tue, Mar 01, 2022 at 10:27:10AM +0000, Daniel P. Berrangé wrote:
> > > > I also didn't know whether there's other limitations of it.  For example,
> > > > will a new socket pair be a problem for any VM environment (either a
> > > > limitation from the management app, container, and so on)?  I think it's
> > > > the same to multifd in that aspect, but I never explored.
> > > 
> > > If it needs extra sockets that is something apps will need to be aware
> > > of unfortunately and explicitly opt-in to :-( Migration is often
> > > tunnelled/proxied over other channels, so whatever does that needs to
> > > be aware of possibility of seeing extra sockets.
> > 
> > Ah, then probably it can never be the default.  But for sure it could be
> > nice that higher level can opt-in and make it a default at some point as
> > long as it knows the network topology is safe to do so.
> > 
> > > 
> > > > > > TODO List
> > > > > > =========
> > > > > > 
> > > > > > TLS support
> > > > > > -----------
> > > > > > 
> > > > > > I only noticed its missing very recently.  Since soft freeze is coming, and
> > > > > > obviously I'm still growing this series, so I tend to have the existing
> > > > > > material discussed. Let's see if it can still catch the train for QEMU 7.0
> > > > > > release (soft freeze on 2022-03-08)..
> > > > > 
> > > > > I don't like the idea of shipping something that is only half finished.
> > > > > It means that when apps probe for the feature, they'll see preempt
> > > > > capability present, but have no idea whether they're using a QEMU that
> > > > > is broken when combined with TLS or not. We shouldn't merge something
> > > > > just to meet the soft freeze deadline if we know key features are broken.
> > > > 
> > > > IMHO merging and declaring support are two problems.
> > > > 
> > > > To me, it's always fine to merge the code that implemented the fundation of a
> > > > feature.  The feature can be worked upon in the future.
> > > > 
> > > > Requiring a feature to be "complete" sometimes can cause burden to not only
> > > > the author of the series but also reviewers.  It's IMHO not necessary to
> > > > bind these two ideas.
> > > > 
> > > > It's sometimes also hard to define "complete": take the TLS as example, no
> > > > one probably even noticed that it won't work with TLS and I just noticed it
> > > > merely these two days..  We obviously can't merge partial patchset, but if
> > > > the patchset is well isolated, then it's not a blocker for merging, imho.
> > > > 
> > > > Per my understanding, what you worried is when we declare it supported but
> > > > later we never know when TLS will be ready for it.  One solution is I can
> > > > rename the capability as x-, then after the TLS side ready I drop the x-
> > > > prefix.  Then Libvirt or any mgmt software doesn't need to support this
> > > > until we drop the x-, so there's no risk of compatibility.
> > > > 
> > > > Would that sound okay to you?
> > > 
> > > If it has an x- prefix then we can basically ignore it from a mgmt app
> > > POV until it is actually finished.
> > > 
> > > > I can always step back and work on TLS first before it's merged, but again
> > > > I don't think it's required.
> > > 
> > > Apps increasingly consider use of TLS to be a mandatory feature for
> > > migration, so until that works, this preempt has to be considered
> > > unsupported & unfinished IMHO. So either TLS should be ready when
> > > it merges, or it should be clearly marked unsupported at the QAPI
> > > level.
> > 
> > Yes, I fully agree with it, and for huge vm migrations I think TLS is in
> > many cases mandatory.
> > 
> > I do plan to work on it right afterwards if this series land, but as the
> > series grows I just noticed maybe we should start landing some codes that's
> > already solid.  Landing the code as another benefit that I want to make
> > sure the code merged at least won't affect the existing features.
> > 
> > So what I'm curious is why TLS is getting quite some attentions in the past
> > few years but I didn't even see any selftests included in migration-test on
> > tls.  That's something I wanted to look into, maybe even before adding the
> > preempt+tls support. But maybe I just missed something, as I didn't use tls
> > a lot in the past.
> 
> Hmm, I think it's worth getting TLS working before putting the full
> series in, because it might impact the way you wire the channels up -
> it's going to take some care; but lets see which parts we can/should
> take.

Taking a step back here and looking at the bigger picture of
migration protocol configuration....

Almost every time we add a new feature to migration, we end up
having to define at least one new migration parameter, then wire
it up in libvirt, and then the mgmt app too, often needing to
ensure it is turn on for both client and server at the same time.


For some features, requiring an explicit opt-in could make sense,
because we don't know for sure that the feature is always a benefit.
These are things that can be thought of as workload sensitive
tunables.


For other features though, it feels like we would be better off if
we could turn it on by default with no config. These are things
that can be thought of as migration infrastructre / transport
architectural designs.


eg it would be nice to be able to use multifd by default for
migration. We would still want a tunable to control the number
of channels, but we ought to be able to just start with a default
number of channels automatically, so the tunable is only needed
for special cases.

This post-copy is another case.  We should start off knowing
we can switch to post-copy at any time. We should further be
able to add pre-emption if we find it available. IOW, we should
not have required anything more than 'switch to post-copy' to
be exposed to mgmtm apps.

Or enabling zero copy on either send or receive side.

Or enabling kernel-TLS offload

Or ..insert other interesting protocol feature...



All this stems from our current migration protocol that started
as a single unidirectional channel, which goes straight into
the migration data stream, with no protocol handshake  and
thus no feature negotiation either.

We've offloaded feature negotiation to libvirt and in turn to
the mgmt app and this is awful, for thue layers above, but
also awful for QEMU. Because multifd requires mgmt app opt-in,
we can wait 10 years and there will still be countless apps
using single-fd mode because they've not been updated to
opt-in.  If we negotiated features at QEMU level we could
have everything using multifd in a few years, and have dropped
single-fd mode a few years later.


So rather than following our historical practice, anjd adding
yet another migration parameter for a specific feature, I'd
really encourage us to put a stop to it and future proof
ourselves.


Introduce one *final-no-more-never-again-after-this* migration
capability called "protocol-negotiation".


When that capability is set, first declare that henceforth the
migration transport is REQUIRED to support **multiple**,
**bi-directional** channels. We might only use 1 TCP channel
in some cases, but it declares our intent that we expect to be
able to use as many channels as we see fit henceforth.

Now define a protocol handshake. A 5 minute thought experiment
starts off with something simple:

   dst -> src:  Greeting Message:
                  Magic: "QEMU-MIGRATE"  12 bytes
                  Num Versions: 1 byte
                  Version list: 1 byte * num versions
                  Num features: 4 bytes
                  Feature list: string * num features

   src -> dst:  Greeting Reply:
                  Magic: "QEMU-MIGRATE" 12 bytes
                  Select version: 1 byte
                  Num select features: 4 bytes
                  Selected features: string * num features   

   .... possibly more src <-> dst messages depending on
        features negotiated....

   src -> dst:  start migration
 
    ...traditional migration stream runs now for the remainder
       of this connection ...



I suggest "dst" starts first, so that connecting to a dst lets you
easily debug whether QEMU is speaking v2 or just waiting for the
client to send something as traditionally the case.

This shouldn't need very much code, and it gives us flexibility
to do all sorts of interesting things going forward with less
overhead for everyone involved.

We can layer in a real authentication system like SASL after
the greeting without any libvirt / mgmt app support

We can enable zero-copy at will. We can enable kernel-TLS at
will. We can add new TCP connections for clever feature XYZ.

We get a back channel every time, so dst can pass info back
to the src to optimize behaviour.

We can experiment with features and throw them away again
later without involving the mgmt app, since we negotiate
their use.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


