Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE24C1989
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 18:09:51 +0100 (CET)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMv9B-0002Ix-TK
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 12:09:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMv7L-0000pJ-0A
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:07:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMv7E-0000Sh-V6
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645636066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5N0l7V431MtNWyHvWORzktZrVIdoBnIhVYQHR3brZ28=;
 b=N1jxI0SW90xXyZol8epAptp8T/kuTG6+L7pkVs/uLpCLOGAjuo9SzGc2Z/l7CDUNVGyhwi
 nbEZE/LpH7xCNJu7NTKgckIpDhVBOeQD+Vee7qSqEVVcQ3ofLK3Ps3R8CUrGzXN4AzSjin
 WVLrfbLuGdSthfHxoND8UE8kFcmB5BU=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632--5QFRcy4MbuSP15My36S4g-1; Wed, 23 Feb 2022 12:07:45 -0500
X-MC-Unique: -5QFRcy4MbuSP15My36S4g-1
Received: by mail-ua1-f69.google.com with SMTP id
 z4-20020a9f3704000000b0030bb302b19dso1785224uad.11
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 09:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5N0l7V431MtNWyHvWORzktZrVIdoBnIhVYQHR3brZ28=;
 b=ZA65m7jKy0tcRQwkGB4C+WPPP4ZlaoPvckita5JelovKcUQoA+ONZt7TZw8rxf94Ec
 3l3yFyLTGt0PMNaKVg6mLqBHxGbW7sbU2YaV0dWh7F4vJiVd5LnA4DXAmyAjmP9HVOCY
 Al0RciPBB5fNMcRpcn79/HNAZPl78HUm1IjGELNKoRyPED4sOIS/6IGWlLUmMroigDaK
 b8VcTLm0yXGzybMX4ud2JZQhjiUe8Gx+08peZamu1xHVunFPF4roK9XAG5HaVRa1iwhm
 KjC6qIJ35ttj5iFUGVs2o2y5jb1vqDbr99gkRoZ90Bhd0SXSGk+z26SKMidFvlXZa7S4
 VUtw==
X-Gm-Message-State: AOAM531cNxGhAmmWRVOLb5u1etcglqAok0FuyFCB5zpCESB/nN2u7nIk
 sADIxKbVUvpyJzip/VPazYqM9zVGVjHRZcZ8+r/2PnS4VCkTLHi80rJdm3GrRSgZIRp2OwjfDYh
 XWeZOy81nLRrfpRDqD4pj/DRpIReIb8A=
X-Received: by 2002:a1f:b402:0:b0:331:4c9f:67d0 with SMTP id
 d2-20020a1fb402000000b003314c9f67d0mr396426vkf.26.1645636063506; 
 Wed, 23 Feb 2022 09:07:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh/82OdxPGV1r8y7UN0cvQ/pFB/eIZx/mf1nZD1CWtQlG7xJY8LgLjAHmPRnXRtyC5XoLQRpLXZou9kJUsaWI=
X-Received: by 2002:a1f:b402:0:b0:331:4c9f:67d0 with SMTP id
 d2-20020a1fb402000000b003314c9f67d0mr396328vkf.26.1645636061628; Wed, 23 Feb
 2022 09:07:41 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-anWO3dpvcECpW6J1ExJLw01DhXvTYtC5FUi5p7kQ2tig@mail.gmail.com>
 <87pmnwqzq7.fsf@pond.sub.org>
 <CAFn=p-YVdQDbzUsQm97=FyuZN_m3jCsFzjTpguRPjtH3PezTMg@mail.gmail.com>
 <87zgmze0im.fsf@pond.sub.org>
 <CAFn=p-b-gfeDgFfivtJ6tOixyydRb1kS8rS+H41RjiVZ-3Sgsw@mail.gmail.com>
 <87czjpilgy.fsf@pond.sub.org> <20220215193601.7bfexzqnpsprjg2t@amd.com>
 <87zgmr89a3.fsf@pond.sub.org> <20220216205144.apr4vxptm6imilbm@amd.com>
