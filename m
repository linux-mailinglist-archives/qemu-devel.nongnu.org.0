Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C155432F5B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 14:16:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXlsu-0007TP-Pi
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 08:16:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hXlqU-000676-Ty
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hXldZ-0001qp-SP
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 08:00:27 -0400
Received: from relay.sw.ru ([185.231.240.75]:39518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hXldV-000126-KO; Mon, 03 Jun 2019 08:00:22 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hXldG-0002hc-1e; Mon, 03 Jun 2019 15:00:06 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 15:00:01 +0300
Message-Id: <20190603120005.37394-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/4] qapi: block-dirty-bitmap-remove
 transaction action
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
	armbru@redhat.com, mreitz@redhat.com,
	nshirokovskiy@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here is block-dirty-bitmap-remove transaction action.

It is used to do transactional movement of the bitmap (which is
possible in conjunction with merge command). Transactional bitmap
movement is needed in scenarios with external snapshot, when we don't
want to leave copy of the bitmap in the base image.

Implementation itself in 03, in short:

.prepare: make bitmap unnamed and non-persistent, delete stored version
          of the bitmap from the image

.commit: release bitmap

.abort: restore bitmap name and persistence. We don't restore bitmap
        version in the image. It's not critical, we have in-RAM version,
        it will be stored on shutdown

Vladimir Sementsov-Ogievskiy (4):
  blockdev: reduce aio_context locked sections in bitmap add/remove
  block/dirty-bitmap: add hide/unhide API
  qapi: implement block-dirty-bitmap-remove transaction action
  iotests: test bitmap moving inside 254

 qapi/transaction.json        |   2 +
 include/block/dirty-bitmap.h |   2 +
 block/dirty-bitmap.c         |  26 +++++++++
 blockdev.c                   | 100 +++++++++++++++++++++++++++--------
 tests/qemu-iotests/254       |  30 ++++++++++-
 tests/qemu-iotests/254.out   |  82 ++++++++++++++++++++++++++++
 6 files changed, 219 insertions(+), 23 deletions(-)

-- 
2.18.0


