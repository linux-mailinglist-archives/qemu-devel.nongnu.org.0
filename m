Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074B94C8959
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:33:11 +0100 (CET)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzob-0006Ko-JR
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:33:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOzjF-0002vR-Tx
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:27:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOzj9-0000Wg-9J
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646130450;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMp5QZ5ebXu52vjH0x+ijuWkt1O87ANnu9CLG6xOFIU=;
 b=AvSfJ58y1ApuN0NPXiA0iy6jdKwOxF1eITAdCfXmF7ZkXKsbH90wjQPLzqVyp7u4ond9xj
 g4alY/ZV1tihk4qzAz7NRWzqMUU0yvB92acwXaSHgkKjlHn4FlB7ji6b7DCg9SR6B7o10W
 wG6larNVSlzSrd5mdig19iHoxqGWWss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-4qmlR92CMGmw2J8HXP7DPg-1; Tue, 01 Mar 2022 05:27:27 -0500
X-MC-Unique: 4qmlR92CMGmw2J8HXP7DPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3056F1858F1C
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 10:27:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFD27623F;
 Tue,  1 Mar 2022 10:27:13 +0000 (UTC)
Date: Tue, 1 Mar 2022 10:27:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 00/25] migration: Postcopy Preemption
Message-ID: <Yh30/nPtWyvqp8xo@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <Yh3yzbmOqAVV9iM9@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 06:17:49PM +0800, Peter Xu wrote:
> On Tue, Mar 01, 2022 at 09:25:55AM +0000, Daniel P. Berrangé wrote:
> > On Tue, Mar 01, 2022 at 04:39:00PM +0800, Peter Xu wrote:
> > > This is v2 of postcopy preempt series.  It can also be found here:
> > > 
> > >   https://github.com/xzpeter/qemu/tree/postcopy-preempt
> > > 
> > > RFC: https://lore.kernel.org/qemu-devel/20220119080929.39485-1-peterx@redhat.com
> > > V1:  https://lore.kernel.org/qemu-devel/20220216062809.57179-1-peterx@redhat.com
> > > 
> > > v1->v2 changelog:
> > > - Picked up more r-bs from Dave
> > > - Rename both fault threads to drop "qemu/" prefix [Dave]
> > > - Further rework on postcopy recovery, to be able to detect qemufile errors
> > >   from either main channel or postcopy one [Dave]
> > > - shutdown() qemufile before close on src postcopy channel when postcopy is
> > >   paused [Dave]
> > > - In postcopy_preempt_new_channel(), explicitly set the new channel in
> > >   blocking state, even if it's the default [Dave]
> > > - Make RAMState.postcopy_channel unsigned int [Dave]
> > > - Added patches:
> > >   - "migration: Create the postcopy preempt channel asynchronously"
> > >   - "migration: Parameter x-postcopy-preempt-break-huge"
> > >   - "migration: Add helpers to detect TLS capability"
> > >   - "migration: Fail postcopy preempt with TLS"
> > >   - "tests: Pass in MigrateStart** into test_migrate_start()"
> > > 
> > > Abstract
> > > ========
> > > 
> > > This series added a new migration capability called "postcopy-preempt".  It can
> > > be enabled when postcopy is enabled, and it'll simply (but greatly) speed up
> > > postcopy page requests handling process.
> > 
> > Is there no way we can just automatically enable this new feature, rather
> > than requiring apps to specify yet another new flag ?
> 
> I didn't make it the default for now, but I do have thought about making it
> the default when it consolidates a bit, perhaps on a new machine type.

Toggling based on machine type feels strange. If it needs a toggle that
implies it is not something that can be transparently enabled without
the app being aware of it. Given that toggling based on machine  type
would be inappropriate as existing apps expect to work with new QEMU.

> I also didn't know whether there's other limitations of it.  For example,
> will a new socket pair be a problem for any VM environment (either a
> limitation from the management app, container, and so on)?  I think it's
> the same to multifd in that aspect, but I never explored.

