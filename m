Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DDCDC831
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 17:13:33 +0200 (CEST)
Received: from localhost ([::1]:41618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLTwa-0001Vo-34
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 11:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iLTrA-0006iM-LA
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iLTr8-0000GQ-PT
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 11:07:56 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38582)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iLTr4-0000B3-HI; Fri, 18 Oct 2019 11:07:51 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 704BE96EF0;
 Fri, 18 Oct 2019 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1571411267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uVZEjVjf5RkbOzKuBwII7TJZpvbTBPo7Ayc+WX9Uv0Q=;
 b=eUopk+ASRZQmQL+cpP1uSfZChRMXiUIxX8Qkm348DJGLe8K4raBgX9q/g7iM7ZqjTzPd4i
 JWMkrf/h96/cDLie0UUhzmKf4Os1IVr2ZF24VirTBVDvRtYTCP0Xysjb9+Do+D48hxEKQI
 /UM6YBeIZglNk59Rim7HYiT+hG4pDyw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/13] Multi-phase reset mechanism
Date: Fri, 18 Oct 2019 17:06:17 +0200
Message-Id: <20191018150630.31099-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1571411267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uVZEjVjf5RkbOzKuBwII7TJZpvbTBPo7Ayc+WX9Uv0Q=;
 b=Mav+uUqQnveDlUlxVrQvCBj+Kw0Sk0VladuSyY/ifSVNjj4RWUThPSszOZJP9BWuNYpMp8
 aR43yXl19rnQX0jGdtwswFSNdvUY/t31ptjQunm/N1R1Z+cB4nonGX794UOwhZ4ecFozGk
 KJZkMY/PoYuDzPz4xmHDfUpoda9PkME=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1571411267; a=rsa-sha256; cv=none;
 b=EGYlgA1M/i+/169sG32BFdflGqKn0bvVxz70TyTjDjWc+X5Emelr7LlESlnWLkTpJSHPS1
 OvjbjXZtz3HcvNIcg0e2khBiKpR24tYxJloEt2yFHxmmvTsRwu6Y3LwxHfJ0AbxgjlTexb
 mUfaXnowI5y6DZeKoydtqb342Q8XkUU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, cohuck@redhat.com,
 mark.burton@greensocs.com, qemu-s390x@nongnu.org, edgari@xilinx.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

The purpose of this series is to split the current reset procedure
into multiple phases. This will help to solve some ordering
difficulties we have during reset. Previous version can be found here:
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg04359.html

This series adds resettable interface and transitions base Device and
Bus classes (sysbus subclasses are ok too). It provides new reset
functions but does not switch anymore the old functions
(device_reset() and qdev/qbus_reset_all()) to resettable interface.
These functions keep the exact same behavior as before.

The series also transition the main reset handlers registration which
has no impact until devices and buses are transitioned.

I think this version is way better regarding the transition from the
legacy to the resettable interface than the previous one.
After this series, the plan is then to transition devices, buses and
legacy reset call sites. Devices and buses have to be transitioned
from mother class to daughter classes order but until the final
(daughter) class is transitioned, old monolitic reset behavior will
be kept for this class.

Changes v4 -> v5:
  + various improvement in the resettable interface (regarding
    transition, robustness and several reset types)
  + better handling of transition from legacy reset to resettable
  + device hotplug and parent bus 'hot' change support
  + improved doc with examples and converted to rst format

Regarding the Resettable interface changes and how to handle more
reset types, please read patch 3 message.

The series is organized as follows:
Patch 1 is unmodified. Patch 2 adds some utility trace events.
Patches 3 to 8 adds resettable api in devices and buses. Patch 9 adds
some documentation. Patches 10 and 11 transition the call sites of
qemu_register_reset(qdev/qbus_reset_all_fn, ...).

Apart from patch 7 about hotplug which is really a rfc. I think other
patches are in pretty good shape.
Patch 3 and 4 are quite big but I don't think it make much sense to
split them. I could give it a try if you think it will ease reviews.
Note that depending on what name we choose for device/bus reset
functions (see patch 8), we may finally don't need patch 1.

I've also added patches 12 and 13 which handle the raspi sd card
reparenting. I'm not sure they fit well in this series but at some
point in this development I thought they had to be before patch 9
(finally it is not the case). Since I had to develop some specific
resettable support just for this case , I kept them as an example
of what transition a device is. Note that patch 13 handle the only
reset parent change (tricky) case I found (apart from hotplug).

Thanks for your feedback,
Damien

Damien Hedde (13):
  add device_legacy_reset function to prepare for reset api change
  hw/core/qdev: add trace events to help with resettable transition
  hw/core: create Resettable QOM interface
  hw/core: add Resettable support to BusClass and DeviceClass
  hw/core/resettable: add support for changing parent
  hw/core/qdev: handle parent bus change regarding resettable
  hw/core/qdev: update hotplug reset regarding resettable
  hw/core: deprecate old reset functions and introduce new ones
  docs/devel/reset.txt: add doc about Resettable interface
  vl: replace deprecated qbus_reset_all registration
  hw/s390x/ipl: replace deprecated qdev_reset_all registration
  hw/gpio/bcm2835_gpio: Isolate sdbus reparenting
  hw/gpio/bcm2835_gpio: Update to resettable

 Makefile.objs            |   1 +
 docs/devel/reset.rst     | 282 ++++++++++++++++++++++++++++++++++++++
 hw/audio/intel-hda.c     |   2 +-
 hw/core/Makefile.objs    |   1 +
 hw/core/bus.c            | 102 ++++++++++++++
 hw/core/qdev.c           | 156 +++++++++++++++++++--
 hw/core/resettable.c     | 289 +++++++++++++++++++++++++++++++++++++++
 hw/core/trace-events     |  27 ++++
 hw/gpio/bcm2835_gpio.c   |  31 +++--
 hw/hyperv/hyperv.c       |   2 +-
 hw/i386/pc.c             |   2 +-
 hw/ide/microdrive.c      |   8 +-
 hw/intc/spapr_xive.c     |   2 +-
 hw/ppc/pnv_psi.c         |   2 +-
 hw/ppc/spapr_pci.c       |   2 +-
 hw/ppc/spapr_vio.c       |   2 +-
 hw/s390x/ipl.c           |  10 +-
 hw/s390x/s390-pci-inst.c |   2 +-
 hw/scsi/vmw_pvscsi.c     |   2 +-
 hw/sd/omap_mmc.c         |   2 +-
 hw/sd/pl181.c            |   2 +-
 include/hw/qdev-core.h   |  58 +++++++-
 include/hw/resettable.h  | 224 ++++++++++++++++++++++++++++++
 tests/Makefile.include   |   1 +
 vl.c                     |  10 +-
 25 files changed, 1185 insertions(+), 37 deletions(-)
 create mode 100644 docs/devel/reset.rst
 create mode 100644 hw/core/resettable.c
 create mode 100644 include/hw/resettable.h

--=20
2.23.0


