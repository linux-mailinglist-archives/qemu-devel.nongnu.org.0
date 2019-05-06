Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C2614BD8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 16:32:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNefa-0001ml-Hg
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 10:32:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hNeap-0006Or-UL
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hNeao-0000cl-Qp
	for qemu-devel@nongnu.org; Mon, 06 May 2019 10:27:47 -0400
Received: from relay.sw.ru ([185.231.240.75]:45610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hNeao-0000bc-H7; Mon, 06 May 2019 10:27:46 -0400
Received: from [10.28.8.145] (helo=kvm.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hNeaj-000444-Jj; Mon, 06 May 2019 17:27:41 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon,  6 May 2019 17:27:33 +0300
Message-Id: <20190506142741.41731-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v6 0/8] qcow2: encryption threads
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
	mreitz@redhat.com, den@openvz.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v6:
 - Rebase on master, so 02 changed to reflect changes in
   qcow2_compress(), keep r-b.
 - Rewrite 06 to even simpler locking [Max], drop r-b
   Drop following
   "qcow2: qcow2_co_preadv: skip using hd_qiov when possible", I'll do
   it in my other coming soon series, and it is actually unrelated to
   current.
 - Drop controversial perf test, hope I'll return to this topic, but not
   in context of these series.
 - Add Max's r-b's to all here, except 06

Vladimir Sementsov-Ogievskiy (8):
  qcow2.h: add missing include
  qcow2: add separate file for threaded data processing functions
  qcow2-threads: use thread_pool_submit_co
  qcow2-threads: qcow2_co_do_compress: protect queuing by mutex
  qcow2-threads: split out generic path
  qcow2: qcow2_co_preadv: improve locking
  qcow2: bdrv_co_pwritev: move encryption code out of the lock
  qcow2: do encryption in threads

 block/qcow2.h          |  20 ++-
 block/qcow2-bitmap.c   |   1 -
 block/qcow2-cache.c    |   1 -
 block/qcow2-cluster.c  |   8 +-
 block/qcow2-refcount.c |   1 -
 block/qcow2-snapshot.c |   1 -
 block/qcow2-threads.c  | 268 +++++++++++++++++++++++++++++++++++++++++
 block/qcow2.c          | 241 +++++-------------------------------
 block/Makefile.objs    |   2 +-
 9 files changed, 321 insertions(+), 222 deletions(-)
 create mode 100644 block/qcow2-threads.c

-- 
2.18.0


