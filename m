Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678645DA8F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:59:01 +0100 (CET)
Received: from localhost ([::1]:46278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqEL5-00035N-PS
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqEIw-0001ZN-Gi
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqEIr-0007v7-D2
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637845000;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=creLitvWwjjA6BEclFBbXMYDOZtrW4S/EO1tU6mFnTU=;
 b=WcPVfktDayR0qsBThqc87a35Et5EGgIGxCbe5/LeWtSiKGwfqC23PeL2IcUOO7fUq0vJYM
 63Mdo4pltKsgI+9mCpV/r9Swz/fCEmGVCqa/7t+vXEQY8T64p5DmT+iVDzC4OWIw2wWS58
 tLPDvpSICf2MlRGkBulRLXg1U94rRYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-6Hl7CtbzMaeywHmCEF1dbg-1; Thu, 25 Nov 2021 07:56:27 -0500
X-MC-Unique: 6Hl7CtbzMaeywHmCEF1dbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 520CA802926;
 Thu, 25 Nov 2021 12:56:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7D37C5FD;
 Thu, 25 Nov 2021 12:55:30 +0000 (UTC)
Date: Thu, 25 Nov 2021 12:55:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
Message-ID: <YZ+HwDmzHTjBkJo9@redhat.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <87y25jw69i.fsf@dusky.pond.sub.org>
 <d3ae2bea-7d60-a714-100c-40b31fd19725@greensocs.com>
 <87lf1dwtm4.fsf@dusky.pond.sub.org> <YZ5HI0ms/sd4gEIS@redhat.com>
 <87czmpvc7o.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czmpvc7o.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, edgar.iglesias@xilinx.com,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 03:51:23PM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Wed, Nov 24, 2021 at 02:50:11PM +0100, Markus Armbruster wrote:
> >> Damien Hedde <damien.hedde@greensocs.com> writes:
> >> 
> >> > The biggest difference is the fw_cfg option I think: it is related
> >> > with the rom_set_order_override()/rom_reset_order_override() (line 17
> >> > and 25). There is also the usb devices parts in between. I lack the 
> >> > knowledge about fw_cfg/usb to tell if it is important or not.
> >> >
> >> > What I wanted to say is I don't know if the difference is
> >> > acceptable. If we want device_add to support all -device use cases, it
> >> > is not. In that case we need to stop either in the middle of this
> >> > function (line 15) or at the end (better with your sketch in mind).
> >> >
> >> > Note that rom_set_order_override()/rom_reset_order_override() only
> >> > set/reset a switch variable that changes how fw_cfg files are
> >> > sorted. It could be integrated into device_add code (and removed from
> >> > the above function) without changing the behavior.
> >> 
> >> For me, the part that puts me off is interleaving CLI and QMP.
> >> 
> >> We process the CLI in an order few people understand, and only while
> >> staring at the code.  That's bad.
> >> 
> >> Injecting QMP at certain points in that sequence can only make it worse.
> >
> > Yep, I share your unease here.. especially wrt this quoted text
> > from later:
> >
> >   > >> Users can do as much or as little with the CLI as they want.  You'd
> >   > >> probably want to set up a QMP monitor and no more.
> >
> > I would say that is a case of overkill. It can only make our
> > lives harder as maintainers in the long term, if we have to
> > worry about such arbitrary mixing of QMP and CLI. This is
> > also why I'm pretty uneasy about the 'preconfig' stuff as
> > implemented today in general.
> >
> > It is a half-way house that doesn't really give mgmt apps
> > what they want, which is a 100% QAPI-only config. If mgmt
> > apps start using preconfig, it won't make life any better
> > for them and will also lock QEMU maintainers into supporting
> > this half-way house.
> 
> Misunderstanding?  The paragraph you quoted is about this design:
> 
>     1. Start event loop
>     
>     2. Feed it CLI left to right.  Each option runs a handler just like each
>         QMP command does.
>     
>         Options that read a configuration file inject the file into the feed.
>     
>         Options that create a monitor create it suspended.
>     
>         Options may advance the phase / run state, and they may require
>         certain phase(s).
>     
>     3. When we're done with CLI, resume any monitors we created.
>     
>     4. Monitors now feed commands to the event loop.  Commands may advance
>         the phase / run state, and they may require certain phase(s).
>     
>     Users can do as much or as little with the CLI as they want.  You'd
>     probably want to set up a QMP monitor and no more.
>     
>     device_add becomes possible at a certain state of the phase / run state
>     machine.  It changes from cold to hot plug at a certain later state.
> 
> Certainly enables 100% QAPI-only config.  It just doesn't *force* you to
> 100%.  Feature.

This is far away from how our CLI handling works today, since we don't
require left-to-right args. Converting existing binaries to this
approach is going to be hard with a high risk of regressions. This
is especiall true if we try todo an incremental conversion, of
different pieces of the CLI and allow arbitrary mixing of CLI and
QMP throughout.

IMHO a pre-requisite for changing CLI arg processing ordering, is
a fresh binary that leaves QemuOpts behind for its CLI, so any
usage is consistent with QAPI. 

> > We have a bit of a track record with QEMU of introducing
> > partial solutions and never quite finishing the job. There's
> > little strong incentive to ever finish it, if you can freely
> > mix both old and new style forever, and thus maintainers are
> > burdened forever with both.
> >
> > IMHO, we should only try to support the non-mixed scenarios
> >
> >   - 100% of hardware configured via CLI args
> >   - 100% of hardware configured via QAPI (whether live in
> >     QMP, or fed in via a QAPI based JSON/YAML config file)
> >
> > so that we only have two clear cases we need to worry about
> > dealing with.
> >
> > Focus our efforts 100% of the 100% QAPI scenario and don't
> > divert energy into short term hybrid solutions.
> 
> The design above pretty much requires 100% QAPI.
> 
> It's based on the notion that there's no real difference between a CLI
> option and a QMP command that doesn't return a value.  So treat the CLI
> more like a monitor.
> 
> For sanity's sake, make it not race with the other monitors by starting
> them suspended.
> 
> This design is arguably *less* hybrid than one that treats a (severely
> dumbed down) CLI unlike a monitor.

Yes, my concern is more about how that gets introduced into the code
for the existing binaries, vs having a clean break where we're 100%
QAPI and no back compat CLI options exist.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


