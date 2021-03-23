Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B6346AF5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:21:30 +0100 (CET)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoSv-0005mF-8X
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lOoR2-0004ZF-HW; Tue, 23 Mar 2021 17:19:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46102
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lOoQz-0002w6-N3; Tue, 23 Mar 2021 17:19:32 -0400
Received: from host86-143-93-99.range86-143.btcentralplus.com ([86.143.93.99]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lOoR1-0002fG-Lh; Tue, 23 Mar 2021 21:19:32 +0000
To: Thomas Huth <thuth@redhat.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <72851037-b283-c4c1-fbeb-da86f0527627@ilande.co.uk>
Date: Tue, 23 Mar 2021 21:19:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 16:48, Thomas Huth wrote:

(adding Markus on CC for comment)

> In case anyone is interested in fixing those, there are two regressions with 
> qemu-system-ppc64 in the current master branch:
> 
> $ ./qemu-system-ppc64 -M ppce500 -device macio-oldworld
> qemu-system-ppc64: ../../devel/qemu/softmmu/memory.c:2443: 
> memory_region_add_subregion_common: Assertion `!subregion->container' failed.

Well this is an odd one. The basic backtrace looks like this:

(gdb) bt
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007ffff5bf9535 in __GI_abort () at abort.c:79
#2  0x00007ffff5bf940f in __assert_fail_base (fmt=0x7ffff5d5bee0 "%s%s%s:%u: 
%s%sAssertion `%s' failed.\n%n", assertion=0x55555617aaf7 "!subregion->container", 
file=0x55555617a7bb "../softmmu/memory.c", line=2443,
     function=<optimized out>) at assert.c:92
#3  0x00007ffff5c07102 in __GI___assert_fail (assertion=0x55555617aaf7 
"!subregion->container", file=0x55555617a7bb "../softmmu/memory.c", line=2443,
     function=0x55555617b0e0 <__PRETTY_FUNCTION__.33121> 
"memory_region_add_subregion_common") at assert.c:101
#4  0x0000555555cd69f1 in memory_region_add_subregion_common (mr=0x55555728a910, 
offset=32768, subregion=0x55555728c2d0) at ../softmmu/memory.c:2443
#5  0x0000555555cd6a51 in memory_region_add_subregion (mr=0x55555728a910, 
offset=32768, subregion=0x55555728c2d0) at ../softmmu/memory.c:2454
#6  0x0000555555a8f83c in macio_common_realize (d=0x555557289f90, 
errp=0x7fffffffe3c0) at ../hw/misc/macio/macio.c:106
#7  0x0000555555a8fadb in macio_oldworld_realize (d=0x555557289f90, 
errp=0x7fffffffe428) at ../hw/misc/macio/macio.c:147
#8  0x0000555555b605bb in pci_qdev_realize (qdev=0x555557289f90, errp=0x7fffffffe4a0) 
at ../hw/pci/pci.c:2114
#9  0x0000555555f1b95f in device_set_realized (obj=0x555557289f90, value=true, 
errp=0x7fffffffe5a8) at ../hw/core/qdev.c:761
#10 0x0000555555e14457 in property_set_bool (obj=0x555557289f90, v=0x5555572f1890, 
name=0x5555561f6af9 "realized", opaque=0x555556a1fce0, errp=0x7fffffffe5a8) at 
../qom/object.c:2257
#11 0x0000555555e12562 in object_property_set (obj=0x555557289f90, 
name=0x5555561f6af9 "realized", v=0x5555572f1890, errp=0x555556920e78 <error_fatal>) 
at ../qom/object.c:1402
#12 0x0000555555e0f0dc in object_property_set_qobject (obj=0x555557289f90, 
name=0x5555561f6af9 "realized", value=0x5555572f16e0, errp=0x555556920e78 
<error_fatal>) at ../qom/qom-qobject.c:28
#13 0x0000555555e128c6 in object_property_set_bool (obj=0x555557289f90, 
name=0x5555561f6af9 "realized", value=true, errp=0x555556920e78 <error_fatal>) at 
../qom/object.c:1472
#14 0x0000555555f1a9e4 in qdev_realize (dev=0x555557289f90, bus=0x5555570046a0, 
errp=0x555556920e78 <error_fatal>) at ../hw/core/qdev.c:389
#15 0x0000555555b6717a in qdev_device_add (opts=0x555556995650, errp=0x555556920e78 
<error_fatal>) at ../softmmu/qdev-monitor.c:665
#16 0x0000555555d93b21 in device_init_func (opaque=0x0, opts=0x555556995650, 
errp=0x555556920e78 <error_fatal>) at ../softmmu/vl.c:1211
#17 0x000055555602d49d in qemu_opts_foreach (list=0x555556826c60 <qemu_device_opts>, 
func=0x555555d93afa <device_init_func>, opaque=0x0, errp=0x555556920e78 
<error_fatal>) at ../util/qemu-option.c:1167
#18 0x0000555555d96cac in qemu_create_cli_devices () at ../softmmu/vl.c:2541
#19 0x0000555555d96dd0 in qmp_x_exit_preconfig (errp=0x555556920e78 <error_fatal>) at 
../softmmu/vl.c:2589
#20 0x0000555555d9945e in qemu_init (argc=5, argv=0x7fffffffea28, 
envp=0x7fffffffea58) at ../softmmu/vl.c:3611
#21 0x000055555586b34d in main (argc=5, argv=0x7fffffffea28, envp=0x7fffffffea58) at 
../softmmu/main.c:49
(gdb)

