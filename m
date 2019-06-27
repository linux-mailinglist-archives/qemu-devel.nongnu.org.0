Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBF58D16
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jun 2019 23:31:56 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgbzm-0006Dm-2C
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 17:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hgbwT-0004eB-OF
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 17:28:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hgbwS-0007O4-MT
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 17:28:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41778)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hgbwP-00073d-2n; Thu, 27 Jun 2019 17:28:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8197330821B2;
 Thu, 27 Jun 2019 21:28:22 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-47.bos.redhat.com [10.18.17.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF395D9D2;
 Thu, 27 Jun 2019 21:28:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 27 Jun 2019 17:28:13 -0400
Message-Id: <20190627212816.27298-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 27 Jun 2019 21:28:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH v2 0/3] python: refactor qemu/__init__.py
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a lot of code hiding in what is ostensibly a package
configuration file. Let's break that out into something more visible.

V2:
 - Retain python 2.7+ compatibility :(
 - Refactor shutdown a little more aggressively

John Snow (3):
  python/qemu: split QEMUMachine out from underneath __init__.py
  machine.py: minor delinting
  QEMUMachine: Don't suppress stack traces on close

 python/qemu/__init__.py                   | 502 +-------------------
 python/qemu/machine.py                    | 536 ++++++++++++++++++++++
 python/qemu/qtest.py                      |   2 +-
 scripts/device-crash-test                 |   2 +-
 scripts/render_block_graph.py             |   2 +-
 tests/acceptance/avocado_qemu/__init__.py |   2 +-
 tests/acceptance/virtio_version.py        |   2 +-
 tests/migration/guestperf/engine.py       |  22 +-
 tests/qemu-iotests/235                    |   2 +-
 tests/vm/basevm.py                        |   3 +-
 10 files changed, 556 insertions(+), 519 deletions(-)
 create mode 100644 python/qemu/machine.py

--=20
2.21.0


