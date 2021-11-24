Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90DA45C5B7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:58:37 +0100 (CET)
Received: from localhost ([::1]:37842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsnF-0008Co-1K
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpsg5-00047I-7A
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:51:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mpsg1-0006tF-Sq
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 08:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637761868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFXw43VdfAbH1IblNNwfNl2vqAs+7pEgDVwLtzZaun8=;
 b=I1OE81hxapxsxArsaVrOhR6Z4ah1Slzyle7ohWryLp8wt73gyFGHHZmQIJogfvuw4ddQ72
 SQMfKv3GzS+uaevGBial8Rxrwx324B2MJmuVnxxUiggcmt/h0VrwLx1iZ7hTnVSb1etqSk
 /TzPFqchrs1tqnbP6NV+ap4Z1gIs08o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-LHgWmldEMvS56oCX0GO_ZA-1; Wed, 24 Nov 2021 08:51:07 -0500
X-MC-Unique: LHgWmldEMvS56oCX0GO_ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 316E11853032;
 Wed, 24 Nov 2021 13:51:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58CFA60CC9;
 Wed, 24 Nov 2021 13:50:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BD6FB11380A7; Wed, 24 Nov 2021 14:50:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <87y25jw69i.fsf@dusky.pond.sub.org>
 <d3ae2bea-7d60-a714-100c-40b31fd19725@greensocs.com>
Date: Wed, 24 Nov 2021 14:50:11 +0100
In-Reply-To: <d3ae2bea-7d60-a714-100c-40b31fd19725@greensocs.com> (Damien
 Hedde's message of "Tue, 23 Nov 2021 17:11:17 +0100")
Message-ID: <87lf1dwtm4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

> On 11/20/21 10:00, Markus Armbruster wrote:
>> Damien Hedde <damien.hedde@greensocs.com> writes:
>> 
>>> Hi all,
>>>
>>> This series adds support for cold-plugging devices using QMP
>>> commands. It is a step towards machine configuration using QMP, but
>>> it does not allow the user to add more devices than he could do with
>>> the CLI options before.
>>>
>>> Right now we can add a device using 2 ways:
>>> + giving "-device" CLI option. In that case the device is
>>>    cold-plugged: it is created before the machine becomes ready.
>>> + issuing device_add QMP command. In that case the device is
>>>    hot-plugged (the command can not be issued before the machine is
>>>    ready).
>>>
>>> This series allows to issue device_add QMP to cold-plug a device
>>> like we do with "-device" CLI option. All added QMP commands are
>>> marked as 'unstable' in qapi as they are part of preconfig.
>>> We achieve this by introducing a new 'x-machine-init' command to
>>> stop the VM creation at a point where we can cold-plug devices.
>>>
>>> We are aware of the ongoing discussion about preconfig future (see
>>> [1]). This patchset includes no major modifications from the v2 (but
>>> the scope is reduced) and "x-machine-init" simply stops the
>>> configuration between qemu_board_init() and qemu_create_cli_devices()
>>> function calls.
>>>
>>> As a consequence, in the current state, the timeline is:
>> 
>> "current state" = with this series applied?
>
> yes. this patchset adds the first two steps.
>
>>> + "x-machine-init" command
>>> + "device_add" cold-plug commands (no fw_cfg legacy order support)
>>> + "x-exit-preconfig" command will then trigger the following
>>> + "-soundhw" CLI options
>>> + "-fw_cfg" CLI options
>>> + usb devices creation
>>> + "-device" CLI options (with fw_cfg legacy order support)
>>> + some other devices creation (with fw_cfg legacy order support)
>>>
>>> We don't know if the differences between -device/device_add are
>>> acceptable or not. To reduce/remove them we could move the
>>> "x-machine-init" stopping point. What do you think ?
>> 
>> I'm not sure I understand this paragraph.
>> I understand the difference between -device and device_add in master:
>> cold vs. hot plug.
>> 
>> Your patch series makes "cold" device_add possible, i.e. it reduces
>> (eliminates?) the difference between -device and device_add when the
>> latter is "cold".
>
> Yes.
> Apart, before this patchset cold-plugging with device_add was not
> possible at all.
>
> So, any difference between -device and a cold device_add is added
> here. (no bad intention, the patch did not move since v1 and this part
> of the code is just really tricky to understand...)
>
>> What difference remains that moving 'the "x-machine-init" stopping
>> point' would 'reduce/remove'?
>
> To answer this, let's take a look at qemu_create_cli_devices() (I
> removed some comments).
>
> | 1 static void qemu_create_cli_devices(void)
> | 2 {
> | 3     DeviceOption *opt;
> | 4
> | 5     soundhw_init();
> | 6
> | 7     qemu_opts_foreach(qemu_find_opts("fw_cfg"),
> | 8                       parse_fw_cfg, fw_cfg_find(), &error_fatal);
> | 9
> |10     /* init USB devices */
> |11     if (machine_usb(current_machine)) {
> |12         if (foreach_device_config(DEV_USB, usb_parse) < 0)
> |13             exit(1);
> |14     }
> |15
> |16     /* init generic devices */
> |17     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
> |18     qemu_opts_foreach(qemu_find_opts("device"),
> |19                       device_init_func, NULL, &error_fatal);
> |20     QTAILQ_FOREACH(opt, &device_opts, next) {
> |21         loc_push_restore(&opt->loc);
> |22         qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
> |23         loc_pop(&opt->loc);
> |24     }
> |25     rom_reset_order_override();
> |26 }
>
> The configuration timeline is:
> Line 3    : handle "-soundhw" (deprecated).
> Line 7-8  : handle "-fw_cfg"
> Line 10-14: related to USB devices
> Line 18-19: handle "-device" CLI options (legacy cli format)
> Line 20-24: handle "-device" CLI options (json format)
>
> With this patchset implementation, we pause just before calling this
> function (it seemed logical to stop here, given the machine
> phase). But the above timeline happens after we paused and issued
> device_add to cold plug devices. As a consequence there is a
> difference between (1) giving a -device option and (2) issuing a
> device_add at this pause point.

I see.

> The biggest difference is the fw_cfg option I think: it is related
> with the rom_set_order_override()/rom_reset_order_override() (line 17
> and 25). There is also the usb devices parts in between. I lack the 
> knowledge about fw_cfg/usb to tell if it is important or not.
>
> What I wanted to say is I don't know if the difference is
> acceptable. If we want device_add to support all -device use cases, it
> is not. In that case we need to stop either in the middle of this
> function (line 15) or at the end (better with your sketch in mind).
>
> Note that rom_set_order_override()/rom_reset_order_override() only
> set/reset a switch variable that changes how fw_cfg files are
> sorted. It could be integrated into device_add code (and removed from
> the above function) without changing the behavior.

For me, the part that puts me off is interleaving CLI and QMP.

We process the CLI in an order few people understand, and only while
staring at the code.  That's bad.

Injecting QMP at certain points in that sequence can only make it worse.

If I understand your proposal correctly, we need special QMP commands to
opt into / manage QMP command injection, not least to avoid incompatible
change.

For instance, this needs to keep working:

1. Plug a SCSI HBA with CLI, say -device virtio-scsi,id=scsi-hba0

2. Plug a SCSI device with QMP, say {"execute": "device_add",
   "arguments": {"driver": "scsi-cd"}}

>>> Patches 1, 3 and 5 miss a review.
>>>
>>> The series is organized as follow:
>>>
>>> + Patches 1 and 2 converts the MachinePhase enum to a qapi definition
>>>    and add the 'query-machine-phase'. It allows to introspect the
>>>    current machine phase during preconfig as we will now be able to
>>>    reach several machine phases using QMP.
>> 
>> If we fold MachinePhase into RunState, we can reuse query-status.
>> 
>> Having two state machines run one after the other feels like one too
>> many.
>> 
>>> + Patch 3 adds the 'x-machine-init' QMP command to stop QEMU at
>>>    machine-initialized phase during preconfig.
>>> + Patch 4 allows issuing device_add QMP command during the
>>>    machine-initialized phase.
>>> + Patch 5 improves the doc about preconfig in consequence.
>> 
>> I understand you want to make progress towards machine configuration
>> with QMP.  However, QEMU startup is (in my educated opinion) a hole, and
>> we should be wary of digging deeper.
>> 
>> The "timeline" you gave above illustrates this.  It's a complicated
>> shuffling of command line options and QMP commands that basically nobody
>> can keep in working memory.  We have reshuffled it / made it more
>> complicated quite a few times already to support new features.  Based on
>> your cover letter, I figure you're making it more complicated once more.
>> 
>> At some point, we need to stop digging us deeper into the hole.  This is
>> not an objection to merging your work.  It's a call to stop and think.
>
> That's why we re-posted this as RFC. Reading the preconfig thread, I
> had the feeling what we've initially proposed 6 months ago was not
> going into the direction discussed in the thread. We don't want to put
> more effort in a dead-end but we are committed into fixing it so that
> it fits into the good direction.

Appreciated!

> Do you mean we should wait for "stabilize preconfig" thread to arrive
> to some conclusion before we continue to work on this ?

"Wait for" feels dangerously passive.  "Push for"?

> Thanks,
> Damien
>
>> Let me quote the sketch I posted to the "Stabilize preconfig" thread:
>> 
>> 1. Start event loop
>> 
>> 2. Feed it CLI left to right.  Each option runs a handler just like each
>>     QMP command does.
>> 
>>     Options that read a configuration file inject the file into the feed.
>> 
>>     Options that create a monitor create it suspended.
>> 
>>     Options may advance the phase / run state, and they may require
>>     certain phase(s).
>> 
>> 3. When we're done with CLI, resume any monitors we created.
>> 
>> 4. Monitors now feed commands to the event loop.  Commands may advance
>>     the phase / run state, and they may require certain phase(s).
>> 
>> Users can do as much or as little with the CLI as they want.  You'd
>> probably want to set up a QMP monitor and no more.
>> 
>> device_add becomes possible at a certain state of the phase / run state
>> machine.  It changes from cold to hot plug at a certain later state.
>> 
>>> [1]: https://lore.kernel.org/qemu-devel/b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com
>>>
>>> Thanks for your feedback.
>> 


