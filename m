Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233363648F3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:19:35 +0200 (CEST)
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXYc-0005BC-65
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYXVL-0001ce-G4
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYXVB-0000rJ-6L
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:16:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618852559;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vL0nW15X6XztO9fVsodgH8pPXUMIn01v2k2PlLFmA58=;
 b=DEw3tR7Y5IdtBW9Vqet8Zi/THO5EiiIPD5BZgPxMgHYLb4B0HsVl89CbUkoZdHaGuxonz6
 8CwiIGU219zBnUoLm2aIm62ph/+UOimL1DTzhWuYpBSc0jNn2lXkL5002kqapumo2wB7O6
 zhe7QHd7+vJDTv2kaJNFfd1Nku9bauY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-K4kwckCnPZ6Xd9_ObnXKRg-1; Mon, 19 Apr 2021 13:15:57 -0400
X-MC-Unique: K4kwckCnPZ6Xd9_ObnXKRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53CC9100A605
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 17:15:56 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 893FA10016DB;
 Mon, 19 Apr 2021 17:15:54 +0000 (UTC)
Date: Mon, 19 Apr 2021 18:15:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC] migration: warn about non-migratable configurations
 unless '--no-migration' was specified
Message-ID: <YH26x8TkpT5zsgst@redhat.com>
References: <20210415154402.28424-1-vkuznets@redhat.com>
 <YHhj/bo883jJ9ocy@redhat.com> <YHh3trxdMQ85NRTh@work-vm>
 <874kg68z07.fsf@vitty.brq.redhat.com>
 <20210416162801.zluqlbvyipoanedw@habkost.net>
 <YH2509yA7qkYFJ0p@work-vm>
MIME-Version: 1.0
In-Reply-To: <YH2509yA7qkYFJ0p@work-vm>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 06:11:47PM +0100, Dr. David Alan Gilbert wrote:
> * Eduardo Habkost (ehabkost@redhat.com) wrote:
> > On Fri, Apr 16, 2021 at 09:33:28AM +0200, Vitaly Kuznetsov wrote:
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> > > 
> > > > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > >> On Thu, Apr 15, 2021 at 05:44:02PM +0200, Vitaly Kuznetsov wrote:
> > > >> > When a migration blocker is added nothing is reported to the user,
> > > >> > inability to migrate such guest may come as a late surprise. As a bare
> > > >> > minimum, we can print a warning. To not pollute the output for those, who
> > > >> > have no intention to migrate their guests, introduce '--no-migration'
> > > >> > option which both block the migration and eliminates warning from
> > > >> 
> > > >> I wonder how this is actually going to work in practice ?
> > > >> 
> > > >> At the time libvirt starts a guest, it has no idea whether the guest
> > > >> is likely to need migration 3, 6, 12, 24 months in to the future.
> > > >> 
> > > >> IOW, we can't use a --no-migration flag and will be stuck with these
> > > >> warnings no mtter what.
> > > >> 
> > > >> Is it possible to query the migration blockers via QMP ?
> > > >
> > > > It's possible to query the currently active ones, as of 6.0; from my
> > > > commit  3af8554bd068576b0399087583df48518a2a98f6 it appears in the
> > > > output of query-migrate in the 'blocked-reasons' list.
> > > >
> > > > The HMP equivalent is a64aec725ea0b26fa4e44f8b8b8c72be9aaa4230 showing:
> > > >
> > > >     (qemu) info migrate
> > > >     globals:
> > > >     store-global-state: on
> > > >     only-migratable: off
> > > >     send-configuration: on
> > > >     send-section-footer: on
> > > >     decompress-error-check: on
> > > >     clear-bitmap-shift: 18
> > > >     Outgoing migration blocked:
> > > >       Migration is disabled when VirtFS export path '/home' is mounted in the guest using mount_tag 'fs'
> > > >       non-migratable device: 0000:00:01.2/1/usb-serial
> > > >     
> > > 
> > > FWIW, this patch makes '--no-migration' an 'ultimate big hammer' so not
> > > matter how many blockers are there, the output will look like:
> > > 
> > > (qemu) info migrate
> > > globals:
> > > store-global-state: on
> > > only-migratable: off
> > > send-configuration: on
> > > send-section-footer: on
> > > decompress-error-check: on
> > > clear-bitmap-shift: 18
> > > Outgoing migration blocked:
> > >   Guest is not migratable ('--no-migration' used)
> > 
> > I would change that.  I expect "--no-migration" to only mean
> > "live migration not really needed", not "live migration should be
> > blocked".
> > 
> > However, I still don't think libvirt should say "live migration
> > not needed" unconditionally (because this isn't always true).  In
> > that case, we would need a different mechanism to silence the
> > warnings somehow.
> > 
> > I would make live migration policy an enum, just to make sure
> > we are explicit about the requirements:
> > 
> > - UNKNOWN: this is the current state in QEMU 6.0, where we don't
> >   really know what the user expects.
> >   This can be the default on existing versioned machine types,
> >   just for compatibility.
> >   I suggest making this print warnings for every migration
> >   blocker (like this patch does).
> >   I suggest deprecating this behavior as soon as we can.
> > 
> > - PREFERRED: try to make the VM migratable when possible, but
> >   don't print a warning or error out if migration is blocked.
> >   This seems to be the behavior expected by libvirt today.
> > 
> > - NOT_NEEDED: live migration is not needed, and QEMU is free to
> >   enable features that block live migration or change guest ABI.
> >   We can probably make this the default on machine types that
> >   never supported live migration.
> 
> I suggest you could do this by adding:
>   -warn-none-migratable
>   -no-warn-none-migratable
> 
> and then argue about defaults another time.

If we're going to add new args, lets at least future proof our
approach with an extensible option that we can wire into QMP
too later

  -migratable  none|preferred|required 

and letting us add extra key/value pairs to tune it if desired.

> > - REQUIRED: live migration is required, and adding a migration
> >   blocker would be a fatal error.
> >   This is already implemented by --only-migratable.
> >   I suggest making this the default on versioned machine types
> >   after a few releases, and after deprecating UNKNOWN.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


