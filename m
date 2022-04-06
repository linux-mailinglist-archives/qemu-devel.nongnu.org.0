Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACE04F5695
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 08:46:50 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbzRJ-0002QQ-Pa
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 02:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nbzJj-0000bn-4a
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 02:38:59 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:2903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nbzJg-00058E-SC
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 02:38:58 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 8C044459FE;
 Wed,  6 Apr 2022 08:38:46 +0200 (CEST)
Message-ID: <bce2cdb4-f0fb-7304-3f7a-64939486b7c9@proxmox.com>
Date: Wed, 6 Apr 2022 08:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] acpi: Bodge acpi_index migration
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com
References: <20220405190658.65187-1-dgilbert@redhat.com>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <20220405190658.65187-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, leobras@redhat.com,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, peterx@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.04.22 um 21:06 schrieb Dr. David Alan Gilbert (git):
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The 'acpi_index' field is a statically configured field, which for
> some reason is migrated; this never makes much sense because it's
> command line static.
> 
> However, on piix4 it's conditional, and the condition/test function
> ends up having the wrong pointer passed to it (it gets a PIIX4PMState
> not the AcpiPciHpState it was expecting, because VMSTATE_PCI_HOTPLUG
> is a macro and not another struct).  This means the field is randomly
> loaded/saved based on a random pointer.  In 6.x this random pointer
> randomly seems to get 0 for everyone (!); in 7.0rc it's getting junk
> and trying to load a field that the source didn't send.  The migration
> stream gets out of line and hits the section footer.
> 
> The bodge is on piix4 never to load the field:
>   a) Most 6.x builds never send it, so most of the time the migration
>     will work.
>   b) We can backport this fix to 6.x to remove the boobytrap.
>   c) It should never have made a difference anyway since the acpi-index
>     is command line configured and should be correct on the destination
>     anyway
>   d) ich9 is still sending/receiving this (unconditionally all the time)
>     but due to (c) should never notice.  We could follow up to make it
>     skip.
> 
> It worries me just when (a) actually happens.
> 
> Fixes: b32bd76 ("pci: introduce acpi-index property for PCI device")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/932
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/acpi/acpi-pci-hotplug-stub.c |  4 ----
>  hw/acpi/pcihp.c                 |  6 ------
>  hw/acpi/piix4.c                 | 11 ++++++++++-
>  include/hw/acpi/pcihp.h         |  2 --
>  4 files changed, 10 insertions(+), 13 deletions(-)
> 

Fixes the issue for me, thanks!

Tested-by: Fabian Ebner <f.ebner@proxmox.com>


