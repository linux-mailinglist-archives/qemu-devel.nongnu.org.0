Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82F124177
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 09:19:35 +0100 (CET)
Received: from localhost ([::1]:50912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihUYQ-0007s9-6T
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 03:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35297)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ihUWP-0005wF-Gm
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ihUWN-0002OX-GG
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:29 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20343
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ihUWN-0002NJ-BU
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576657045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Wz35dFuQYF/gKqeZmat0XrL3ZOUP48dWoJjuJEojsw=;
 b=C+CJ5F+gA5fj7mW8K7PEtnzl0spxPPEw2U1dkewjUc/UALjEdAirAGey9fArLBGzjR+Bq2
 z+G5T5LiU5oe2f0vt3XUwBYPEmh6feluDuO5Gi5Hyahja2Rl/SrZPei9KYM/9h92Z5GjZ1
 js1A0TA6cq8Lm0cVXaEpKk8SuALrwxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-OkGJGHCmMqiSvPOeHfqa6g-1; Wed, 18 Dec 2019 03:17:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 237BD801E74
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 08:17:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C55711000325
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 08:17:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FFE911386A7; Wed, 18 Dec 2019 09:17:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/35] Error reporting patches for 2019-12-17
Date: Wed, 18 Dec 2019 09:16:46 +0100
Message-Id: <20191218081721.23520-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: OkGJGHCmMqiSvPOeHfqa6g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* New PATCH 20: Resolve conflict with David Gibson's pull request

The following changes since commit aceeaa69d28e6f08a24395d0aa6915b687d0a681=
:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-=
12-17' into staging (2019-12-17 15:55:20 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-error-2019-12-17-v2

for you to fetch changes up to d936613547aec49b0b80193cee0b9df05cd8a2ae:

  nbd: assert that Error** is not NULL in nbd_iter_channel_error (2019-12-1=
8 08:43:19 +0100)

----------------------------------------------------------------
Error reporting patches for 2019-12-17

----------------------------------------------------------------
Markus Armbruster (15):
      error: Fix -msg timestamp default
      crypto: Fix certificate file error handling crash bug
      crypto: Fix typo in QCryptoTLSSession's <example> comment
      io: Fix Error usage in a comment <example>
      tests: Clean up initialization of Error *err variables
      exec: Fix file_ram_alloc() error API violations
      hw/acpi: Fix legacy CPU plug error API violations
      hw/core: Fix fit_load_fdt() error API violations
      hw/ipmi: Fix realize() error API violations
      qga: Fix guest-get-fsinfo error API violations
      memory-device: Fix memory pre-plug error API violations
      error: Clean up unusual names of Error * variables
      hw/intc/s390: Simplify error handling in kvm_s390_flic_realize()
      tests-blockjob: Use error_free_or_abort()
      Revert "ppc: well form kvmppc_hint_smt_possible error hint helper"

Vladimir Sementsov-Ogievskiy (20):
      net/net: Clean up variable shadowing in net_client_init()
      error: make Error **errp const where it is appropriate
      hmp: drop Error pointer indirection in hmp_handle_error
      vnc: drop Error pointer indirection in vnc_client_io_error
      qdev-monitor: make Error **errp const where it is appropriate
      ppc: make Error **errp const where it is appropriate
      9pfs: make Error **errp const where it is appropriate
      hw/core/qdev: cleanup Error ** variables
      block/snapshot: rename Error ** parameter to more common errp
      hw/i386/amd_iommu: rename Error ** parameter to more common errp
      qga: rename Error ** parameter to more common errp
      monitor/qmp-cmds: rename Error ** parameter to more common errp
      hw/s390x: rename Error ** parameter to more common errp
      hw/sd: drop extra whitespace in sdhci_sysbus_realize() header
      hw/tpm: rename Error ** parameter to more common errp
      hw/usb: rename Error ** parameter to more common errp
      include/qom/object.h: rename Error ** parameter to more common errp
      backends/cryptodev: drop local_err from cryptodev_backend_complete()
      hw/vfio/ap: drop local_err from vfio_ap_realize
      nbd: assert that Error** is not NULL in nbd_iter_channel_error

 include/block/snapshot.h            |   2 +-
 include/crypto/tlssession.h         |   2 +-
 include/io/task.h                   |   2 +-
 include/monitor/hmp.h               |   2 +-
 include/qapi/error.h                |   6 +-
 include/qemu/error-report.h         |   3 +-
 include/qom/object.h                |   4 +-
 target/ppc/kvm_ppc.h                |   4 +-
 ui/vnc.h                            |   2 +-
 backends/cryptodev.c                |  11 +--
 block/nbd.c                         |   1 +
 block/snapshot.c                    |   4 +-
 crypto/tlscredsx509.c               |   2 +-
 dump/dump-hmp-cmds.c                |   4 +-
 exec.c                              |   6 +-
 hw/9pfs/9p-local.c                  |   2 +-
 hw/9pfs/9p-proxy.c                  |   2 +-
 hw/acpi/cpu_hotplug.c               |  10 +--
 hw/core/loader-fit.c                |  15 ++--
 hw/core/machine-hmp-cmds.c          |   6 +-
 hw/core/qdev.c                      |  28 +++----
 hw/i386/amd_iommu.c                 |  14 ++--
 hw/intc/s390_flic_kvm.c             |  16 ++--
 hw/ipmi/isa_ipmi_bt.c               |   7 +-
 hw/ipmi/isa_ipmi_kcs.c              |   7 +-
 hw/ipmi/pci_ipmi_bt.c               |   6 +-
 hw/ipmi/pci_ipmi_kcs.c              |   6 +-
 hw/mem/memory-device.c              |   6 +-
 hw/ppc/spapr_pci.c                  |  16 ++--
 hw/ppc/spapr_pci_nvlink2.c          |  10 +--
 hw/s390x/event-facility.c           |   2 +-
 hw/s390x/s390-stattrib.c            |   3 +-
 hw/sd/sdhci.c                       |   2 +-
 hw/tpm/tpm_emulator.c               |   8 +-
 hw/usb/dev-network.c                |   2 +-
 hw/vfio/ap.c                        |   9 +--
 monitor/hmp-cmds.c                  | 155 ++++++++++++++++++--------------=
----
 monitor/qmp-cmds.c                  |   2 +-
 net/net.c                           |  17 ++--
 qdev-monitor.c                      |  16 ++--
 qga/commands-posix.c                |   8 +-
 qga/commands-win32.c                |   2 +-
 qga/commands.c                      |  12 +--
 qom/qom-hmp-cmds.c                  |   4 +-
 target/ppc/kvm.c                    |   6 +-
 tests/test-blockjob.c               |  15 ++--
 tests/test-qobject-output-visitor.c |   8 +-
 tests/test-string-output-visitor.c  |   4 +-
 ui/vnc.c                            |  20 ++---
 util/error.c                        |   6 +-
 util/qemu-error.c                   |   6 +-
 vl.c                                |   2 +-
 qemu-options.hx                     |  10 ++-
 53 files changed, 261 insertions(+), 264 deletions(-)

--=20
2.21.0


