Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3A294F02
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 16:47:58 +0200 (CEST)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVFPB-0003YH-0i
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 10:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kVFNF-0002Le-Rk; Wed, 21 Oct 2020 10:45:57 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:19541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1kVFNA-0006Iw-UD; Wed, 21 Oct 2020 10:45:56 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 30DA345EA5;
 Wed, 21 Oct 2020 16:45:39 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH] migration/block-dirty-bitmap: fix larger granularity bitmaps
Date: Wed, 21 Oct 2020 16:44:56 +0200
Message-Id: <20201021144456.1072-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 10:45:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 jsnow@redhat.com, s.reiter@proxmox.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sectors_per_chunk is a 64 bit integer, but the calculation is done in 32
bits, leading to an overflow for coarse bitmap granularities.

If that results in the value 0, it leads to a hang where no progress is
made but send_bitmap_bits is constantly called with nr_sectors being 0.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 migration/block-dirty-bitmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 5bef793ac0..5398869e2b 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -562,8 +562,9 @@ static int add_bitmaps_to_list(DBMSaveState *s, BlockDriverState *bs,
         dbms->bitmap_alias = g_strdup(bitmap_alias);
         dbms->bitmap = bitmap;
         dbms->total_sectors = bdrv_nb_sectors(bs);
-        dbms->sectors_per_chunk = CHUNK_SIZE * 8 *
+        dbms->sectors_per_chunk = CHUNK_SIZE * 8lu *
             bdrv_dirty_bitmap_granularity(bitmap) >> BDRV_SECTOR_BITS;
+        assert(dbms->sectors_per_chunk != 0);
         if (bdrv_dirty_bitmap_enabled(bitmap)) {
             dbms->flags |= DIRTY_BITMAP_MIG_START_FLAG_ENABLED;
         }
-- 
2.20.1



