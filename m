Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28224F426
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 10:33:27 +0200 (CEST)
Received: from localhost ([::1]:47912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kA7uw-0003c4-Fi
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 04:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kA7tn-0002Vh-CK; Mon, 24 Aug 2020 04:32:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:37750 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kA7tk-0003dH-3N; Mon, 24 Aug 2020 04:32:14 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kA7tL-000xK2-2N; Mon, 24 Aug 2020 11:31:47 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 0/4] Apply COR-filter to the block-stream permanently
Date: Mon, 24 Aug 2020 11:31:50 +0300
Message-Id: <1598257914-887267-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 04:32:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note: this series is based on the another one "block: Deal with filters"
      by Max Reitz that could be found in the branches:
      https://git.xanclic.moe/XanClic/qemu child-access-functions-v6
      https://github.com/XanClic/qemu child-access-functions-v6

v7:
  01: A complete reversion of the commit c624b015bf14f "block/stream:
      introduce a bottom node" doesn't make a sense as the patch
      "stream: Deal with filters" replaces the concept of the
      'bottom node' with the one of the 'base_overlay' and the
      'above_base', introduced by Max in the series "block: Deal with
      filters".
  02: #include "block/block-copy.h" was removed.
      The extra "state->active = true" was dropped.
      The comment about the bdrv_child_refresh_perms() supplied.
  03: "filter_node_name = NULL" dropped in the qmp_block_stream().
  04: The comment to the commit was extended with an explanation of
      why the test case 'test_stream_parallel' was removed.
      Due to the v6 review, the initial "char *base_fmt" is kept for
      the final backing file change no more. I urge to keep it.

The v6 Message-Id:
<1597785880-431103-1-git-send-email-andrey.shinkevich@virtuozzo.com>

Andrey Shinkevich (4):
  copy-on-read: Support preadv/pwritev_part functions
  copy-on-read: add filter append/drop functions
  qapi: add filter-node-name to block-stream
  block: apply COR-filter to block-stream jobs

 block/copy-on-read.c           | 132 +++++++++++++++++++++++++++++++++++++----
 block/copy-on-read.h           |  35 +++++++++++
 block/monitor/block-hmp-cmds.c |   4 +-
 block/stream.c                 |  62 ++++++++++++++-----
 blockdev.c                     |   4 +-
 include/block/block_int.h      |   7 ++-
 qapi/block-core.json           |   6 ++
 tests/qemu-iotests/030         |  50 ++--------------
 tests/qemu-iotests/030.out     |   4 +-
 tests/qemu-iotests/245         |  19 ++++--
 10 files changed, 240 insertions(+), 83 deletions(-)
 create mode 100644 block/copy-on-read.h

-- 
1.8.3.1


