Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC63C8FA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 12:30:53 +0200 (CEST)
Received: from localhost ([::1]:55978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hae3I-0003xL-0R
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 06:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60355)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hae05-0002Ds-T3
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hae00-0001DJ-Iv
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:27:31 -0400
Received: from relay.sw.ru ([185.231.240.75]:45602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hadzz-0001Ad-Cb; Tue, 11 Jun 2019 06:27:28 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hadzt-00083J-BQ; Tue, 11 Jun 2019 13:27:21 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 11 Jun 2019 13:27:17 +0300
Message-Id: <20190611102720.86114-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 0/3] nbd: merge block/nbd.c and
 block/nbd-client.c
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

I need some fields of BDRVNBDState to be available in nbd-client.c
code for my nbd-reconnect series. This leads to the following idea:
It seems that there is no actual benefits in splitting
NBDClientSession out of BDRVNBDState and nbd-client.c out of nbd.c
It only increases confusion around nbd client architecture, and make
it different from other formats. So, I propose to merge them back.

The only thing I doubt in:
NBD client block driver is called "nbd", so, seems logical to keep
BDRVNBDState structure name and block/nbd.c filename. But I can't
rename all nbd_client_* handlers to nbd_*, as they start conflicting
with definitions in include/block/nbd.h (nbd_init for example). So,
for now I've kept old names, so, some handlers are nbd_* and some
nbd_client_*, which is definitely inconsistent.. So, maybe they
all should become block_nbd_ or bdrv_nbd_ or nbddrv_ or something
like this to stress that it is BlockDriver implementation, not
nbd/client.c code (separated from generic block layer). Or keep them
as is, a bit inconsistent. What do you think?

Vladimir Sementsov-Ogievskiy (3):
  block/nbd-client: drop stale logout
  block/nbd: merge nbd-client.* to nbd.c
  block/nbd: merge NBDClientSession struct back to BDRVNBDState

 block/nbd-client.h  |   72 ---
 block/nbd-client.c  | 1226 -----------------------------------------
 block/nbd.c         | 1282 +++++++++++++++++++++++++++++++++++++++++--
 block/Makefile.objs |    2 +-
 block/trace-events  |    4 +-
 5 files changed, 1251 insertions(+), 1335 deletions(-)
 delete mode 100644 block/nbd-client.h
 delete mode 100644 block/nbd-client.c

-- 
2.18.0


