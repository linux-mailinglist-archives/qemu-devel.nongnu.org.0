Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2954E457CA6
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 10:03:11 +0100 (CET)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moMH7-0000IJ-NB
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 04:03:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1moMFc-0007eP-6h
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1moMFV-0000Ry-MY
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 04:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637398888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HxFReRcQczG/uZ6K73hJDAJpZ9vUUv3g1Q7dsANA0u8=;
 b=f9OeokKErEIDzXUbzMRy4iHmD5t0x9Mmy/iQTmf4GveHSXrTVGgImLuZWMWQ5iGrHf+PDH
 UlLxltSxJ/4iuhtCvUaIduYObViJFlTYjj8JLCDYnym9DvwQVTGTYLlX0RT17ix656uphl
 Wc+aQTwX4JxXzgT1cpk9D9avidgdFME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-tsZKvjFQN2a6h9P0GTEP6g-1; Sat, 20 Nov 2021 04:01:25 -0500
X-MC-Unique: tsZKvjFQN2a6h9P0GTEP6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC5EF91288;
 Sat, 20 Nov 2021 09:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28E6E4180;
 Sat, 20 Nov 2021 09:00:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9971311380A7; Sat, 20 Nov 2021 10:00:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
Date: Sat, 20 Nov 2021 10:00:57 +0100
In-Reply-To: <20211117144703.16305-1-damien.hedde@greensocs.com> (Damien
 Hedde's message of "Wed, 17 Nov 2021 15:46:58 +0100")
Message-ID: <87y25jw69i.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: edgar.iglesias@xilinx.com,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Damien Hedde <damien.hedde@greensocs.com> writes:

> Hi all,
>
> This series adds support for cold-plugging devices using QMP
> commands. It is a step towards machine configuration using QMP, but
> it does not allow the user to add more devices than he could do with
> the CLI options before.
>
> Right now we can add a device using 2 ways:
> + giving "-device" CLI option. In that case the device is
>   cold-plugged: it is created before the machine becomes ready.
> + issuing device_add QMP command. In that case the device is
>   hot-plugged (the command can not be issued before the machine is
>   ready).
>
> This series allows to issue device_add QMP to cold-plug a device
> like we do with "-device" CLI option. All added QMP commands are
> marked as 'unstable' in qapi as they are part of preconfig.
> We achieve this by introducing a new 'x-machine-init' command to
> stop the VM creation at a point where we can cold-plug devices.
>
> We are aware of the ongoing discussion about preconfig future (see
> [1]). This patchset includes no major modifications from the v2 (but
> the scope is reduced) and "x-machine-init" simply stops the
> configuration between qemu_board_init() and qemu_create_cli_devices()
> function calls.
>
> As a consequence, in the current state, the timeline is:

"current state" = with this series applied?

> + "x-machine-init" command
> + "device_add" cold-plug commands (no fw_cfg legacy order support)
> + "x-exit-preconfig" command will then trigger the following
> + "-soundhw" CLI options
> + "-fw_cfg" CLI options
> + usb devices creation
> + "-device" CLI options (with fw_cfg legacy order support)
> + some other devices creation (with fw_cfg legacy order support)
>
> We don't know if the differences between -device/device_add are
> acceptable or not. To reduce/remove them we could move the
> "x-machine-init" stopping point. What do you think ?

I'm not sure I understand this paragraph.

I understand the difference between -device and device_add in master:
cold vs. hot plug.

Your patch series makes "cold" device_add possible, i.e. it reduces
(eliminates?) the difference between -device and device_add when the
latter is "cold".

What difference remains that moving 'the "x-machine-init" stopping
point' would 'reduce/remove'?

> Patches 1, 3 and 5 miss a review.
>
> The series is organized as follow:
>
> + Patches 1 and 2 converts the MachinePhase enum to a qapi definition
>   and add the 'query-machine-phase'. It allows to introspect the
>   current machine phase during preconfig as we will now be able to
>   reach several machine phases using QMP.

If we fold MachinePhase into RunState, we can reuse query-status.

Having two state machines run one after the other feels like one too
many.

> + Patch 3 adds the 'x-machine-init' QMP command to stop QEMU at
>   machine-initialized phase during preconfig.
> + Patch 4 allows issuing device_add QMP command during the
>   machine-initialized phase.
> + Patch 5 improves the doc about preconfig in consequence. 

I understand you want to make progress towards machine configuration
with QMP.  However, QEMU startup is (in my educated opinion) a hole, and
we should be wary of digging deeper.

The "timeline" you gave above illustrates this.  It's a complicated
shuffling of command line options and QMP commands that basically nobody
can keep in working memory.  We have reshuffled it / made it more
complicated quite a few times already to support new features.  Based on
your cover letter, I figure you're making it more complicated once more.

At some point, we need to stop digging us deeper into the hole.  This is
not an objection to merging your work.  It's a call to stop and think.

Let me quote the sketch I posted to the "Stabilize preconfig" thread:

1. Start event loop

2. Feed it CLI left to right.  Each option runs a handler just like each
   QMP command does.

   Options that read a configuration file inject the file into the feed.

   Options that create a monitor create it suspended.

   Options may advance the phase / run state, and they may require
   certain phase(s).

3. When we're done with CLI, resume any monitors we created.

4. Monitors now feed commands to the event loop.  Commands may advance
   the phase / run state, and they may require certain phase(s).

Users can do as much or as little with the CLI as they want.  You'd
probably want to set up a QMP monitor and no more.

device_add becomes possible at a certain state of the phase / run state
machine.  It changes from cold to hot plug at a certain later state.

> [1]: https://lore.kernel.org/qemu-devel/b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com
>
> Thanks for your feedback.


