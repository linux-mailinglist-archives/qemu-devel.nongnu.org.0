Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB5233F74F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:44:34 +0100 (CET)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaDh-0001rH-JO
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmk-0003dN-ED; Wed, 17 Mar 2021 13:16:42 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmh-0006rX-3b; Wed, 17 Mar 2021 13:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=cLVaGAUvkg/g3oAxIv0vJ35DHI4M0jIdl3N6yCvATAY=; 
 b=Zji3HBB0f0jm3qsFr6c49acYqyyp3G+U2R3rEjyF3bnymSL8EUffAmLngRBFKKir1H2daBDerM2C9sPKHnmGcnzjFBLvj9n/6LS7/BPDqTuk9fhMK4JMRKr4CUDCf+4vNG41IvS+Wu8ku86cHFTJABlFliSsTwCkNHDomMt7nV58bDRV1tdpliLABEBCa5EuYkcxmJTysSEqHPMHAnqd3MDpDb4lgsJ9fu5IAYXIlI+D4KdFmGwTRUqThJ/TubJqsYVnN19HMiAi4lq+TQab5ODRS7i1Jr/l+f2DTlXQYg6r7es0mzM/3WzJ2xLkxOXagT+Q01bnXp57kAcuVTQc/g==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lMZmd-0003uw-EG; Wed, 17 Mar 2021 18:16:35 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lMZmQ-0007RS-B1; Wed, 17 Mar 2021 18:16:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] Allow changing bs->file on reopen
Date: Wed, 17 Mar 2021 18:15:51 +0100
Message-Id: <cover.1616000692.git.berto@igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210317143529.615584-1-vsementsov@virtuozzo.com>

Hello,

this is the same as v3, but rebased on top of Vladimir's "block:
update graph permissions update v3", which you can get here:

git: https://src.openvz.org/scm/~vsementsov/qemu.git
tag: up-block-topologic-perm-v3

Tip: you may find it easier to review patch 4 if you use 'git diff -w'
since a big part of the changes that you see in
qmp_x_blockdev_reopen() are just indentation changes.

Berto

v4:
- Rebase on top of version 3 of Vladimir's branch
v3: https://lists.gnu.org/archive/html/qemu-block/2021-03/msg00553.html
v2: https://lists.gnu.org/archive/html/qemu-block/2021-02/msg00623.html
v1: https://lists.gnu.org/archive/html/qemu-block/2021-01/msg00437.html

Output of git backport-diff against v3:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/6:[----] [--] 'block: Add bdrv_reopen_queue_free()'
002/6:[0018] [FC] 'block: Allow changing bs->file on reopen'
003/6:[----] [--] 'iotests: Test replacing files with x-blockdev-reopen'
004/6:[0071] [FC] 'block: Support multiple reopening with x-blockdev-reopen'
005/6:[----] [--] 'iotests: Test reopening multiple devices at the same time'
006/6:[----] [-C] 'block: Make blockdev-reopen stable API'

Alberto Garcia (6):
  block: Add bdrv_reopen_queue_free()
  block: Allow changing bs->file on reopen
  iotests: Test replacing files with x-blockdev-reopen
  block: Support multiple reopening with x-blockdev-reopen
  iotests: Test reopening multiple devices at the same time
  block: Make blockdev-reopen stable API

 qapi/block-core.json       |  24 ++---
 include/block/block.h      |   2 +
 block.c                    | 135 ++++++++++++++++----------
 blockdev.c                 |  78 +++++++++------
 tests/qemu-iotests/155     |   9 +-
 tests/qemu-iotests/165     |   4 +-
 tests/qemu-iotests/245     | 190 +++++++++++++++++++++++++++++++++----
 tests/qemu-iotests/245.out |  11 ++-
 tests/qemu-iotests/248     |   4 +-
 tests/qemu-iotests/248.out |   2 +-
 tests/qemu-iotests/296     |  11 ++-
 tests/qemu-iotests/298     |   4 +-
 12 files changed, 351 insertions(+), 123 deletions(-)

-- 
2.20.1


