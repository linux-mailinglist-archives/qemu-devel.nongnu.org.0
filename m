Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B839DF19
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 11:16:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL2OV-00089G-Hs
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 05:16:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hL2HL-0002RK-Hq
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:08:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hL2HJ-0003vt-NQ
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 05:08:51 -0400
Received: from relay.sw.ru ([185.231.240.75]:32872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hL2HJ-0003sR-EQ; Mon, 29 Apr 2019 05:08:49 -0400
Received: from [10.28.8.145] (helo=kvm.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hL2HD-0002jV-D5; Mon, 29 Apr 2019 12:08:43 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon, 29 Apr 2019 12:08:37 +0300
Message-Id: <20190429090842.57910-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v7 0/5] backup-top: preparing refactoring
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
	jsnow@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

Here some refactoring patches, as a first step for backup-top filter
introduction.

v7:
01,03,04: add Max's r-b
05: fix s/return NULL/goto error/ [Max]

v6:
01: - use end_cluster instead of last_cluster and fix bug in
      calculation [Max]
02: only rebased on 01, keep r-b
03, 04: new
05: it's rewritten
    "[PATCH v5 10/11] block/backup: tiny refactor backup_job_create",
    to make it more useful in general than just code movement inside
    one function

Vladimir Sementsov-Ogievskiy (5):
  block/backup: simplify backup_incremental_init_copy_bitmap
  block/backup: move to copy_bitmap with granularity
  block/backup: refactor and tolerate unallocated cluster skipping
  block/backup: unify different modes code path
  block/backup: refactor: split out backup_calculate_cluster_size

 block/backup.c | 243 +++++++++++++++++++++----------------------------
 1 file changed, 105 insertions(+), 138 deletions(-)

-- 
2.18.0


