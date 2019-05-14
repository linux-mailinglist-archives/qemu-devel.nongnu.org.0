Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED91C43B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 09:58:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41422 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQSKJ-0002EZ-Eo
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 03:58:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hQSIF-0001E2-Ay
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:56:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hQSIE-00043u-CV
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:56:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hQSIE-00041U-7L
	for qemu-devel@nongnu.org; Tue, 14 May 2019 03:56:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E5F3C024920;
	Tue, 14 May 2019 07:56:08 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.40.205.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD9263F65;
	Tue, 14 May 2019 07:56:03 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 09:55:59 +0200
Message-Id: <20190514075602.7674-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 14 May 2019 07:56:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 0/3] rng-builtin: add an RNG backend that
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
	Kashyap Chamarthy <kchamart@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, Amit Shah <amit@kernel.org>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new RNG backend using QEMU builtin getrandom function.

This patch applies on top of
    "[PATCH v6 00/24] Add qemu_getrandom and ARMv8.5-RNG etc"
Based-on: 20190510173049.28171-1-richard.henderson@linaro.org

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

 backends/Makefile.objs         |  2 +-
 backends/rng-builtin.c         | 54 ++++++++++++++++++++++++++++++++++
 backends/rng-random.c          |  2 +-
 hw/virtio/virtio-rng.c         |  2 +-
 include/hw/virtio/virtio-rng.h |  4 +--
 include/sysemu/rng-builtin.h   | 17 +++++++++++
 qemu-options.hx                |  9 +++++-
 7 files changed, 84 insertions(+), 6 deletions(-)
 create mode 100644 backends/rng-builtin.c
 create mode 100644 include/sysemu/rng-builtin.h

--=20
2.20.1


