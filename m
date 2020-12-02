Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261432CC1F5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 17:18:40 +0100 (CET)
Received: from localhost ([::1]:50898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkUpz-0001zp-63
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 11:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkUot-0001Y6-8M
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:17:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kkUop-0003Tg-Ik
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606925845;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xG4Bzfr2fIkqTusaxbiNihpGgZPsyogyCeYrfzC17pw=;
 b=jPH/bwkh+KRM3wXdx3/eoSeTsR/UyGN9PEJWzyprcM0ovtZCIGyfvTbHVI66NZz4INVrg8
 sTdhUfrL70f7GjTH6pZOHkxOL49BOCd4/V7/CBkVnUm+z326nekYZfe9+phUkx7dGb1jXh
 AlBNCMwaus7Dg6rPHZ2OlYk9ESS1gQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-w6XdX5n3NVuICNmQa7y6Cg-1; Wed, 02 Dec 2020 11:17:18 -0500
X-MC-Unique: w6XdX5n3NVuICNmQa7y6Cg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A32A100E429;
 Wed,  2 Dec 2020 16:17:06 +0000 (UTC)
Received: from redhat.com (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0324F100AE48;
 Wed,  2 Dec 2020 16:17:01 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:16:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: priyankar jain <priyankar.jain@nutanix.com>
Subject: Re: [RFC] dbus-vmstate: Connect to the dbus only during the
 migration phase
Message-ID: <20201202161659.GL2360260@redhat.com>
References: <1605810535-51254-1-git-send-email-priyankar.jain@nutanix.com>
 <20201119184724.GO579364@redhat.com>
 <057612c5-a9b8-c7be-c710-1b635aa361be@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <057612c5-a9b8-c7be-c710-1b635aa361be@nutanix.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Turschmid <peter.turschm@nutanix.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 09:25:27PM +0530, priyankar jain wrote:
> On 20/11/20 12:17 am, Daniel P. Berrangé wrote:
> > On Thu, Nov 19, 2020 at 06:28:55PM +0000, Priyankar Jain wrote:
> > > Today, dbus-vmstate maintains a constant connection to the dbus. This is
> > > problematic for a number of reasons:
> > > 1. If dbus-vmstate is attached during power-on, then the device holds
> > >     the unused connection for a long period of time until migration
> > >     is triggered, thus unnecessarily occupying dbus.
> > > 2. Similarly, if the dbus is restarted in the time period between VM
> > >     power-on (dbus-vmstate initialisation) and migration, then the
> > >     migration will fail. The only way to recover would be by
> > >     re-initialising the dbus-vmstate object.
> > > 3. If dbus is not available during VM power-on, then currently dbus-vmstate
> > >     initialisation fails, causing power-on to fail.
> > > 4. For a system with large number of VMs, having multiple QEMUs connected to
> > >     the same dbus can lead to a DoS for new connections.
> > 
> > The expectation is that there is a *separate* dbus daemon created for
> > each QEMU instance. There should never be multiple QEMUs connected to
> > the same dbus instance, nor should it ever connect to the common dbus
> > instances provided by most Linux distros.
> > 
> > None of these 4 issues should apply when each QEMU has its own dedicated
> > dbus instance AFAICT.
> > 
> > 
> > Regards,
> > Daniel
> > 
> 
> How does having a separate dbus daemon resolve issue (2)? If any daemon
> restarts between VM power-on and migration, the dbus-vmstate object for that
> VM would have to be reinitialized, no?

The private dbus damon for QEMU is expected to exist for the lifetime of
that QEMU process.

> Secondly, on a setup with large number of VMs, having separate dbus-daemons
> leads to high cummulative memory usage by dbus daemons, is it a feasible
> approach to spawn a new dbus-daemon for every QEMU, given the fact that
> majority of the security aspect lies with the dbus peers, apart from the
> SELinux checks provided by dbus.

The memory usage of a dbus daemon shouldn't be that high. A large portion
of the memory footprint should be readony pages shared between all dbus
procsses. The private usage should be a functional of number of clients
and the message traffic. Do you have any measured figures you're concerned
with ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


