Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A2A65F51A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 21:19:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDWgr-0006gD-Oe; Thu, 05 Jan 2023 15:18:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pDWgK-0006aA-1Q
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:17:46 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pDWgH-0002bY-6E
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 15:17:43 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pDWfp-0001O7-Tj; Thu, 05 Jan 2023 21:17:13 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Hyper-V Dynamic Memory Protocol driver (hv-balloon)
Date: Thu,  5 Jan 2023 21:17:05 +0100
Message-Id: <cover.1672878904.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

This is a continuation of v1 patch series located here:
https://lore.kernel.org/qemu-devel/cover.1600556526.git.maciej.szmigiero@oracle.com/

Since some time has passed since v1 was posted below there's a reminder
what this series is about:
This series adds a Hyper-V Dynamic Memory Protocol driver (hv-balloon)
and its protocol definitions.
Also included is a driver providing backing devices for memory hot-add
protocols ("virtual DIMM sticks"), which allow inserting extra RAM into
the guest at run time without having to duplicate all of the address space
management logic of TYPE_MEMORY_DEVICE in each memory hot-add protocol
driver.

One of advantages of these over ACPI-based PC DIMM hotplug is that such
memory can be hotplugged in much smaller granularity because the ACPI DIMM
slot limit does not apply.

The hv-balloon driver is like virtio-balloon on steroids: it allows both
changing the guest memory allocation via ballooning and inserting extra RAM
into it by adding required memory backends and providing them to the driver.

In contrast with ACPI DIMM hotplug where one can only request to unplug a
whole DIMM stick this driver allows removing memory from guest in single
page (4k) units via ballooning.

After a VM reboot each previously hot-added memory backend gets released.
A "HV_BALLOON_MEMORY_BACKEND_UNUSED" QMP event is emitted in this case so
the software controlling QEMU knows that it either needs to delete that
memory backend (if no longer needed) or re-insert it.
    
In the future, the guest boot memory size might be changed on reboot
instead, taking into account the effective size that VM had before that
reboot (much like Hyper-V does).

For performance reasons, the guest-released memory is tracked in few range
trees, as a series of (start, count) ranges.
Each time a new page range is inserted into such tree its neighbors are
checked as candidates for possible merging with it.

Besides performance reasons, the Dynamic Memory protocol itself uses page
ranges as the data structure in its messages, so relevant pages need to be
merged into such ranges anyway.

One has to be careful when tracking the guest-released pages, since the
guest can maliciously report returning pages outside its current address
space, which later clash with the address range of newly added memory.
Similarly, the guest can report freeing the same page twice.

The above design results in much better ballooning performance than when
using virtio-balloon with the same guest: 230 GB / minute with this driver
versus 70 GB / minute with virtio-balloon.

During a ballooning operation most of time is spent waiting for the guest
to come up with newly freed page ranges, processing the received ranges on
the host side (in QEMU / KVM) is nearly instantaneous.

The unballoon operation is also pretty much instantaneous:
thanks to the merging of the ballooned out page ranges 200 GB of memory can
be returned to the guest in about 1 second.
With virtio-balloon this operation takes about 2.5 minutes.

These tests were done against a Windows Server 2019 guest running on a
Xeon E5-2699, after dirtying the whole memory inside guest before each
balloon operation.

Using a range tree instead of a bitmap to track the removed memory also
means that the solution scales well with the guest size: even a 1 TB range
takes just few bytes of memory.

An optional "status-report=on" device parameter requests memory status
events from the guest (typically sent every second), which allow the host
to learn both the guest memory available and the guest memory in use
counts.
They are emitted externally as "HV_BALLOON_STATUS_REPORT" QMP events.

The driver is named hv-balloon since the Linux kernel client driver for
the Dynamic Memory Protocol is named as such and to follow the naming
pattern established by the virtio-balloon driver.
The whole protocol runs over Hyper-V VMBus that has its implementation
recently merged in.

