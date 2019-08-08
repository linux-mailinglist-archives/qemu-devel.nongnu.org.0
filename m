Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E521E86519
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 17:04:35 +0200 (CEST)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvjxy-0001aF-Jr
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 11:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hvjx0-00010v-2n
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 11:03:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hvjwz-0006g3-13
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 11:03:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32141)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hvjwy-0006dp-SK
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 11:03:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C282F30EF4D2
 for <qemu-devel@nongnu.org>; Thu,  8 Aug 2019 15:03:30 +0000 (UTC)
Received: from localhost (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5C55C22C;
 Thu,  8 Aug 2019 15:03:29 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 19:03:23 +0400
Message-Id: <20190808150325.21939-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 08 Aug 2019 15:03:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] Add dbus-vmstate
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
peer address, and save/load from org.qemu.VMState1 interface.

This way, helpers can have their state migrated with QEMU, without
implementing another ad-hoc support (such as done for TPM emulation)

I chose D-Bus as it is ubiquitous on Linux (it is systemd IPC), and
can be made to work on various other OSes. There are several
implementations and good bindings for various languages.
(the tests/dbus-vmstate-test.c is a good example of how simple
the implementation of services can be, even in C)

v2:
- D-Bus is most common and practical through a bus, but it requires a
  daemon to be running. I argue that the benefits outweight the cost
  of running an extra daemon in v1 in the context of multi-process
  qemu, but it is also possible to connect in p2p mode as done in this
  new version.

dbus-vmstate is put into use by the libvirt series "[PATCH v2 00/23]
Use a slirp helper process".

Marc-Andr=C3=A9 Lureau (2):
  qemu-file: move qemu_{get,put}_counted_string() declarations
  Add dbus-vmstate object

 MAINTAINERS                         |   6 +
 backends/Makefile.objs              |   4 +
 backends/dbus-vmstate.c             | 332 +++++++++++++++++++++++++
 configure                           |   7 +
 docs/interop/dbus-vmstate.rst       |  63 +++++
 docs/interop/index.rst              |   1 +
 include/migration/qemu-file-types.h |   4 +
 migration/qemu-file.h               |   4 -
 tests/Makefile.include              |  18 +-
 tests/dbus-vmstate-test.c           | 371 ++++++++++++++++++++++++++++
 tests/dbus-vmstate1.xml             |  12 +
 11 files changed, 817 insertions(+), 5 deletions(-)
 create mode 100644 backends/dbus-vmstate.c
 create mode 100644 docs/interop/dbus-vmstate.rst
 create mode 100644 tests/dbus-vmstate-test.c
 create mode 100644 tests/dbus-vmstate1.xml

--=20
2.23.0.rc1


