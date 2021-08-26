Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D63F8AD8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:18:41 +0200 (CEST)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJH9M-0003zl-Is
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mJH6o-00027o-8K
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:16:02 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:42151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mJH6l-0001o4-15
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:16:01 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C10EC43C9C;
 Thu, 26 Aug 2021 17:15:47 +0200 (CEST)
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
To: Markus Armbruster <armbru@redhat.com>
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
 <87r1eh4j0f.fsf@dusky.pond.sub.org> <87r1eguxgi.fsf@dusky.pond.sub.org>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <91f2fb28-fd4d-f7ad-13d1-61c7ba16ae3c@proxmox.com>
Date: Thu, 26 Aug 2021 17:15:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87r1eguxgi.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 26/08/2021 15:50, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
> [...]
> 
>> Let me re-explain the bug in my own words, to make sure I understand.
>>
>> A QMP monitor normally runs in the monitor I/O thread.
>>
>> A QMP monitor can serve only one client at a time.
>>
>> It executes out-of-band commands right as it reads them.  In-band
>> commands are queued, and executed one after the other in the main loop.
>>
>> Command output is buffered.  We write it out as fast as the character
>> device can take it.  If a write fails, we throw away the entire buffer
>> contents.
>>
>> A client can disconnect at any time.  This throws away the queue.  An
>> in-band command may be executing in the main loop.  An out-of-band
>> command may be executing in the monitor's thread.
>>
>> Such commands (if any) are not affected by the disconnect.  Their output
>> gets buffered, but write out fails, so it's thrown away.
>>
>> *Except* when another client connects quickly enough.  Then we send it
>> output meant for the previous client.  This is wrong.  I suspect this
>> could even send invalid JSON.
>>

I'm not sure this is the case. In all testing I have *never* encountered 
the case of broken JS or any other indication that partial output was 
received.

I think the issue is just between starting to execute the command in the 
BH and the new client connecting... can the CHR_EVENTs even be triggered 
when the main thread is busy with the BH?

>> Special case: if in-band command qmp_capabilities is executing when the
>> client disconnects, and another client connects before the command flips
>> the monitor from capabilities negotiation mode to command mode, that
>> client starts in the wrong mode.
> 
> What the cases have in common: disconnect + connect in monitor I/O
> thread and the command executing in the main thread change the same
> monitor state.
> 
> You observed two issues: one involving the output buffer (new client
> receives old client's output), and one involving monitor mode (new
> client has its mode flipped by the old client's qmp_capabilities
> command).
> 
> Any monitor state accessed by commands could cause issues.  Right now, I
> can see only one more: file descriptors.  Cleaning them up on disconnect
> could mess with the command.

Right, that would make sense, but also only an issue if the reconnect 
can happen in the middle of the command itself.

Maybe we can acquire some kind of lock during actual in-band QMP command 
execution?

> 
> [...]
> 
> 


