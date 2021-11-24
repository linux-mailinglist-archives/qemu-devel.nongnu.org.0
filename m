Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492B745C810
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:53:34 +0100 (CET)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpteO-0004iF-Ur
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:53:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mptdE-0003ym-7n
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mptdB-0002hm-2W
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637765536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7wQf90aOHlheB1cAI6h4dZxwBpI/JkCbZA+tejMRMg=;
 b=T65/pt7RCIj3uwOyuSaieGkvBi0HFPiZ613tIwl8a6k3eM8hpmSfZryvnzCa8Eu0DcyxwH
 G8Jh8/8Zl6M1nNql+aaFlDHA1rTf5E9sIWv8I4CzdLme4Z9qlwTcBYa9d8/k5Bd34+1gbV
 GEnD5LsyKF7+L8ABNT7H1WbF8AfY1lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-_ScfbZR3P4qXwnFggXm7sQ-1; Wed, 24 Nov 2021 09:52:12 -0500
X-MC-Unique: _ScfbZR3P4qXwnFggXm7sQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17F26185302E;
 Wed, 24 Nov 2021 14:52:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4009860C05;
 Wed, 24 Nov 2021 14:51:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B9DDA11380A7; Wed, 24 Nov 2021 15:51:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <87y25jw69i.fsf@dusky.pond.sub.org>
 <d3ae2bea-7d60-a714-100c-40b31fd19725@greensocs.com>
 <87lf1dwtm4.fsf@dusky.pond.sub.org> <YZ5HI0ms/sd4gEIS@redhat.com>
Date: Wed, 24 Nov 2021 15:51:23 +0100
In-Reply-To: <YZ5HI0ms/sd4gEIS@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 24 Nov 2021 14:07:31 +0000")
Message-ID: <87czmpvc7o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, Nov 24, 2021 at 02:50:11PM +0100, Markus Armbruster wrote:
>> Damien Hedde <damien.hedde@greensocs.com> writes:
>>=20
>> > The biggest difference is the fw_cfg option I think: it is related
>> > with the rom_set_order_override()/rom_reset_order_override() (line 17
>> > and 25). There is also the usb devices parts in between. I lack the=20
>> > knowledge about fw_cfg/usb to tell if it is important or not.
>> >
>> > What I wanted to say is I don't know if the difference is
>> > acceptable. If we want device_add to support all -device use cases, it
>> > is not. In that case we need to stop either in the middle of this
>> > function (line 15) or at the end (better with your sketch in mind).
>> >
>> > Note that rom_set_order_override()/rom_reset_order_override() only
>> > set/reset a switch variable that changes how fw_cfg files are
>> > sorted. It could be integrated into device_add code (and removed from
>> > the above function) without changing the behavior.
>>=20
>> For me, the part that puts me off is interleaving CLI and QMP.
>>=20
>> We process the CLI in an order few people understand, and only while
>> staring at the code.  That's bad.
>>=20
>> Injecting QMP at certain points in that sequence can only make it worse.
>
> Yep, I share your unease here.. especially wrt this quoted text
> from later:
>
>   > >> Users can do as much or as little with the CLI as they want.  You'=
d
>   > >> probably want to set up a QMP monitor and no more.
>
> I would say that is a case of overkill. It can only make our
> lives harder as maintainers in the long term, if we have to
> worry about such arbitrary mixing of QMP and CLI. This is
> also why I'm pretty uneasy about the 'preconfig' stuff as
> implemented today in general.
>
> It is a half-way house that doesn't really give mgmt apps
> what they want, which is a 100% QAPI-only config. If mgmt
> apps start using preconfig, it won't make life any better
> for them and will also lock QEMU maintainers into supporting
> this half-way house.

Misunderstanding?  The paragraph you quoted is about this design:

    1. Start event loop
   =20
    2. Feed it CLI left to right.  Each option runs a handler just like eac=
h
        QMP command does.
   =20
        Options that read a configuration file inject the file into the fee=
d.
   =20
        Options that create a monitor create it suspended.
   =20
        Options may advance the phase / run state, and they may require
        certain phase(s).
   =20
    3. When we're done with CLI, resume any monitors we created.
   =20
    4. Monitors now feed commands to the event loop.  Commands may advance
        the phase / run state, and they may require certain phase(s).
   =20
    Users can do as much or as little with the CLI as they want.  You'd
    probably want to set up a QMP monitor and no more.
   =20
    device_add becomes possible at a certain state of the phase / run state
    machine.  It changes from cold to hot plug at a certain later state.

Certainly enables 100% QAPI-only config.  It just doesn't *force* you to
100%.  Feature.

> We have a bit of a track record with QEMU of introducing
> partial solutions and never quite finishing the job. There's
> little strong incentive to ever finish it, if you can freely
> mix both old and new style forever, and thus maintainers are
> burdened forever with both.
>
> IMHO, we should only try to support the non-mixed scenarios
>
>   - 100% of hardware configured via CLI args
>   - 100% of hardware configured via QAPI (whether live in
>     QMP, or fed in via a QAPI based JSON/YAML config file)
>
> so that we only have two clear cases we need to worry about
> dealing with.
>
> Focus our efforts 100% of the 100% QAPI scenario and don't
> divert energy into short term hybrid solutions.

The design above pretty much requires 100% QAPI.

It's based on the notion that there's no real difference between a CLI
option and a QMP command that doesn't return a value.  So treat the CLI
more like a monitor.

For sanity's sake, make it not race with the other monitors by starting
them suspended.

This design is arguably *less* hybrid than one that treats a (severely
dumbed down) CLI unlike a monitor.


