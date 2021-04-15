Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F53610B7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:04:48 +0200 (CEST)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5Q7-0001yU-2D
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX530-0008AL-Ny
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:40:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX52u-0000HH-BU
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504847;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8k5ujv+dftCUrvcY6gwlX+AmAxPRZdv8dO3XK2ULv0=;
 b=AzfQXVOp21WZnO0TYntkKtdtPG+PJGDqUVeByX2LDzTfzhcyoN5WAZGFbrdqab2i37tKkC
 OkYG5lEV0DTEfu2D/uE5Cp/mu4vogASjvHNpHyyFw0eQqkshN/SWmDvYvoibVND2pJsnHO
 KYoV/SlmlRqrbUtAR1bKONws8jfCf8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-PWjCTELbPCSJ9c_2oec1DA-1; Thu, 15 Apr 2021 12:40:46 -0400
X-MC-Unique: PWjCTELbPCSJ9c_2oec1DA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5087319253C0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 16:40:45 +0000 (UTC)
Received: from redhat.com (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF739694CD;
 Thu, 15 Apr 2021 16:40:43 +0000 (UTC)
Date: Thu, 15 Apr 2021 17:40:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YHhsiK2GOAqQn8dK@redhat.com>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com>
 <CAOpTY_r-sSdNEWCqoAbSfOvnAAbgEAKgU=LfeVco65gD=k3uDQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOpTY_r-sSdNEWCqoAbSfOvnAAbgEAKgU=LfeVco65gD=k3uDQ@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 12:30:11PM -0400, Eduardo Habkost wrote:
> On Thu, Apr 15, 2021 at 12:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Apr 15, 2021 at 05:44:02PM +0200, Vitaly Kuznetsov wrote:
> > > When a migration blocker is added nothing is reported to the user,
> > > inability to migrate such guest may come as a late surprise. As a bare
> > > minimum, we can print a warning. To not pollute the output for those, who
> > > have no intention to migrate their guests, introduce '--no-migration'
> > > option which both block the migration and eliminates warning from
> >
> > I wonder how this is actually going to work in practice ?
> >
> > At the time libvirt starts a guest, it has no idea whether the guest
> > is likely to need migration 3, 6, 12, 24 months in to the future.
> 
> I believe the libvirt API could be extended so applications can
> indicate that migration is not a required feature. This would let QEMU
> automatically enable useful but non-migration-friendly features. For
> example, I would expect "-cpu host" to become the default CPU model if
> --no-migration is specified.
> 
> >
> > IOW, we can't use a --no-migration flag and will be stuck with these
> > warnings no mtter what.
> 
> The expected behavior of the libvirt API is to create migratable VMs
> by default, isn't it? This means it would be valid for libvirt to use
> "--only-migratable" by default.

Yes & no.  Libvirt attempts to explicitly configure the guest so
that it has a stable ABI, and thus can theoretically be migrated
We doesn't try to secondguess which QEMU features may or may not
be migratable though.

> If libvirt can't use "--only-migratable" by default, I would say it's
> a deficiency of the libvirt API that needs to be addressed.

It is valid to boot a guest with an attached PCI device, which will
make it non-migratable, but later hot-unplug the PCI device before
starting the migration.

> > Is it possible to query the migration blockers via QMP ?
> 
> I don't think it is, but we can add that if it's useful for libvirt.

I think it would be useful.

> > Libvirt recently introduced a new API 'virDomainGetMessages' which
> > lets us report a list of human targetted message strings against
> > a guest. We use it for reporting when an operation has tainted
> > a guest, and also use it for reporting when a deprecated QEMU
> > feature is used.  We could use it to report any migration
> > blockers that exist.
> >
> > These are visible from 'virsh dominfo $guestname' and could also
> > be displayed by a mgmt application.
> 
> Cool!
> 
> Will the API include all warnings printed by QEMU to stderr?

No, we don't look at stderr - that's just going into a logfile.

When I refer to deprecated featurs here, I'm talking specifically
about stuff we see from the QAPI schema. Right now that means
CPU models and machine types with the deprecated flag. It can be
extended to other devices later.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


