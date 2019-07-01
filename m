Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EADE2D09A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 22:44:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVix3-0006FM-Ix
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 16:44:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hVivV-0005g2-Nd
	for qemu-devel@nongnu.org; Tue, 28 May 2019 16:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hVivU-0001Bx-RX
	for qemu-devel@nongnu.org; Tue, 28 May 2019 16:42:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41784)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1hVivU-0001AT-L9
	for qemu-devel@nongnu.org; Tue, 28 May 2019 16:42:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43CCE3001835
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 20:42:23 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C549410018F9;
	Tue, 28 May 2019 20:42:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2019 16:42:18 -0400
Message-Id: <20190528204220.9615-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 28 May 2019 20:42:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH 0/2] python: refactor qemu/__init__.py
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
Cc: John Snow <jsnow@redhat.com>, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a lot of code hiding in what is ostensibly a package
configuration file. Let's break that out into something more visible.

This is based on top of a recent patch I sent to Max;
"[Qemu-devel] [PATCH v2] event_match: always match on None value".

John Snow (2):
  python/qemu: split QEMUMachine out from underneath __init__.py
  machine.py: minor delinting

 python/qemu/__init__.py                   | 502 +--------------------
 python/qemu/machine.py                    | 527 ++++++++++++++++++++++
 python/qemu/qtest.py                      |   2 +-
 scripts/device-crash-test                 |   2 +-
 scripts/render_block_graph.py             |   2 +-
 tests/acceptance/avocado_qemu/__init__.py |   2 +-
 tests/acceptance/virtio_version.py        |   2 +-
 tests/migration/guestperf/engine.py       |  22 +-
 tests/qemu-iotests/235                    |   2 +-
 tests/vm/basevm.py                        |   3 +-
 10 files changed, 547 insertions(+), 519 deletions(-)
 create mode 100644 python/qemu/machine.py

--=20
2.20.1


