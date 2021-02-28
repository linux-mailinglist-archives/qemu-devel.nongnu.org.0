Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6441E3271E7
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 11:45:07 +0100 (CET)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGJZR-0001IZ-Ro
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 05:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGJYR-0000pc-Em
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 05:44:03 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:22999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.lamprecht@proxmox.com>)
 id 1lGJYP-0001YT-3D
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 05:44:03 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3B87141CDE;
 Sun, 28 Feb 2021 11:43:57 +0100 (CET)
Message-ID: <e36b3025-d709-1a6c-6b5a-a08bc6de819f@proxmox.com>
Date: Sun, 28 Feb 2021 11:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Content-Language: en-US
To: vit9696 <vit9696@protonmail.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <1D984D1D-0DFB-49FC-BD7F-1AAF9B862A5D@protonmail.com>
From: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
In-Reply-To: <1D984D1D-0DFB-49FC-BD7F-1AAF9B862A5D@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=t.lamprecht@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Reiter <s.reiter@proxmox.com>,
 qemu devel list <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vitaly,

On 28.02.21 10:11, vit9696 wrote:
> For us this breaks the ability to control the boot options between the operating system and the OVMF. It happens because the operating system builds the DPs based on ACPI (in fact the only source available to it), while OVMF uses another source. The previous behaviour also violates the specification, so I do not believe there is room for reverting it. I believe it is also not possible to update QEMU to internally use the 1 UID, since it may conflict with the case when there are multiple PCI bus.

I think you may have misunderstood me a little bit, I did not ask for this to
be reverted in upstream QEMU, it's quite clear to me that this should be the
new default behaviour and should have been since ever.

Albeit, I must ask what makes macOS special to not be allowed doing things that
Windows and Linux guest can do just fine?

I mainly asked for other drawbacks of such a revert as it is currently the
straight forward stop gap solution for us as downstream. What we probably will
do, is keeping this as default to the new standard behavior and adding a switch
to revert to the old one - our QEMU integration library in Proxmox VE can then
set this for old VMs and use the new standard for new ones on VM start, that
way we keep backward compatible - as only Windows VMs seems to be affected we
can even do this only for those (we have a OS type config property from which
we can derive this).

>
> In my opinion, the most logical workaround is to provide in-guest steps to update VM configuration to account for this.

Often the Hypervisor admin and Guest admin are not the same, so this is only
a small band-aid and for most helping only after the fact.

We also have quite easy to setup clustering so this means that such affected
VMs will seemingly break on migration to an update node for lots of users - for
us an unacceptable situation to expose our users with and honestly, I have a
hard time seeing me and colleagues to wish spending our nerves to direct
hundreds of reports to the documented solution (some will certainly find it on
their own, but whatever one does, lots won't) and dealing with their,
relatable, fit they'll throw and me having to hold back telling them off to
just use Linux instead ;-)

And I think that other integrator will get some reports too, and FWICT there's
no outside way an user can use to revert to the old behavior.
Note that QEMU 5.2 is not yet released in some major distributions, e.g.,
Debian will ship it with Bullseye which release is still months away, latest
Fedora (33) is shipping QEMU 5.1, so RHEL/CentOS are probably using something
even older and Ubuntu will only add it in 21.04, also two months away.

Currently, QEMU 5.2 which introduces this change, is only released in some is
released in faster moving targets, where Windows VMs are more often for
non-server workloads (educated guess) which again correlates with higher
probability to use of DHCP and not static address assignment (again, educated
guess) - which is the most obvious and noticeable thing we and our users saw
break.

Which brings me again to my other point, there may be lots of other things
breaking in a more subtle way, we do not know but can tell there's lots of
device reshuffling going on when checking out the Windows Device Manager I
cannot immagine that the loss of network configuration is the only thing that
breaks is the only thing that breaks.

So why all this fuss and wall of text? Because I think that this will affect
lots of users, most of them in distros which will only ship the problematic
QEMU version later this year. How many affected there will be: no idea, but we
got quite some reports (compared to usual small stuff breakage) with only
rolling this QEMU version out *partially*, to only some parts of our user base.

That's why I personally think it may be worth to think about adding a switch to
QEMU directly to keep the backwards compatible, albeit standard incompatible
behavior either as opt-in or opt-out to new standard-conform behavior. And
while I thought opt-out is the way to go when starting out this message, I now
rather think opt-in to new is, at least if rustling bells of users with
Windows + static IPs is thought to be worth to avoid. As said, if there's quorum
against this, we can live fine with keeping that switch as downstream patch but
I'd like to avoid that and certainly won't just rush forward shipping it but
wait until next week, maybe there are some other opinions or better ideas.

cheers,
Thomas


