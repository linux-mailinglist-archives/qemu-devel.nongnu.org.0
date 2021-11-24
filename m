Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3957A45C6DB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:10:10 +0100 (CET)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsyO-0004Xo-RU
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:10:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpsx2-0003pl-1a
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpswy-0005Dh-Ux
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637762920;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mnkGoQDi3iNlPdqhxZvttm1cnEr+OPyJeZeoPYTzbD4=;
 b=OEYPa3GzYy/jgW4ohf5JmZ/TokhmQvOnmL+zcW6d3POLSEzl5htwc7BXddaJqFownPGYLP
 cXdvjrVFfqjxvet1G+sP/MveKxtLSUvbcs2FalxnpF6e1gSZA1QGzOY7c+HBJhH0tkWGeN
 7SEEaJ2Ys0SwVsJZoovggDHXtB8G2Bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-525-a4e1PcV4O12cJi5NFYwexA-1; Wed, 24 Nov 2021 09:08:31 -0500
X-MC-Unique: a4e1PcV4O12cJi5NFYwexA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 741A684B9A7;
 Wed, 24 Nov 2021 14:08:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54FC5694BF;
 Wed, 24 Nov 2021 14:07:33 +0000 (UTC)
Date: Wed, 24 Nov 2021 14:07:31 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
Message-ID: <YZ5HI0ms/sd4gEIS@redhat.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <87y25jw69i.fsf@dusky.pond.sub.org>
 <d3ae2bea-7d60-a714-100c-40b31fd19725@greensocs.com>
 <87lf1dwtm4.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87lf1dwtm4.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Nov 24, 2021 at 02:50:11PM +0100, Markus Armbruster wrote:
> Damien Hedde <damien.hedde@greensocs.com> writes:
> 
> > The biggest difference is the fw_cfg option I think: it is related
> > with the rom_set_order_override()/rom_reset_order_override() (line 17
> > and 25). There is also the usb devices parts in between. I lack the 
> > knowledge about fw_cfg/usb to tell if it is important or not.
> >
> > What I wanted to say is I don't know if the difference is
> > acceptable. If we want device_add to support all -device use cases, it
> > is not. In that case we need to stop either in the middle of this
> > function (line 15) or at the end (better with your sketch in mind).
> >
> > Note that rom_set_order_override()/rom_reset_order_override() only
> > set/reset a switch variable that changes how fw_cfg files are
> > sorted. It could be integrated into device_add code (and removed from
> > the above function) without changing the behavior.
> 
> For me, the part that puts me off is interleaving CLI and QMP.
> 
> We process the CLI in an order few people understand, and only while
> staring at the code.  That's bad.
> 
> Injecting QMP at certain points in that sequence can only make it worse.

Yep, I share your unease here.. especially wrt this quoted text
from later:

  > >> Users can do as much or as little with the CLI as they want.  You'd
  > >> probably want to set up a QMP monitor and no more.

I would say that is a case of overkill. It can only make our
lives harder as maintainers in the long term, if we have to
worry about such arbitrary mixing of QMP and CLI. This is
also why I'm pretty uneasy about the 'preconfig' stuff as
implemented today in general.

It is a half-way house that doesn't really give mgmt apps
what they want, which is a 100% QAPI-only config. If mgmt
apps start using preconfig, it won't make life any better
for them and will also lock QEMU maintainers into supporting
this half-way house.

We have a bit of a track record with QEMU of introducing
partial solutions and never quite finishing the job. There's
little strong incentive to ever finish it, if you can freely
mix both old and new style forever, and thus maintainers are
burdened forever with both.

IMHO, we should only try to support the non-mixed scenarios

  - 100% of hardware configured via CLI args
  - 100% of hardware configured via QAPI (whether live in
    QMP, or fed in via a QAPI based JSON/YAML config file)

so that we only have two clear cases we need to worry about
dealing with.

Focus our efforts 100% of the 100% QAPI scenario and don't
divert energy into short term hybrid solutions.


> >> Let me quote the sketch I posted to the "Stabilize preconfig" thread:
> >> 
> >> 1. Start event loop
> >> 
> >> 2. Feed it CLI left to right.  Each option runs a handler just like each
> >>     QMP command does.
> >> 
> >>     Options that read a configuration file inject the file into the feed.
> >> 
> >>     Options that create a monitor create it suspended.
> >> 
> >>     Options may advance the phase / run state, and they may require
> >>     certain phase(s).
> >> 
> >> 3. When we're done with CLI, resume any monitors we created.
> >> 
> >> 4. Monitors now feed commands to the event loop.  Commands may advance
> >>     the phase / run state, and they may require certain phase(s).
> >> 
> >> Users can do as much or as little with the CLI as they want.  You'd
> >> probably want to set up a QMP monitor and no more.
> >> 
> >> device_add becomes possible at a certain state of the phase / run state
> >> machine.  It changes from cold to hot plug at a certain later state.
> >> 
> >>> [1]: https://lore.kernel.org/qemu-devel/b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com
> >>>
> >>> Thanks for your feedback.
> >> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


