Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74C127F06
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 16:06:49 +0100 (CET)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiJrc-00078H-Hr
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 10:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiJqX-0006Er-B8
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:05:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiJqV-0007s4-Kk
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:05:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32384
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiJqV-0007rf-GP
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 10:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576854339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7QzHkLdifapNMunxWzsgH/zieKUpuniJUApeV5RCaEE=;
 b=a0S5Hn5tUMlJXYxtYuvOFxeRUWZ1OqsiEbBWpBxMUzoEl4A+6O4y+22f/0fyAYvbGfwDfM
 CGNpaFku7lNfGHhcphkp5Iack6xcRXHNUPcboLQvDFyBppeGLbmbZWxvORzuXSr3gYQyT5
 AQNJzoidq8IM+RNw3A3puGHkVVugPMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-y4N1dYoOPUCEdDSnhr4wyg-1; Fri, 20 Dec 2019 10:05:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 336BE800D4C;
 Fri, 20 Dec 2019 15:05:33 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAB905DA60;
 Fri, 20 Dec 2019 15:05:28 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/9] Add dbus-vmstate
Date: Fri, 20 Dec 2019 19:05:13 +0400
Message-Id: <20191220150522.633032-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: y4N1dYoOPUCEdDSnhr4wyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: berrange@redhat.com, quintela@redhat.com, mprivozn@redhat.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8e5943260a8f765216674ee87ce8588cc4e7463e=
:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-pull-re=
quest' into staging (2019-12-20 12:46:10 +0000)

are available in the Git repository at:

  https://github.com/elmarco/qemu.git tags/dbus-vmstate7-pull-request

for you to fetch changes up to 011eb80c5748ec599067858e5a940a5605415ede:

  tests: add dbus-vmstate-test (2019-12-20 19:00:49 +0400)

----------------------------------------------------------------
Add dbus-vmstate

Hi,

With external processes or helpers participating to the VM support, it
becomes necessary to handle their migration. Various options exist to
transfer their state:
1) as the VM memory, RAM or devices (we could say that's how
   vhost-user devices can be handled today, they are expected to
   restore from ring state)
2) other "vmstate" (as with TPM emulator state blobs)
3) left to be handled by management layer

1) is not practical, since an external processes may legitimatelly
need arbitrary state date to back a device or a service, or may not
even have an associated device.

2) needs ad-hoc code for each helper, but is simple and working

3) is complicated for management layer, QEMU has the migration timing

The proposed "dbus-vmstate" object will connect to a given D-Bus
address, and save/load from org.qemu.VMState1 owners on migration.

Thus helpers can easily have their state migrated with QEMU, without
implementing ad-hoc support (such as done for TPM emulation)

D-Bus is ubiquitous on Linux (it is systemd IPC), and can be made to
work on various other OSes. There are several implementations and good
bindings for various languages.  (the tests/dbus-vmstate-test.c is a
good example of how simple the implementation of services can be, even
in C)

dbus-vmstate is put into use by the libvirt series "[PATCH 00/23] Use
a slirp helper process".

v7: after Daniel & David reviews
- some docs improvements
- changed qemu_dbus_get_queued_owners() to take errp
- added __func__ to error_report() and some traces
- new patch "tests: add migration-helpers unit" and adapt
  dbus-vmstate-test to use it
- use dbus-vmstate-test temporary directory for dbus listen path

v6:
- rebased (minor change in patch 2)

v5:
- trying to fix patchew/ci: install dbus-daemon in containers, skip
  test if unavailable

v4:
- add Daniel security scenarios to the D-Bus document
- misc doc improvements
- add "util: add dbus helper unit" patch, with
  qemu_dbus_get_queued_owners()
- add "configure: add GDBUS_CODEGEN", explaining why gio-unix is
  required when available
- silence the expected failing tests
- update copyright headers, MAINTAINERS
- add r-b/a-b tags
- rebased

(Note: patchew dbus test fails for unclear reasons, but I can't
reproduce locally nor on travis)

v3:
- after various discussions on helper processes, we settled on a
  preference for having a bus for communications. This version is
  actually v1 updated.
- added a dbus.rst document to describe D-Bus recommendations for QEMU
- added dbus-vmstate-daemon.sh to play with the dbus-daemon configuration
  (although it is not very useful in the context of a single UID)
