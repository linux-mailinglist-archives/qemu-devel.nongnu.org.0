Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24627CD98
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 14:45:46 +0200 (CEST)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNF0r-0003FD-6W
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 08:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kNEuN-0005Na-Jg; Tue, 29 Sep 2020 08:39:03 -0400
Received: from relay.sw.ru ([185.231.240.75]:34360 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kNEuK-0000IH-6t; Tue, 29 Sep 2020 08:39:02 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kNEtg-002EOe-Lw; Tue, 29 Sep 2020 15:38:20 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, jsnow@redhat.com, armbru@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v10 0/9] Apply COR-filter to the block-stream permanently
Date: Tue, 29 Sep 2020 15:38:20 +0300
Message-Id: <1601383109-110988-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 08:38:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

Despite the patch "freeze link to base node..." has been removed from the
series in the current version 9, the iotest case test_stream_parallel does
not pass after the COR-filter is inserted into the backing chain. As the
test case may not be initialized, it does not make a sense and was removed
again.
The check with bdrv_is_allocated_above() takes place in the COR-filter and
in the block-stream job both. An optimization of the block-stream job based
on the filter functionality may be made in a separate series.

v10:
  02: The missed new file block/copy-on-read.h added
v9:
  02: Refactored.
  04: Base node name is used instead of the file name.
  05: New implementation based on Max' review.
  06: New.
  07: New. The patch "freeze link to base node..." was deleted.
  08: New.
  09: The filter node options are initialized.

The v8 Message-Id:
<1598633579-221780-1-git-send-email-andrey.shinkevich@virtuozzo.com>

Andrey Shinkevich (9):
  copy-on-read: Support preadv/pwritev_part functions
  copy-on-read: add filter append/drop functions
  qapi: add filter-node-name to block-stream
  copy-on-read: pass base node name to COR driver
  copy-on-read: limit guest COR activity to base in COR driver
  copy-on-read: skip non-guest reads if no copy needed
  stream: skip filters when writing backing file name to QCOW2 header
  block: remove unused backing-file name parameter
  block: apply COR-filter to block-stream jobs

 block/copy-on-read.c           | 165 ++++++++++++++++++++++++++++++++++++++---
 block/copy-on-read.h           |  35 +++++++++
 block/io.c                     |   2 +-
 block/monitor/block-hmp-cmds.c |   6 +-
 block/stream.c                 | 112 +++++++++++++++++-----------
 blockdev.c                     |  21 +-----
 include/block/block_int.h      |   9 ++-
 qapi/block-core.json           |  23 ++----
 tests/qemu-iotests/030         |  51 ++-----------
 tests/qemu-iotests/030.out     |   4 +-
 tests/qemu-iotests/141.out     |   2 +-
 tests/qemu-iotests/245         |  19 +++--
 12 files changed, 302 insertions(+), 147 deletions(-)
 create mode 100644 block/copy-on-read.h

-- 
1.8.3.1


