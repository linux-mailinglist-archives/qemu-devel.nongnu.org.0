Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AEEC8B4B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 16:31:28 +0200 (CEST)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFff5-0004lx-Jd
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 10:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iFfWx-0005hw-8H
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 10:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1iFfWv-0005bm-NN
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 10:23:03 -0400
Received: from relay.sw.ru ([185.231.240.75]:53316)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iFfWv-0005Zh-D0; Wed, 02 Oct 2019 10:23:01 -0400
Received: from [172.16.25.136] (helo=dhcp-172-16-25-136.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1iFfWr-0003C3-2H; Wed, 02 Oct 2019 17:22:57 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v2 0/6] qcow2: advanced compression options
Date: Wed,  2 Oct 2019 17:22:40 +0300
Message-Id: <1570026166-748566-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 jsnow@redhat.com, armbru@redhat.com, dgilbert@redhat.com, stefanha@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New enhancements for writing compressed data to QCOW2 image.

The preceding patches have been queued in the Max's block branch:

Based-on: https://github.com/XanClic/qemu.git block

v2:
    The number of parameters in nbd_export_new() has been reduced by
    the introduced flags for all the boolean ones (suggested by Eric).

Andrey Shinkevich (6):
  qcow2: Allow writing compressed data to multiple clusters
  tests/qemu-iotests: add case of writing compressed data to multiple
    clusters
  qemu-nbd: add compression flag support
  block: support compressed write for copy-on-read
  block-stream: add compress option
  tests/qemu-iotests: add case for block-stream compress

 block/io.c                 |  21 +++++++--
 block/qcow2.c              | 113 ++++++++++++++++++++++++++++++++++-----------
 block/stream.c             |  19 +++++---
 block/trace-events         |   2 +-
 blockdev-nbd.c             |   8 +++-
 blockdev.c                 |  14 +++++-
 hmp-commands.hx            |   4 +-
 include/block/block_int.h  |   3 +-
 include/block/nbd.h        |  11 ++++-
 monitor/hmp-cmds.c         |   5 +-
 nbd/server.c               |  14 ++++--
 qapi/block-core.json       |   5 +-
 qemu-nbd.c                 |  30 ++++++++++--
 qemu-nbd.texi              |   2 +
 tests/qemu-iotests/030     |  49 +++++++++++++++++++-
 tests/qemu-iotests/030.out |   4 +-
 tests/qemu-iotests/214     |   9 ++++
 tests/qemu-iotests/214.out |   6 +++
 18 files changed, 257 insertions(+), 62 deletions(-)

-- 
1.8.3.1


