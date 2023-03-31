Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9BC6D1709
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 07:53:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi7fw-0001ww-Nn; Fri, 31 Mar 2023 01:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pi7fr-0001wO-MT
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 01:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pi7fp-0004nI-DI
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 01:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680241899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5Vze4PZuokLvjAdSUHK45LKfSAsD8h2YWMty4IvF54=;
 b=EtIloRYLtGs828tT2gMs9c89JiWWEZg6pzNoREXeG4SIvyyk1rj9dhIOuppMHf190Ze8p9
 paqZcCfz7h5zCiyT+TN2UwPAsTRZ4LPx1Zan2ikWbkU2AvKIpJBmIe3L4N8gb7oRgB6z7q
 mHQ9KOmHmw5cfwJo/xlmCHzZpMw0eUU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-15pdiCaEPmSObbt5SAgyNA-1; Fri, 31 Mar 2023 01:51:37 -0400
X-MC-Unique: 15pdiCaEPmSObbt5SAgyNA-1
Received: by mail-oi1-f199.google.com with SMTP id
 r133-20020acaf38b000000b00386b94ef384so5100561oih.16
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 22:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680241897;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L5Vze4PZuokLvjAdSUHK45LKfSAsD8h2YWMty4IvF54=;
 b=nSbSa5zcwajwXHQK/e1L8Ek6UGzythjJSy4Z8kpGrZjk9FKFLFBbM63Es8nANVX/OV
 inlvm1BO5Fik2lso+oZ1GtVhL30hyWYyZ1LYB+Wj4ojvxC1ANVlYiCuZzIh5rWoS41Yg
 KFR154t8rXX4NavYbEgxrF5NdgBO3BpdKbvwzSyHvfecFZF8ze4bHEdiRBw1kc/fB24U
 B754Qv02ITKWtj1eto+P3n9RPTDkKt3631up87IQiFMeXD4/6Hrfs2HjXHKQfo+BUh+l
 e85Cn+U4BFn97of0U0gxf6QzgUpXUYBl9Ek7+qWxcAxM4EpQqh4GLo5yHc+b00AfQ6T8
 UdAQ==
X-Gm-Message-State: AAQBX9dwXmhB20hKBFLs+63epe/zzkepEoyd7OhQR0tYyOdKNffbIbGY
 P02kJNvVtcvIxtfQYJrCh4sD4LybkvDNu8pJot4EDpntSt/hwVc07hRPMa1FuV7LcNmuSk73ck7
 wP+HZ4jnxS/OBXw4=
X-Received: by 2002:a05:6870:4409:b0:17e:a41f:53fc with SMTP id
 u9-20020a056870440900b0017ea41f53fcmr16053486oah.55.1680241896772; 
 Thu, 30 Mar 2023 22:51:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZazxOimF4dh4Y/GcMZD7bgwG36/KJ1pz5EYOuq1ULjJcoK6BulG3lUMgkHVyQuuatQSH5dqg==
X-Received: by 2002:a05:6870:4409:b0:17e:a41f:53fc with SMTP id
 u9-20020a056870440900b0017ea41f53fcmr16053477oah.55.1680241896468; 
 Thu, 30 Mar 2023 22:51:36 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a802:19c0:a363:dfcf:ad3e:8303?
 ([2804:1b3:a802:19c0:a363:dfcf:ad3e:8303])
 by smtp.gmail.com with ESMTPSA id
 vk10-20020a0568710e4a00b0017e0c13b29asm643849oab.36.2023.03.30.22.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 22:51:35 -0700 (PDT)
Message-ID: <cb17d76c55366837f0ecc2ce6ff3efb9d3ab4737.camel@redhat.com>
Subject: Re: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Juan
 Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Date: Fri, 31 Mar 2023 02:51:32 -0300
In-Reply-To: <ZCYKvo/bs1srv2HK@x1n>
References: <20230327161518.2385074-1-leobras@redhat.com>
 <ZCWanp5hITk4HImX@redhat.com> <ZCWeWy3Yluda1VbF@x1n>
 <ZCWjWzkNK3dupgo6@redhat.com> <ZCWxzROM13XLoGyf@work-vm>
 <ZCYKvo/bs1srv2HK@x1n>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2023-03-30 at 18:18 -0400, Peter Xu wrote:
