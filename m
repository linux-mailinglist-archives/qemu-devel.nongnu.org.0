Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C022DB8CD2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 10:28:19 +0200 (CEST)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBEH4-0001jV-CS
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 04:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBEEh-0008DZ-1T
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 04:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iBEEf-0005PQ-SS
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 04:25:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:60548)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBEEc-0005Nh-PN; Fri, 20 Sep 2019 04:25:46 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iBEEZ-0004DS-Be; Fri, 20 Sep 2019 11:25:43 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/3] proper locking on bitmap add/remove paths
Date: Fri, 20 Sep 2019 11:25:40 +0300
Message-Id: <20190920082543.23444-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 armbru@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

We need to lock qcow2 mutex on accessing in-image metadata, especially
on updating this metadata. Let's implement it.

v3:
01: add John's r-b
02: - fix bdrv_remove_persistent_dirty_bitmap return value
    - drop extra zeroing of ret in qcow2_remove_persistent_dirty_bitmap
03: add John's r-b

Vladimir Sementsov-Ogievskiy (3):
  block: move bdrv_can_store_new_dirty_bitmap to block/dirty-bitmap.c
  block/dirty-bitmap: return int from
    bdrv_remove_persistent_dirty_bitmap
  block/qcow2: proper locking on bitmap add/remove paths

 block/qcow2.h                |  14 ++---
 include/block/block_int.h    |  14 ++---
 include/block/dirty-bitmap.h |   5 +-
 block.c                      |  22 -------
 block/dirty-bitmap.c         | 119 +++++++++++++++++++++++++++++++++--
 block/qcow2-bitmap.c         |  36 +++++++----
 block/qcow2.c                |   5 +-
 blockdev.c                   |  28 +++------
 8 files changed, 163 insertions(+), 80 deletions(-)

-- 
2.21.0


