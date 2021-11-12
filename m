Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CED44EF28
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 23:20:14 +0100 (CET)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mleu4-0007Oe-H1
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 17:20:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlet3-0006jr-RW
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 17:19:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mlesz-0002Ag-UG
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 17:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636755544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tA9lIqv0wdw9OVWtlVhPintn2dx7XT4bxPi0Ho0aU5k=;
 b=Xm4o6T26gwMkDzxJ2U+XtJHQEU0OK6BgFPHdI3Rae7uXrhCgvl8LSZiFXjWRNpQ4ErzM3R
 GBkQqGPMTu+QP5aovwae8kqx7JJzCVED+wjmoGEMwqalY0oyc1kmpmFB0GpWZCGsQ8SrMI
 o8XgBXJKDm5OV7pE2ObPCfaIJSZBZPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-IuG0TRYEM5KjQlfViZFzFw-1; Fri, 12 Nov 2021 17:19:02 -0500
X-MC-Unique: IuG0TRYEM5KjQlfViZFzFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D8EB9F92A
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 22:19:02 +0000 (UTC)
Received: from [10.39.192.6] (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54AB719C59;
 Fri, 12 Nov 2021 22:19:00 +0000 (UTC)
Message-ID: <e1411df1-696c-ceec-ef77-8cc4d538de70@redhat.com>
Date: Fri, 12 Nov 2021 23:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] qmp: Stabilize preconfig
To: Markus Armbruster <armbru@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
 <c4ac9bcc-90ae-302f-d5d4-b95f1419a7a0@redhat.com>
 <87pmr7rzls.fsf@dusky.pond.sub.org>
 <bc437ccb-0487-a5ff-8e6a-50067715c4d4@redhat.com>
 <87mtman4h1.fsf@dusky.pond.sub.org>
 <13efddef-cc30-9a6a-a700-060d6fca57e3@redhat.com>
 <87ee7lh9x2.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ee7lh9x2.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 12:48, Markus Armbruster wrote:
>> The monitor starts, the question is the availability of the event loop.
> 
> What does the event loop depend on?

It depends on moving the relevant code out of qemu_init (at least 
conditionally, as is the case for what is in qmp_x_exit_preconfig). 
This in turn has the problem that it's ugly to have lingering unapplied 
settings from the command line.

>>>> 5) PHASE_MACHINE_READY - machine init done notifiers have been called
>>>> and the VM is ready.  Devices plugged in this phase already count as
>>>> hot-plugged.  -S starts the monitor here.
> 
> Why would anyone *want* to plug a device in PHASE_MACHINE_READY (when
> the plug is hot) instead of earlier (when it's cold)?

Well, PHASE_MACHINE_READY includes the whole time the guest is running. 
  So the simplest thing to do is to tell the user "if it hurts, don't do 
it".  If you want a cold-plugged device, plug it during 
PHASE_MACHINE_INIT, which right now means on the command line.

>>> Related question: when exactly in these phases do we create devices
>>> specified with -device?
>>
>> In PHASE_MACHINE_INIT---that is, after the machine has been initialized
>> and before machine-done-notifiers have been called.
> 
> In other words, you should never use device_add where -device would do,
> because the latter gives you cold plug (which is simple and reliable),
> and the former hot plug (which is the opposite).

Exactly.

>> No, because the monitor goes directly from a point where device_add 
>> fails (PHASE_ACCEL_CREATED) to a point where devices are hotplugged 
>> (PHASE_MACHINE_READY).
> 
> Bummer.

True, but consider that these "phases" were reconstructed ex post.  It's 
not like x-exit-preconfig was designed to skip PHASE_MACHINE_INIT; it's 
just that preconfig used to call qemu_main_loop() at the point which is 
now known as PHASE_ACCEL_CREATED.

>>>> With a pure-QMP configuration flow, PHASE_MACHINE_CREATED would be
>>>> reached with a machine-set command (corresponding to the
>>>> non-deprecated parts of -machine) and PHASE_ACCEL_CREATED would be
>>>> reached with an accel-set command (corresponding to -accel).
>>>
>>> I don't think this depends on "pure-QMP configuration flow".  -machine
>>> and -accel could advance the phase just like their buddies machine-set
>>> and accel-set.
>>
>> They already do (see qemu_init's calls to phase_advance).
>>
>>> State transition diagram:
>>>
>>>       PHASE_NO_MACHINE (initial state)
>>>               |  -machine or machine-set
>>>       PHASE_MACHINE_CREATED
>>>               |  -accel or accel-set
>>>       PHASE_ACCEL_CREATED
>>>               |
>>
>> qmp_x_exit_preconfig() -> qemu_init_board() -> machine_run_board_init()
> 
> I read this as "the state transition happens in
> machine_run_board_init(), called from qmp_x_exit_preconfig() via
> qemu_init_board()".

Exactly.  And in turn qmp_x_exit_preconfig() is reached from either the 
monitor (with -preconfig) or qemu_init (without -preconfig).

>>>       PHASE_MACHINE_INIT
>>>               |
>>
>> qmp_x_exit_preconfig() -> qemu_machine_creation_done() ->
>> qdev_machine_creation_done()
> 
> I read this as "the state transition happens in
> qdev_machine_creation_done(), called from qmp_x_exit_preconfig() via
> qemu_machine_creation_done()".

Right again.  In both cases, just grep for calls of "phase_advance".

>>> The earlier the monitor becomes available, the better.
>>> Ideally, we'd process the command line strictly left to right, and fail
>>> options that are "out of phase".  Make the monitor available right when
>>> we process its -mon.  The -chardev for its character device must precede
>>> it.
>>
>> The boat for this has sailed.  The only sane way to do this is a new binary.
> 
> "Ideally" still applies to any new binary.

Well, "ideally" any new binary would only have a few command line 
options, and ordering would be mostly irrelevant.  For example I'd 
expect a QMP binary to only have a few options, mostly for 
debugging/development (-L, -trace) and for process-wide settings (such 
as -name).

>>> Likewise, we'd fail QMP commands that are "out of phase".
>>> @allow-preconfig is a crutch that only exists because we're afraid (with
>>> reason) of hidden assumptions in QMP commands.
>>
>> At this point, it's not even like that anymore (except for block devices
>> because my patches haven't been applied).
>
> My point is that we still have quite a few commands without
> 'allow-preconfig' mostly because we are afraid of allowing them in
> preconfig state, not because of true phase dependencies.

I think there's very few of them, if any (outside the block layer for 
which patches exist), and those are due to distraction more than fear.

Paolo


