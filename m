Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF391864F0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 07:14:34 +0100 (CET)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDj1F-0000p3-AS
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 02:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jDitk-0007es-Fh
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 02:06:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jDitj-0008FO-Kn
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 02:06:48 -0400
Received: from relay.sw.ru ([185.231.240.75]:49928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jDitg-0007MJ-LT; Mon, 16 Mar 2020 02:06:44 -0400
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jDitX-0004fQ-Uz; Mon, 16 Mar 2020 09:06:36 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] zero pointer after bdrv_unref_child
Date: Mon, 16 Mar 2020 09:06:29 +0300
Message-Id: <20200316060631.30052-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

I faced use-after-free of bs->backing pointer after bdrv_unref_child in
bdrv_set_backing_hd.

Fix it, and do similar thing for s->data_file in qcow2.c.

I'm not sure that this is the full fix. Is it safe to keep bs->backing
during bdrv_unref_child itself? Is it safe to keep bs->backing during
all-child-unref loop in bdrv_close?


Vladimir Sementsov-Ogievskiy (2):
  block: bdrv_set_backing_bs: fix use-after-free
  block/qcow2: zero data_file child after free

 block.c       | 2 +-
 block/qcow2.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.21.0


