Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E2C3584B4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:29:50 +0200 (CEST)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUjF-0007n0-LS
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lUUhY-0006Wy-Uu
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:28:05 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:50801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lUUhW-0005Dg-Lt
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:28:04 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3111A459F4;
 Thu,  8 Apr 2021 15:27:52 +0200 (CEST)
Message-ID: <1f326b87-b568-5aa5-011e-057e046c0717@proxmox.com>
Date: Thu, 8 Apr 2021 15:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210322154024.15011-1-s.reiter@proxmox.com>
 <YG2xUD5M7RCuIe+X@merkur.fritz.box> <87lf9tces9.fsf@dusky.pond.sub.org>
 <YG7akVvfY30Q7Cj1@merkur.fritz.box> <871rblaqm9.fsf@dusky.pond.sub.org>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH v2] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
In-Reply-To: <871rblaqm9.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu-devel@nongnu.org, Wolfgang Bumiller <w.bumiller@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.04.21 14:49, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
>> Am 08.04.2021 um 11:21 hat Markus Armbruster geschrieben:
>>> Should this go into 6.0?
>>
>> This is something that the responsible maintainer needs to decide.
> 
> Yes, and that's me.  I'm soliciting opinions.
> 
>> If it helps you with the decision, and if I understand correctly, it is
>> a regression from 5.1, but was already broken in 5.2.
> 
> It helps.
> 
> Even more helpful would be a risk assessment: what's the risk of
> applying this patch now vs. delaying it?

Stefan is on vacation this week, but I can share some information, maybe it
helps.

> 
> If I understand Stefan correctly, Proxmox observed VM hangs.  How
> frequent are these hangs?  Did they result in data corruption?


They were not highly frequent, but frequent enough to get roughly a bit over a
dozen of reports in our forum, which normally means something is off but its
limited to certain HW, storage-tech used or load patterns.

We had initially a hard time to reproduce this, but a user finally could send
us a backtrace of a hanging VM and with that information we could pin it enough
down and Stefan came up with a good reproducer (see v1 of this patch).

We didn't got any report of actual data corruption due to this, but the VM
hangs completely, so a user killing it may produce that theoretical; but only
for those program running in the guest that where not made power-loss safe
anyway...

> 
> How confident do we feel about the fix?
> 

Cannot comment from a technical POV, but can share the feedback we got with it.

Some context about reach:
We have rolled the fix out to all repository stages which had already a build of
5.2, that has a reach of about 100k to 300k installations, albeit we only have
some rough stats about the sites that accesses the repository daily, cannot really
tell who actually updated to the new versions, but there are some quite update-happy
people in the community, so with that in mind and my experience of the feedback
loop of rolling out updates, I'd figure a lower bound one can assume without going
out on a limb is ~25k.

Positive feedback from users:
We got some positive feedback from people which ran into this at least once per
week about the issue being fixed with that. In total almost a dozen user reported
improvements, a good chunk of those which reported the problem in the first place.

Mixed feedback:
We had one user which reported still getting QMP timeouts, but that their VMs did
not hang anymore (could be high load or the like). Only one user reported that it
did not help, still investigating there, they have quite high CPU pressure stats
and it actually may also be another issue, cannot tell for sure yet though.

Negative feedback:
We had no new users reporting of new/worse problems in that direction, at least
from what I'm aware off.

Note, we do not use OOB currently, so above does not speak for the OOB case at
all.


