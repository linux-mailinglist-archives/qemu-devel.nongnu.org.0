Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D42CBE0A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:17:10 +0100 (CET)
Received: from localhost ([::1]:34202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkS0M-0001vk-1D
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkRz2-0001KP-89
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:15:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkRyv-0003SL-Vd
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606914940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wOYDlRM1J1TX4rNcpF87wktxTBIRfGv+/XJxtZaV5sU=;
 b=C1mVj2jti4hQSnpTGi+hp/JHi781zmoDPpfpLNXIt9L4h/RCJubvWUJvIgwo4eki+fGZgY
 /mGkiUoxfnf/itFpkbRBOrcpd/9o0HQ9XrXraqaZbywa9rNeWlwjNhpLkSHNuBz3T+OPZJ
 DivjnAf3VFxcGNx5+9GeqnOQ9qNcUys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-hhEBAYH-N22WCabSod8-Cw-1; Wed, 02 Dec 2020 08:15:35 -0500
X-MC-Unique: hhEBAYH-N22WCabSod8-Cw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5B8D108E1A3
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 13:15:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDBE310016F4;
 Wed,  2 Dec 2020 13:15:33 +0000 (UTC)
Date: Wed, 2 Dec 2020 13:15:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 24/29] migration, vl: start migration via
 qmp_migrate_incoming
Message-ID: <20201202131531.GI2360260@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-25-pbonzini@redhat.com>
 <20201120163408.7740a92f@redhat.com>
 <0562d6fa-b619-7dc3-ef94-242a39436cfa@redhat.com>
 <20201202131037.GF3226@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201202131037.GF3226@work-vm>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 01:10:37PM +0000, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
> > On 20/11/20 16:34, Igor Mammedov wrote:
> > > >       qapi_event_send_migration(MIGRATION_STATUS_SETUP);
> > > > -    if (!strcmp(uri, "defer")) {
> > > > -        deferred_incoming_migration(errp);
> > > > -    } else if (strstart(uri, "tcp:", &p) ||
> > > > -               strstart(uri, "unix:", NULL) ||
> > > > -               strstart(uri, "vsock:", NULL)) {
> > > considering the last hunk does won't call qmp_migrate_incoming
> > > if 'defer' was used, wouldn't we will lose QAPI event here?
> > > not sure how important it to users,
> > 
> > Hmm yeah that's true.  That might even be considered a bugfix (no setup is
> > done until the "real" migrate-incoming command), but I can also add the
> > event manually in qemu_init.
> > 
> > (Libvirt doesn't use the SETUP case of the event but that's of course only
> > part of the story).
> 
> I'm more worried about how this stops a repeated 'migrate incoming'
> or a 'migrate_incoming' that's issued following a qemu that's been
> started with -incoming tcp:... but which a socket hasn't yet connected
> to.

Can someone remind me why we need to have an -incoming arg at all ?

With snapshots, we can just start QEMU normally, using -S if desired,
and then invoke "loadvm" to restore from a snapshot at any time.

What is different thet means we can't just run "migrate_incoming" on
any QEMU at any time, ignoring -incoming entirely ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


