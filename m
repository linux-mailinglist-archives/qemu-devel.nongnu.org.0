Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E135CF0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 14:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYV86-0000Wy-1U
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 08:34:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYV5q-00081h-0N
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 08:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYV5p-0006KT-6Y
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 08:32:37 -0400
Received: from relay.sw.ru ([185.231.240.75]:52312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYV5o-0006EF-To; Wed, 05 Jun 2019 08:32:37 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYV5h-0001rG-RV; Wed, 05 Jun 2019 15:32:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Wed,  5 Jun 2019 15:32:27 +0300
Message-Id: <20190605123229.92848-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 0/2] introduce pinned blk
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, jsnow@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all.

Here is a proposal of replacing workaround in mirror, when
we have to move filter node back to block-job blk after
bdrv_replace_node.

v2: rebased on updated blk_new, with aio context paramter.


Vladimir Sementsov-Ogievskiy (2):
  block: introduce pinned blk
  blockjob: use blk_new_pinned in block_job_create

 include/block/block_int.h      |  6 ++++++
 include/sysemu/block-backend.h |  2 ++
 block.c                        |  2 +-
 block/block-backend.c          | 25 ++++++++++++++++++++++++-
 block/mirror.c                 |  6 +-----
 blockjob.c                     |  2 +-
 6 files changed, 35 insertions(+), 8 deletions(-)

-- 
2.18.0


