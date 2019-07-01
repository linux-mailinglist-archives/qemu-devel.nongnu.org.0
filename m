Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D454D2DFD5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 16:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVze8-0003UO-0r
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 10:33:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hVzcK-0002dz-9O
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:31:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hVzcJ-0004eQ-Aj
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:31:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hVzcI-0004BA-Uv
	for qemu-devel@nongnu.org; Wed, 29 May 2019 10:31:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A2FAA3B48;
	Wed, 29 May 2019 14:31:15 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-181.brq.redhat.com
	[10.40.204.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6DBE611AD;
	Wed, 29 May 2019 14:31:07 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 16:31:02 +0200
Message-Id: <20190529143106.11789-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 29 May 2019 14:31:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 0/4] rng-builtin: add an RNG backend that
 uses qemu_guest_getrandom()
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kashyap Chamarthy <kchamart@redhat.com>, Amit Shah <amit@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new RNG backend using QEMU builtin getrandom function.

v7: rebase on master
    Make rng-builtin asynchronous with QEMUBH (removed existing R-b)

v6: remove "sysemu/rng-random.h" from virtio-rng.c
    rebase on qemu_getrandom v8

v5: PATCH 1 s/linux/Linux/
    remove superfluous includes from rng-builtin.c
    don't update rng-random documentation
    add a patch from Markus to keep the default backend out of VirtIORNGC=
onf
    move TYPE_RNG_BUILTIN to sysemu/rng.h and remove sysemu/rng-builtin.h

v4: update PATCH 1 commit message

v3: Include Kashyap's patch in the series
    Add a patch to change virtio-rng default backend to rng-builtin

v2: Update qemu-options.hx
    describe the new backend and specify virtio-rng uses the
    rng-random by default

Kashyap Chamarthy (1):
  VirtIO-RNG: Update default entropy source to `/dev/urandom`

Laurent Vivier (2):
  rng-builtin: add an RNG backend that uses qemu_guest_getrandom()
  virtio-rng: change default backend to rng-builtin

Markus Armbruster (1):
  virtio-rng: Keep the default backend out of VirtIORNGConf

 backends/Makefile.objs         |  2 +-
 backends/rng-builtin.c         | 77 ++++++++++++++++++++++++++++++++++
 backends/rng-random.c          |  2 +-
 hw/virtio/virtio-rng.c         | 19 ++++-----
 include/hw/virtio/virtio-rng.h |  2 -
 include/sysemu/rng.h           |  2 +
 qemu-options.hx                |  9 +++-
 7 files changed, 97 insertions(+), 16 deletions(-)
 create mode 100644 backends/rng-builtin.c

--=20
2.20.1


