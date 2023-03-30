Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81C66D08EF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:59:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phtii-0003tG-FX; Thu, 30 Mar 2023 10:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phtif-0003sS-K9
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phtid-0000CG-2R
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680188257;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VwtSGaZ4LV2gDM+QFf5Vdk3i8RLDDWFS5eIUvgzLfdE=;
 b=SiIv9nj3zbgonTHyBJA645QqdUZ89EuIxxl4b30rJXULjxnMsxRxy7V5qN7AfE714SiAcS
 HEETqe/jBQO3t5wbw1WKfwny3U2LSYw6aBMM4Ep96t4lxXlrH16qhvSqRFfVM787qbCiGn
 LCPmjNTjcVZ8xSVSSvMYN+StT4CUG10=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-ITC5jL1YMY-0aLboHSnjlQ-1; Thu, 30 Mar 2023 10:57:35 -0400
X-MC-Unique: ITC5jL1YMY-0aLboHSnjlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 121508028AD
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 14:57:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0515018EC7;
 Thu, 30 Mar 2023 14:57:33 +0000 (UTC)
Date: Thu, 30 Mar 2023 15:57:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v1 1/1] migration: Disable postcopy + multifd migration
Message-ID: <ZCWjWzkNK3dupgo6@redhat.com>
References: <20230327161518.2385074-1-leobras@redhat.com>
 <ZCWanp5hITk4HImX@redhat.com> <ZCWeWy3Yluda1VbF@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCWeWy3Yluda1VbF@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 30, 2023 at 10:36:11AM -0400, Peter Xu wrote:
> On Thu, Mar 30, 2023 at 03:20:14PM +0100, Daniel P. Berrangé wrote:
> > On Mon, Mar 27, 2023 at 01:15:18PM -0300, Leonardo Bras wrote:
> > > Since the introduction of multifd, it's possible to perform a multifd
> > > migration and finish it using postcopy.
> > > 
> > > A bug introduced by yank (fixed on cfc3bcf373) was previously preventing
> > > a successful use of this migration scenario, and now it should be
> > > working on most cases.
> > > 
> > > But since there is not enough testing/support nor any reported users for
> > > this scenario, we should disable this combination before it may cause any
> > > problems for users.
> > 
> > Clearly we don't have enough testing, but multifd+postcopy looks
> > like a clearly useful scenario that we should be supporting.
> > 
> > Every post-copy starts with at least one pre-copy iteration, and
> > using multifd for that will be important for big VMs where single
> > threaded pre-copy is going to be CPU bound. The greater amount we
> > can transfer in the pre-copy phase, the less page faults / latency
> > spikes postcopy is going to see.
> 
> If we're using 1-round precopy + postcopy approach, the amount of memory
> will be the same which is the guest mem size.
> 
> Multifd will make the round shorter so more chance of getting less
> re-dirtied pages during the iteration, but that effect is limited.  E.g.:
> 
>   - For a very idle guest, finishing 1st round in 1min or 3min may not
>     bring a large difference because most of the pages will be constant
>     anyway, or
> 
>   - For a very busy guest, probably similar amount of pages will be dirtied
>     no matter in 1min / 3min.  Multifd will bring a benefit here, but
>     busier the guest smaller the effect.

I don't feel like that follows. If we're bottlenecking mostly on CPU
but have sufficient network bandwidth, then multifd can be the difference
between needing to switch to post-copy or being successful in converging
in pre-copy.

IOW, without multifd we can expect 90% of guests will get stuck and need
a switch to post-copy, but with multifd 90% of the guest will complete
while in precopy mode and only 10% need switch to post-copy. That's good
because it means most guests will avoid the increased failure risk and
the period of increased page fault latency from post-copy.


> > In terms of migration usage, my personal recommendation to mgmt
> > apps would be that they should always enable the post-copy feature
> > when starting a migration. Even if they expect to try to get it to
> > complete using exclusively pre-copy in the common case, its useful
> > to have post-copy capability flag enabled, as a get out of jail
> > free card. ie if migration ends up getting stuck in non-convergance,
> > or they have a sudden need to urgently complete the migration it is
> > good to be able to flip to post-copy mode.
> 
> I fully agree.
> 
> It should not need to be enabled only if not capable, e.g., the dest host
> may not have privilege to initiate the userfaultfd (since QEMU postcopy
> requires kernel fault traps, so it's very likely).

Sure, the mgmt app (libvirt) should be checking support for userfaultfd
on both sides before permitting / trying to enable the feature.


> > I'd suggest that we instead add a multifd+postcopy test case to
> > migration-test.c and tackle any bugs it exposes. By blocking it
> > unconditionally we ensure no one will exercise it to expose any
> > further bugs.
> 
> That's doable.  But then we'd better also figure out how to identify the
> below two use cases of both features enabled:
> 
>   a. Enable multifd in precopy only, then switch to postcopy (currently
>   mostly working but buggy; I think Juan can provide more information here,
>   at least we need to rework multifd flush when switching, and test and
>   test over to make sure there's nothing else missing).
> 
>   b. Enable multifd in both precopy and postcopy phase (currently
>   definitely not supported)
> 
> So that mgmt app will be aware whether multifd will be enabled in postcopy
> or not.  Currently we can't identify it.
> 
> I assume we can say by default "mutlifd+postcopy" means a) above, but we
> need to document it, and when b) is wanted and implemented someday, we'll
> need some other flag/cap for it.

As I've mentioned a few times, I think we need to throw away the idea
of exposing capabilities that mgmt apps need to learn about, and make
the migration protocol fully bi-directional so src + dst QEMU can
directly negotiate features. Apps shouldn't have to care about the
day-to-day improvements in the migration impl to the extent that they
are today.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


