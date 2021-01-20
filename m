Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616FD2FD20B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:56:39 +0100 (CET)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DyQ-0001cL-GU
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2Dx7-00019t-Np
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:55:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2Dx5-0004CM-MP
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 08:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611150915;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vqPlFyftD0zUuWU3fobHKNPhuL3zQBIe0l4a+jA9z5U=;
 b=E6Dgj4aL8aWhF+lvkwPtDO8oWnNxGfyUJ03X6dOBqqQJMWzKUlvdYntqm91sSpqQYBY5bP
 W6mzUPCY5pi6kjMq9k0cGQqW9CJIhdYVlNhz4oe6Sh+QL3jS7rjdoCiQt3DnP0uSm7Qai0
 GXhQHFABwq923KXaVsbIPfEHutYr720=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-prBtGZ6oP_KjVOgzgjDYzw-1; Wed, 20 Jan 2021 08:55:07 -0500
X-MC-Unique: prBtGZ6oP_KjVOgzgjDYzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2ED1107ACE3;
 Wed, 20 Jan 2021 13:55:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46CA2100AE32;
 Wed, 20 Jan 2021 13:55:02 +0000 (UTC)
Date: Wed, 20 Jan 2021 13:54:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Subject: Re: [PULL 16/45] vl: Add option to avoid stopping VM upon guest panic
Message-ID: <20210120135459.GJ3015589@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
 <20201215175445.1272776-17-pbonzini@redhat.com>
 <CAFEAcA93tYRjdjQJm8GKNS2=4iV5QU4X_JJevWEBc7wggX6Cwg@mail.gmail.com>
 <3f399e69-f941-d928-acee-f3d16182df5d@oracle.com>
MIME-Version: 1.0
In-Reply-To: <3f399e69-f941-d928-acee-f3d16182df5d@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Mihai Carabas <mihai.carabas@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 12:28:14AM -0500, Alejandro Jimenez wrote:
> 
> 
> On 1/19/2021 4:34 PM, Peter Maydell wrote:
> > On Tue, 15 Dec 2020 at 18:11, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > > From: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> > > 
> > > The current default action of pausing a guest after a panic event
> > > is received leaves the responsibility to resume guest execution to the
> > > management layer. The reasons for this behavior are discussed here:
> > > https://lore.kernel.org/qemu-devel/52148F88.5000509@redhat.com/
> > > 
> > > However, in instances like the case of older guests (Linux and
> > > Windows) using a pvpanic device but missing support for the
> > > PVPANIC_CRASHLOADED event, and Windows guests using the hv-crash
> > > enlightenment, it is desirable to allow the guests to continue
> > > running after sending a PVPANIC_PANICKED event. This allows such
> > > guests to proceed to capture a crash dump and automatically reboot
> > > without intervention of a management layer.
> > > 
> > > Add an option to avoid stopping a VM after a panic event is received,
> > > by passing:
> > > 
> > > -action panic=none
> > > 
> > > in the command line arguments, or during runtime by using an upcoming
> > > QMP command.
> > Hi. This commit message doesn't say it's changing the default
> > action, but the change does:
> > 
> > > @@ -3899,6 +3899,8 @@ DEF("action", HAS_ARG, QEMU_OPTION_action,
> > >       "                   action when guest reboots [default=none]\n"
> > >       "-action shutdown=poweroff|pause\n"
> > >       "                   action when guest shuts down [default=poweroff]\n"
> > > +    "-action panic=poweroff|pause|none\n"
> > > +    "                   action when guest panics [default=poweroff]\n"
> > >       "-action watchdog=reset|shutdown|poweroff|inject-nmi|pause|debug|none\n"
> > >       "                   action when watchdog fires [default=reset]\n",
> > >       QEMU_ARCH_ALL)
> > >   RebootAction reboot_action = REBOOT_ACTION_NONE;
> > >   ShutdownAction shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> > > +PanicAction panic_action = PANIC_ACTION_POWEROFF;
> > We used to default to 'pause' and now we default to 'poweroff'.
> Hi Peter.
> 
> My rationale for setting the panic action to 'poweroff' was to keep the
> default behavior of QEMU when '-no-shutdown' is not specified, and a panic
> occurs. I believe that in order to accomplish that, the default panic action
> should still be 'poweroff', but as you point out there is an instance where
> the behavior changes. Specifically, when '-no-shutdown' is not used there is
> now one fewer QMP event issued when a guest panic is detected, before
> stopping the VM and powering off.
> 
> I tried to account for this scenario in the original patches, but I failed
> to catch the problem after the rebase when the changes were merged. I'll
> test and send a fix for this issue in the next few days.
> 
> > 
> > We noticed this because it broke an in-flight test case for
> > the pvpanic-pci device from Mihai (which was expecting to see
> > the device in 'pause' state and found it was now in 'poweroff').
> The test is just checking for the arrival of the QMP event, and not actually
> expecting the VM to be paused, correct? I see that if a test/management app
> is expecting to receive a GUEST_PANICKED event with the specific 'pause'
> action, then it might be confused. But any such tests would only be able to
> check for the arrival of the QMP event, and not actually expect to issue any
> commands to a paused VM, since the next block of code in QEMU immediately
> powers off and shutdowns when '-no-shutdown' is not requested. This was the
> typical behavior before the patches.
> 
> > Test cases aren't very exciting, but was it really intentional
> > to change the default behaviour?
> My intention was to preserve the default behavior. Perhaps Paolo wanted to
> reduce the number of GUEST_PANICKED events by removing the one with 'pause'
> action? You could consider it superfluous since it is immediately followed
> by another indicating the 'poweroff' action... Unless I hear otherwise from
> either of you, I'll work on a fix to keep the same number and type of events
> sent.

Why would pause be immediately followed by poweroff ? These are independant
actions, and the mgmt app should be deciding what todo next after the
pause action. It may wish to capture a guest crash image before poweroff.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


