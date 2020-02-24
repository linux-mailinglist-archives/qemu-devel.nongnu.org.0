Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CD8169ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 07:56:14 +0100 (CET)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j67f3-0004zE-3P
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 01:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhang.zhanghailiang@huawei.com>) id 1j67dk-0003Fx-Hr
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:54:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhang.zhanghailiang@huawei.com>) id 1j67dj-0006CC-D3
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:54:52 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:52408 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhang.zhanghailiang@huawei.com>)
 id 1j67dj-00064q-1H
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 01:54:51 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1485A79627075DC5B3B5;
 Mon, 24 Feb 2020 14:54:46 +0800 (CST)
Received: from huawei.com (10.133.214.142) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Feb 2020
 14:54:40 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH V2 5/8] ram/colo: only record bitmap of dirty pages in COLO
 stage
Date: Mon, 24 Feb 2020 14:54:11 +0800
Message-ID: <20200224065414.36524-6-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200224065414.36524-1-zhang.zhanghailiang@huawei.com>
References: <20200224065414.36524-1-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.214.142]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: danielcho@qnap.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is only need to record bitmap of dirty pages while goes
into COLO stage.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 migration/ram.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index ebf9e6ba51..1b3f423351 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2735,7 +2735,7 @@ static inline void *host_from_ram_block_offset(RAMB=
lock *block,
 }
=20
 static inline void *colo_cache_from_block_offset(RAMBlock *block,
-                                                 ram_addr_t offset)
+                             ram_addr_t offset, bool record_bitmap)
 {
     if (!offset_in_ramblock(block, offset)) {
         return NULL;
@@ -2751,7 +2751,8 @@ static inline void *colo_cache_from_block_offset(RA=
MBlock *block,
     * It help us to decide which pages in ram cache should be flushed
     * into VM's RAM later.
     */
-    if (!test_and_set_bit(offset >> TARGET_PAGE_BITS, block->bmap)) {
+    if (record_bitmap &&
+        !test_and_set_bit(offset >> TARGET_PAGE_BITS, block->bmap)) {
         ram_state->migration_dirty_pages++;
     }
     return block->colo_cache + offset;
@@ -3408,13 +3409,13 @@ static int ram_load_precopy(QEMUFile *f)
             if (migration_incoming_colo_enabled()) {
                 if (migration_incoming_in_colo_state()) {
                     /* In COLO stage, put all pages into cache temporari=
ly */
-                    host =3D colo_cache_from_block_offset(block, addr);
+                    host =3D colo_cache_from_block_offset(block, addr, t=
rue);
                 } else {
                    /*
                     * In migration stage but before COLO stage,
                     * Put all pages into both cache and SVM's memory.
                     */
-                    host_bak =3D colo_cache_from_block_offset(block, add=
r);
+                    host_bak =3D colo_cache_from_block_offset(block, add=
r, false);
                 }
             }
             if (!host) {
--=20
2.21.0



