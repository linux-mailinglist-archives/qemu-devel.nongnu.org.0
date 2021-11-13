Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2980544F216
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 08:54:53 +0100 (CET)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlnsB-0003ip-PN
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 02:54:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlnqM-0002Dt-Pn
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 02:52:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mlnqI-0004RA-UU
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 02:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636789973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dPeRYQX77dsN2wwaMHYGKJYtOKjpnPT17mH9IVuxslQ=;
 b=V2dYAHKwSUa76kebxHAbDSIZLFoirklelFjHx21BoTEESKXxupeJyY3JEclt8q3FTFF4fX
 qZhDpGStoXAmHDI1XQh5riaKkVHl33B8Nf8at61hntiAW+k4pv6o08YmDpukujKnrdvUwW
 l2bmN6rPvrgKQfV4niHW08lhof8cvzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-hSTuXD_JP9CIfoF32g_hFQ-1; Sat, 13 Nov 2021 02:52:52 -0500
X-MC-Unique: hSTuXD_JP9CIfoF32g_hFQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A8B487D542
 for <qemu-devel@nongnu.org>; Sat, 13 Nov 2021 07:52:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7EE71017CF2;
 Sat, 13 Nov 2021 07:52:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2D46311380A7; Sat, 13 Nov 2021 08:52:49 +0100 (CET)
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
 <87ee7lh9x2.fsf@dusky.pond.sub.org>
 <e1411df1-696c-ceec-ef77-8cc4d538de70@redhat.com>
Date: Sat, 13 Nov 2021 08:52:49 +0100
In-Reply-To: <e1411df1-696c-ceec-ef77-8cc4d538de70@redhat.com> (Paolo
 Bonzini's message of "Fri, 12 Nov 2021 23:18:58 +0100")
Message-ID: <87wnlcsd9q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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

> On 11/12/21 12:48, Markus Armbruster wrote:
>>> The monitor starts, the question is the availability of the event loop.
>> 
>> What does the event loop depend on?
>
> It depends on moving the relevant code out of qemu_init (at least 
> conditionally, as is the case for what is in qmp_x_exit_preconfig). 
> This in turn has the problem that it's ugly to have lingering unapplied 
> settings from the command line.
>
>>>>> 5) PHASE_MACHINE_READY - machine init done notifiers have been called
>>>>> and the VM is ready.  Devices plugged in this phase already count as
>>>>> hot-plugged.  -S starts the monitor here.
>> 
>> Why would anyone *want* to plug a device in PHASE_MACHINE_READY (when
>> the plug is hot) instead of earlier (when it's cold)?
>
> Well, PHASE_MACHINE_READY includes the whole time the guest is running. 
>   So the simplest thing to do is to tell the user "if it hurts, don't do 
> it".  If you want a cold-plugged device, plug it during 
> PHASE_MACHINE_INIT, which right now means on the command line.

One, we don't tell users anything of the sort as far as I can tell, and
two, I'm afraid you missed my question :)

I'm not asking what to do "if it hurts", or "if you want a cold-plugged
device".  I'm asking whether there's a reason for ever wanting hot plug
instead of cold plug.  Or in other words, what can hot plug possibly
gain us over cold plug?

As far as I know, the answer is "nothing but trouble".

If that's true, then what we should tell users is to stick to -device
for initial configuration, and stay away from device_add.

Such advice would rain on the "configure everything with QMP" parade.
No big deal, we already know that parade needs plenty of work before it
can hit main street, and having to provide a way to cold plug with QMP
is merely yet another sub-task.

>>>> Related question: when exactly in these phases do we create devices
>>>> specified with -device?
>>>
>>> In PHASE_MACHINE_INIT---that is, after the machine has been initialized
>>> and before machine-done-notifiers have been called.
>> 
>> In other words, you should never use device_add where -device would do,
>> because the latter gives you cold plug (which is simple and reliable),
>> and the former hot plug (which is the opposite).
>
> Exactly.
>
>>> No, because the monitor goes directly from a point where device_add 
>>> fails (PHASE_ACCEL_CREATED) to a point where devices are hotplugged 
>>> (PHASE_MACHINE_READY).
>> 
>> Bummer.
>
> True, but consider that these "phases" were reconstructed ex post.  It's 
> not like x-exit-preconfig was designed to skip PHASE_MACHINE_INIT; it's 
> just that preconfig used to call qemu_main_loop() at the point which is 
> now known as PHASE_ACCEL_CREATED.

Understand.  I'm just trying to map the terrain so we can hopefully get
from here to a better place.


[...]

>>>> The earlier the monitor becomes available, the better.
>>>> Ideally, we'd process the command line strictly left to right, and fail
>>>> options that are "out of phase".  Make the monitor available right when
>>>> we process its -mon.  The -chardev for its character device must precede
>>>> it.
>>>
>>> The boat for this has sailed.  The only sane way to do this is a new binary.
>> 
>> "Ideally" still applies to any new binary.
>
> Well, "ideally" any new binary would only have a few command line 
> options, and ordering would be mostly irrelevant.  For example I'd 
> expect a QMP binary to only have a few options, mostly for 
> debugging/development (-L, -trace) and for process-wide settings (such 
> as -name).

This is where we disagree.

For me, a new, alternative qemu-system-FOO binary should be able to
replace the warty one we have.

One important kind of user is management applications.  Libvirt
developers tell us that they'd like to configure as much as possible via
QMP.

Another kind of user dear to me is me^H^Hdevelopers.  For ad hoc
testing, having to configure via QMP is a pain we'd rathe do without.  A
combination of configuration file(s), CLI and HMP is much quicker.  I
don't want to remain stuck on the traditional binary, I want to do this
with the new one.

Catering to this kind of users should not be hard.  All it takes is a
sensiblly designed startup.  Rough sketch without much thought:

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

>>>> Likewise, we'd fail QMP commands that are "out of phase".
>>>> @allow-preconfig is a crutch that only exists because we're afraid (with
>>>> reason) of hidden assumptions in QMP commands.
>>>
>>> At this point, it's not even like that anymore (except for block devices
>>> because my patches haven't been applied).
>>
>> My point is that we still have quite a few commands without
>> 'allow-preconfig' mostly because we are afraid of allowing them in
>> preconfig state, not because of true phase dependencies.
>
> I think there's very few of them, if any (outside the block layer for 
> which patches exist), and those are due to distraction more than fear.

qapi/*.json has 216 commands, of which 26 carry 'allow-preconfig'.


