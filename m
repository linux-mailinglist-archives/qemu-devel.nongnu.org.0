Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2E6D120A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 00:20:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi0bY-00047i-B8; Thu, 30 Mar 2023 18:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pi0bW-00047a-HD
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 18:18:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pi0bU-00081p-1j
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 18:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680214722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qznnXn/M3+Owz/QxtcHnkbakU5rju9iECJOgd8wOfX0=;
 b=PIOj3XrlAPvorrZZkLrYFJ6HQ3XfXlA0TAHdYhG7G/Uq8ga3WXDIHwwCsyukcZ2Umk/em/
 09GSD/6bz7XoNQAR2W/hlOYsz9+zwgb9dgSMM5DF2PkEeN4L5+Gg0Vam/RoY9Vyk62zlYQ
 b3xQnBQKZ5aVlfxnIvLQxVoLnj/xfAk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-2quYf3QtNJm48cLYDIpT2Q-1; Thu, 30 Mar 2023 18:18:41 -0400
X-MC-Unique: 2quYf3QtNJm48cLYDIpT2Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 p22-20020a05622a00d600b003e38f7f800bso13257394qtw.9
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 15:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680214720; x=1682806720;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qznnXn/M3+Owz/QxtcHnkbakU5rju9iECJOgd8wOfX0=;
 b=MlSFCFK8pkYyPWPQvvcwudsFFS6/P4pwIF/vsn10eFAE54Q8mYyh+HC5l1l+C0hbfR
 2wYXzAElu/SFZW9kesvv9h2VAV2KwgO10vbw0O47G/Ebs5UUVswnZEdwdTpRi6Hm47Tj
 +6AQpTlt21nBwO+PadbsMWq1nYjKfkWEljoezqGVEFp9qnlwo0WOvJ4caMaKBbjQS07J
 cw/qU2FlIy7EyKHDslmGDiW99uSAn0fKRsFWNjeORsM5DNS7YLhsf4obAF+eYIXjdHg3
 BSCgtKF+nzgpo6vTf0qfkNcCY5tfazrGlvYaq49T5Rv6a8TtbgIlm+3W/LYg6xko99FN
 s3rA==
X-Gm-Message-State: AAQBX9dVfmCk1loyyBzDCGEyc42Cn+GAFjvbX1TNdusc8x20z7ohYIGi
 t7cwRiO6Gzu13r7h4rzWC1QWcr/UQSKDhT6f09s23UqnbDxGFuq5b12ATxCmHKsFM0cI4PGPqQu
 L0gwQbeYvEedGsIE=
X-Received: by 2002:a05:6214:f67:b0:5e0:3825:9adb with SMTP id
 iy7-20020a0562140f6700b005e038259adbmr5907059qvb.2.1680214720550; 
 Thu, 30 Mar 2023 15:18:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350bkkSNJzeiL0tecmJZ0c/IbFlxbxqGf7dYQ8h8eQ8oFK+GSda3a6z8rsARvelUyYeDNZJ1b/Q==
X-Received: by 2002:a05:6214:f67:b0:5e0:3825:9adb with SMTP id
 iy7-20020a0562140f6700b005e038259adbmr5907032qvb.2.1680214720245; 
 Thu, 30 Mar 2023 15:18:40 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 c26-20020a056214071a00b005dd8b9345cdsm142425qvz.101.2023.03.30.15.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 15:18:39 -0700 (PDT)
Date: Thu, 30 Mar 2023 18:18:38 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
Message-ID: <ZCYKvo/bs1srv2HK@x1n>
References: <20230327161518.2385074-1-leobras@redhat.com>
 <ZCWanp5hITk4HImX@redhat.com> <ZCWeWy3Yluda1VbF@x1n>
 <ZCWjWzkNK3dupgo6@redhat.com> <ZCWxzROM13XLoGyf@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCWxzROM13XLoGyf@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, Mar 30, 2023 at 04:59:09PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Thu, Mar 30, 2023 at 10:36:11AM -0400, Peter Xu wrote:
> > > On Thu, Mar 30, 2023 at 03:20:14PM +0100, Daniel P. Berrangé wrote:
> > > > On Mon, Mar 27, 2023 at 01:15:18PM -0300, Leonardo Bras wrote:
> > > > > Since the introduction of multifd, it's possible to perform a multifd
> > > > > migration and finish it using postcopy.
> > > > > 
> > > > > A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
> > > > > a successful use of this migration scenario, and now it should be
> > > > > working on most cases.
> > > > > 
> > > > > But since there is not enough testing/support nor any reported users for
> > > > > this scenario, we should disable this combination before it may cause any
> > > > > problems for users.
> > > > 
> > > > Clearly we don't have enough testing, but multifd+postcopy looks
> > > > like a clearly useful scenario that we should be supporting.
> > > > 
> > > > Every post-copy starts with at least one pre-copy iteration, and
> > > > using multifd for that will be important for big VMs where single
> > > > threaded pre-copy is going to be CPU bound. The greater amount we
> > > > can transfer in the pre-copy phase, the less page faults / latency
> > > > spikes postcopy is going to see.
> > > 
> > > If we're using 1-round precopy + postcopy approach, the amount of memory
> > > will be the same which is the guest mem size.
> > > 
> > > Multifd will make the round shorter so more chance of getting less
> > > re-dirtied pages during the iteration, but that effect is limited.  E.g.:
> > > 
> > >   - For a very idle guest, finishing 1st round in 1min or 3min may not
> > >     bring a large difference because most of the pages will be constant
> > >     anyway, or
> > > 
> > >   - For a very busy guest, probably similar amount of pages will be dirtied
> > >     no matter in 1min / 3min.  Multifd will bring a benefit here, but
> > >     busier the guest smaller the effect.
> > 
> > I don't feel like that follows. If we're bottlenecking mostly on CPU
> > but have sufficient network bandwidth, then multifd can be the difference
> > between needing to switch to post-copy or being successful in converging
> > in pre-copy.
> > 
> > IOW, without multifd we can expect 90% of guests will get stuck and need
> > a switch to post-copy, but with multifd 90% of the guest will complete
> > while in precopy mode and only 10% need switch to post-copy. That's good
> > because it means most guests will avoid the increased failure risk and
> > the period of increased page fault latency from post-copy.

