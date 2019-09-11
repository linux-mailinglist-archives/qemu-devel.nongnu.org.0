Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F11B0035
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 17:37:30 +0200 (CEST)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i84gT-00052H-6R
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 11:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i847d-0000wI-QU
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:01:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i847Y-0003rC-95
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 11:01:28 -0400
Received: from relay.sw.ru ([185.231.240.75]:38498)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i847C-0003fd-A7; Wed, 11 Sep 2019 11:01:05 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i8474-0002Ew-D6; Wed, 11 Sep 2019 18:00:54 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Wed, 11 Sep 2019 18:00:51 +0300
Message-Id: <20190911150054.90936-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 0/3] proper locking on bitmap add/remove
 paths
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

We need to lock qcow2 mutex on accessing in-image metadata, especially
on updating this metadata. Let's implement it.

v2:

fix uninitialized variable in 03, found by Patchew

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
 block/qcow2-bitmap.c         |  38 ++++++-----
 block/qcow2.c                |   5 +-
 blockdev.c                   |  28 +++------
 8 files changed, 164 insertions(+), 81 deletions(-)

-- 
2.18.0


