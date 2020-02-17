Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD681607A9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 02:22:35 +0100 (CET)
Received: from localhost ([::1]:38650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3V7K-0002zo-2W
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 20:22:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhang.zhanghailiang@huawei.com>) id 1j3V6M-0001t1-3f
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 20:21:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhang.zhanghailiang@huawei.com>) id 1j3V6K-0006TL-TB
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 20:21:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2712 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhang.zhanghailiang@huawei.com>)
 id 1j3V6K-0006GW-If
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 20:21:32 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8EADB6FA3AAB437C8F70;
 Mon, 17 Feb 2020 09:21:24 +0800 (CST)
Received: from huawei.com (10.133.214.142) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 09:21:16 +0800
From: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 0/3] Optimize VM's downtime while do checkpoint in COLO
Date: Mon, 17 Feb 2020 09:20:46 +0800
Message-ID: <20200217012049.22988-1-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.214.142]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
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
Cc: danielcho@qnap.com, chen.zhang@intel.com,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is an untested serial that tries to reduce VM's pause time
while do checkpoint in COLO state.

The second patch tries to reduce the total number of dirty pages
while do checkpoint with VM been paused, instead of sending all
dirty pages while VM been pause, it sends part of dirty pages during
the gap time of two checkpoints when SVM and PVM are running.

The third patch tries to reduce the pause time of backup ram into
cache in secondary part.


Hailiang Zhang (3):
  migration/colo: wrap incoming checkpoint process into new helper
  COLO: Migrate dirty pages during the gap of checkpointing
  COLO: Optimize memory back-up process

 migration/colo.c       | 332 +++++++++++++++++++++++++----------------
 migration/migration.h  |   1 +
 migration/ram.c        |  35 ++++-
 migration/ram.h        |   1 +
 migration/trace-events |   1 +
 qapi/migration.json    |   4 +-
 6 files changed, 234 insertions(+), 140 deletions(-)

--=20
2.21.0



