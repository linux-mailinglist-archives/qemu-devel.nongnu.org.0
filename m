Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08EB4C3750
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:02:34 +0100 (CET)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLFx-0008Bv-F9
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:02:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNLE4-0007ME-94; Thu, 24 Feb 2022 16:00:36 -0500
Received: from [2001:41c9:1:41f::167] (port=46278
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNLE1-0001Cq-Iz; Thu, 24 Feb 2022 16:00:35 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNLDL-0006TD-Uy; Thu, 24 Feb 2022 20:59:56 +0000
Message-ID: <7a64b078-a11e-0e5a-e7ae-104052442d88@ilande.co.uk>
Date: Thu, 24 Feb 2022 21:00:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220224185817.2207228-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 0/4] ppc: nested TCG migration (KVM-on-TCG)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2022 18:58, Fabiano Rosas wrote:

> This series implements the migration for a TCG pseries guest running a
> nested KVM guest. This is just like migrating a pseries TCG guest, but
> with some extra state to allow a nested guest to continue to run on
> the destination.
> 
> Unfortunately the regular TCG migration scenario (not nested) is not
> fully working so I cannot be entirely sure the nested migration is
> correct. I have included a couple of patches for the general migration
> case that (I think?) improve the situation a bit, but I'm still seeing
> hard lockups and other issues with more than 1 vcpu.
> 
> This is more of an early RFC to see if anyone spots something right
> away. I haven't made much progress in debugging the general TCG
> migration case so if anyone has any input there as well I'd appreciate
> it.
> 
> Thanks
> 
> Fabiano Rosas (4):
>    target/ppc: TCG: Migrate tb_offset and decr
>    spapr: TCG: Migrate spapr_cpu->prod
>    hw/ppc: Take nested guest into account when saving timebase
>    spapr: Add KVM-on-TCG migration support
> 
>   hw/ppc/ppc.c                    | 17 +++++++-
>   hw/ppc/spapr.c                  | 19 ++++++++
>   hw/ppc/spapr_cpu_core.c         | 77 +++++++++++++++++++++++++++++++++
>   include/hw/ppc/spapr_cpu_core.h |  2 +-
>   target/ppc/machine.c            | 61 ++++++++++++++++++++++++++
>   5 files changed, 174 insertions(+), 2 deletions(-)

FWIW I noticed there were some issues with migrating the decrementer on Mac machines 
a while ago which causes a hang on the destination with TCG (for MacOS on a x86 host 
in my case). Have a look at the following threads for reference:

https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg00546.html
https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg04622.html

IIRC there is code that assumes any migration in PPC is being done live, and so 
adjusts the timebase on the destination to reflect wall clock time by recalculating 
tb_offset. I haven't looked at the code for a while but I think the outcome was that 
there needs to be 2 phases in migration: the first is to migrate the timebase as-is 
for guests that are paused during migration, whilst the second is to notify 
hypervisor-aware guest OSs such as Linux to make the timebase adjustment if required 
if the guest is running.


ATB,

Mark.

