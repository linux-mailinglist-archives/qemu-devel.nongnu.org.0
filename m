Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435084C0F3C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 10:31:02 +0100 (CET)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnzA-0003Tc-GQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 04:31:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncc-0001U2-UO
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:48 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMncR-0001zM-Cu
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:07:42 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 27ABE20770;
 Wed, 23 Feb 2022 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645607236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s0EgAzFADplKXOibWEJJLjDUxGwi9XYHAXoq8mED4kA=;
 b=UC3wzKPiAzMnAEI+1BH3xK4li4Y6QXeH3zg680ftsTx+9gLITj6EU4zsHm8BE9GkR63YNO
 Zv3XOcFDcfEnv+yiabsaJ+9HY1w/YAUpFMfEyXG+2Ey+WbWnAqokS/a6dR2nvkGKhip1bL
 zAaI//x9Tvv8ercNUY2qrTu9g2HWHoo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	edgari@xilinx.com
Subject: [PATCH v4 00/14] Initial support for machine creation via QMP
Date: Wed, 23 Feb 2022 10:06:52 +0100
Message-Id: <20220223090706.4888-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series adds initial support to build a machine using QMP/QAPI
commands. With this series, one can start from the 'none' machine,
create cpus, sysbus devices, memory map them and wire interrupts.

Sorry for the huge cc list on this cover-letter. Apart from people
who attended the kvm call about this topic, I've cc'ed you only
according to MAINTAINERS file.

The series is divided in 4 parts which are independent of each other,
but we need the 4 parts to be able to use this mechanism:
+ Patches 1 to 6 allow to use the qapi command device_add to cold
  plug devices (like CLI -device do)
+ Patches 7 to 10 modify the 'none' machine which serves as base
  machine.
+ Patches 11 to 13 handle memory mapping and memory creation
+ Patches 14 allows dynamic cold plug of opentitan/sifive_e machine
  to build some example. This last patch is based on a cleanup
  series: it probably works without it, but some config errors are
  not handled (see based-on below).

Only patch 11 is reviewed-by.

v4:
+ cold plugging approach changed in order not to conflict with
  startup. I do not add additional command to handle this so that
  we can change everything easily.
+ device_add in cold plug context is also now equivalent to -device
  CLI regarding -fw_cfg. I also added patches to modify the 'none'
  machine.
+ reworked most of the none machine part
+ updated the sybus-mmio-map command patch

Note that there are still lot of limitations (for example if you try
to create more cpus than the _max_cpus_, tcg will abort()).
Basically all tasks done by machine init reading some parameters are
really tricky: for example, loading complex firmware. But we have to
start by something and all this is not accessible unless the user
asked for none machine and -preconfig.

I can maintain the code introduced here. I'm not sure what's the
process. Is there something else to do than propose a patch to
MAINTAINERS ?
If there is a global agreement on moving on with these feature, it
would be great to have a login on qemu wiki so I can document
limitations and the work being done to solve them.

A simple test can be done with the following scenario which build
a machine subset of the opentitan.

$ cat commands.qmp
// RAM 0x10000000
device_add driver=sysbus-memory id=ram size=0x4000 readonly=false
sysbus-mmio-map device=ram addr=268435456
// CPUS
device_add driver=riscv.hart_array id=cpus cpu-type=lowrisc-ibex-riscv-cpu num-harts=1 resetvec=0x8080
// ROM 0x00008000
device_add driver=sysbus-memory id=rom size=0x4000 readonly=true
sysbus-mmio-map device=rom addr=32768
// PLIC 0x48000000
device_add driver=riscv.sifive.plic id=plic hart-config=M hartid-base=0 num-sources=180 num-priorities=3 priority-base=0x0 pending-base=0x1000 enable-base=0x2000 enable-stride=32 context-base=0x200000 context-stride=8 aperture-size=0x4005000
sysbus-mmio-map device=plic addr=1207959552
qom-set path=plic property=unnamed-gpio-out[1] value=cpus/harts[0]/unnamed-gpio-in[11]
// UART 0x40000000
device_add driver=ibex-uart id=uart chardev=serial0
sysbus-mmio-map device=uart addr=1073741824
qom-set path=uart property=sysbus-irq[1] value=plic/unnamed-gpio-in[2]
// FIRMWARE
device_add driver=loader cpu-num=0 file=/path/to/firmware.elf
x-exit-preconfig

$ qemu-system-riscv32 -display none -M none -preconfig -serial stdio -qmp unix:/tmp/qmp-sock,server

In another terminal, you'll need to send the commands with, for example:
$ grep -v '^//' commands.qmp | qmp-shell /tmp/qmp-sock -v

It is the same as running
$ qemu-system-riscv32 -display none -M opentitan -serial stdio -kernel path/to/firmware.elf

If you need a firmware, you can pick this one
https://github.com/GreenSocs/qemu-qmp-machines/blob/master/opentitan-echo.elf
This firmware is just a small interrupt-based bare-metal program
echoing back whatever is sent in the uart.

This repo contains also sifive_e machine example.

Based-on: <20220218164646.132112-1-damien.hedde@greensocs.com>
"RiscV cleanups for user-related life cycles"

Thanks for your comments,
--
Damien

Damien Hedde (13):
  machine: add phase_get() and document phase_check()/advance()
  machine&vl: introduce phase_until() to handle phase transitions
  vl: support machine-initialized target in phase_until()
  qapi/device_add: compute is_hotplug flag
  qapi/device_add: handle the rom_order_override when cold-plugging
  none-machine: add the NoneMachineState structure
  none-machine: add 'ram-addr' property
  none-machine: allow cold plugging sysbus devices
  none-machine: allow several cpus
  softmmu/memory: add memory_region_try_add_subregion function
  add sysbus-mmio-map qapi command
  hw/mem/system-memory: add a memory sysbus device
  hw: set user_creatable on opentitan/sifive_e devices

Mirela Grujic (1):
  qapi/device_add: Allow execution in machine initialized phase

 qapi/qdev.json                 | 34 +++++++++++-
 include/exec/memory.h          | 22 ++++++++
 include/hw/mem/sysbus-memory.h | 28 ++++++++++
 include/hw/qdev-core.h         | 33 ++++++++++++
 hw/char/ibex_uart.c            |  1 +
 hw/char/sifive_uart.c          |  1 +
 hw/core/null-machine.c         | 68 ++++++++++++++++++++++--
 hw/core/qdev.c                 |  5 ++
 hw/core/sysbus.c               | 49 ++++++++++++++++++
 hw/gpio/sifive_gpio.c          |  1 +
 hw/intc/riscv_aclint.c         |  2 +
 hw/intc/sifive_plic.c          |  1 +
 hw/mem/sysbus-memory.c         | 80 +++++++++++++++++++++++++++++
 hw/misc/sifive_e_prci.c        |  8 +++
 hw/misc/unimp.c                |  1 +
 hw/riscv/riscv_hart.c          |  1 +
 hw/timer/ibex_timer.c          |  1 +
 monitor/misc.c                 |  2 +-
 softmmu/memory.c               | 23 ++++++---
 softmmu/qdev-monitor.c         | 20 +++++++-
 softmmu/vl.c                   | 94 ++++++++++++++++++++++++++--------
 hmp-commands.hx                |  1 +
 hw/mem/meson.build             |  2 +
 23 files changed, 439 insertions(+), 39 deletions(-)
 create mode 100644 include/hw/mem/sysbus-memory.h
 create mode 100644 hw/mem/sysbus-memory.c

-- 
2.35.1