The driver was tested against Windows Server 2012 R2, Windows Server 2016
and Windows Server 2016 guests and obeys the guest alignment requirements
reported to the host via DM_CAPABILITIES_REPORT message.
Extensive event tracing is available under 'hv_balloon_*' prefix.

Example usage:
* Add "-device vmbus-bridge,id=vmbus-bridge -device hv-balloon,id=hvb"
  to the QEMU command line and set "maxmem" value to something large,
  like 1T.

* Use QEMU HMP commands to add a new memory backend:
  object_add memory-backend-ram,id=mem1,size=200G
  This command is actually the same as for ACPI-based DIMM hotplug.

* Execute QMP "hv-balloon-add-memory" command, providing the id of
  that memory backend as the "id" parameter to hot-add that memory:
  hv-balloon-add-memory id=mem1

* Use the ballooning interface HMP commands to force the guest to give
  out as much memory as possible:
  balloon 1
  The ballooning interface monitor commands can also be used to resize
  the guest up and down appropriately.

* One can check the current guest size by issuing a "info balloon" command.
  This is useful to know what is happening, since large ballooning or
  unballooning operations take some time to complete.

* Once the guest is restarted a "HV_BALLOON_MEMORY_BACKEND_UNUSED" QMP
  event will be generated.
  The backing memory device then can be removed:
  object_del mem1
  Or, alternatively, it can be re-added:
  hv-balloon-add-memory id=mem1

Future directions:
* Allow sharing the ballooning QEMU interface between hv-balloon and
  virtio-balloon drivers.
  Currently, only one of them can be added to the VM at the same time.

* Add vmstate / live migration support to the hv-balloon driver.

* Change the guest boot memory size on reboot, taking into account the
  effective size that VM had before that reboot (much like Hyper-V does).



Changes from v1:
Conversion of the driver to transparently managing hot-added memory as
virtual DIMMs.

Specifically, these virtual DIMMs are now automatically being created and
deleted by the driver.
This way the QEMU controller does not have to do vDIMM management manually,
as suggested during the review of v1.

Thanks to that these virtual DIMMs are now an implementation detail,
transparent to the QEMU user.

Separation of ballooning function from memory hot-add function - ballooning
interfaces are no longer used to allow hot-removal of hot-added memory.

Removal of automatic re-add of hot-added memory after a guest reboot.
This makes it easier to introduce automatic resizing of boot memory
on reboot at some point in the future.

Other minor improvements of these drivers:
* Centralized state machine transitions to enforce single transition
  per iteration rule,

* Increased use of Glib's automatic memory management where possible,
  (g_autoptr() and g_autofree()),

* Move hapvdimm class and instance structs from the header file to
  implementation (.c) file, use OBJECT_DECLARE_SIMPLE_TYPE to declare it,

* Minor cleanups.

It's also worth noting that since the v1 was posted the KVM memory slot
count limit was also increased to 32k (together with switching to a more
scalable memslots implementation).

 Kconfig.host                     |    3 +
 configure                        |   36 +
 hw/hyperv/Kconfig                |    5 +
 hw/hyperv/hv-balloon.c           | 2185 ++++++++++++++++++++++++++++++
 hw/hyperv/meson.build            |    1 +
 hw/hyperv/trace-events           |   16 +
 hw/i386/Kconfig                  |    2 +
 hw/i386/pc.c                     |    4 +-
 hw/mem/Kconfig                   |    4 +
 hw/mem/hapvdimm.c                |  221 +++
 hw/mem/meson.build               |    1 +
 include/hw/hyperv/dynmem-proto.h |  423 ++++++
 include/hw/mem/hapvdimm.h        |   27 +
 meson.build                      |    4 +-
 qapi/machine.json                |   68 +
 15 files changed, 2998 insertions(+), 2 deletions(-)
 create mode 100644 hw/hyperv/hv-balloon.c
 create mode 100644 hw/mem/hapvdimm.c
 create mode 100644 include/hw/hyperv/dynmem-proto.h
 create mode 100644 include/hw/mem/hapvdimm.h


