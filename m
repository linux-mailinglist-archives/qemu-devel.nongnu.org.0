Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F0113A9A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 04:50:02 +0100 (CET)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ici9R-0000T7-DD
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 22:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ici5n-0006QZ-CO
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 22:46:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ici5m-0003ym-6K
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 22:46:15 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2212 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ici5b-0003iE-54; Wed, 04 Dec 2019 22:46:04 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 61B969613D875B7693FA;
 Thu,  5 Dec 2019 11:45:56 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Dec 2019 11:45:47 +0800
From: <pannengyuan@huawei.com>
To: <eblake@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH v5 0/2] block/nbd: fix memory leak in nbd_open
Date: Thu, 5 Dec 2019 11:45:26 +0800
Message-ID: <1575517528-44312-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: liyiting@huawei.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

This series add a new function to do the common cleanups, and fix a memory
leak in nbd_open when nbd_client_connect returns error status.

---
Changes v2 to v1:
- add a new function to do the common cleanups (suggested by Stefano Garzarella).
---
Changes v3 to v2:
- split in two patches(suggested by Stefano Garzarella)
---
Changes v4 to v3:
- replace function name from nbd_free_bdrvstate_prop to nbd_clear_bdrvstate and add Fixes tag(suggested by Eric Blake).
- remove static function prototype. (suggested by Eric Blake)
---
Changes v5 to v4:
- correct the wrong email address

Pan Nengyuan (2):
  block/nbd: extract the common cleanup code
  block/nbd: fix memory leak in nbd_open()

 block/nbd.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

-- 
2.7.2.windows.1



