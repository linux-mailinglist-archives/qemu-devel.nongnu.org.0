Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A8534CD72
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:59:04 +0200 (CEST)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQofn-0003bP-8w
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lQoec-00039B-6z
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:57:50 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:5062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1lQoeY-0008HO-Tc
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:57:48 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D4B8E458B0;
 Mon, 29 Mar 2021 11:49:07 +0200 (CEST)
Subject: Re: [PATCH] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
To: Markus Armbruster <armbru@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
References: <20210318133550.13120-1-s.reiter@proxmox.com>
 <20210322110847.cdo477ve2gydab64@wobu-vie.proxmox.com>
 <87lfaahsxm.fsf@dusky.pond.sub.org>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <26625cd5-7eab-46f6-a8af-14e7069e7dbb@proxmox.com>
Date: Mon, 29 Mar 2021 11:49:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87lfaahsxm.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 3:48 PM, Markus Armbruster wrote:
> Wolfgang Bumiller <w.bumiller@proxmox.com> writes:
> 
>> On Thu, Mar 18, 2021 at 02:35:50PM +0100, Stefan Reiter wrote:
>>> If OOB is disabled, events received in monitor_qmp_event will be handled
>>> in the main context. Thus, we must not acquire a qmp_queue_lock there,
>>> as the dispatcher coroutine holds one over a yield point, where it
>>> expects to be rescheduled from the main context. If a CHR_EVENT_CLOSED
>>> event is received just then, it can race and block the main thread by
>>> waiting on the queue lock.
>>>
>>> Run monitor_qmp_cleanup_queue_and_resume in a BH on the iohandler
>>> thread, so the main thread can always make progress during the
>>> reschedule.
>>>
>>> The delaying of the cleanup is safe, since the dispatcher always moves
>>> back to the iothread afterward, and thus the cleanup will happen before
>>> it gets to its next iteration.
>>>
>>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>>> ---
>>
>> This is a tough one. It *may* be fine, but I wonder if we can approach
>> this differently:
> 
> You guys make my head hurt.
> 

That makes three of us, I think.

> I understand we're talking about a bug.  Is it a recent regression, or
> an older bug?  How badly does the bug affect users?
> 

It's a regression introduced with the coroutinization of QMP in 5.2. It 
only occurs when OOB is disabled - in our downstream we have it disabled 
unconditionally, as it caused some issues in the past.

It affected quite a lot of our users, some when the host was under CPU 
load, some seemingly random. When it happened it usually hit multiple 
VMs at once, completely hanging them.

Just for reference, our forum has the full story:
https://forum.proxmox.com/threads/all-vms-locking-up-after-latest-pve-update.85397/

> I'm about to vanish for my Easter break...  If the bug must be fixed for
> 6.0, just waiting for me to come back seems unadvisable.
> 

Since it doesn't happen with OOB (so, by default), I don't think it's 
that urgent.

BTW, I've sent a v2 as well:
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07590.html

That one we have shipped to our users for now, with mostly good success, 
though a few reports that something still hangs - which could be people 
failing to upgrade, or some other issue still unsolved...

And happy easter break :)