In-Reply-To: <20220216205144.apr4vxptm6imilbm@amd.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Feb 2022 12:07:30 -0500
Message-ID: <CAFn=p-ZyXuvOwmDybNdzKjotGxdRfo--0OwEnAhzNvBF20bPJg@mail.gmail.com>
Subject: Re: Adding a handshake to qemu-guest-agent
To: Michael Roth <michael.roth@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 3:52 PM Michael Roth <michael.roth@amd.com> wrote:
>
> On Wed, Feb 16, 2022 at 10:12:36AM +0100, Markus Armbruster wrote:
> > Michael Roth <michael.roth@amd.com> writes:
> >
> > > On Mon, Feb 14, 2022 at 03:14:37PM +0100, Markus Armbruster wrote:
> > >> Cc: the qemu-ga maintainer
> > >>
> > >> John Snow <jsnow@redhat.com> writes:
> > >>
> > >> > [Moving our discussion upstream, because it stopped being brief and simple.]
> > >
> > > Hi John, Markus,
> > >
> > >>
> > >> Motivation: qemu-ga doesn't do capability negotiation as specified in
> > >> docs/interop/qmp-spec.txt.
> > >>
> > >> Reminder: qmp-spec.txt specifies the server shall send a greeting
> > >> containing the capabilities on offer.  The client shall send a
> > >> qmp_capabilities command before any other command.
> > >>
> > >> We can't just fix qemu-ga to comply, because it would break existing
> > >> clients.
> > >>
> > >> We could document its behavior in qmp-spec.txt.  Easy enough, but also
> > >> kind of sad.
> > >
> > > I'm not sure we could've ever done it QMP-style with the initial
> > > greeting/negotiation mode. It's been a while, I but recall virtio-serial
> > > chardev in guest not having a very straight-forward way of flushing out
> > > data from the vring after a new client connects on the host side, so
> > > new clients had a chance of reading left-over garbage from previous
> > > client sessions. Or maybe it was open/close/open on the guest/chardev
> > > side that didn't cause the flush... anyway:
> > >
> > > This is why guest-sync was there, so you could verify the stream was
> > > in sync with a given "session ID" before continuing. But that doesn't
> > > help much if the stream is in some garbage state that parser can't
> > > recover from...
> > >
> > > This is why guest-sync-delimited was introduced; it inserts a 0xFF
> > > sential value (invalid for any normal QMP stream) prior to response that
> > > a client can scan for to flush the stream. Similarly, clients are
> > > supposed to precede guest-sync/guest-sync-delimited so QGA to get stuck
> > > trying to parse a partial read from an earlier client that is 'eating' a
> > > new request from a new client connection. I don't think these are really
> > > issues with vsock (or the other transports QGA accepts), but AFAIK
> > > Windows is still mostly reliant on virtio-serial, so these are probably
> > > still needed.
> >
> > I believe you're right about the reason being virtio-serial.  I
> > documented it that way in commit 72e9e569d0 "docs/interop/qmp-spec: How
> > to force known good parser state".
> >
> >     2.6 Forcing the JSON parser into known-good state
> >     -------------------------------------------------
> >
> >     Incomplete or invalid input can leave the server's JSON parser in a
> >     state where it can't parse additional commands.  To get it back into
> >     known-good state, the client should provoke a lexical error.
> >
> >     The cleanest way to do that is sending an ASCII control character
> >     other than '\t' (horizontal tab), '\r' (carriage return), or '\n' (new
> >     line).
> >
> >     Sadly, older versions of QEMU can fail to flag this as an error.  If a
> >     client needs to deal with them, it should send a 0xFF byte.
> >
> >     2.7 QGA Synchronization
> >     -----------------------
> >
> >     When a client connects to QGA over a transport lacking proper
> >     connection semantics such as virtio-serial, QGA may have read partial
> >     input from a previous client.  The client needs to force QGA's parser
> >     into known-good state using the previous section's technique.
> >     Moreover, the client may receive output a previous client didn't read.
> >     To help with skipping that output, QGA provides the
> >     'guest-sync-delimited' command.  Refer to its documentation for
> >     details.
> >
> > 0xFF is invalid UTF-8, which is kind of icky.  We should've used a
> > proper control character like EOT (end of transmission) from the start.
> > Water under the bridge.
> >
> > guest-sync has another design flaw: an unread command reply consisting
> > of just an integer can be confused with guest-sync's reply.  Unlikely as
> > long as guest-sync's @id argument is chosen at random, as its
> > documentation demands.
> >
> > guest-sync could be deprecated, I guess.
>
> Yes, should probably be deprecated in favor of guest-sync-delimited. I
> left it for clients that really don't want to dig into the transport
> layer to search for 0xFF, but still want at least some ability to
> re-sync.
>
> >
> > The @id argument of guest-sync and guest-sync-delimited feels kind of
> > redundant with the command object's @id member.  Except QGA didn't
> > conform to the QMP spec until commit 4eaca8de26 "qmp: common 'id'
> > handling & make QGA conform to QMP spec" (v4.0.0).  More water under the
> > bridge.
> >
> > Note that there's no need for all this when the transport provides
> > proper connection semantics.  Clients relying on connection semantics
> > work fine even when they don't bother with this syncing stuff.  Do such
> > clients exist?  We probably don't know.  May or may not matter.
>
> True, I think only virtio-serial and maybe isa-serial require the sync.
> I was hoping virtio-vsock might quickly become the default, then most
> clients would no longer need guest-sync*, but Windows still seems to be
> reliant on virtio-serial (AFAIK).
>
> >
> > > So QGA has sort of always had its own hand-shake, ideally via
> > > guest-sync-delimited. So if this new negotiation mechanism could
> > > build off of that, rather than introducing something on top, that would
> > > be ideal. Unfortunately it's naming isn't great for what's being done
> > > here, but 'synchronize' is sorta in the ball-park at least...
> >
> > Fair point.
> >
> > >> Is there a way to add capability negotiation to qemu-ga without breaking
> > >> existing clients?  We obviously have to make it optional.
> > >>
> > >> The obvious idea "make qmp_capabilities optional" doesn't work, because
> > >> the client needs to receive the greeting before sending
> > >> qmp_capabilities, to learn what capabilities are on offer.
> > >>
> > >> This leads to...
> > >>
> > >> > What about something like this:
> > >> >
> > >> > Add a new "request-negotiation" command to qemu-guest-agent 7.0.0.
> > >> >
> > >> > [Modern client to unknown server]
> > >> > 1. A modern client connects to a server of unknown version, and
> > >> > without waiting, issues the "request-negotiation" command.
> > >> > 2. An old server will reply with CommandNotFound. We are done negotiating.
> > >> > 3. A modern server will reply with the greeting in the traditional
> > >> > format, but as a reply object (to preserve "execute" semantics.)
> > >> > 4. The modern client will now issue qmp-capabilities as normal.
> > >> > 5. The server replies with success or failure as normal.
> > >> > 6. Connection is fully established.
> > >> >
> > >> > [Old client to unknown server]
> > >> > 1. An old client connects to an unknown version server.
> > >> > 2. A command is issued some time later.
> > >> >   2a. The server is old, the command worked as anticipated.
> > >> >   2b. The server is new, the command fails with CommandNotFound and
> > >> > urges the use of 'request-negotiation'.
> > >>
> > >> A new server could accept the command, too.  This way, negotiation
> > >> remains optional, unlike in "normal" QMP.  Old clients don't negotiate,
> > >> and get default capabilities.
> > >
> > > ...so what if we had guest-sync/guest-sync-delimited start returning
> > > capabilities and version fields rather than a new request-negotiation
> > > command? If they aren't present we know the server is too old, and don't
> > > have to rely on CommandNotFound to determine that.
> >
> > Both guest-sync and guest-sync-delimited have a design flaw that defeats
> > such a straighforward extension: 'returns': 'int'.  There is no way to
> > return more data compatibly.
>
> Ugh, I misread the scheme and thought it was a struct with a single
> field... I knew that seemed to good to be true.
>
> >
> > We could add an optional flag to guest-sync-delimited to make it return
> > an object.  But I think we'd be better off with a new command.
>
> New cmd is probably for the best then, since hopefully guest-sync-delimited
> can become irrelevant in the future, and the possibility of a failed sync
> command on old clients (due to new param) getting mixed in with the recovery
> logic for a failed negotiation/capability probe, would probably make the
> whole interface a bit too unwieldy.
>
> > >> > - QGA is now officially on a different flavor of QMP protocol. You
> > >> > still need to know in advance if you are connecting to QGA or anything
> > >> > else. That's still a little sad, but maybe that's just simply an
> > >> > impossible goal.
> > >> >
> > >> > Bonus:
> > >> > - If an execution ID is used when sending "request-negotiation", we
> > >> > know that the server is at least version 4.0.0 if it responds to us
> > >> > using that ID. A modern client can then easily distinguish between
> > >> > pre-4.0, post-4.0 and post-7.0 servers. It's a useful probe.
> > >
> > > Is that in reference to the optional 'id' field that can be passed to
> > > QMP requests? Don't see the harm in that, and QGA should pass them back
> > > intact.
> >
> > I think it does since commit 4eaca8de26 "qmp: common 'id' handling &
> > make QGA conform to QMP spec" (v4.0.0).
>
> Ah, right, sort of remember now. Thanks for the pointer.
>
> -Mike
>

Thank you both for the history lesson!

This came up because qmp-shell and our qmp library claim to support
connecting to QGA targets, but they do so by just *not* sending a
greeting at all. I was completely ignorant that there was already a
different handshaking procedure needed for QGA targets. We don't use
it at all in our unit test infrastructure.

It was brought to my attention in particular that QGA prior to 4.0
does not support execution IDs properly, so I need to add some kind of
"probe" to the client to test for that support. In theory, a client
could just always opt to never use execution IDs when connecting to a
QGA target, but I find them to be extremely helpful for reading server
logs and so I believe that a Good Client :tm: should use them
absolutely all the time unless circumstances prohibit it.

Before I press on the idea of adding a more rigorous handshake, I'll
need to go and study the QGA limitations and do some more testing to
make sure I am actually solving any real problem, then. More
constraints than I was aware of. (Shucks.)

Thanks!
--js


