Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C53365B0A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:17:57 +0200 (CEST)
Received: from localhost ([::1]:36442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYrCN-0003rW-RE
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYrB0-0003CU-6i
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:16:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYrAt-00050G-Ky
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618928181;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iotkF/XsO627r9SowUlymX8MJXDJ/y1gj3PoCEKmgP4=;
 b=GtVndbiJPMR8ykbINAL6rmmZoAb5yrY5uRkX1Q6knsKHJAuDPJt0+Bl4sItVfI0V/VWa63
 pQ+YnvNsatcS+5Jh5zZbqU00WHEuvTRVvG4A8v4pnzrIzNV6jCTS0Xjq+Ldl8FIWPrlNPD
 1s5WaL16oWNIhRCuLO8iWLPtnfSIQeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-XS-cSSWoNTC_PVcChFy4LA-1; Tue, 20 Apr 2021 10:16:18 -0400
X-MC-Unique: XS-cSSWoNTC_PVcChFy4LA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A8171084427
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 14:16:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 649C55FCA6;
 Tue, 20 Apr 2021 14:16:01 +0000 (UTC)
Date: Tue, 20 Apr 2021 15:15:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YH7iH70ciHAz+DDa@redhat.com>
References: <874kg68z07.fsf@vitty.brq.redhat.com>
 <20210416162801.zluqlbvyipoanedw@habkost.net>
 <YH2509yA7qkYFJ0p@work-vm> <YH26x8TkpT5zsgst@redhat.com>
 <YH27H6VmKGXdA4H7@redhat.com> <YH3QRs7VUapXZaTj@work-vm>
 <20210419193228.q5e6vdnqwygh22bq@habkost.net>
 <YH7ATwO6DIbKIR4i@work-vm>
 <20210420134811.o2ypiw3y4fr73udb@habkost.net>
 <YH7g5CdYGGCgHGpR@work-vm>
MIME-Version: 1.0
In-Reply-To: <YH7g5CdYGGCgHGpR@work-vm>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 03:10:44PM +0100, Dr. David Alan Gilbert wrote:
> * Eduardo Habkost (ehabkost@redhat.com) wrote:
> > On Tue, Apr 20, 2021 at 12:51:43PM +0100, Dr. David Alan Gilbert wrote:
> > > I prefer things that are fairly obvious without needing to look at the
> > > documentation until you want the detail.
> > > 
> > > > - NONE: live migration is not needed, and device or machine code
> > > >   is allowed to enable features that block live migration or
> > > >   change guest ABI.
> > > >   (Not implemented yet)
> > > > 
> > > > - PREFERRED: machine and device code should try to make the VM
> > > >   migratable when possible, but won't emit a warning or error out
> > > >   if migration is blocked.
> > > >   (Current default behavior)
> > > > 
> > > > - REQUIRED: live migration support is required, and adding a
> > > >   migration blocker will be an error.
> > > >   (Implemented today by --only-migratable)
> > > 
> > > How about
> > >   -migratable blocked
> > >      Live migration is not allowed; an outbound migration will fail
> > 
> > "none" and NOT_NEEDED above were about letting QEMU automatically
> > enable features that block live migration or change guest ABI.
> > 
> > If that's implied by "blocked", I'd like to get that documented
> > explicitly.  If that's not implied by "blocked", I don't
> > understand what's the use case for "blocked".
> 
> My 'blocked' is stronger - migration is hard disabled by a blocker
> always; it's for (rare) cases where the user wants to stop a migration
> happening, even if qemu believes it can do it.
> 
> > > 
> > >   -migratable allowed
> > >      Live migration is allowed, but some devices/options may block
> > >      it if they're unable to migrate [current default]
> > 
> > "preferred" above was about QEMU trying to keep live migration
> > working as much as possible.  That's something we all expect QEMU
> > to do, but it's not documented anywhere.
> > 
> > If that's implied by "allowed", I'd like to get that documented
> > explicitly.  If that's not implied by "allowed", then we have a
> > problem.
> 
> My difficulty by your definition is I don't understand what
> 'working as much as possible' means - that's the current behaviour
> as I understand it.   I think mine is more explicit.

I think it helps to illustrate examples. The obvious case is where
thre are new kernel features QEMU wants to use. Normally we try to
avoid using them because that reduces potential targets for
migration to those with the same kernel or newer.

So a "preferred" / "allowed" mode would avoid automagically using
new host kernel features, while a "blocked" / "none" mode would
be free to use any kernel features

> > > 
> > >   -migratable warn
> > >       Live migration is allowed, but if some device/option is
> > >       unable to migrate, migration will be blocked and a warning
> > >       printed
> > 
> > This makes sense, but I don't think we need to support this use
> > case.
> 
> I thought that was exactly what Vitaly's patch tried to do?

Yep, but I'm sceptical how useful it actually is in practice.

Whether migration is blocked at the time the VM starts is not
really important, because VM configuration can be changed
at runtime, making any warnings obsolete/inaccurate for anyone
reading them after the fact.

> 
> > > 
> > >   -migratable required
> > >       Live migration is allowed, attempting to add a device or
> > >       enable an option that can't migrate will fail. [--only-migratable]
> > 
> > This matches "required" above.
> 
> Dave
> 
> 
> > -- 
> > Eduardo
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


