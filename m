Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1F1BD5A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 20:47:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQFyY-00045o-Rt
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 14:47:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQFwJ-0003G4-Pf
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hQFwI-0003VQ-DP
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:44:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37336)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hQFwI-0003Up-5I
	for qemu-devel@nongnu.org; Mon, 13 May 2019 14:44:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C94EC0568FE
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 18:44:41 +0000 (UTC)
Received: from localhost (unknown [10.36.112.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BE545DE01;
	Mon, 13 May 2019 18:44:34 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 20:44:25 +0200
Message-Id: <20190513184433.21038-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 13 May 2019 18:44:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 0/8] Add vhost-user-gpu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

vhost-user allows to drive a virtio device in a seperate
process. After vhost-user-net, we have seen
vhost-user-{scsi,blk,crypto,input} added more recently.

This series, initially proposed ~3 years ago, time flies
(https://lists.gnu.org/archive/html/qemu-devel/2016-06/msg01905.html)
contributes with vhost-user-gpu.

You may start a vhost-user-gpu with virgl rendering in a separate
process like this:

$ ./vhost-user-gpu --virgl -s vgpu.sock &
$ qemu...
  -chardev socket,id=3Dchr,path=3Dvgpu.sock
  -device vhost-user-vga,chardev=3Dchr

Based-on: <20190513183325.8596-1-marcandre.lureau@redhat.com>

v7:
 - add "framed" replies to the vhost-user-gpu protocol
 - use GBM library instead of drm-vendor APIs
 - added "virtio-gpu: add a pixman helper header"

v6:
 - do not install vhost-user-input
 - install vhost-user-gpu and json file following the spec
 - fix the build when drm-intel-devel missing
 - rebase (& resend without already applied patches)

v5:
 - remove user-creatable version of vhost-user-backend
 - remove optinal management of sub-process in vhost-user-backend
 - removed daemonize/pid code
 - drop introduction of new input & gpu messages for PCI config space
   handling, instead use VHOST_USER_PROTOCOL_F_CONFIG
 - plain mem & udmabuf fallback for 2d rendering
 - rebased, kconfig-ify, rst-ify

Marc-Andr=C3=A9 Lureau (8):
  vhost-user: add vhost_user_gpu_set_socket()
  virtio-gpu: add bswap helpers header
  virtio-gpu: add a pixman helper header
  util: compile drm.o on Linux
  contrib: add vhost-user-gpu
  virtio-gpu: split virtio-gpu, introduce virtio-gpu-base
  virtio-gpu: split virtio-gpu-pci & virtio-vga
  hw/display: add vhost-user-vga & gpu-pci

 configure                                  |   17 +
 contrib/libvhost-user/libvhost-user.h      |    1 +
 contrib/vhost-user-gpu/virgl.h             |   25 +
 contrib/vhost-user-gpu/vugbm.h             |   67 ++
 contrib/vhost-user-gpu/vugpu.h             |  177 +++
 hw/display/virtio-vga.h                    |   32 +
 include/hw/virtio/vhost-backend.h          |    2 +
 include/hw/virtio/virtio-gpu-bswap.h       |   61 +
 include/hw/virtio/virtio-gpu-pci.h         |   40 +
 include/hw/virtio/virtio-gpu-pixman.h      |   45 +
 include/hw/virtio/virtio-gpu.h             |   92 +-
 contrib/libvhost-user/libvhost-user.c      |    1 +
 contrib/vhost-user-gpu/main.c              | 1185 ++++++++++++++++++++
 contrib/vhost-user-gpu/virgl.c             |  579 ++++++++++
 contrib/vhost-user-gpu/vugbm.c             |  331 ++++++
 hw/display/vhost-user-gpu-pci.c            |   51 +
 hw/display/vhost-user-gpu.c                |  607 ++++++++++
 hw/display/vhost-user-vga.c                |   52 +
 hw/display/virtio-gpu-3d.c                 |   49 +-
 hw/display/virtio-gpu-base.c               |  268 +++++
 hw/display/virtio-gpu-pci.c                |   55 +-
 hw/display/virtio-gpu.c                    |  444 ++------
 hw/display/virtio-vga.c                    |  138 +--
 hw/virtio/vhost-user.c                     |   11 +
 vl.c                                       |    1 +
 MAINTAINERS                                |   10 +-
 Makefile                                   |   24 +-
 Makefile.objs                              |    1 +
 contrib/vhost-user-gpu/50-qemu-gpu.json.in |    5 +
 contrib/vhost-user-gpu/Makefile.objs       |   10 +
 docs/interop/index.rst                     |    2 +-
 docs/interop/vhost-user-gpu.rst            |  243 ++++
 docs/interop/vhost-user.txt                |    9 +
 hw/display/Kconfig                         |   10 +
 hw/display/Makefile.objs                   |    5 +-
 rules.mak                                  |    9 +-
 util/Makefile.objs                         |    2 +-
 37 files changed, 4176 insertions(+), 485 deletions(-)
 create mode 100644 contrib/vhost-user-gpu/virgl.h
 create mode 100644 contrib/vhost-user-gpu/vugbm.h
 create mode 100644 contrib/vhost-user-gpu/vugpu.h
 create mode 100644 hw/display/virtio-vga.h
 create mode 100644 include/hw/virtio/virtio-gpu-bswap.h
 create mode 100644 include/hw/virtio/virtio-gpu-pci.h
 create mode 100644 include/hw/virtio/virtio-gpu-pixman.h
 create mode 100644 contrib/vhost-user-gpu/main.c
 create mode 100644 contrib/vhost-user-gpu/virgl.c
 create mode 100644 contrib/vhost-user-gpu/vugbm.c
 create mode 100644 hw/display/vhost-user-gpu-pci.c
 create mode 100644 hw/display/vhost-user-gpu.c
 create mode 100644 hw/display/vhost-user-vga.c
 create mode 100644 hw/display/virtio-gpu-base.c
 create mode 100644 contrib/vhost-user-gpu/50-qemu-gpu.json.in
 create mode 100644 contrib/vhost-user-gpu/Makefile.objs
 create mode 100644 docs/interop/vhost-user-gpu.rst

--=20
2.21.0.777.g83232e3864