> On Thu, Mar 30, 2023 at 04:59:09PM +0100, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > > On Thu, Mar 30, 2023 at 10:36:11AM -0400, Peter Xu wrote:
> > > > On Thu, Mar 30, 2023 at 03:20:14PM +0100, Daniel P. Berrang=C3=A9 w=
rote:
> > > > > On Mon, Mar 27, 2023 at 01:15:18PM -0300, Leonardo Bras wrote:
> > > > > > Since the introduction of multifd, it's possible to perform a m=
ultifd
> > > > > > migration and finish it using postcopy.
> > > > > >=20
> > > > > > A bug introduced by yank (fixed on cfc3bcf373) was previously p=
reventing
> > > > > > a successful use of this migration scenario, and now it should =
be
> > > > > > working on most cases.
> > > > > >=20
> > > > > > But since there is not enough testing/support nor any reported =
users for
> > > > > > this scenario, we should disable this combination before it may=
 cause any
> > > > > > problems for users.
> > > > >=20
> > > > > Clearly we don't have enough testing, but multifd+postcopy looks
> > > > > like a clearly useful scenario that we should be supporting.
> > > > >=20
> > > > > Every post-copy starts with at least one pre-copy iteration, and
> > > > > using multifd for that will be important for big VMs where single
> > > > > threaded pre-copy is going to be CPU bound. The greater amount we
> > > > > can transfer in the pre-copy phase, the less page faults / latenc=
y
> > > > > spikes postcopy is going to see.

I totally agree. It's a valid and useful scenario, and I am far from denyin=
g
this.

The thing is: postcopy + multifd has been 'available' for a while, but 100%
broken at least since the introduction of Yank (this was fixed on cfc3bcf37=
3).
And even this 100% incidence bug was only noticed by an avid tester, meanin=
g no
one was actually triggering postcopy after a multifd migration.

The proposal of this patchset is to avoid that unaware users just ends up l=
osing
their VM due to a possible bug that may happen while using this configurati=
on.

> > > >=20
> > > > If we're using 1-round precopy + postcopy approach, the amount of m=
emory
> > > > will be the same which is the guest mem size.
> > > >=20
> > > > Multifd will make the round shorter so more chance of getting less
> > > > re-dirtied pages during the iteration, but that effect is limited. =
 E.g.:
> > > >=20
> > > >   - For a very idle guest, finishing 1st round in 1min or 3min may =
not
> > > >     bring a large difference because most of the pages will be cons=
tant
> > > >     anyway, or
> > > >=20
> > > >   - For a very busy guest, probably similar amount of pages will be=
 dirtied
> > > >     no matter in 1min / 3min.  Multifd will bring a benefit here, b=
ut
> > > >     busier the guest smaller the effect.
> > >=20
> > > I don't feel like that follows. If we're bottlenecking mostly on CPU
> > > but have sufficient network bandwidth, then multifd can be the differ=
ence
> > > between needing to switch to post-copy or being successful in converg=
ing
> > > in pre-copy.
> > >=20
> > > IOW, without multifd we can expect 90% of guests will get stuck and n=
eed
> > > a switch to post-copy, but with multifd 90% of the guest will complet=
e
> > > while in precopy mode and only 10% need switch to post-copy. That's g=
ood
> > > because it means most guests will avoid the increased failure risk an=
d
> > > the period of increased page fault latency from post-copy.
>=20
> Makes sense.  But we may need someone to look after that, though.  I am
> aware that Juan used to plan doing work in this area.  Juan, have you
> started looking into fixing multifd + postcopy (for current phase, not fo=
r
> a complete support)?  If we're confident and think resolving it is easy
> then I think it'll be worthwhile, and this patch may not be needed.
>=20
> We should always keep in mind though that currently the user can suffer
> from weird errors or crashes when using them together, and that's the maj=
or
> reason Leonardo proposed this patch - we either fix things soon or we
> disable them, which also makes sense to me.
>=20
> I think time somehow proved that it's non-trivial to fix them soon, hence
> this patch.  I'll be 100% more than happy when patches coming to prove me
> wrong to fix things up (along with a multifd+postcopy qtest).

Yes, exactly.

I am not sure on how bugfixes are provided upstream to older versions, but =
this
issue hits since qemu 6.0.0.=C2=A0Are we providing a fix to those versions?=
=C2=A0

If so, it's probably easier to have this patch disabling the combination th=
an a
full backport with the fix.