- added a new vmstate interface, so that any object can implement
  VMStateDescription, and converted dbus-vmstate
- added "migration: fix vmdesc leak on vmstate_save() error"
- convert to g_auto

v2:
- D-Bus is most common and practical through a bus, but it requires a
  daemon to be running. I argue that the benefits outweight the cost
  of running an extra daemon in v1 in the context of multi-process
  qemu, but it is also possible to connect in p2p mode as done in this
  new version.

----------------------------------------------------------------

Marc-Andr=C3=A9 Lureau (9):
  vmstate: add qom interface to get id
  vmstate: replace DeviceState with VMStateIf
  docs: start a document to describe D-Bus usage
  util: add dbus helper unit
  Add dbus-vmstate object
  configure: add GDBUS_CODEGEN
  dockerfiles: add dbus-daemon to some of latest distributions
  tests: add migration-helpers unit
  tests: add dbus-vmstate-test

 MAINTAINERS                              |  12 +
 Makefile.objs                            |   1 +
 backends/Makefile.objs                   |   4 +
 backends/dbus-vmstate.c                  | 510 +++++++++++++++++++++++
 backends/trace-events                    |   7 +
 configure                                |   7 +
 docs/interop/dbus-vmstate.rst            |  74 ++++
 docs/interop/dbus.rst                    | 110 +++++
 docs/interop/index.rst                   |   2 +
 hw/block/onenand.c                       |   2 +-
 hw/core/Makefile.objs                    |   1 +
 hw/core/qdev.c                           |  21 +-
 hw/core/vmstate-if.c                     |  23 +
 hw/ide/cmd646.c                          |   2 +-
 hw/ide/isa.c                             |   2 +-
 hw/ide/piix.c                            |   2 +-
 hw/ide/via.c                             |   2 +-
 hw/misc/max111x.c                        |   2 +-
 hw/net/eepro100.c                        |   4 +-
 hw/net/virtio-net.c                      |   3 +-
 hw/nvram/eeprom93xx.c                    |   4 +-
 hw/ppc/spapr_drc.c                       |   9 +-
 hw/ppc/spapr_iommu.c                     |   4 +-
 hw/s390x/s390-skeys.c                    |   2 +-
 include/hw/vmstate-if.h                  |  40 ++
 include/migration/register.h             |   4 +-
 include/migration/vmstate.h              |  10 +-
 include/qemu/dbus.h                      |  19 +
 migration/savevm.c                       |  20 +-
 stubs/vmstate.c                          |   4 +-
 tests/Makefile.include                   |  25 +-
 tests/dbus-vmstate-daemon.sh             |  95 +++++
 tests/dbus-vmstate-test.c                | 382 +++++++++++++++++
 tests/dbus-vmstate1.xml                  |  12 +
 tests/docker/dockerfiles/centos7.docker  |   1 +
 tests/docker/dockerfiles/debian10.docker |   1 +
 tests/docker/dockerfiles/fedora.docker   |   1 +
 tests/docker/dockerfiles/ubuntu.docker   |   1 +
 tests/migration-helpers.c                | 167 ++++++++
 tests/migration-helpers.h                |  37 ++
 tests/migration-test.c                   | 176 +-------
 util/Makefile.objs                       |   3 +
 util/dbus.c                              |  57 +++
 43 files changed, 1660 insertions(+), 205 deletions(-)
 create mode 100644 backends/dbus-vmstate.c
 create mode 100644 backends/trace-events
 create mode 100644 docs/interop/dbus-vmstate.rst
 create mode 100644 docs/interop/dbus.rst
 create mode 100644 hw/core/vmstate-if.c
 create mode 100644 include/hw/vmstate-if.h
 create mode 100644 include/qemu/dbus.h
 create mode 100755 tests/dbus-vmstate-daemon.sh
 create mode 100644 tests/dbus-vmstate-test.c
 create mode 100644 tests/dbus-vmstate1.xml
 create mode 100644 tests/migration-helpers.c
 create mode 100644 tests/migration-helpers.h
 create mode 100644 util/dbus.c

--=20
2.24.0.308.g228f53135a