But how can the assert() fire given that the DBDMA memory region hasn't been attached 
to anything yet? The answer appears to be because of some magic in the platform bus 
used by the e500 machine. Poking around you can see what is happening by placing a 
breakpoint on e500plat_machine_device_plug_cb():

(gdb) bt
#0  e500plat_machine_device_plug_cb (hotplug_dev=0x555556a1ea00, dev=0x55555728bcf0, 
errp=0x7fffffffe170) at ../hw/ppc/e500plat.c:48
#1  0x0000555555f171ac in hotplug_handler_plug (plug_handler=0x555556a1ea00, 
plugged_dev=0x55555728bcf0, errp=0x7fffffffe170) at ../hw/core/hotplug.c:34
#2  0x0000555555f1bb5f in device_set_realized (obj=0x55555728bcf0, value=true, 
errp=0x7fffffffe278) at ../hw/core/qdev.c:818
#3  0x0000555555e14457 in property_set_bool (obj=0x55555728bcf0, v=0x5555572f2600, 
name=0x5555561f6af9 "realized", opaque=0x555556a1fce0, errp=0x7fffffffe278) at 
../qom/object.c:2257
#4  0x0000555555e12562 in object_property_set (obj=0x55555728bcf0, 
name=0x5555561f6af9 "realized", v=0x5555572f2600, errp=0x7fffffffe3c0) at 
../qom/object.c:1402
#5  0x0000555555e0f0dc in object_property_set_qobject (obj=0x55555728bcf0, 
name=0x5555561f6af9 "realized", value=0x5555572f1f10, errp=0x7fffffffe3c0) at 
../qom/qom-qobject.c:28
#6  0x0000555555e128c6 in object_property_set_bool (obj=0x55555728bcf0, 
name=0x5555561f6af9 "realized", value=true, errp=0x7fffffffe3c0) at ../qom/object.c:1472
#7  0x0000555555f1a9e4 in qdev_realize (dev=0x55555728bcf0, bus=0x55555728a5d0, 
errp=0x7fffffffe3c0) at ../hw/core/qdev.c:389
#8  0x0000555555a8f7f0 in macio_common_realize (d=0x555557289cd0, 
errp=0x7fffffffe3c0) at ../hw/misc/macio/macio.c:102
#9  0x0000555555a8fadb in macio_oldworld_realize (d=0x555557289cd0, 
errp=0x7fffffffe428) at ../hw/misc/macio/macio.c:147
#10 0x0000555555b605bb in pci_qdev_realize (qdev=0x555557289cd0, errp=0x7fffffffe4a0) 
at ../hw/pci/pci.c:2114
#11 0x0000555555f1b95f in device_set_realized (obj=0x555557289cd0, value=true, 
errp=0x7fffffffe5a8) at ../hw/core/qdev.c:761
#12 0x0000555555e14457 in property_set_bool (obj=0x555557289cd0, v=0x5555572f1260, 
name=0x5555561f6af9 "realized", opaque=0x555556a1fce0, errp=0x7fffffffe5a8) at 
../qom/object.c:2257
#13 0x0000555555e12562 in object_property_set (obj=0x555557289cd0, 
name=0x5555561f6af9 "realized", v=0x5555572f1260, errp=0x555556920e78 <error_fatal>) 
at ../qom/object.c:1402
#14 0x0000555555e0f0dc in object_property_set_qobject (obj=0x555557289cd0, 
name=0x5555561f6af9 "realized", value=0x5555572f10b0, errp=0x555556920e78 
<error_fatal>) at ../qom/qom-qobject.c:28
#15 0x0000555555e128c6 in object_property_set_bool (obj=0x555557289cd0, 
name=0x5555561f6af9 "realized", value=true, errp=0x555556920e78 <error_fatal>) at 
../qom/object.c:1472
#16 0x0000555555f1a9e4 in qdev_realize (dev=0x555557289cd0, bus=0x555557004300, 
errp=0x555556920e78 <error_fatal>) at ../hw/core/qdev.c:389
#17 0x0000555555b6717a in qdev_device_add (opts=0x555556995650, errp=0x555556920e78 
<error_fatal>) at ../softmmu/qdev-monitor.c:665
#18 0x0000555555d93b21 in device_init_func (opaque=0x0, opts=0x555556995650, 
errp=0x555556920e78 <error_fatal>) at ../softmmu/vl.c:1211
#19 0x000055555602d49d in qemu_opts_foreach (list=0x555556826c60 <qemu_device_opts>, 
func=0x555555d93afa <device_init_func>, opaque=0x0, errp=0x555556920e78 
<error_fatal>) at ../util/qemu-option.c:1167
#20 0x0000555555d96cac in qemu_create_cli_devices () at ../softmmu/vl.c:2541
#21 0x0000555555d96dd0 in qmp_x_exit_preconfig (errp=0x555556920e78 <error_fatal>) at 
../softmmu/vl.c:2589
#22 0x0000555555d9945e in qemu_init (argc=5, argv=0x7fffffffea28, 
envp=0x7fffffffea58) at ../softmmu/vl.c:3611
#23 0x000055555586b34d in main (argc=5, argv=0x7fffffffea28, envp=0x7fffffffea58) at 
../softmmu/main.c:49

