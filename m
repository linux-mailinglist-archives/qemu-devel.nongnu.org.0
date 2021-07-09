Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC483C26F2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:36:50 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sYb-0001LD-WC
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1sXH-0008J2-KV; Fri, 09 Jul 2021 11:35:27 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:31387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m1sXC-0001OZ-Du; Fri, 09 Jul 2021 11:35:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8B7CA74570D;
 Fri,  9 Jul 2021 17:35:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 138547456E3; Fri,  9 Jul 2021 17:35:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 11F2A7456B4;
 Fri,  9 Jul 2021 17:35:18 +0200 (CEST)
Date: Fri, 9 Jul 2021 17:35:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v23] spapr: Fix implementation of Open Firmware
 client interface
In-Reply-To: <f8b149b7-366d-f5cd-7820-7e5ceab0157d@ozlabs.ru>
Message-ID: <42abd27b-d73-e61-bd77-5ced775b7ee3@eik.bme.hu>
References: <20210708065625.548396-1-aik@ozlabs.ru>
 <d18ddc97-2293-bd5e-f91d-2cc2cf1fcf89@eik.bme.hu>
 <83533520-a1b6-29b3-66ee-c770ee2ff80c@ozlabs.ru>
 <433d7bea-60be-2962-4974-ba74ea4fe84@eik.bme.hu>
 <f8b149b7-366d-f5cd-7820-7e5ceab0157d@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021, Alexey Kardashevskiy wrote:
> On 09/07/2021 23:28, BALATON Zoltan wrote:
>> On Fri, 9 Jul 2021, Alexey Kardashevskiy wrote:
>>> On 09/07/2021 08:34, BALATON Zoltan wrote:
>>>> MorphOS still boots but this breaks Linux which changes a few things in 
>>>> the device tree to fix it up to make it look the way it thinks is better.
>>> 
>>> 
>>> What are those things? What does the change break precisely? Does the 
>>> kernel stop booting?
>>> Can you please send output with the trace_vof_setprop tracepoint enabled?
>> 
>> It's fixing up some props that on Pegasos2 firmware are not how Linux 
>> expects them.
>
> Why does it need to fix them then? You are building the FDT in QEMU, built it 
> in the way Linux like and then you do not depend on the kernel fixing them 
> up. What do I miss?

The SmartFirmware used on the real hardware has some quirks that Linux 
handles by fixing up the device tree. The board firmware has the device 
tree the way I build it. I want to be compatible with how things work with 
actual board firmware (thus replacing the non-distributable firmware blob 
with VOF but still allowing using a ROM image if needed) not just get 
things work with VOF by whatever hacks needed to get Linux boot. Keeping 
compatibility with board firmware is useful so other guests can work too 
and avoid possible conflicts with different assumptions from different 
guests that may need different hacks if not using board ROM and also it's 
simpler to debug by just comparing with what the real firmware has. These 
fix ups are needed with the board firmware so they are also needed with 
VOF which emulates the board firmware now, at least to the point of simple 
CI and RTAS that's enough for some guests to boot (currently Linux and 
MorphOS which are the two guests that work well enough with current state 
of emulation anyway; AmigaOS needs some graphics driver or better Radeon 
emulation then it would need more stuff from VOF as it calls methods to 
access disk blocks which may be something you did in your further patches 
for GRUB so I can get back to it when you get to GRUB support but that's 
not urgent as there's no ouput without a graphics driver in AmigaOS so not 
really useful to fix VOF for it now).

> From traces I see that (besides PCI) it mostly sets props for 
> linux-initrd/bootargs which you rather need to handle to keep the machine's 
> properties and the FDT in sync.

How do I handle that and what do I need to keep in sync? The pegasos2 does 
not support -initrd option as initrd is embedded in kernel and -append is 
just passed through to bootags. I don't use these in QEMU at all so the 
guest can do whatever it wants with them.

Regards,
BALATON Zoltan

