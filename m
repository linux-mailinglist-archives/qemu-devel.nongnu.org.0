Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2415D44E5C0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:50:42 +0100 (CET)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlV4q-0000qh-PC
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:50:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlV2v-00087s-1K
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlV2r-0003BU-Ij
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636717716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wIsLH+AAkdlq/2kp0UUbDDC9o+NlmwMN4cOfgMEi4/E=;
 b=dwaC1iaLPHXTO5PH4SyxN8edqoeRYG47xxesQ1Pv/w+p1IaNqxCwJXRP2o3ZWoCJlRt9rS
 n0/EmcHPZid19n6MJO++C3i7c+FWFigZvDsBVRvBl8Py7WcZdTmsmzTZjBr9oanfNUqINW
 DtfQo5SDEgJslehvgkjADsH79uT/9c0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-x6yC9velNzejNas_tai_Xw-1; Fri, 12 Nov 2021 06:48:34 -0500
X-MC-Unique: x6yC9velNzejNas_tai_Xw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD7161966320
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 11:48:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73CC019C59;
 Fri, 12 Nov 2021 11:48:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D6DBF11380A7; Fri, 12 Nov 2021 12:48:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qmp: Stabilize preconfig
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
 <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com>
 <87pmr7rzls.fsf@dusky.pond.sub.org>
 <bc437ccb-0487-a5ff-8e6a-50067715c4d4@redhat.com>
 <87mtman4h1.fsf@dusky.pond.sub.org>
 <13efddef-cc30-9a6a-a700-060d6fca57e3@redhat.com>
Date: Fri, 12 Nov 2021 12:48:25 +0100
In-Reply-To: <13efddef-cc30-9a6a-a700-060d6fca57e3@redhat.com> (Paolo
 Bonzini's message of "Thu, 11 Nov 2021 20:22:09 +0100")
Message-ID: <87ee7lh9x2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/11/21 15:37, Markus Armbruster wrote:
>>> 1) PHASE_NO_MACHINE - backends can already be created here, but no
>>> machine exists yet
>>>
>>> 2) PHASE_MACHINE_CREATED - the machine object has been created.  It's
>>> not initialized, but it's there.
>>>
>>> 3) PHASE_ACCEL_CREATED - the accelerator object has been created.  The
>>> accelerator needs the machine object, because for example KVM might
>>> not support all machine types.  So the accelerator queries the machine
>>> object and fails creation in case of incompatibility.  This enables
>>> e.g. fallback to TCG.  -preconfig starts the monitor here.
>> 
>> We should be able to start monitors first, if we put in the work.
>
> The monitor starts, the question is the availability of the event loop. 

What does the event loop depend on?

>   This requires a command (or a something) to advance to the next phase. 
>    x-exit-preconfig is such a command.
>
> In addition, one thing I don't like of preconfig is that command line 
> arguments linger until they are triggered by x-exit-preconfig.  Adding 
> more such commands makes things worse.

Yes, that's ugly.  I'd prefer command line left to right, and then QMP
commands in order.  If your command line advances the phase too far for
your QMP commands, then that's your own fault.

>>> 4) PHASE_MACHINE_INIT - machine initialization consists mostly in
>>> creating the onboard devices.  For this to happen, the machine needs
>>> to learn about the accelerator, because onboard devices include CPUs
>>> and other accelerator-dependent devices.  Devices plugged in this
>>> phase are cold-plugged.
>>>
>>> 5) PHASE_MACHINE_READY - machine init done notifiers have been called
>>> and the VM is ready.  Devices plugged in this phase already count as
>>> hot-plugged.  -S starts the monitor here.
>> 
>> Remind us: what work is done in the machine init done notifiers?
>
> It depends, but---generally speaking---what they do applies only to 
> cold-plugged devices.  For example, fw_cfg gathers the boot order in the 
> machine-init-done notifier (via get_boot_devices_list).
>
>> What exactly necessitates "count as hot-plugged"?  Is it something done
>> in these notifiers?
>
> It depends on the bus.  It boils down to this code in device_initfn:
>
>      if (phase_check(PHASE_MACHINE_READY)) {
>          dev->hotplugged = 1;
>          qdev_hot_added = true;
>      }
>
> For example, hotplugged PCI devices must define function 0 last; 
> coldplugged PCI devices can define functions in any order 
> (do_pci_register_device, called by pci_qdev_realize).
>
> Another example, a device_add after machine-done causes an ACPI hotplug 
> event, because acpi_pcihp_device_plug_cb checks dev->hotplugged.

