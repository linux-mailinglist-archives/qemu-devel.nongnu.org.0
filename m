Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C147762C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 16:42:47 +0100 (CET)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxsu6-00088f-5d
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 10:42:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxssi-0007FR-1S
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxssd-0001X2-1z
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 10:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639669273;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kkQILstT4phYyndldmzwjQhIU/dz1pnOfvMtYqsulRU=;
 b=fnVvjXoqA/DlWJ+zbCvd97lFhFdPI+YGgTvUDtIVMAgbjuTQJtG+ng+iawy23y4ep4xWa6
 JZ1A4V5ZiQrDFZR7Ch4YoNsbqX+PvyRTBWSLfb8EIGkCKI8GNJXrVwHTDaghmsX5uUVVK9
 yEj8nj/m9Z+laU6Uov6UupQ6Lf/hPjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-gn6stvEPNvGL1DNLD5hX_A-1; Thu, 16 Dec 2021 10:41:04 -0500
X-MC-Unique: gn6stvEPNvGL1DNLD5hX_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABC5D84A613;
 Thu, 16 Dec 2021 15:41:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49BAD101E818;
 Thu, 16 Dec 2021 15:41:00 +0000 (UTC)
Date: Thu, 16 Dec 2021 15:40:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbteCdJDt8B95sfj@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <877dc7tnjf.fsf@dusky.pond.sub.org>
 <da52f408-6037-20a9-78a9-77f12d86f620@redhat.com>
 <875yroyhih.fsf@dusky.pond.sub.org>
 <8dd178b7-631b-25b4-4f68-334b0d583f72@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8dd178b7-631b-25b4-4f68-334b0d583f72@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 04:28:29PM +0100, Paolo Bonzini wrote:
> On 12/16/21 11:24, Markus Armbruster wrote:
> > > Not really, in particular the startup has been mostly reworked already
> > > and I disagree that it is messy.  softmmu/vl.c is messy, sure: it has
> > > N different command line parser for command line options, magic
> > > related to default devices, and complicated ordering of -object
> > > creation.
> > > 
> > > But the building of emulator data structures is not messy; only the
> > > code that transforms the user's instructions into startup commands.
> > > The messy parts are almost entirely contained within softmmu/vl.c.
> > 
> > In my opinion, the worst mess is the reordering and the (commonly
> > unstated, sometimes unknown) dependencies that govern it.
> > The reordering is part of the stable interface.  Its finer points
> > basically nobody understands, at least not without staring at the code.
> 
> Then we agree, because that's what I meant by "the messy parts are almost
> entirely contained within softmmu/vl.c".
> 
> > > The one (and important, but fixable) exception is backends for
> > > on-board devices: serial_hd, drive_get, and nd_table.
> > 
> > Practical ideas on fixing it?
> 
> What you did with pflash, turned up to 11.
> 
> > > > * A new binary sidesteps the need to manage incompatible change.
> > > 
> > > More precisely, a new binary sidesteps the need to integrate an
> > > existing mechanism with a new transport, and deal with the
> > > incompatibilities that arise.
> > 
> > I'm not sure I got this.
> 
> Configuring the VM part in CLI and part in QMP is not something anybody
> needs nor should desire.  A new binary can use the CLI only for things that
> really have to be done before QMP is up, for example the configuration of
> sandboxing or tracing; and even that is only nice-to-have and not absolutely
> necessary.

I wouldn't special case sandboxing at least. It should be something that
can be activated via a QMP command too. That way you can blockdev-add
a bunch of disks and other backends while you are still relatively
unconfined, and then lock it down with a sandbox before starting vCPUs.

Or you can perhaps start with a coarse sandbox and then switch to
a stronger sandbox part way through config (though can't remember
offhand if that's possible with seccomp, or whether the first
seccomp profile applied, prevents you adding stronger ones later).

Anyway sandboxing doesn't need to be active before QMP IMHO, because
our primary goal with it is to mitigate guest exploits from untrusted
code - the initial startup is largely trustworthy. Starting guest CPUs,
or reading VMState is where it becomes dangerous generally.