>=20
> >=20
> > Agreed, although I think Peter's point was that in the cases where you
> > know the guests are crazy busy and you're always going to need postcopy=
,
> > it's a bit less of an issue.
> > (But still, getting multiple fd's in the postcopy phase is good to
> > reduce latency).
>=20
> Yes, that'll be another story though, IMHO.
>=20
> When talking about this, I'd guess it'll be easier (and much less code) t=
o
> just spawn more preempt threads than multifd ones: some of them can servi=
ce
> page faults only, but some of them just keeps dumping concurrently with t=
he
> migration thread.
>=20
> It should be easy because all preempt threads on dest buffers the reads a=
nd
> they'll be as simple as a wrapper of ram_load_postcopy().  I think it cou=
ld
> naturally just work, but I'll need to check when we think it more
> seriously.
>=20
> >=20
> > Dave
> >=20
> > >=20
> > > > > In terms of migration usage, my personal recommendation to mgmt
> > > > > apps would be that they should always enable the post-copy featur=
e
> > > > > when starting a migration. Even if they expect to try to get it t=
o
> > > > > complete using exclusively pre-copy in the common case, its usefu=
l
> > > > > to have post-copy capability flag enabled, as a get out of jail
> > > > > free card. ie if migration ends up getting stuck in non-convergan=
ce,
> > > > > or they have a sudden need to urgently complete the migration it =
is
> > > > > good to be able to flip to post-copy mode.
> > > >=20
> > > > I fully agree.

Yes, I also agree with this. Nice analogy with the "out of jail free card" =
:)
It's great to have multifd with the postcopy option, once it is working fin=
e.

Imagine this same scenario: multifd migration not converging, so trigger
postcopy: VM crashes.=C2=A0
It feels much worse that telling the user this option is not supported.

> > > >=20
> > > > It should not need to be enabled only if not capable, e.g., the des=
t host
> > > > may not have privilege to initiate the userfaultfd (since QEMU post=
copy
> > > > requires kernel fault traps, so it's very likely).
> > >=20
> > > Sure, the mgmt app (libvirt) should be checking support for userfault=
fd
> > > on both sides before permitting / trying to enable the feature.

+1

> > >=20
> > >=20
> > > > > I'd suggest that we instead add a multifd+postcopy test case to
> > > > > migration-test.c and tackle any bugs it exposes. By blocking it
> > > > > unconditionally we ensure no one will exercise it to expose any
> > > > > further bugs.

We can revert the patch as soon as it is working nicely. This may take some
time, though. That's why we want to keep it safe for the time being.

> > > >=20
> > > > That's doable.  But then we'd better also figure out how to identif=
y the
> > > > below two use cases of both features enabled:
> > > >=20
> > > >   a. Enable multifd in precopy only, then switch to postcopy (curre=
ntly
> > > >   mostly working but buggy; I think Juan can provide more informati=
on here,
> > > >   at least we need to rework multifd flush when switching, and test=
 and
> > > >   test over to make sure there's nothing else missing).
> > > >=20
> > > >   b. Enable multifd in both precopy and postcopy phase (currently
> > > >   definitely not supported)
> > > >=20
> > > > So that mgmt app will be aware whether multifd will be enabled in p=
ostcopy
> > > > or not.  Currently we can't identify it.
> > > >=20
> > > > I assume we can say by default "mutlifd+postcopy" means a) above, b=
ut we
> > > > need to document it, and when b) is wanted and implemented someday,=
 we'll
> > > > need some other flag/cap for it.
> > >=20
> > > As I've mentioned a few times, I think we need to throw away the idea
> > > of exposing capabilities that mgmt apps need to learn about, and make
> > > the migration protocol fully bi-directional so src + dst QEMU can
> > > directly negotiate features. Apps shouldn't have to care about the
> > > day-to-day improvements in the migration impl to the extent that they
> > > are today.
>=20
> I agree that setting the same caps on both sides are ugly, but shouldn't
> this a separate problem, and we should allow the user to choose (no matte=
r
> to apply that to src only, or to both sides)?

Agree that setting stuff only once is much nicer than setting it twice, and
could have avoided some config issues I had in the past.=20

>=20
> To be explicit, I am thinking maybe even if multifd+postcopy full support
> will be implemented, for some reason the user still wants to only use
> multifd during precopy but not postcopy.  I'm afraid automatically choose
> what's the latest supported may not always work for the user for whatever
> reasons and could have other implications here.

I agree the user should be the one choosing what to use, but then having bo=
th
sides' qemu to negotiate this without the other side's management app, that
could be nice. Failure to setting something could happen on requesting side=
,
something like "Remote host don't support TLS".

>=20
> In short, IMHO it's an ABI breakage if user enabled both features, then i=
t
> behaves differently after upgrading QEMU with a full multifd+postcopy
> support added.
>=20
> Thanks,
>=20


Thank you all for the comments!

Leo


