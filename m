Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E750C24900E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 23:26:10 +0200 (CEST)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k897R-0007KC-Ew
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 17:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k8968-0005rK-Oe; Tue, 18 Aug 2020 17:24:48 -0400
Received: from relay.sw.ru ([185.231.240.75]:41582 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k8965-0003cZ-3K; Tue, 18 Aug 2020 17:24:48 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1k895p-000GtS-J8; Wed, 19 Aug 2020 00:24:29 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 0/4] Apply COR-filter to the block-stream permanently
Date: Wed, 19 Aug 2020 00:24:36 +0300
Message-Id: <1597785880-431103-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 17:24:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

v6:
  Re-based to the series "block: Deal with filters".
  The minimum number of patches were kept.
  Not all the iotests were checked for pass.
  
  04: The test case iotests:030:test_stream_parallel was removed
      due to multiple errors.

Andrey Shinkevich (4):
  copy-on-read: Support preadv/pwritev_part functions
  copy-on-read: add filter append/drop functions
  qapi: add filter-node-name to block-stream
  block: apply COR-filter to block-stream jobs

 block/copy-on-read.c           | 131 +++++++++++++++++++++++++++++++++++++----
 block/copy-on-read.h           |  36 +++++++++++
 block/monitor/block-hmp-cmds.c |   4 +-
 block/stream.c                 |  80 +++++++++++++++++--------
 blockdev.c                     |   8 ++-
 include/block/block_int.h      |   7 ++-
 qapi/block-core.json           |   6 ++
 tests/qemu-iotests/030         |  50 ++--------------
 tests/qemu-iotests/030.out     |   4 +-
 9 files changed, 240 insertions(+), 86 deletions(-)
 create mode 100644 block/copy-on-read.h

-- 
1.8.3.1


