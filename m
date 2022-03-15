Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D44D9A4E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:24:06 +0100 (CET)
Received: from localhost ([::1]:34668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5HZ-0004Sy-Cs
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:24:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU59a-0007i4-3I
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU59Y-0007b6-4U
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647342947;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q81EOuKRE2u4/XpENEV9V856MigbmKgMHU076wv1Y14=;
 b=R9xGVurjYBQ8lZhArPGeG8kOqgBi9cllES5hDjuWK2UxyCfHtfWZppXiPTyXqJxoH0VeWw
 z/bgYrwc8vs7wQ/eZSdydumrfVGDRbLKkPQYCGJww4OqBoZexc0M57fFW7X74aF2N2vY8h
 qhpRmosVuHa3k1o34AK0+yXPm52pkK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-PqcLwGNxOSqkRmGj0mQIJw-1; Tue, 15 Mar 2022 07:15:46 -0400
X-MC-Unique: PqcLwGNxOSqkRmGj0mQIJw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9FCD101AA6A
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:15:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 663B9400F3A;
 Tue, 15 Mar 2022 11:15:44 +0000 (UTC)
Date: Tue, 15 Mar 2022 11:15:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjB1XXzIsJWtSR4E@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
 <YjAul3GIWmB3+v0P@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YjAul3GIWmB3+v0P@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 02:13:43PM +0800, Peter Xu wrote:
> On Mon, Mar 14, 2022 at 06:49:25PM +0000, Daniel P. Berrangé wrote:
> > Taking a step back here and looking at the bigger picture of
> > migration protocol configuration....
> > 
> > Almost every time we add a new feature to migration, we end up
> > having to define at least one new migration parameter, then wire
> > it up in libvirt, and then the mgmt app too, often needing to
> > ensure it is turn on for both client and server at the same time.
> > 
> > 
> > For some features, requiring an explicit opt-in could make sense,
> > because we don't know for sure that the feature is always a benefit.
> > These are things that can be thought of as workload sensitive
> > tunables.
> > 
> > 
> > For other features though, it feels like we would be better off if
> > we could turn it on by default with no config. These are things
> > that can be thought of as migration infrastructre / transport
> > architectural designs.
> 
> Thanks for raising this discussion.  That's something I wanted to raise too
> but I just haven't, at least formally.
> 
> Actually I think I raised this question once or twice, but I just didn't
> insist trying. :)
> 
> > 
> > 
> > eg it would be nice to be able to use multifd by default for
> > migration. We would still want a tunable to control the number
> > of channels, but we ought to be able to just start with a default
> > number of channels automatically, so the tunable is only needed
> > for special cases.
> 
> I still remember you mentioned the upper layer softwares can have
> assumption on using only 1 pair of socket for migration, I think that makes
> postcopy-preempt by default impossible.
> 
> Why multifd is different here?

It isn't different. We went through the pain to extending libvirt
to know how to open many channels for multifd. We'll have todo
the same with this postcopy-pre-empt. To this day though, management
apps above libvirt largely don't enable multifd, which is a real
shame. This is the key reason I think we need to handle this at
the QEMU level automatically.

> > This post-copy is another case.  We should start off knowing
> > we can switch to post-copy at any time.
> 
> This one is kind of special and it'll be harder, IMHO.
> 
> AFAIU, postcopy users will always initiate the migration with at least a
> full round of precopy, with the hope that all the static guest pages will
> be migrated.

I think I didn't explain myself properly here. Today there are
two parts to postcopy usage in libvirt

  - Pass the "VIR_MIGRATE_POSTCOPY" when starting the migration.
    The migration still runs in pre-copy mode. This merely ensures
    we configure a bi-directional socket, so the app has the option
    to swtich to postcopy later

  - Invoke virDomainMigrateStartPostCopy  to flip from pre-copy
    to post-copy phase. This requires you previously passed
    VIR_MIGRATE_POSTCOPY to enable its use.

The first point using 'VIR_MIGRATE_POSTCOPY' should not exist.
That should be automaticaly negotiated and handled by QEMU.

Libvirt and mgmt apps should only need to care about whether
or not they call virDomainMigrateStartPostCopy to flip to
post-copy mode.

> > We should further be able to add pre-emption if we find it available.
> 
> Yeah here I have the same question per multifd above.  I just have no idea
> whether QEMU has such knowledge on making this decision.  E.g., how could
> QEMU know whether upper app is not tunneling the migration stream?  How
> could QEMU know whether the upper app could handle multiple tcp sockets
> well?

It can't do this today - that's why we need the new migration protocol
feature negotiation I describe below.

> > So rather than following our historical practice, anjd adding
> > yet another migration parameter for a specific feature, I'd
> > really encourage us to put a stop to it and future proof
> > ourselves.
> > 
> > 
> > Introduce one *final-no-more-never-again-after-this* migration
> > capability called "protocol-negotiation".
> 
> Let's see how Juan/Dave/others think.. anyway, that's something I always
> wanted.
> 
> IMHO an even simpler term can be as simple as:
> 
>   -global migration.handshake=on

This is just inventing a new migration capability framework. We
can just use existing QMP for this.

> > When that capability is set, first declare that henceforth the
> > migration transport is REQUIRED to support **multiple**,
> > **bi-directional** channels.
> 
> This new capability will simply need to depend on the return-path
> capability we already have.  E.g. exec-typed migration won't be able to
> enable return-path, so not applicable to this one too.

'exec' can be made to work if desired. Currently we only create
a unidirectuional pipe and wire it up to stdin for outgoing
migration. Nothing stops us declaring 'exec' uses a socketpair
wired to stdin + stdout, and supprot invoking 'exec' multiple
times to get many sockets

> > Now define a protocol handshake. A 5 minute thought experiment
> > starts off with something simple:
> > 
> >    dst -> src:  Greeting Message:
> >                   Magic: "QEMU-MIGRATE"  12 bytes
> >                   Num Versions: 1 byte
> >                   Version list: 1 byte * num versions
> >                   Num features: 4 bytes
> >                   Feature list: string * num features
> > 
> >    src -> dst:  Greeting Reply:
> >                   Magic: "QEMU-MIGRATE" 12 bytes
> >                   Select version: 1 byte
> >                   Num select features: 4 bytes
> >                   Selected features: string * num features   
> > 
> >    .... possibly more src <-> dst messages depending on
> >         features negotiated....
> > 
> >    src -> dst:  start migration
> >  
> >     ...traditional migration stream runs now for the remainder
> >        of this connection ...
> > 
> > 
> > 
> > I suggest "dst" starts first, so that connecting to a dst lets you
> > easily debug whether QEMU is speaking v2 or just waiting for the
> > client to send something as traditionally the case.
> 
> No strong opinion on which QEMU should start the conversation, just to
> mention that we may not be able to use this to identify whether it's an old
> or new QEMU, afaiu, because of network delays?
> 
> We can never tell whether the dest QEMU didn't talk is because it's an old
> binary or it's new binary but with high latency network.

Sure, you wouldn't want to functionally rely on it. It is mostly
just a debugging aid so you can port scan and show it is new
QEMU migration protocol not the old one.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


