Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A6042C52C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 17:47:41 +0200 (CEST)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1magTk-00077o-Cf
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 11:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1magQx-0006Ax-RC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:44:47 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:43030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1magQv-0004aB-Kc
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 11:44:47 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A589945DB9;
 Wed, 13 Oct 2021 17:44:32 +0200 (CEST)
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
To: Markus Armbruster <armbru@redhat.com>
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
 <87r1eh4j0f.fsf@dusky.pond.sub.org> <87r1eguxgi.fsf@dusky.pond.sub.org>
 <91f2fb28-fd4d-f7ad-13d1-61c7ba16ae3c@proxmox.com>
 <87eea9wrcf.fsf@dusky.pond.sub.org> <871r67b0yr.fsf@dusky.pond.sub.org>
 <87v922bnk1.fsf@dusky.pond.sub.org>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <bc5f180d-3161-59c0-2ded-0808a150dec7@proxmox.com>
Date: Wed, 13 Oct 2021 17:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87v922bnk1.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 10/12/21 11:27 AM, Markus Armbruster wrote:
> Stefan, any thoughts on this?
> 

Sorry, I didn't get to work on implementing this. Idea 3 does seem very
reasonable, though I suppose the question is what all should go into the
per-session state, and also how it is passed down.

We did roll out my initial patch to our users in the meantime and got
some positive feedback (that specific error disappeared), however another
one (reported at the same time) still exists, so I was trying to diagnose
- it might also turn out to be monitor related and resolved by the more
thorough fix proposed here, but unsure.

> Markus Armbruster <armbru@redhat.com> writes:
> 
>> I've thought a bit more.
>>
>> A monitor can serve a series of clients.
>>
>> Back when all of the monitor ran in the main thread, we completely
>> finished serving the current client before we started serving the next
>> one (I think).  In other words, sessions did not overlap.
>>
>> Since we moved parts of the monitor to the monitor I/O thread (merge
>> commit 4bdc24fa018), sessions can overlap, and this causes issues, as
>> you demonstrated.
>>
>> Possible fixes:
>>
>> 1. Go back to "don't overlap" with suitable synchronization.
>>
>>     I'm afraid this won't cut it, because exec-oob would have wait in
>>     line behind reconnect.
>>
>>     It currently waits for other reasons, but that feels fixable.  Going
>>     back to "don't overlap" would make it unfixable.
>>
>> 2. Make the lingering session not affect / be affected by the new
>>     session's state
>>
>>     This is what your patch tries.  Every access of session state needs
>>     to be guarded like
>>
>>          if (conn_nr_before == qatomic_read(&mon->connection_nr)) {
>>              access session state
>>          } else {
>>              ???
>>          }
>>
>>     Issues:
>>
>>     * We have to find and guard all existing accesses.  That's work.
>>
>>     * We have to guard all future accesses.  More work, and easy to
>>       forget, which makes this fix rather brittle.
>>
>>     * The fix is spread over many places.
>>
>>     * We may run into cases where the ??? part gets complicated.
>>       Consider file descriptors.  The command in flight will have its
>>       monitor_get_fd() fail after disconnect.  Probably okay, because it
>>       can also fail for other reasons.  But we might run into cases where
>>       the ??? part creates new failure modes for us to handle.
>>
>> 3. Per-session state
>>
>>     Move per-session state from monitor state into a separate object.
>>
>>     Use reference counts to keep this object alive until both threads are
>>     done with the session.
>>
>>     Monitor I/O thread executes monitor core and the out-of-band
>>     commands; its stops using the old session on disconnect, and starts
>>     using the new session on connect.
>>
>>     Main thread executes in-band commands, and these use the session that
>>     submitted them.
>>
>>     Do I make sense, or should I explain my idea in more detail?
> 
> 


