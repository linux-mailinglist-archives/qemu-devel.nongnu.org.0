Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54CA3FCB03
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 17:46:50 +0200 (CEST)
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL5yL-00085y-Cm
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 11:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL5x7-0007Gs-VL
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL5x3-00005O-3L
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 11:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630424728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qoO96Sj7HwdtWRkZN5ODShrfAcnpII/gf3O1lCMSKv4=;
 b=PTnBY0XtfA/CqR8LpWoFfMovk5Rao1pvNlPCOiwcKpK12xryyjDnJ4Xz4XhqdTEFTQX5cI
 NsmvyNglTf0iuvBw8GlyMqUf+PFLOHYTn9XyKQ2Ysc5STt25Jw8Se5aTMCkqbeQ8WFv6pU
 94K6B3pt5dvGLO97pXwTr3FXAFU/yKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-VE88_qhANlO_iBjGYLLpHw-1; Tue, 31 Aug 2021 11:45:26 -0400
X-MC-Unique: VE88_qhANlO_iBjGYLLpHw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B780100806F;
 Tue, 31 Aug 2021 15:45:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B000218649;
 Tue, 31 Aug 2021 15:45:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3DD9311380A9; Tue, 31 Aug 2021 17:45:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
 <87r1eh4j0f.fsf@dusky.pond.sub.org>
 <87r1eguxgi.fsf@dusky.pond.sub.org>
 <91f2fb28-fd4d-f7ad-13d1-61c7ba16ae3c@proxmox.com>
Date: Tue, 31 Aug 2021 17:45:20 +0200
In-Reply-To: <91f2fb28-fd4d-f7ad-13d1-61c7ba16ae3c@proxmox.com> (Stefan
 Reiter's message of "Thu, 26 Aug 2021 17:15:43 +0200")
Message-ID: <87eea9wrcf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> On 26/08/2021 15:50, Markus Armbruster wrote:
>> Markus Armbruster <armbru@redhat.com> writes:
>> [...]
>> 
>>> Let me re-explain the bug in my own words, to make sure I understand.
>>>
>>> A QMP monitor normally runs in the monitor I/O thread.
>>>
>>> A QMP monitor can serve only one client at a time.
>>>
>>> It executes out-of-band commands right as it reads them.  In-band
>>> commands are queued, and executed one after the other in the main loop.
>>>
>>> Command output is buffered.  We write it out as fast as the character
>>> device can take it.  If a write fails, we throw away the entire buffer
>>> contents.
>>>
>>> A client can disconnect at any time.  This throws away the queue.  An
>>> in-band command may be executing in the main loop.  An out-of-band
>>> command may be executing in the monitor's thread.
>>>
>>> Such commands (if any) are not affected by the disconnect.  Their output
>>> gets buffered, but write out fails, so it's thrown away.
>>>
>>> *Except* when another client connects quickly enough.  Then we send it
>>> output meant for the previous client.  This is wrong.  I suspect this
>>> could even send invalid JSON.
>>>
>
> I'm not sure this is the case. In all testing I have *never*
> encountered the case of broken JS or any other indication that partial
> output was received.

We buffer monitor output without bounds, and try to write it out as
quickly as the client will take it.  I think short writes are possible
when the client is slow to read.  Such short writes can write partial
JSON expressions; the operating system doesn't know or care.  If the
client disconnects right then, the buffer starts with the remainder of
the JSON expression.  If the buffer is sent to the next client...

> I think the issue is just between starting to execute the command in
> the BH and the new client connecting... can the CHR_EVENTs even be
> triggered when the main thread is busy with the BH?

Good question.  We better find out.

>>> Special case: if in-band command qmp_capabilities is executing when the
>>> client disconnects, and another client connects before the command flips
>>> the monitor from capabilities negotiation mode to command mode, that
>>> client starts in the wrong mode.
>>
>> What the cases have in common: disconnect + connect in monitor I/O
>> thread and the command executing in the main thread change the same
>> monitor state.
>>
>> You observed two issues: one involving the output buffer (new client
>> receives old client's output), and one involving monitor mode (new
>> client has its mode flipped by the old client's qmp_capabilities
>> command).
>>
>> Any monitor state accessed by commands could cause issues.  Right now, I
>> can see only one more: file descriptors.  Cleaning them up on disconnect
>> could mess with the command.
>
> Right, that would make sense, but also only an issue if the reconnect
> can happen in the middle of the command itself.
>
> Maybe we can acquire some kind of lock during actual in-band QMP
> command execution?

Yes, the root cause is insufficient synchronization between in-band
command running in the main loop and disconnect / connect running in the
monitor I/O thread, and synchronizing them properly feels like the best
chance for a complete and reliable fix.

Before the OOB work, everything was in the main thread.  I figure the
misbehavior you found was not possible then.

Synchronization so that disconnect is delayed until after the in-band
command in flight completes should get us back to that state.  But I'm
afraid it could regress the OOB feature.

The point of OOB commands is "exec-oob executes right away no matter
what".  To make that possible OOB-capable commands are severely
restricted in what they can do, and the client needs to limit the number
of commands in flight.

"Right away" should be possible even when the client has to connect
first.  I'm not sure that's actually the case now.  Delaying until after
in-band completes would definitely kill it, though.

I'm afraid the synchronization needs to be more involved.

>> [...]


