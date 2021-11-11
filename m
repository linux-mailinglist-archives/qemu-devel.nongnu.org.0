Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BD344D8AB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:55:17 +0100 (CET)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBTw-0001cJ-Iu
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlBCs-0000HO-QT
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlBCp-0001i9-KD
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636641454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XaFwH12RQMzE7kC3jwu34yboh/hjBGwQZ/XZ7iDYnqQ=;
 b=YdvxZcfsRhwTBYF/i4Rl8PU9vVUhhWpssCZs/MkFLFbWVszQUCMpb00O/CoMXBSdJEtL3R
 tZWVn5knvvEbmEovC5HqiIflJ4HzAVw6mzIgvinsXpslZDafi4nfq4JKu7hhNF5ye+ITzd
 T2p2ZdYZW3tdyCMRArJCWEt/iNCgSs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-7F1ZeynzPvWA6KlyzQgaCg-1; Thu, 11 Nov 2021 09:37:33 -0500
X-MC-Unique: 7F1ZeynzPvWA6KlyzQgaCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B76491006AA1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:37:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41E3D5F93B;
 Thu, 11 Nov 2021 14:37:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA02011380A7; Thu, 11 Nov 2021 15:37:14 +0100 (CET)
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
Date: Thu, 11 Nov 2021 15:37:14 +0100
In-Reply-To: <bc437ccb-0487-a5ff-8e6a-50067715c4d4@redhat.com> (Paolo
 Bonzini's message of "Thu, 11 Nov 2021 09:15:09 +0100")
Message-ID: <87mtman4h1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/11/21 07:11, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>>>> On 11/3/21 09:02, Markus Armbruster wrote:
>>>>> I wonder whether we really have to step through three states
>>>>>
>>>>>            x-exit-preconfig  cont
>>>>>       preconfig ---> pre run ---> run
>>>>>
>>>>> and not two
>>>>>
>>>>>               cont
>>>>>       pre run ---> run
>>>
>>> Devices would be hotplugged between x-exit-preconfig and cont, and
>> 
>> Cold plugged!
>
> Nope, hotplugged!  After x-exit-preconfig, the machine is ready to
> start, and that means that the machine will have completed 
> initialization via their machine_init_done notifiers.
>
> For example, fw_cfg will have set the bootorder.  Any device created
> after x-exit-preconfig will not be in the bootorder.

After re-reading this a couple of times, and checking the code, I now
see what I missed.

There has to be a point where we transition from cold to hot plug.  It
obviously can be no later than VM starting to run, i.e. first cont.

We actually moved it from there back to x-exit-preconfig.  I missed /
forgot that.

Why does it have to be moved back?  Let's see below.

>>> part of the machine until x-exit-preconfig; so there is a need for
>>> something like x-exit-preconfig.
>> 
>> Can you briefly explain why device_add doesn't work before
>> x-exit-preconfig and does after?
>
> The answer to this question is basically the verbose version of the
> coldplug/hotplug thing from above.  There are five stages in the
> startup of QEMU (marked by different values of the MachineInitPhase
> enum):
>
> 1) PHASE_NO_MACHINE - backends can already be created here, but no
> machine exists yet
>
> 2) PHASE_MACHINE_CREATED - the machine object has been created.  It's
> not initialized, but it's there.
>
> 3) PHASE_ACCEL_CREATED - the accelerator object has been created.  The
> accelerator needs the machine object, because for example KVM might
> not support all machine types.  So the accelerator queries the machine 
> object and fails creation in case of incompatibility.  This enables
> e.g. fallback to TCG.  -preconfig starts the monitor here.

We should be able to start monitors first, if we put in the work.

> 4) PHASE_MACHINE_INIT - machine initialization consists mostly in
> creating the onboard devices.  For this to happen, the machine needs
> to learn about the accelerator, because onboard devices include CPUs
> and other accelerator-dependent devices.  Devices plugged in this
> phase are cold-plugged.
>
> 5) PHASE_MACHINE_READY - machine init done notifiers have been called
> and the VM is ready.  Devices plugged in this phase already count as 
> hot-plugged.  -S starts the monitor here.

Remind us: what work is done in the machine init done notifiers?

What exactly necessitates "count as hot-plugged"?  Is it something done
in these notifiers?

> x-exit-preconfig goes straight from PHASE_ACCEL_CREATED to
> PHASE_MACHINE_READY.  Devices can only be created after 
> PHASE_MACHINE_INIT, so device_add cannot be enabled at preconfig
> stage.

Now I am confused again.  Can you cold plug devices with device_add in
presence of -preconfig, and if yes, how?

Related question: when exactly in these phases do we create devices
specified with -device?

> stage.   Why does preconfig start at PHASE_ACCEL_CREATED?  Well, the
> phases were not as easy to identify in qemu_init() when it was
> introduced, so I suppose it just seemed like a good place. :)  These
> days, qemu_init() is just a hundred lines of code apart from the huge
> command line parsing switch statement, so we have a clearer idea of
> the steps and you can look deeper at what happens in each phase if you
> want.  phase_advance() is your friend.
>
>
> With a pure-QMP configuration flow, PHASE_MACHINE_CREATED would be
> reached with a machine-set command (corresponding to the
> non-deprecated parts of -machine) and PHASE_ACCEL_CREATED would be
> reached with an accel-set command (corresponding to -accel).

I don't think this depends on "pure-QMP configuration flow".  -machine
and -accel could advance the phase just like their buddies machine-set
and accel-set.

State transition diagram:

    PHASE_NO_MACHINE (initial state)
            |
            |  -machine or machine-set
            v
    PHASE_MACHINE_CREATED
            |
            |  -accel or accel-set
            v
    PHASE_ACCEL_CREATED
            |
            |  ???
            v
    PHASE_MACHINE_INIT
            |
            |  ???
            v
    PHASE_MACHINE_READY
            |
            |  cont
            v
           ???

Can you fill in the ??? blanks?

> I haven't yet thought hard enough whether accel-set could go directly
> from PHASE_MACHINE_CREATED to PHASE_MACHINE_INIT.  It probably depends 
> on how CPUs would be configured in the QMP flow; if accel-set must
> return at PHASE_ACCEL_CREATED, a separate command is needed to reach 
> PHASE_MACHINE_INIT.  But either way, there the monitor would be
> accessible at PHASE_MACHINE_INIT, where device_add works and
> cold-plugs the devices.

The earlier the monitor becomes available, the better.

Ideally, we'd process the command line strictly left to right, and fail
options that are "out of phase".  Make the monitor available right when
we process its -mon.  The -chardev for its character device must precede
it.

Likewise, we'd fail QMP commands that are "out of phase".
@allow-preconfig is a crutch that only exists because we're afraid (with
reason) of hidden assumptions in QMP commands.


