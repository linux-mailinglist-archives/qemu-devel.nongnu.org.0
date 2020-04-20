Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADF1B14D4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 20:39:19 +0200 (CEST)
Received: from localhost ([::1]:40652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQbKA-0003BX-3N
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 14:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbI2-0000vy-LL
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:09 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1jQbI0-0003wk-77
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 14:37:06 -0400
Received: from relay.sw.ru ([185.231.240.75]:39810)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHs-0003NK-3F; Mon, 20 Apr 2020 14:36:56 -0400
Received: from dhcp-172-16-25-136.sw.ru ([172.16.25.136] helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1jQbHi-0001xO-J8; Mon, 20 Apr 2020 21:36:46 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/7] Apply COR-filter to the block-stream permanently
Date: Mon, 20 Apr 2020 21:36:39 +0300
Message-Id: <1587407806-109784-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay.sw.ru
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 14:36:51
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
 qemu-devel@nongnu.org, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 mreitz@redhat.com, jsnow@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note: this series is based on the one "block: Deal with filters"
      by Max Reitz that can be found in the branches:

      https://git.xanclic.moe/XanClic/qemu child-access-functions-v6
      https://github.com/XanClic/qemu child-access-functions-v6

      When running iotests, apply "char-socket: Fix race condition"
      to avoid sporadic segmentation faults.

With this series, all the block-stream COR operations pass through
the COR-filter.

Andrey Shinkevich (7):
  block: prepare block-stream for using COR-filter
  stream: exclude a link to filter from freezing
  block: protect parallel jobs from overlapping
  copy-on-read: Support refreshing filename
  qapi: add filter-node-name to block-stream
  iotests: prepare 245 for using filter in block-stream
  block: apply COR-filter to block-stream jobs

 block/copy-on-read.c       |   7 ++
 block/stream.c             | 170 +++++++++++++++++++++++++++++++++++++++------
 blockdev.c                 |  15 +++-
 blockjob.c                 |  15 +++-
 include/block/block_int.h  |   7 +-
 monitor/hmp-cmds.c         |   4 +-
 qapi/block-core.json       |   6 ++
 tests/qemu-iotests/030     |   6 +-
 tests/qemu-iotests/141.out |   2 +-
 tests/qemu-iotests/245     |  15 ++--
 10 files changed, 210 insertions(+), 37 deletions(-)

-- 
1.8.3.1


