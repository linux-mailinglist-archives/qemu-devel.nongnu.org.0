Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253910E9FA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 13:17:48 +0100 (CET)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibkeB-00019E-CH
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 07:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ibkbm-00086G-5I
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 07:15:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1ibkbl-0005qB-13
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 07:15:18 -0500
Received: from relay.sw.ru ([185.231.240.75]:44994)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ibkbk-0005nx-PM; Mon, 02 Dec 2019 07:15:16 -0500
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1ibkba-0005N6-Jt; Mon, 02 Dec 2019 15:15:06 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH v12 0/3] qcow2: advanced compression options
Date: Mon,  2 Dec 2019 15:15:03 +0300
Message-Id: <1575288906-551879-1-git-send-email-andrey.shinkevich@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compression filter driver is introduced as suggested by Max.
A sample usage of the filter can be found in the test #214.
Now, multiple clusters can be written compressed.
It is useful for the backup job.

v12:
  01: Missed to change the driver interface .bdrv_co_block_status
      from _status_from_backing to _status_from_file (noticed by
      Vladimir).

Andrey Shinkevich (3):
  block: introduce compress filter driver
  qcow2: Allow writing compressed data of multiple clusters
  tests/qemu-iotests: add case to write compressed data of multiple
    clusters

 block/Makefile.objs        |   1 +
 block/filter-compress.c    | 168 +++++++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c              | 102 +++++++++++++++++++--------
 qapi/block-core.json       |  10 +--
 tests/qemu-iotests/214     |  43 ++++++++++++
 tests/qemu-iotests/214.out |  14 ++++
 6 files changed, 307 insertions(+), 31 deletions(-)
 create mode 100644 block/filter-compress.c

-- 
1.8.3.1


