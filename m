Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA020788
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 15:03:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRG2p-0003lf-6I
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 09:03:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hRFTy-0007ud-J2
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:27:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hRFTv-00087B-H5
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:27:34 -0400
Received: from relay.sw.ru ([185.231.240.75]:33898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hRFTv-00085D-9w; Thu, 16 May 2019 08:27:31 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hRFTp-0006Eb-Rd; Thu, 16 May 2019 15:27:25 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Thu, 16 May 2019 15:27:23 +0300
Message-Id: <20190516122725.132334-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/2] bitmaps: merge bitmaps from different nodes
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
	den@virtuozzo.com, armbru@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

We need to copy bitmaps to new top node on external snapshot, to
not break incremental backup chain.

The only thing to do is to allow block-dirty-bitmap-merge to work
with different nodes, here it is.

Vladimir Sementsov-Ogievskiy (2):
  qapi: support external bitmaps in block-dirty-bitmap-merge
  iotests: test external snapshot with bitmap copying

 qapi/block-core.json       | 13 +++++++---
 block/dirty-bitmap.c       |  9 ++++---
 blockdev.c                 | 46 +++++++++++++++++++++++----------
 tests/qemu-iotests/254     | 52 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/254.out | 53 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/group   |  1 +
 6 files changed, 154 insertions(+), 20 deletions(-)
 create mode 100755 tests/qemu-iotests/254
 create mode 100644 tests/qemu-iotests/254.out

-- 
2.18.0


