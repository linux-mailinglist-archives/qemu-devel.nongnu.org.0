Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414164B84B0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:46:30 +0100 (CET)
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGtJ-0001AM-2Y
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:46:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKGMg-0002ng-NT
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nKGMe-0006UI-IM
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645002763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUcyxEbooTdROsSb0BRYTxisdMidby1dzxFhQ3eL1cg=;
 b=AE2x4vI547ifsxquS4whB09G6xPSuJ8qsMGw4puqPSC/U+VsOIBhUoADykguu/NZVOhkgb
 HnfHI619o6X+QPwBdYOByAr0TH2kHuI0dwWE+xI9n+aJJ+rFKVyOsCDN11xgRMeAEHxyu1
 owaI5Jba9LSJXMgjMBg8ANz29Wann10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-Jnxct6JhM5GlV2KOI1GS4A-1; Wed, 16 Feb 2022 04:12:40 -0500
X-MC-Unique: Jnxct6JhM5GlV2KOI1GS4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB1C1006AA0;
 Wed, 16 Feb 2022 09:12:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E68214F874;
 Wed, 16 Feb 2022 09:12:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4209021E66FF; Wed, 16 Feb 2022 10:12:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: Adding a handshake to qemu-guest-agent
References: <CAFn=p-anWO3dpvcECpW6J1ExJLw01DhXvTYtC5FUi5p7kQ2tig@mail.gmail.com>
 <87pmnwqzq7.fsf@pond.sub.org>
 <CAFn=p-YVdQDbzUsQm97=FyuZN_m3jCsFzjTpguRPjtH3PezTMg@mail.gmail.com>
 <87zgmze0im.fsf@pond.sub.org>
 <CAFn=p-b-gfeDgFfivtJ6tOixyydRb1kS8rS+H41RjiVZ-3Sgsw@mail.gmail.com>
 <87czjpilgy.fsf@pond.sub.org>
 <20220215193601.7bfexzqnpsprjg2t@amd.com>
Date: Wed, 16 Feb 2022 10:12:36 +0100
In-Reply-To: <20220215193601.7bfexzqnpsprjg2t@amd.com> (Michael Roth's message
 of "Tue, 15 Feb 2022 13:36:01 -0600")
Message-ID: <87zgmr89a3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael Roth <michael.roth@amd.com> writes:

> On Mon, Feb 14, 2022 at 03:14:37PM +0100, Markus Armbruster wrote:
>> Cc: the qemu-ga maintainer
>> 
>> John Snow <jsnow@redhat.com> writes:
>> 
>> > [Moving our discussion upstream, because it stopped being brief and simple.]
>
> Hi John, Markus,
>
>> 
>> Motivation: qemu-ga doesn't do capability negotiation as specified in
>> docs/interop/qmp-spec.txt.
>> 
>> Reminder: qmp-spec.txt specifies the server shall send a greeting
>> containing the capabilities on offer.  The client shall send a
>> qmp_capabilities command before any other command.
>> 
>> We can't just fix qemu-ga to comply, because it would break existing
>> clients.
>> 
>> We could document its behavior in qmp-spec.txt.  Easy enough, but also
>> kind of sad.
>
> I'm not sure we could've ever done it QMP-style with the initial
> greeting/negotiation mode. It's been a while, I but recall virtio-serial
> chardev in guest not having a very straight-forward way of flushing out
> data from the vring after a new client connects on the host side, so
> new clients had a chance of reading left-over garbage from previous
> client sessions. Or maybe it was open/close/open on the guest/chardev
> side that didn't cause the flush... anyway:
>
> This is why guest-sync was there, so you could verify the stream was
> in sync with a given "session ID" before continuing. But that doesn't
> help much if the stream is in some garbage state that parser can't
> recover from...
>
> This is why guest-sync-delimited was introduced; it inserts a 0xFF
> sential value (invalid for any normal QMP stream) prior to response that
> a client can scan for to flush the stream. Similarly, clients are
> supposed to precede guest-sync/guest-sync-delimited so QGA to get stuck
> trying to parse a partial read from an earlier client that is 'eating' a
> new request from a new client connection. I don't think these are really
> issues with vsock (or the other transports QGA accepts), but AFAIK
> Windows is still mostly reliant on virtio-serial, so these are probably
> still needed.

I believe you're right about the reason being virtio-serial.  I
documented it that way in commit 72e9e569d0 "docs/interop/qmp-spec: How
to force known good parser state".

    2.6 Forcing the JSON parser into known-good state
    -------------------------------------------------

    Incomplete or invalid input can leave the server's JSON parser in a
    state where it can't parse additional commands.  To get it back into
    known-good state, the client should provoke a lexical error.

    The cleanest way to do that is sending an ASCII control character
    other than '\t' (horizontal tab), '\r' (carriage return), or '\n' (new
    line).

    Sadly, older versions of QEMU can fail to flag this as an error.  If a
    client needs to deal with them, it should send a 0xFF byte.

    2.7 QGA Synchronization
    -----------------------

    When a client connects to QGA over a transport lacking proper
    connection semantics such as virtio-serial, QGA may have read partial
    input from a previous client.  The client needs to force QGA's parser
    into known-good state using the previous section's technique.
    Moreover, the client may receive output a previous client didn't read.
    To help with skipping that output, QGA provides the
    'guest-sync-delimited' command.  Refer to its documentation for
    details.

0xFF is invalid UTF-8, which is kind of icky.  We should've used a
proper control character like EOT (end of transmission) from the start.
Water under the bridge.