I think you can probably argue that even tracing doesn't hugely
need special casing if you can get QMP started early enough that
there's little else that can go wrong before you get a chance to
send a QMP 'trace' command.

> 
> > > The problem is that CLI and HMP, being targeted to humans (and as you
> > > say below humans matter), are not necessarily trivial transports.  If
> > > people find the trivial transport unusable, we will not be able to
> > > retire the old CLI.
> > 
> > Yes, a trivial CLI transport alone may not suffice to retire the old
> > CLI.  By itself, that doesn't mean trivial transports must be avoided.
> > 
> > Do I have to argue the benefits of a trivial configuration file
> > transport?
> 
> I think you do; I'm not sure that a trivial configuration file transport is
> useful.  It's a middle ground in sophistication that I'm not sure would
> serve many people.  The only source of bug reports for -readconfig has been
> lxd, and I think we agree that they would be served better by QMP.
> 
> > Do I have to argue the benefits of a trivial CLI transport for use by
> > relatively unsophisticated programs / relatively sophisticated humans
> > (such as developers)? Can we agree these benefits are not zero?
> 
> We can.  But again I think you're misunderstanding the pain that the
> existing CLI inflicts on users.  Most users do not find the ordering
> complicated in practice; they do not even know that the issue exists. The
> problem that users have is the 100+ character command lines, and that can be
> fixed in two ways:
> 
> - with a trivial configuration file transport
> 
> - with a management tool such as virt-manager or virsh.
> 
> And I maintain that most users would be better served by the latter.  In
> fact, I constantly wonder how much we're overestimating the amount of people
> that are using QEMU.  In every post (Reddit, HN, wherever) that mentions
> QEMU being too complex and not having a front-end like VirtualBox, there's
> always someone that mentions virt-manager.

An important thing to note is that while libvirt is theoretically
general purpose for any aspect of QEMU, practically speaking our
coverage of QEMU features is very much skewed to virtualization
use cases. The emulation use cases don't get anywher near as much
love & attention, especially for architectures lacking KVM, or for
machine types not used with KVM.

Also although libvirt tries to focus on just exposing a mechanism
and not imposing a policy there are some aspects where we don't
achieve that due to our architecture design. For example, if you
want QEMU connected to stdio that's not possible with libvirt
directly. There's always a level of indirection there because
we unconditionally daemonize QEMU.

> > > Bad CLI is also very hard to deprecate because, unlike QMP (for which
> > > you can delegate the workarounds to Libvirt & friends) and HMP (for
> > > which people can just learn the new thing and type it), it is baked in
> > > countless scripts.  People hate it when scripts break.
> > 
> > I assure you that bad QMP is plenty hard to deprecate, even when libvirt
> > can be updated to cope.
> 
> Right, and CLI is worse. :)
> 
> > > The issues with the CLI then can be completely self-contained within
> > > softmmu/vl.c, and will not influence the innards of QEMU.
> > 
> > The issues with the CLI will still influence its users. Can we
> > agree that human users deserve something better than the current
> > CLI?
> 
> Deserve, yes.  Need, not sure.  Do you agree that a lot of clients of QEMU
> would be better served by Libvirt (programs) and virt-manager (humans)?
> 
> So, if I have to choose between better QMP now and better CLI now, I choose
> better QMP now.  Exactly to avoid the "somebody could" trap and focus on
> something that "we can" do now.
> 
> > I think we can learn from our experience with HMP/QMP.
> > 
> > Good:
> > 
> > * Separate interfaces for machines and for humans
> > * Layering the human interface on top of the machine interface: HMP
> >    commands implemented on top of QMP's internal C interface.
> 
> Agreed.  CLI should likewise be implemented on top of QMP's internal C
> interface, the same way non-preconfig mode concludes startup with
> qmp_x_exit_preconfig(NULL).  Second choice (inferior but sometimes
> acceptable): implement it on top of the same QOM interfaces as the QOM
> commands.
> 
> > * The stable interface is clear: QMP unless explicitly marked unstable.
> 
> Agreed, the problem here is that CLI is harder to evolve.
> 
> Paolo
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


