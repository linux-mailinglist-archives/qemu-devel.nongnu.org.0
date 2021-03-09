Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F49332F3A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:44:06 +0100 (CET)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiGz-0002OB-Nj
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrU-0001Hq-8O; Tue, 09 Mar 2021 12:09:40 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrC-0001DQ-4Y; Tue, 09 Mar 2021 12:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=TbPMbyrBAGbP0pHYaa8WTpOrbOD1MNwfE3YnE1ItbUw=; 
 b=WbznzAJxXEHEsT7j+E0+rvL0AIf9WKCa68ZaoEolqEY/M98lcbFS4Zh8WhxTpDpKjs5tTp+YZ62PT35+nZXy7fGQt7kg1fjMWQTvgm8Iv6HPKJZ/fK20j9TgDYHWu9VvX6ik48naTfT/3cJCMnPeAoV8B8qODLKbOOPH2bS8VlXLfbaLUyDMKTzf3zzs3fksVEFfY5qyU3mlsnQoq0mYtbQXOLPa/uAca2DrtzCdjIkXeqxhGYYR69O/ZzSHF+9anWVCj3QTLpLidKqHFRePjWbuiI2F2EU9weSpAV9aLTSYsT5D3EIXLt0D+GOYxlBPnYkb3rkh8zE4toHTkdHx6g==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lJfqn-0003Lo-R0; Tue, 09 Mar 2021 18:08:53 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lJfqa-0005IR-IK; Tue, 09 Mar 2021 18:08:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] Allow changing bs->file on reopen
Date: Tue,  9 Mar 2021 18:08:26 +0100
Message-Id: <cover.1615309297.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20201127144522.29991-1-vsementsov@virtuozzo.com>

Hello,

here's the third version of the patches that allow replacing bs->file
using (x-)blockdev-reopen. You can read more details here:

https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html

In summary, the series does three things:

   - Allows replacing bs->file
   - Allows reopening multiple block devices with one single command.
   - Drops the x- prefix from the command name.

This is still depending on Vladimir's "update graph permissions
update" branch.

Regards,

Berto

v3:
- Patch 1: Move bdrv_reopen_queue_free() to a new patch
- Patch 2: Merge bdrv_reopen_parse_backing() and bdrv_reopen_parse_file()
- Patch 3: Add more tests
- Patch 4: Update documentation and fix iotest 296
- Patch 5: Minor updates to iotest 245
- Patch 6: New patch, drop the 'x-' prefix from x-blockdev-reopen

v2: https://lists.gnu.org/archive/html/qemu-block/2021-02/msg00623.html
v1: https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html

Output of git backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/6:[down] 'block: Add bdrv_reopen_queue_free()'
002/6:[0160] [FC] 'block: Allow changing bs->file on reopen'
003/6:[down] 'iotests: Test replacing files with x-blockdev-reopen'
004/6:[0042] [FC] 'block: Support multiple reopening with x-blockdev-reopen'
005/6:[0015] [FC] 'iotests: Test reopening multiple devices at the same time'
006/6:[down] 'block: Make blockdev-reopen stable API'

Alberto Garcia (6):
  block: Add bdrv_reopen_queue_free()
  block: Allow changing bs->file on reopen
  iotests: Test replacing files with x-blockdev-reopen
  block: Support multiple reopening with x-blockdev-reopen
  iotests: Test reopening multiple devices at the same time
  block: Make blockdev-reopen stable API

 qapi/block-core.json       |  24 ++---
 include/block/block.h      |   2 +
 block.c                    | 137 ++++++++++++++++----------
 blockdev.c                 |  85 +++++++++--------
 tests/qemu-iotests/155     |   9 +-
 tests/qemu-iotests/165     |   4 +-
 tests/qemu-iotests/245     | 190 +++++++++++++++++++++++++++++++++----
 tests/qemu-iotests/245.out |  11 ++-
 tests/qemu-iotests/248     |   4 +-
 tests/qemu-iotests/248.out |   2 +-
 tests/qemu-iotests/296     |  11 ++-
 tests/qemu-iotests/298     |   4 +-
 12 files changed, 351 insertions(+), 132 deletions(-)

-- 
2.20.1


