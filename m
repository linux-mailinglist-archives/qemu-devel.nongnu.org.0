Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9561345049F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 13:42:55 +0100 (CET)
Received: from localhost ([::1]:37544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmbK2-0001md-5f
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 07:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmbF2-0000R2-RL
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:37:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mmbEz-0002ZI-7Q
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:37:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636979859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LansR1gII2ghz1sm9gjZryPnD/BRb5dvAQj1Xjpf0SU=;
 b=BTJ5d4Mrwva1gwE1LS9ldkk4AGqbhZyRfBLMiK7M5D5FQVhBgveNwrlWCdjDM5VdC5bfcR
 m6SdcGwzRehk9/h95+j3Eh+omOQUGrW6anlT/FfHqhnUuOeUEf5IbdQt94RrqhEvWlYeFf
 AgnKlk7qv+dodqa3gf8HfjnWOcA9F4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-umAg8z6zPQuADiPtOgY5gA-1; Mon, 15 Nov 2021 07:37:37 -0500
X-MC-Unique: umAg8z6zPQuADiPtOgY5gA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F15015728
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:37:36 +0000 (UTC)
Received: from [10.39.195.133] (unknown [10.39.195.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA76D67840;
 Mon, 15 Nov 2021 12:37:34 +0000 (UTC)
Message-ID: <0fba39ee-4a1a-b388-82d3-4dc44cf3b9fb@redhat.com>
Date: Mon, 15 Nov 2021 13:37:33 +0100
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
 <e1411df1-696c-ceec-ef77-8cc4d538de70@redhat.com>
 <87wnlcsd9q.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87wnlcsd9q.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11/13/21 08:52, Markus Armbruster wrote:
> I'm not asking what to do "if it hurts", or "if you want a cold-plugged
> device".  I'm asking whether there's a reason for ever wanting hot plug
> instead of cold plug.  Or in other words, what can hot plug possibly
> gain us over cold plug?
> 
> As far as I know, the answer is "nothing but trouble".

Yes, I agree.

> If that's true, then what we should tell users is to stick to -device
> for initial configuration, and stay away from device_add.

Yes, which is one issue with stabilizing -preconfig.  It's not clear 
what exactly it is solving.

>>>> The boat for this has sailed.  The only sane way to do this is a new binary.
>>>
>>> "Ideally" still applies to any new binary.
>>
>> Well, "ideally" any new binary would only have a few command line
>> options, and ordering would be mostly irrelevant.  For example I'd
>> expect a QMP binary to only have a few options, mostly for
>> debugging/development (-L, -trace) and for process-wide settings (such
>> as -name).
> 
> This is where we disagree.  For me, a new, alternative qemu-system-FOO binary
> should be able to replace the warty one we have.
> 
> One important kind of user is management applications.  Libvirt
> developers tell us that they'd like to configure as much as possible via
> QMP.  Another kind of user dear to me is me^H^Hdevelopers.  For ad hoc
> testing, having to configure via QMP is a pain we'd rathe do without.  I
> don't want to remain stuck on the traditional binary, I want to do this
> with the new one.

Why do you care?  For another example, you can use "reboot" or 
"systemctl isolate reboot.target" and they end up doing the same thing.

As long as qemu_init invokes qmp_machine_set, qmp_accel_set, 
qmp_device_add, qmp_plugin_add, qmp_cont, etc. to do its job, the 
difference between qemu-system-* and qemu-qmp-* is a couple thousands 
lines of boring code that all but disappears once the VM is up and 
running.  IOW, with the right design (e.g. shortcut options for QOM 
properties good; dozens of global variables bad), there's absolutely no 
issue with some people using qemu-system-* and some using qemu-qmp-*.

>>>>> Likewise, we'd fail QMP commands that are "out of phase".
>>>>> @allow-preconfig is a crutch that only exists because we're afraid (with
>>>>> reason) of hidden assumptions in QMP commands.
>>>>
>>>> At this point, it's not even like that anymore (except for block devices
>>>> because my patches haven't been applied).
>>>
>>> My point is that we still have quite a few commands without
>>> 'allow-preconfig' mostly because we are afraid of allowing them in
>>> preconfig state, not because of true phase dependencies.
>>
>> I think there's very few of them, if any (outside the block layer for
>> which patches exist), and those are due to distraction more than fear.
> 
> qapi/*.json has 216 commands, of which 26 carry 'allow-preconfig'.

Well, 
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg01597.html 
alone would more than double that. :)

Places like machine.json, machine-target.json, migration.json, 
replay.json have a lot of commands that are, obviously, almost entirely 
not suitable for preconfig.  I don't think there are many commands left, 
I'd guess maybe 30 (meaning that ~60% are done).

Paolo


