Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA61455E1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 14:26:30 +0100 (CET)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuG1c-0000h9-RE
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 08:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51889)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iuFyw-0006mX-2l
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iuFyv-0002MA-2L
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 08:23:42 -0500
Received: from relay.sw.ru ([185.231.240.75]:42282)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iuFys-0002Hx-Fg; Wed, 22 Jan 2020 08:23:38 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iuFyj-00057B-4J; Wed, 22 Jan 2020 16:23:29 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/7] Fix crashes on early shutdown during bitmaps postcopy
Date: Wed, 22 Jan 2020 16:23:21 +0300
Message-Id: <20200122132328.31156-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 quintela@redhat.com, dgilbert@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Patches 5 and 6 fixes two crashes, triggered by new test case in patch
7.

Vladimir Sementsov-Ogievskiy (7):
  migration/block-dirty-bitmap: refactor incoming state to be one struct
  migration/block-dirty-bitmap: rename finish_lock to just lock
  migration/block-dirty-bitmap: simplify dirty_bitmap_load_complete
  migration/block-dirty-bitmap: keep bitmap state for all bitmaps
  migration/block-dirty-bitmap: cancel migration on shutdown
  migration: handle to_src_file on target only for ram postcopy
  qemu-iotests/199: add early shutdown case to bitmaps postcopy

 migration/migration.h          |   1 +
 migration/block-dirty-bitmap.c | 171 +++++++++++++++++++++------------
 migration/migration.c          |   7 ++
 migration/savevm.c             |  19 ++--
 tests/qemu-iotests/199         |  12 ++-
 tests/qemu-iotests/199.out     |   4 +-
 6 files changed, 142 insertions(+), 72 deletions(-)

-- 
2.21.0


