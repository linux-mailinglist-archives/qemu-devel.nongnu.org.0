Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C988B2CC546
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:35:37 +0100 (CET)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWyW-0006r7-SJ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:35:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuI-0001do-MT; Wed, 02 Dec 2020 13:31:14 -0500
Received: from relay.sw.ru ([185.231.240.75]:49922 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWuB-000104-5a; Wed, 02 Dec 2020 13:31:14 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWtu-00BTPZ-6O; Wed, 02 Dec 2020 21:30:50 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH v13 00/10] Apply COR-filter to the block-stream permanently
Date: Wed,  2 Dec 2020 21:30:51 +0300
Message-Id: <1606933861-297777-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
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

The previous version 12 was discussed in the email thread:
Message-Id: <1603390423-980205-1-git-send-email-andrey.shinkevich@virtuozzo.com>

v13:
  02: The bdrv_remove_node() was dropped.
  05: Three patches with fixes were merged into one.
  06: Minor changes based on Vladimir's suggestions.
  08: Three patches with fixes were merged into one.
  09: The search for format_name of backing file was added.
  10: The flag BLK_PERM_GRAPH_MOD was removed.

Andrey Shinkevich (10):
  copy-on-read: support preadv/pwritev_part functions
  block: add API function to insert a node
  copy-on-read: add filter drop function
  qapi: add filter-node-name to block-stream
  qapi: create BlockdevOptionsCor structure for COR driver
  iotests: add #310 to test bottom node in COR driver
  block: include supported_read_flags into BDS structure
  copy-on-read: skip non-guest reads if no copy needed
  stream: skip filters when writing backing file name to QCOW2 header
  block: apply COR-filter to block-stream jobs

 block.c                        |  25 +++++++
 block/copy-on-read.c           | 143 +++++++++++++++++++++++++++++++++++++----
 block/copy-on-read.h           |  32 +++++++++
 block/io.c                     |  12 +++-
 block/monitor/block-hmp-cmds.c |   4 +-
 block/stream.c                 | 120 +++++++++++++++++++++++-----------
 blockdev.c                     |  12 ++--
 include/block/block.h          |  10 ++-
 include/block/block_int.h      |  11 +++-
 qapi/block-core.json           |  27 +++++++-
 tests/qemu-iotests/030         |  51 ++-------------
 tests/qemu-iotests/030.out     |   4 +-
 tests/qemu-iotests/141.out     |   2 +-
 tests/qemu-iotests/245         |  22 +++++--
 tests/qemu-iotests/310         | 114 ++++++++++++++++++++++++++++++++
 tests/qemu-iotests/310.out     |  15 +++++
 tests/qemu-iotests/group       |   1 +
 17 files changed, 484 insertions(+), 121 deletions(-)
 create mode 100644 block/copy-on-read.h
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out

-- 
1.8.3.1


