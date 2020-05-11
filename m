Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB821CD97F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 14:18:56 +0200 (CEST)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY7OZ-0004HJ-94
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 08:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jY7NC-0002yC-4t
 for qemu-devel@nongnu.org; Mon, 11 May 2020 08:17:30 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59787
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jY7N9-0001KI-V9
 for qemu-devel@nongnu.org; Mon, 11 May 2020 08:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589199446;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4dodrFkm7W23QcCiM2XgZ4yQUtn5VFbzMjDR0gce5c=;
 b=I2gspClLbaOBURhgTFAzzYwBe8YrD1nGqvgnKpKslqQyIIHjSkQSF0www25a5Yey1fiMGq
 vBfUdUxJEuvcF+jqDMBEfdWPtQof0ih7pf4tfHteoTed6sxZzFdbPAxGf0YAfWGurc5n77
 OOdhgjHl5pwcCjEkASEPfFSh7OgqVDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-LK4EOlMoM-qJh58IWW22zA-1; Mon, 11 May 2020 08:17:24 -0400
X-MC-Unique: LK4EOlMoM-qJh58IWW22zA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2152819200C4;
 Mon, 11 May 2020 12:17:23 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B59C760621;
 Mon, 11 May 2020 12:17:16 +0000 (UTC)
Date: Mon, 11 May 2020 13:17:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/5] Introduce 'yank' oob qmp command to recover from
 hanging qemu
Message-ID: <20200511121714.GL1135885@redhat.com>
References: <cover.1589193717.git.lukasstraub2@web.de>
 <20200511114947.GJ1135885@redhat.com>
 <20200511120718.GD2811@work-vm>
MIME-Version: 1.0
In-Reply-To: <20200511120718.GD2811@work-vm>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 03:10:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 11, 2020 at 01:07:18PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Mon, May 11, 2020 at 01:14:34PM +0200, Lukas Straub wrote:
> > > Hello Everyone,
> > > In many cases, if qemu has a network connection (qmp, migration, chardev, etc.)
> > > to some other server and that server dies or hangs, qemu hangs too.
> > 
> > If qemu as a whole hangs due to a stalled network connection, that is a
> > bug in QEMU that we should be fixing IMHO. QEMU should be doing non-blocking
> > I/O in general, such that if the network connection or remote server stalls,
> > we simply stop sending I/O - we shouldn't ever hang the QEMU process or main
> > loop.
> > 
> > There are places in QEMU code which are not well behaved in this respect,
> > but many are, and others are getting fixed where found to be important.
> > 
> > Arguably any place in QEMU code which can result in a hang of QEMU in the
> > event of a stalled network should be considered a security flaw, because
> > the network is untrusted in general.
> 
> That's not really true of the 'management network' - people trust that
> and I don't see a lot of the qemu code getting fixed safely for all of
> them.

It depends on the user / app / deployment scenario. In OpenStack alot of
work was done to beef up security between services on the mgmt network,
with TLS encryption as standard to reduce attack vectors.

> > > These patches introduce the new 'yank' out-of-band qmp command to recover from
> > > these kinds of hangs. The different subsystems register callbacks which get
> > > executed with the yank command. For example the callback can shutdown() a
> > > socket. This is intended for the colo use-case, but it can be used for other
> > > things too of course.
> > 
> > IIUC, invoking the "yank" command unconditionally kills every single
> > network connection in QEMU that has registered with the "yank" subsystem.
> > IMHO this is way too big of a hammer, even if we accept there are bugs in
> > QEMU not handling stalled networking well.
> 
> But isn't this hammer conditional - I see that it's a migration
> capabiltiy for the migration socket, and a flag in nbd - so it only
> yanks things you've told it to.

IIUC, you have to set these flags upfront when you launch QEMU, or
hotplug the device using the feature. When something gets stuck,
and you issue the "yank" command, then everything that has the flag
enabled gets torn down. So in practice it looks like the flag will
get enabled for everything at QEMU startup, and yanking down tear
down everything.

> > eg if a chardev hangs QEMU, and we tear down everything, killing the NBD
> > connection used for the guest disk, we needlessly break I/O.
> > 
> > eg doing this in the chardev backend is not desirable, because the bugs
> > with hanging QEMU are typically caused by the way the frontend device
> > uses the chardev blocking I/O calls, instead of non-blocking I/O calls.
> > 
> 
> Having a way to get out of any of these problems from a single point is
> quite nice.  To be useful in COLO you need to know for sure you can get
> out of any network screwup.
> 
> We already use shutdown(2) in migrate_cancel and migrate-pause for
> basically the same reason; I don't think we've got anything similar for
> NBD, and we probably should have (I think I asked for it fairly
> recently).

Yes, the migrate_cancel is an example of a more fine grained way to
recover. I was thinking that we need an equivalent fine control knob
for NBD too.

That way if QEMU does get stuck, you can start by tearing down the
least distruptive channel. eg try tearing down the migration connection
first (which shouldn't negatively impact the guest), and only if that
doesn't work then, move on to tear down the NBD connection (which risks
data loss)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