It seems that realizing the DBDMA device calls e500plat_machine_device_plug_cb() and 
since this is a DBDMA device it proceeds to call platform_bus_link_device() in 
hw/core/platform-bus.c like this:

         if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
             platform_bus_link_device(pms->pbus_dev, SYS_BUS_DEVICE(dev));
         }

which does:

/*
  * Look for unassigned IRQ lines as well as unassociated MMIO regions.
  * Connect them to the platform bus if available.
  */
void platform_bus_link_device(PlatformBusDevice *pbus, SysBusDevice *sbdev)
{
     int i;

     for (i = 0; sysbus_has_irq(sbdev, i); i++) {
         platform_bus_map_irq(pbus, sbdev, i);
     }

     for (i = 0; sysbus_has_mmio(sbdev, i); i++) {
         platform_bus_map_mmio(pbus, sbdev, i);
     }
}

Hmmm. So basically any sysbus device, even if it is part of another device has its 
MMIO memory regions automatically mapped to a free memory area within the platform 
bus on realize. And of course DBDMA has a parent class of TYPE_SYS_BUS_DEVICE...

I'm not sure what the right solution is here. In my mind there hasn't really been any 
difference between TYPE_DEVICE and TYPE_SYS_BUS_DEVICE other than the APIs that 
expose the memory regions and IRQs are different, but clearly platform bus 
expects/defines a different behaviour here.

Probably the quickest solution for now would be to change the DBDMA device so that it 
is derived from TYPE_DEVICE rather than TYPE_SYS_BUS_DEVICE and make the relevant 
changes if everyone agrees?


ATB,

Mark.

