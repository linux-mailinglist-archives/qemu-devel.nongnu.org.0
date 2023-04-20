Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FC46E98EA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWgI-0002mt-IR; Thu, 20 Apr 2023 11:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppWgA-0002kD-Uj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:58:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ppWg8-0000QK-Od
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682006315;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHQ87oOKOD+ZIKX2gwYhCItm3lCBnSKi0JoeugvoWgI=;
 b=FXo5stFr6KUd6uABbwMAbZUisfnPNzb/6oCjuahRNI6bj9SNP9oooTiNX41w+N54h9aVXb
 Qfsy8uueuVGqHKLigTStXz0xcBR/Mr7oM9LY2jEWgKBP9OTR1BtzI4D1k2DZjCEA/tliZB
 GqXdxZ6A4JEZuQFU8IsWeovf11s9eWA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-VGLW_DyBP7GcizhcCEtzgg-1; Thu, 20 Apr 2023 11:58:34 -0400
X-MC-Unique: VGLW_DyBP7GcizhcCEtzgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA6B03855562
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 15:58:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 333D2440BC;
 Thu, 20 Apr 2023 15:58:33 +0000 (UTC)
Date: Thu, 20 Apr 2023 16:58:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] tests/qtest: make more migration pre-copy scenarios
 run non-live
Message-ID: <ZEFhJ5OxmKxxmJpH@redhat.com>
References: <20230418133100.48799-1-berrange@redhat.com>
 <20230418133100.48799-3-berrange@redhat.com>
 <87wn26wvzf.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wn26wvzf.fsf@secure.mitica>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 20, 2023 at 02:59:00PM +0200, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > There are 27 pre-copy live migration scenarios being tested. In all of
> > these we force non-convergance and run for one iteration, then let it
> > converge and wait for completion during the second (or following)
> > iterations. At 3 mbps bandwidth limit the first iteration takes a very
> > long time (~30 seconds).
> >
> > While it is important to test the migration passes and convergance
> > logic, it is overkill to do this for all 27 pre-copy scenarios. The
> > TLS migration scenarios in particular are merely exercising different
> > code paths during connection establishment.
> >
> > To optimize time taken, switch most of the test scenarios to run
> > non-live (ie guest CPUs paused) with no bandwidth limits. This gives
> > a massive speed up for most of the test scenarios.
> >
> > For test coverage the following scenarios are unchanged
> >
> >  * Precopy with UNIX sockets
> >  * Precopy with UNIX sockets and dirty ring tracking
> >  * Precopy with XBZRLE
> >  * Precopy with multifd
> 
> Just for completeness: the other test that is still slow is
> /migration/vcpu_dirty_limit.
> 
> > -    migrate_ensure_non_converge(from);
> > +    if (args->live) {
> > +        migrate_ensure_non_converge(from);
> > +    } else {
> > +        migrate_ensure_converge(from);
> > +    }
> 
> Looks ... weird?
> But the only way that I can think of improving it is to pass args to
> migrate_ensure_*() and that is a different kind of weird.

I'm going to change this a little anyway. Currently for the non-live
case, I start the migration and then  stop the CPUs. I want to reverse
that order, as we should have CPUs paused before even starting the
migration to ensure we don't have any re-dirtied pages at all.

> 
> >      } else {
> > -        if (args->iterations) {
> > -            while (args->iterations--) {
> > +        if (args->live) {
> > +            if (args->iterations) {
> > +                while (args->iterations--) {
> > +                    wait_for_migration_pass(from);
> > +                }
> > +            } else {
> >                  wait_for_migration_pass(from);
> >              }
> > +
> > +            migrate_ensure_converge(from);
> 
> I think we should change iterations to be 1 when we create args, but
> otherwise, treat 0 as 1 and change it to something in the lines of:
> 
>         if (args->live) {
>             while (args->iterations-- >= 0) {
>                 wait_for_migration_pass(from);
>             }
>             migrate_ensure_converge(from);
> 
> What do you think?

I think in retrospect 'iterations' was overkill as we only use the
values 0 (implicitly 1) or 2. IOW we could just just a 'bool multipass'
to distinguish the two cases.

> > -        qtest_qmp_eventwait(to, "RESUME");
> > +        if (!args->live) {
> > +            qtest_qmp_discard_response(to, "{ 'execute' : 'cont'}");
> > +        }
> > +        if (!got_resume) {
> > +            qtest_qmp_eventwait(to, "RESUME");
> > +        }
> >  
> >          wait_for_serial("dest_serial");
> >      }
> 
> I was looking at the "culprit" of Lukas problem, and it is not directly
> obvious.  I see that when we expect one event, we just drop any event
> that we are not interested in.  I don't know if that is the proper
> behaviour or if that is what affecting this test.

I've not successfully reproduced it yet, nor figured out a real
scenario where it could plausibly happen. i'm looking to add more
debug to help us out.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


