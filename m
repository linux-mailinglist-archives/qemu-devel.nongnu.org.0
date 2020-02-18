Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272FF16245D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 11:17:23 +0100 (CET)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3zwQ-0004bg-3v
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 05:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zv7-0002xv-HW
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <f.gruenbichler@proxmox.com>) id 1j3zv6-0007tJ-EH
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 05:16:01 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:52101)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <f.gruenbichler@proxmox.com>)
 id 1j3zv3-0007qG-8g; Tue, 18 Feb 2020 05:15:57 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id E1819419A3;
 Tue, 18 Feb 2020 11:07:54 +0100 (CET)
From: =?UTF-8?q?Fabian=20Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu 0/6] mirror: implement incremental and bitmap modes
Date: Tue, 18 Feb 2020 11:07:34 +0100
Message-Id: <20200218100740.2228521-1-f.gruenbichler@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.180
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

picking up on John's in-progress patch series from last summer, this is
a stab at rebasing and adding test cases for the low-hanging fruits:

- bitmap mirror mode with always/on-success/never bitmap sync mode
- incremental mirror mode as sugar for bitmap + on-success

Fabian Gr=C3=BCnbichler (4):
  mirror: add check for bitmap-mode without bitmap
  mirror: switch to bdrv_dirty_bitmap_merge_internal
  iotests: add test for bitmap mirror
  mirror: move some checks to QMP

John Snow (2):
  drive-mirror: add support for sync=3Dbitmap mode=3Dnever
  drive-mirror: add support for conditional and always bitmap sync modes

 include/block/block_int.h   |    4 +-
 block/mirror.c              |   96 +-
 blockdev.c                  |   71 +-
 tests/test-block-iothread.c |    4 +-
 qapi/block-core.json        |   29 +-
 tests/qemu-iotests/284      |  547 +++++++
 tests/qemu-iotests/284.out  | 2846 +++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/group    |    1 +
 8 files changed, 3567 insertions(+), 31 deletions(-)
 create mode 100755 tests/qemu-iotests/284
 create mode 100644 tests/qemu-iotests/284.out

--=20
2.20.1