guest-sync has another design flaw: an unread command reply consisting
of just an integer can be confused with guest-sync's reply.  Unlikely as
long as guest-sync's @id argument is chosen at random, as its
documentation demands.

guest-sync could be deprecated, I guess.  

The @id argument of guest-sync and guest-sync-delimited feels kind of
redundant with the command object's @id member.  Except QGA didn't
conform to the QMP spec until commit 4eaca8de26 "qmp: common 'id'
handling & make QGA conform to QMP spec" (v4.0.0).  More water under the
bridge.

Note that there's no need for all this when the transport provides
proper connection semantics.  Clients relying on connection semantics
work fine even when they don't bother with this syncing stuff.  Do such
clients exist?  We probably don't know.  May or may not matter.

> So QGA has sort of always had its own hand-shake, ideally via
> guest-sync-delimited. So if this new negotiation mechanism could
> build off of that, rather than introducing something on top, that would
> be ideal. Unfortunately it's naming isn't great for what's being done
> here, but 'synchronize' is sorta in the ball-park at least...

Fair point.

>> Is there a way to add capability negotiation to qemu-ga without breaking
>> existing clients?  We obviously have to make it optional.
>> 
>> The obvious idea "make qmp_capabilities optional" doesn't work, because
>> the client needs to receive the greeting before sending
>> qmp_capabilities, to learn what capabilities are on offer.
>> 
>> This leads to...
>> 
>> > What about something like this:
>> >
>> > Add a new "request-negotiation" command to qemu-guest-agent 7.0.0.
>> >
>> > [Modern client to unknown server]
>> > 1. A modern client connects to a server of unknown version, and
>> > without waiting, issues the "request-negotiation" command.
>> > 2. An old server will reply with CommandNotFound. We are done negotiating.
>> > 3. A modern server will reply with the greeting in the traditional
>> > format, but as a reply object (to preserve "execute" semantics.)
>> > 4. The modern client will now issue qmp-capabilities as normal.
>> > 5. The server replies with success or failure as normal.
>> > 6. Connection is fully established.
>> >
>> > [Old client to unknown server]
>> > 1. An old client connects to an unknown version server.
>> > 2. A command is issued some time later.
>> >   2a. The server is old, the command worked as anticipated.
>> >   2b. The server is new, the command fails with CommandNotFound and
>> > urges the use of 'request-negotiation'.
>> 
>> A new server could accept the command, too.  This way, negotiation
>> remains optional, unlike in "normal" QMP.  Old clients don't negotiate,
>> and get default capabilities.
>
> ...so what if we had guest-sync/guest-sync-delimited start returning
> capabilities and version fields rather than a new request-negotiation
> command? If they aren't present we know the server is too old, and don't
> have to rely on CommandNotFound to determine that.

Both guest-sync and guest-sync-delimited have a design flaw that defeats
such a straighforward extension: 'returns': 'int'.  There is no way to
return more data compatibly.

We could add an optional flag to guest-sync-delimited to make it return
an object.  But I think we'd be better off with a new command.

> If they are present, then qmp_capabilities can be issued to renegotiate
> capabilities. (I agree with Markus on enabling default capabilities by
> default as it's done now so backward-compatibility with older clients
> is maintained, or maybe an explicit flag to QGA to require negotiation,
> but only if there's a good use-case for requiring negotiation in some
> cases)
>
>> 
>> > Compatibility matrix summary:
>> > Old client on old server: Works just fine, as always.
>> > Old client on new server: Will fail; the new server requires the
>> > negotiation step to be performed. This is a tractable problem.
>> > POSSIBLY we need to send some kind of "warning event" for two versions
>> > before making it genuinely mandatory. Also tractable.
>> 
>> With optional negotiation, this works fine, too.
>> 
>> > New client on old server: Works, albeit with a single failed execute
>> > command now in the log file.
>> > New client on new server: Works, though handshaking is now permanently
>> > a little chattier than with any other QMP server.
>> >
>> > ***The QMP spec will need to be updated*** to state: the asynchronous
>> > greeting is mandatory on all QMP implementations, EXCEPT for the
>> > qemu-guest-agent, which for historical reasons, uses an alternate
>> > handshaking process, ...
>> >
>> > Compatibility concerns:
>> > - We must never remove the 'request-negotiation' command from QGA,
>> > forever-and-ever, unless we also make a new error class for
>> > "NegotiationRequired" that's distinct from "CommandNotFound", but
>> > that's more divergence. Supporting the negotiation request command
>> > forever-and-ever is probably fine.
>> 
>> Yup.
>> 
>> > - QGA is now officially on a different flavor of QMP protocol. You
>> > still need to know in advance if you are connecting to QGA or anything
>> > else. That's still a little sad, but maybe that's just simply an
>> > impossible goal.
>> >
>> > Bonus:
>> > - If an execution ID is used when sending "request-negotiation", we
>> > know that the server is at least version 4.0.0 if it responds to us
>> > using that ID. A modern client can then easily distinguish between
>> > pre-4.0, post-4.0 and post-7.0 servers. It's a useful probe.
>
> Is that in reference to the optional 'id' field that can be passed to
> QMP requests? Don't see the harm in that, and QGA should pass them back
> intact.

I think it does since commit 4eaca8de26 "qmp: common 'id' handling &
make QGA conform to QMP spec" (v4.0.0).

>> 
>> Mike, thoughts?
>> 


