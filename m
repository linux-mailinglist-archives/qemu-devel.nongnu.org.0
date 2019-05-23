Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C156428DED
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 01:42:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTxLx-0007sU-Gc
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 19:42:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hTxK3-00075R-Mn
	for qemu-devel@nongnu.org; Thu, 23 May 2019 19:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1hTxK2-00032i-P8
	for qemu-devel@nongnu.org; Thu, 23 May 2019 19:40:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1hTxK1-0002sN-1G
	for qemu-devel@nongnu.org; Thu, 23 May 2019 19:40:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0327811BD;
	Thu, 23 May 2019 23:40:22 +0000 (UTC)
Received: from localhost (ovpn-112-51.ams2.redhat.com [10.36.112.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7C4260BF3;
	Thu, 23 May 2019 23:40:12 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 01:40:07 +0200
Message-Id: <20190523234011.583-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 23 May 2019 23:40:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/4] tests/docker: add podman support
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
Cc: Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

podman allows to run containers in a similar fashion as docker, but
without daemon or root privileges. Thank you podman!

I haven't done extensive testing. Basic make docker-test rules
work. There seems to be a few issues with permissions at run time
(podman ps fails), but that seems not directly related to this series.

There was also a small issue running make check, due to not having
network address at all by default. See "qemu-sockets: do not require
configured ipv4/ipv6 address" patch for the proposed solution.

Marc-Andr=C3=A9 Lureau (4):
  docker.py: add podman support
  tests/docker: add podman support
  docker: update fedora to f30
  qemu-sockets: do not require configured ipv4/ipv6 address

 util/qemu-sockets.c                    |  8 ++---
 Makefile                               |  2 +-
 tests/docker/Makefile.include          | 17 ++++++++--
 tests/docker/docker.py                 | 43 +++++++++++++++++++++++---
 tests/docker/dockerfiles/fedora.docker |  2 +-
 5 files changed, 56 insertions(+), 16 deletions(-)

--=20
2.22.0.rc1.1.g079e7d2849.dirty


