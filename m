Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8ED349283
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:58:57 +0100 (CET)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPZg-0006Dp-4n
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lPPYk-0005fG-P6; Thu, 25 Mar 2021 08:57:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48882
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lPPYi-0006YN-T0; Thu, 25 Mar 2021 08:57:58 -0400
Received: from host86-143-93-99.range86-143.btcentralplus.com ([86.143.93.99]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lPPYj-0001pP-CM; Thu, 25 Mar 2021 12:58:02 +0000
To: Peter Maydell <peter.maydell@linaro.org>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <72851037-b283-c4c1-fbeb-da86f0527627@ilande.co.uk>
 <CAFEAcA-8M7PKiM9tOXuVKMwMRF6Q02FbyQbU-P60wQqgcedrKg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <4be7c437-ddaa-849a-6c0b-5cce2d5b6fdb@ilande.co.uk>
Date: Thu, 25 Mar 2021 12:57:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-8M7PKiM9tOXuVKMwMRF6Q02FbyQbU-P60wQqgcedrKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.143.93.99
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Crashes with qemu-system-ppc64
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Cc: Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 22:57, Peter Maydell wrote:

> On Tue, 23 Mar 2021 at 21:21, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>> I'm not sure what the right solution is here. In my mind there hasn't really been any
>> difference between TYPE_DEVICE and TYPE_SYS_BUS_DEVICE other than the APIs that
>> expose the memory regions and IRQs are different, but clearly platform bus
>> expects/defines a different behaviour here.
>>
>> Probably the quickest solution for now would be to change the DBDMA device so that it
>> is derived from TYPE_DEVICE rather than TYPE_SYS_BUS_DEVICE and make the relevant
>> changes if everyone agrees?
> 
> You want to be at least cautious about doing that. TYPE_DEVICE objects
> don't get reset usually, because they are not part of the qbus hierarchy
> (all TYPE_SYS_BUS_DEVICE devices live on the sysbus and get reset when
> the sysbus is reset). So you would need the (currently nonexistent)
> reset function of the containing macio device to manually reset any
> TYPE_DEVICE children it has. (This is one of the areas where reset is
> a mess, incidentally: logically speaking if you have a PCI device then
> you want its children to all get reset when the PCI device itself is
> reset; as it stands that doesn't happen, because its sysbus children
> are on the sysbus, and a pci-bus-reset won't touch them.)
> 
> I forget how the platform bus stuff is supposed to work, but something
> should be arranging that it only happens for a pretty restrictive subset
> of devices -- in general it should certainly not be firing for random
> sysbus devices that are part of something else.
> 
> It's a pretty old commit (from 2018, one of Igor's), but I wonder if
> this was broken by commit a3fc8396352e945f9. The original design of
> the platform bus was that the "grab unassigned IRQs and MMIO regions"
> hook got run as a machine-init-done hook. That meant that by definition
> the board code had finished setting up all its sysbus devices, and
> anything still unconnected must be (assuming not a bug) something the
> user requested via -device to be put on the platform bus. But in
> commit a3fc8396352e945f9 we changed this to use the hotplug-handler
> callbacks, which happen when the device is realized. So it stopped
> being true that we would only find loose MMIOs and IRQs on the user's
> sysbus devices and now we're also incorrectly grabbing parts of
> devices that are supposed to be being wired up by QEMU code before
> that code has a chance to do that wiring.
> 
> There must still be something causing this not to happen literally for
> every sysbus device, or we'd have noticed a lot earlier. I'm not sure
> what's specifically different here, but I think it is that:
>   (1) we only create the platform bus itself as pretty much the
>       last thing we do in machine init. This (accidentally?)
>       means it doesn't get to see most of the sysbus devices in
>       the board itself
>   (2) macio-oldworld is a pluggable PCI device which happens to
>       use a sysbus device as part of its implementation, which
>       is probably not very common
> 
> I think the long term fix is that we either need to undo
> a3fc8396352e945f9 so that we only run after all other device
> creation code has run and the unassigned IRQs and MMIOs really
> are just the loose ends, or alternatively we need to make the
> hooks much more restrictive about identifying what devices are
> supposed to go into the platform bus.

Thanks for the analysis: I can certainly see how the above commit would have changed 
the behaviour. Looking at hw/ppc/e590plat.c in e500plat_machine_class_init() I see 
that line 101 reads "machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);" 
which looks like it is intended to add a class restriction to this functionality.

In machine_initfn() a callback for machine_init_notify() is added to perform the 
check but the macio-oldworld device is realized first, because qmp_x_exit_preconfig() 
calls qemu_create_cli_devices() to realize the devices just before 
qemu_machine_creation_done() where the notifier is invoked.

> Second note: does it actually make sense for a user to create
> a macio-oldworld device and plug it into anything? It's a PCI
> device, but is it really a generally usable device rather than
> a specific built-into-the-board part of the g3beige machine ?
> If it isn't actually useful for a user to create it on the command
> line with -device, we could sidestep the whole thing for 6.0 by
> marking it dc->user_creatable = false ...

I'd prefer not to do that if possible since the macio device is a good example to 
have as something that passes device-introspect-test whilst containing several 
different child devices.

Given that the DBDMA device hasn't changed for some time and the above commit dates 
back to 2018 then I'd be inclined to leave it for now unless it is causing gitlab CI 
to fail.


ATB,

Mark.

