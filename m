Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341B13C12E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jan 2020 13:40:34 +0100 (CET)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irhyL-0003xt-EF
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 07:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1irhuf-0002IM-2N
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 07:36:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1irhud-00030J-F7
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 07:36:44 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:53462)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1irhuc-0002yA-Sa; Wed, 15 Jan 2020 07:36:43 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 62AB096EF0;
 Wed, 15 Jan 2020 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1579091799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Is+3y8PyaoD3fDrqFoTeD1QYkefQzBDvYY5F/IE0UQo=;
 b=4Z3boid5krYexeLVtzS+fAve/wRgSuSlHS2gvMcodDNDg88cSRhUWQkWqun6jv5qMsJOYh
 dFFmUSHWZ/g7GJeQ6aMNox5Q56OFi5aG/CmevIP2iBp0YQb9nSzZ8jqQG6dwvSeA+08D+d
 wu0mCAmebVTzXckHiN+HJL+T4UMiznE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/11] Multi-phase reset mechanism
Date: Wed, 15 Jan 2020 13:36:09 +0100
Message-Id: <20200115123620.250132-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1579091800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Is+3y8PyaoD3fDrqFoTeD1QYkefQzBDvYY5F/IE0UQo=;
 b=WmuAWdB0pNIOSGH2GW3nzVvFXx+GxdBYFyRLjv+eFDMdxrFaa0rK9hJggChQ7AY0j/VkfE
 aPX69lZltSBCPwIJdkD0C0Icax1imyRQZma1Ua2/zXaqty/Pdx+Rp6e3bR+gZYlpjS6DAl
 qyXluGZHo0AwnEUTTYy+qUdVhUYAzAw=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1579091800; a=rsa-sha256; cv=none;
 b=pAbxOlmo684UrwMrggGbZZKzviipff0epGxXObNAFy8Z15ZQ5Ooriyr9Q5VDijy0/ZzlmU
 70gEYh3fw6p037zSBrR3rVWt3YNJ216yXbkaLD/XOBEOFq3fCKXeyvqsHFss5CuMImXO+X
 GIyfbyp0/11KS5auLZDL2YAUQ896xdA=
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
 pbonzini@redhat.com, philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

The purpose of this series is to split the current reset procedure
into multiple phases. This will help to solve some ordering
difficulties we have during reset.

This is a ready to merge version. I've rebased on master and followed
Richard's remarks on v6. All patches have been reviewed by.

This series adds resettable interface and transitions base Device and
Bus classes (sysbus subclasses are ok too). It provides new reset
functions but does not switch anymore the old functions
(device_reset() and qdev/qbus_reset_all()) to resettable interface.
These functions keep the exact same behavior as before.

The series also transition the main reset handlers registration which
has no impact until devices and buses are transitioned.

The series is organized as follows:
Patch 1 is unmodified. Patch 2 adds some utility trace events.
Patches 3 to 8 adds resettable api in devices and buses. Patch 9 adds
some documentation. Patches 10 and 11 transition the call sites of
qemu_register_reset(qdev/qbus_reset_all_fn, ...).

After this series, the plan is then to transition devices, buses and
legacy reset call sites. Devices and buses have to be transitioned
from mother class to daughter classes order but until the final
(daughter) class is transitioned, old monolitic reset behavior will
be kept for this class.

Thanks,
Damien

v7:
  + patch 1
    - new device_reset occurrence (rebase)
  + patch 3
    - ResettablePhases un-nest (Richard)
    - warnings (Richard)
  + patch 7
    - inline resettable_state_clear (Richard)

v6:
https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04664.html
  + patch 1
    - update (microvm machine) (rebase)
  + patch 2
    - added more info in trace_qdev_update_parent_bus (Philippe)
  + patch 3
    - typos (Peter)
    - missing gpl header in header (Peter)
    - clarify global entry_in_progress flag (Peter)
  + patch 4
    -  parent/child terminology (Peter)
  + patch 5
    - typos (Peter)
    - comment about global exit_in_progress flag (Peter)
  + patch 6
    -  update list of qdev_set_parent_bus() call sites (rebase)
  + patch 7
    - clear reset state in realize before doing the hotplug reset
  + patch 9
    - added entry in index.rst
    - fix commit message and various improvements (Peter)
    - do parent phase method before child actions (Peter)
    - clarify "Polling the reset state" paragraph=20
  + patch 12&13
    - removed (follow-up series to cleanup the raspi sd)

v5:
https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg04730.html
  + various improvement in the resettable interface (regarding
    transition, robustness and several reset types)
  + better handling of transition from legacy reset to resettable
  + device hotplug and parent bus 'hot' change support
  + improved doc with examples and converted to rst format

v4:
https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg04359.html

Damien Hedde (11):
  add device_legacy_reset function to prepare for reset api change
  hw/core/qdev: add trace events to help with resettable transition
  hw/core: create Resettable QOM interface
  hw/core: add Resettable support to BusClass and DeviceClass
  hw/core/resettable: add support for changing parent
  hw/core/qdev: handle parent bus change regarding resettable
  hw/core/qdev: update hotplug reset regarding resettable
  hw/core: deprecate old reset functions and introduce new ones
  docs/devel/reset.rst: add doc about Resettable interface
  vl: replace deprecated qbus_reset_all registration
  hw/s390x/ipl: replace deprecated qdev_reset_all registration

 docs/devel/index.rst     |   1 +
 docs/devel/reset.rst     | 289 +++++++++++++++++++++++++++++++++++++
 Makefile.objs            |   1 +
 include/hw/qdev-core.h   |  58 +++++++-
 include/hw/resettable.h  | 247 ++++++++++++++++++++++++++++++++
 hw/audio/intel-hda.c     |   2 +-
 hw/core/bus.c            | 102 +++++++++++++
 hw/core/qdev.c           | 160 +++++++++++++++++++--
 hw/core/resettable.c     | 301 +++++++++++++++++++++++++++++++++++++++
 hw/hyperv/hyperv.c       |   2 +-
 hw/i386/microvm.c        |   2 +-
 hw/i386/pc.c             |   2 +-
 hw/ide/microdrive.c      |   8 +-
 hw/intc/spapr_xive.c     |   2 +-
 hw/ppc/pnv_psi.c         |   4 +-
 hw/ppc/spapr_pci.c       |   2 +-
 hw/ppc/spapr_vio.c       |   2 +-
 hw/s390x/ipl.c           |  10 +-
 hw/s390x/s390-pci-inst.c |   2 +-
 hw/scsi/vmw_pvscsi.c     |   2 +-
 hw/sd/omap_mmc.c         |   2 +-
 hw/sd/pl181.c            |   2 +-
 vl.c                     |  10 +-
 hw/core/Makefile.objs    |   1 +
 hw/core/trace-events     |  27 ++++
 tests/Makefile.include   |   1 +
 26 files changed, 1211 insertions(+), 31 deletions(-)
 create mode 100644 docs/devel/reset.rst
 create mode 100644 include/hw/resettable.h
 create mode 100644 hw/core/resettable.c

--=20
2.24.1