If it needs extra sockets that is something apps will need to be aware
of unfortunately and explicitly opt-in to :-( Migration is often
tunnelled/proxied over other channels, so whatever does that needs to
be aware of possibility of seeing extra sockets.

> > > TODO List
> > > =========
> > > 
> > > TLS support
> > > -----------
> > > 
> > > I only noticed its missing very recently.  Since soft freeze is coming, and
> > > obviously I'm still growing this series, so I tend to have the existing
> > > material discussed. Let's see if it can still catch the train for QEMU 7.0
> > > release (soft freeze on 2022-03-08)..
> > 
> > I don't like the idea of shipping something that is only half finished.
> > It means that when apps probe for the feature, they'll see preempt
> > capability present, but have no idea whether they're using a QEMU that
> > is broken when combined with TLS or not. We shouldn't merge something
> > just to meet the soft freeze deadline if we know key features are broken.
> 
> IMHO merging and declaring support are two problems.
> 
> To me, it's always fine to merge the code that implemented the fundation of a
> feature.  The feature can be worked upon in the future.
> 
> Requiring a feature to be "complete" sometimes can cause burden to not only
> the author of the series but also reviewers.  It's IMHO not necessary to
> bind these two ideas.
> 
> It's sometimes also hard to define "complete": take the TLS as example, no
> one probably even noticed that it won't work with TLS and I just noticed it
> merely these two days..  We obviously can't merge partial patchset, but if
> the patchset is well isolated, then it's not a blocker for merging, imho.
> 
> Per my understanding, what you worried is when we declare it supported but
> later we never know when TLS will be ready for it.  One solution is I can
> rename the capability as x-, then after the TLS side ready I drop the x-
> prefix.  Then Libvirt or any mgmt software doesn't need to support this
> until we drop the x-, so there's no risk of compatibility.
> 
> Would that sound okay to you?

If it has an x- prefix then we can basically ignore it from a mgmt app
POV until it is actually finished.

> I can always step back and work on TLS first before it's merged, but again
> I don't think it's required.

Apps increasingly consider use of TLS to be a mandatory feature for
migration, so until that works, this preempt has to be considered
unsupported & unfinished IMHO. So either TLS should be ready when
it merges, or it should be clearly marked unsupported at the QAPI
level.

> 
> > 
> > > Multi-channel for preemption threads
> > > ------------------------------------
> > > 
> > > Currently the postcopy preempt feature use only one extra channel and one
> > > extra thread on dest (no new thread on src QEMU).  It should be mostly good
> > > enough for major use cases, but when the postcopy queue is long enough
> > > (e.g. hundreds of vCPUs faulted on different pages) logically we could
> > > still observe more delays in average.  Whether growing threads/channels can
> > > solve it is debatable, but sounds worthwhile a try.  That's yet another
> > > thing we can think about after this patchset lands.
> > 
> > If we don't think about it upfront, then we'll possibly end up with
> > yet another tunable flag that apps have to worry about. It also
> > could make migration code even more complex if we have to support
> > two different scenarios. If we think multiple threads are goign to
> > be a benefit lets check that and if so, design it into the exposed
> > application facing interface from the start rather than retrofitting
> > afterwards.
> 
> I am not very sure we need that multi-threading.  I'm always open to
> opinions, though.
> 
> I raised it not as "must to do" but some idea in mind.  I'm not sure
> whether we'll have it some day.  Note that this is different from multifd,
> obviously only 1 multifd thread doesn't sound right at all. Postcopy is
> different, because in most cases the new thread can be idle.
> 
> That's also why this series didn't start from N threads but 1 thread only,
> because AFAICT it solves the major problem, which is the isolation between
> page request pages and background pages. One thread is a very good fit in
> many scenarios already.
> 
> So without obvious reasoning, I'm afraid it could over-engineer things if
> we start with N threads, keeping most of them idle.
> 
> Even if we need it, we'll need a parameter to specify the number of
> threads, that can be a good way to identify the boundary with old/new
> QEMUs, so e.g. upper layers like Libvirt can easily detect this difference
> if it wants by trying to detect the n_channels parameter.
> 
> Thanks,
> 
> -- 
> Peter Xu
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


