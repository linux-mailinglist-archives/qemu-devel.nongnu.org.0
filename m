Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED434B53B9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:49:37 +0100 (CET)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcfX-0003w2-Fc
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJc8a-00046f-Aw
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nJc8M-0005Oa-56
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644848085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SSHipU3AaFRUKs39V+LvB5jh+gOg6xaAudxMhmggmxA=;
 b=aPLgnE7J2fHZMFm2O+swyTqB6tUIT4rs61CNZTP0G3FxFh69XmSbECudYSqntZhqbIGJMR
 z8RiS24OxF2wXIiIAw9CpMCNUA4mZ9/bSsyYVLkM+48N0R1Es/5VjhuE//gp/UO5qo/tQe
 lOjGLvFko5Esr4QjOlcid5pC5eIr7TE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-zie4vREnNn-EdxVLmacPIA-1; Mon, 14 Feb 2022 09:14:43 -0500
X-MC-Unique: zie4vREnNn-EdxVLmacPIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0F061091DA1;
 Mon, 14 Feb 2022 14:14:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E52287D3CD;
 Mon, 14 Feb 2022 14:14:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 711FE21E65E6; Mon, 14 Feb 2022 15:14:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Adding a handshake to qemu-guest-agent
References: <CAFn=p-anWO3dpvcECpW6J1ExJLw01DhXvTYtC5FUi5p7kQ2tig@mail.gmail.com>
 <87pmnwqzq7.fsf@pond.sub.org>
 <CAFn=p-YVdQDbzUsQm97=FyuZN_m3jCsFzjTpguRPjtH3PezTMg@mail.gmail.com>
 <87zgmze0im.fsf@pond.sub.org>
 <CAFn=p-b-gfeDgFfivtJ6tOixyydRb1kS8rS+H41RjiVZ-3Sgsw@mail.gmail.com>
Date: Mon, 14 Feb 2022 15:14:37 +0100
In-Reply-To: <CAFn=p-b-gfeDgFfivtJ6tOixyydRb1kS8rS+H41RjiVZ-3Sgsw@mail.gmail.com>
 (John Snow's message of "Fri, 11 Feb 2022 14:38:20 -0500")
Message-ID: <87czjpilgy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: the qemu-ga maintainer

John Snow <jsnow@redhat.com> writes:

> [Moving our discussion upstream, because it stopped being brief and simple.]

Motivation: qemu-ga doesn't do capability negotiation as specified in
docs/interop/qmp-spec.txt.

Reminder: qmp-spec.txt specifies the server shall send a greeting
containing the capabilities on offer.  The client shall send a
qmp_capabilities command before any other command.

We can't just fix qemu-ga to comply, because it would break existing
clients.

We could document its behavior in qmp-spec.txt.  Easy enough, but also
kind of sad.

Is there a way to add capability negotiation to qemu-ga without breaking
existing clients?  We obviously have to make it optional.

The obvious idea "make qmp_capabilities optional" doesn't work, because
the client needs to receive the greeting before sending
qmp_capabilities, to learn what capabilities are on offer.

This leads to...

> What about something like this:
>
> Add a new "request-negotiation" command to qemu-guest-agent 7.0.0.
>
> [Modern client to unknown server]
> 1. A modern client connects to a server of unknown version, and
> without waiting, issues the "request-negotiation" command.
> 2. An old server will reply with CommandNotFound. We are done negotiating.
> 3. A modern server will reply with the greeting in the traditional
> format, but as a reply object (to preserve "execute" semantics.)
> 4. The modern client will now issue qmp-capabilities as normal.
> 5. The server replies with success or failure as normal.
> 6. Connection is fully established.
>
> [Old client to unknown server]
> 1. An old client connects to an unknown version server.
> 2. A command is issued some time later.
>   2a. The server is old, the command worked as anticipated.
>   2b. The server is new, the command fails with CommandNotFound and
> urges the use of 'request-negotiation'.

A new server could accept the command, too.  This way, negotiation
remains optional, unlike in "normal" QMP.  Old clients don't negotiate,
and get default capabilities.

> Compatibility matrix summary:
> Old client on old server: Works just fine, as always.
> Old client on new server: Will fail; the new server requires the
> negotiation step to be performed. This is a tractable problem.
> POSSIBLY we need to send some kind of "warning event" for two versions
> before making it genuinely mandatory. Also tractable.

With optional negotiation, this works fine, too.

> New client on old server: Works, albeit with a single failed execute
> command now in the log file.
> New client on new server: Works, though handshaking is now permanently
> a little chattier than with any other QMP server.
>
> ***The QMP spec will need to be updated*** to state: the asynchronous
> greeting is mandatory on all QMP implementations, EXCEPT for the
> qemu-guest-agent, which for historical reasons, uses an alternate
> handshaking process, ...
>
> Compatibility concerns:
> - We must never remove the 'request-negotiation' command from QGA,
> forever-and-ever, unless we also make a new error class for
> "NegotiationRequired" that's distinct from "CommandNotFound", but
> that's more divergence. Supporting the negotiation request command
> forever-and-ever is probably fine.

Yup.

> - QGA is now officially on a different flavor of QMP protocol. You
> still need to know in advance if you are connecting to QGA or anything
> else. That's still a little sad, but maybe that's just simply an
> impossible goal.
>
> Bonus:
> - If an execution ID is used when sending "request-negotiation", we
> know that the server is at least version 4.0.0 if it responds to us
> using that ID. A modern client can then easily distinguish between
> pre-4.0, post-4.0 and post-7.0 servers. It's a useful probe.

Mike, thoughts?