Makes sense.  But we may need someone to look after that, though.  I am
aware that Juan used to plan doing work in this area.  Juan, have you
started looking into fixing multifd + postcopy (for current phase, not for
a complete support)?  If we're confident and think resolving it is easy
then I think it'll be worthwhile, and this patch may not be needed.

We should always keep in mind though that currently the user can suffer
from weird errors or crashes when using them together, and that's the major
reason Leonardo proposed this patch - we either fix things soon or we
disable them, which also makes sense to me.

I think time somehow proved that it's non-trivial to fix them soon, hence
this patch.  I'll be 100% more than happy when patches coming to prove me
wrong to fix things up (along with a multifd+postcopy qtest).

> 
> Agreed, although I think Peter's point was that in the cases where you
> know the guests are crazy busy and you're always going to need postcopy,
> it's a bit less of an issue.
> (But still, getting multiple fd's in the postcopy phase is good to
> reduce latency).

Yes, that'll be another story though, IMHO.

When talking about this, I'd guess it'll be easier (and much less code) to
just spawn more preempt threads than multifd ones: some of them can service
page faults only, but some of them just keeps dumping concurrently with the
migration thread.

It should be easy because all preempt threads on dest buffers the reads and
they'll be as simple as a wrapper of ram_load_postcopy().  I think it could
naturally just work, but I'll need to check when we think it more
seriously.

> 
> Dave
> 
> > 
> > > > In terms of migration usage, my personal recommendation to mgmt
> > > > apps would be that they should always enable the post-copy feature
> > > > when starting a migration. Even if they expect to try to get it to
> > > > complete using exclusively pre-copy in the common case, its useful
> > > > to have post-copy capability flag enabled, as a get out of jail
> > > > free card. ie if migration ends up getting stuck in non-convergance,
> > > > or they have a sudden need to urgently complete the migration it is
> > > > good to be able to flip to post-copy mode.
> > > 
> > > I fully agree.
> > > 
> > > It should not need to be enabled only if not capable, e.g., the dest host
> > > may not have privilege to initiate the userfaultfd (since QEMU postcopy
> > > requires kernel fault traps, so it's very likely).
> > 
> > Sure, the mgmt app (libvirt) should be checking support for userfaultfd
> > on both sides before permitting / trying to enable the feature.
> > 
> > 
> > > > I'd suggest that we instead add a multifd+postcopy test case to
> > > > migration-test.c and tackle any bugs it exposes. By blocking it
> > > > unconditionally we ensure no one will exercise it to expose any
> > > > further bugs.
> > > 
> > > That's doable.  But then we'd better also figure out how to identify the
> > > below two use cases of both features enabled:
> > > 
> > >   a. Enable multifd in precopy only, then switch to postcopy (currently
> > >   mostly working but buggy; I think Juan can provide more information here,
> > >   at least we need to rework multifd flush when switching, and test and
> > >   test over to make sure there's nothing else missing).
> > > 
> > >   b. Enable multifd in both precopy and postcopy phase (currently
> > >   definitely not supported)
> > > 
> > > So that mgmt app will be aware whether multifd will be enabled in postcopy
> > > or not.  Currently we can't identify it.
> > > 
> > > I assume we can say by default "mutlifd+postcopy" means a) above, but we
> > > need to document it, and when b) is wanted and implemented someday, we'll
> > > need some other flag/cap for it.
> > 
> > As I've mentioned a few times, I think we need to throw away the idea
> > of exposing capabilities that mgmt apps need to learn about, and make
> > the migration protocol fully bi-directional so src + dst QEMU can
> > directly negotiate features. Apps shouldn't have to care about the
> > day-to-day improvements in the migration impl to the extent that they
> > are today.

I agree that setting the same caps on both sides are ugly, but shouldn't
this a separate problem, and we should allow the user to choose (no matter
to apply that to src only, or to both sides)?

To be explicit, I am thinking maybe even if multifd+postcopy full support
will be implemented, for some reason the user still wants to only use
multifd during precopy but not postcopy.  I'm afraid automatically choose
what's the latest supported may not always work for the user for whatever
reasons and could have other implications here.

In short, IMHO it's an ABI breakage if user enabled both features, then it
behaves differently after upgrading QEMU with a full multifd+postcopy
support added.

Thanks,

-- 
Peter Xu


