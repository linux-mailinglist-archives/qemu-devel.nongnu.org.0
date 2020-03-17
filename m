Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CA188D34
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 19:31:15 +0100 (CET)
Received: from localhost ([::1]:39302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGzh-00063P-2J
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 14:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jEGmt-0003LK-GX
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jEGms-0008U4-En
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:17:59 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:57705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jEGms-0005Ut-5D; Tue, 17 Mar 2020 14:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=oWauXz47PpW+xVTM/4Ib2FZL1+ZMSwNIBOfuc4avzAI=; 
 b=WYjpzvM73Lgs5SQe1qRRYChrWddCJt7O19zP1KdeOkjdxCo2Za00xelT0D3jJPyEG+c8rULlL/Cmbk11q5nwkbKaYY/nH9uNrHH5XWgo3B23FQrGCfJ5jV9ZdFZzbUxi7AKmhKSY2b2lSJzdBHwLOUUXbf1GBkLHbZHrROSqoQr1QDGprXdzAVOohkHEVPpCGSFFafRbzpwDWv53pQRGkg5LS1zyXmzbPF3N/y7cM/sjGHcL2Dt5Q5EoOySWNBg8dL5vWoDj4nAcTHpBdrdnqd+IW4Z4iBipAt9p5M79J6wPSKxLymu9+/8tZzw27KkHoF0W3XIp4LsRABKA6LdV8w==;
Received: from [81.0.35.138] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jEGmD-00015c-0i; Tue, 17 Mar 2020 19:17:17 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jEGlw-0006Oj-OL; Tue, 17 Mar 2020 19:17:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/30] qcow2: Add subcluster support to check_refcounts_l2()
Date: Tue, 17 Mar 2020 19:16:18 +0100
Message-Id: <ef2a1699095c04e954665aba591dd055c3bddb63.1584468723.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1584468723.git.berto@igalia.com>
References: <cover.1584468723.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting the QCOW_OFLAG_ZERO bit of the L2 entry is forbidden if an
image has subclusters. Instead, the individual 'all zeroes' bits must
be used.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-refcount.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 3b89a97fd0..9337496c84 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1686,8 +1686,13 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
                         int ign = active ? QCOW2_OL_ACTIVE_L2 :
                                            QCOW2_OL_INACTIVE_L2;
 
-                        l2_entry = QCOW_OFLAG_ZERO;
-                        set_l2_entry(s, l2_table, i, l2_entry);
+                        if (has_subclusters(s)) {
+                            set_l2_entry(s, l2_table, i, 0);
+                            set_l2_bitmap(s, l2_table, i,
+                                          QCOW_L2_BITMAP_ALL_ZEROES);
+                        } else {
+                            set_l2_entry(s, l2_table, i, QCOW_OFLAG_ZERO);
+                        }
                         ret = qcow2_pre_write_overlap_check(bs, ign,
                                 l2e_offset, l2_entry_size(s), false);
                         if (ret < 0) {
-- 
2.20.1


