Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDEB2B45A6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 15:20:44 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kefN4-0006dO-TK
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 09:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kefLL-00064A-Il; Mon, 16 Nov 2020 09:18:55 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kefLF-0001cl-Pj; Mon, 16 Nov 2020 09:18:55 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZWPv6Vl4z6wn9;
 Mon, 16 Nov 2020 22:18:11 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 22:18:16 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] ui/vnc: Add missing lock for send_color_map
Date: Mon, 16 Nov 2020 22:13:38 +0800
Message-ID: <20201116141338.148911-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=liangpeng10@huawei.com; helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 09:18:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: liangpeng10@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-stable@nongnu.org, xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vnc_write() should be locked after the RFB protocol is initialized.

Fixes: 0c426e4534b4 ("vnc: Add support for color map")
Cc: qemu-stable@nongnu.org
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 ui/vnc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/vnc.c b/ui/vnc.c
index 49235056f7a8..ca3fc376aeb5 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2156,6 +2156,7 @@ static void send_color_map(VncState *vs)
 {
     int i;
 
+    vnc_lock_output(vs);
     vnc_write_u8(vs, VNC_MSG_SERVER_SET_COLOUR_MAP_ENTRIES);
     vnc_write_u8(vs,  0);    /* padding     */
     vnc_write_u16(vs, 0);    /* first color */
@@ -2168,6 +2169,7 @@ static void send_color_map(VncState *vs)
         vnc_write_u16(vs, (((i >> pf->gshift) & pf->gmax) << (16 - pf->gbits)));
         vnc_write_u16(vs, (((i >> pf->bshift) & pf->bmax) << (16 - pf->bbits)));
     }
+    vnc_unlock_output(vs);
 }
 
 static void set_pixel_format(VncState *vs, int bits_per_pixel,
-- 
2.28.0