Worse, if the guest doesn't play ball, the device remains in hot plug
limbo.

Why would anyone *want* to plug a device in PHASE_MACHINE_READY (when
the plug is hot) instead of earlier (when it's cold)?

>>> x-exit-preconfig goes straight from PHASE_ACCEL_CREATED to
>>> PHASE_MACHINE_READY.  Devices can only be created after
>>> PHASE_MACHINE_INIT, so device_add cannot be enabled at preconfig
>>> stage.
>> 
>> Now I am confused again.  Can you cold plug devices with device_add in
>> presence of -preconfig, and if yes, how?
>
> No, because the monitor goes directly from a point where device_add 
> fails (PHASE_ACCEL_CREATED) to a point where devices are hotplugged 
> (PHASE_MACHINE_READY).

Bummer.

>> Related question: when exactly in these phases do we create devices
>> specified with -device?
>
> In PHASE_MACHINE_INIT---that is, after the machine has been initialized 
> and before machine-done-notifiers have been called.

In other words, you should never use device_add where -device would do,
because the latter gives you cold plug (which is simple and reliable),
and the former hot plug (which is the opposite).

>>> With a pure-QMP configuration flow, PHASE_MACHINE_CREATED would be
>>> reached with a machine-set command (corresponding to the
>>> non-deprecated parts of -machine) and PHASE_ACCEL_CREATED would be
>>> reached with an accel-set command (corresponding to -accel).
>> 
>> I don't think this depends on "pure-QMP configuration flow".  -machine
>> and -accel could advance the phase just like their buddies machine-set
>> and accel-set.
>
> They already do (see qemu_init's calls to phase_advance).
>
>> State transition diagram:
>> 
>>      PHASE_NO_MACHINE (initial state)
>>              |
>>              |  -machine or machine-set
>>              v
>>      PHASE_MACHINE_CREATED
>>              |
>>              |  -accel or accel-set
>>              v
>>      PHASE_ACCEL_CREATED
>>              |
>>              |  ???
>
> qmp_x_exit_preconfig() -> qemu_init_board() -> machine_run_board_init()

I read this as "the state transition happens in
machine_run_board_init(), called from qmp_x_exit_preconfig() via
qemu_init_board()".

>>              v
>>      PHASE_MACHINE_INIT
>>              |
>>              |  ???
>
> qmp_x_exit_preconfig() -> qemu_machine_creation_done() -> 
> qdev_machine_creation_done()

I read this as "the state transition happens in
qdev_machine_creation_done(), called from qmp_x_exit_preconfig() via
qemu_machine_creation_done()".

> The steps in qmp_x_exit_preconfig() are pretty self-explanatory:
>
>      qemu_init_board();
>      qemu_create_cli_devices();
>      qemu_machine_creation_done();
>
> qemu_init() calls qmp_x_exit_preconfig() if -preconfig is not passed on 
> the command line.
>
>>              v
>>      PHASE_MACHINE_READY
>>              |
>>              |  cont
>>              v
>>             ???
>
> No phases anymore, it's always PHASE_MACHINE_READY.  cont simply changes 
> the runstate to RUNNING.
>
>> The earlier the monitor becomes available, the better.
>> Ideally, we'd process the command line strictly left to right, and fail
>> options that are "out of phase".  Make the monitor available right when
>> we process its -mon.  The -chardev for its character device must precede
>> it.
>
> The boat for this has sailed.  The only sane way to do this is a new binary.

"Ideally" still applies to any new binary.

>> Likewise, we'd fail QMP commands that are "out of phase".
>> @allow-preconfig is a crutch that only exists because we're afraid (with
>> reason) of hidden assumptions in QMP commands.
>
> At this point, it's not even like that anymore (except for block devices 
> because my patches haven't been applied).  allow-preconfig is just a 
> quick way to avoid writing
>
>      if (!phase_check(PHASE_MACHINE_READY)) {
>          error_setg(errp, "Please configure the machine first");
>          return;
>      }
>
> over and over in many commands.

My point is that we still have quite a few commands without
'allow-preconfig' mostly because we are afraid of allowing them in
preconfig state, not because of true phase dependencies.


