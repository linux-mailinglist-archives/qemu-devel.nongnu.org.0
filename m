Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625CD244A78
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 15:35:48 +0200 (CEST)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Zs3-0006bp-8D
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 09:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1k6Rix-0003mV-Qx; Fri, 14 Aug 2020 00:53:51 -0400
Received: from [203.148.12.82] (port=34281 helo=ZXSHCAS2.zhaoxin.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1k6Riv-0006o6-4H; Fri, 14 Aug 2020 00:53:51 -0400
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 14 Aug
 2020 12:37:06 +0800
Received: from zhaoxin-ubuntu20.04 (114.242.249.230) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 14 Aug
 2020 12:37:04 +0800
From: "zhaoxin\\RockCuioc" <RockCui-oc@zhaoxin.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] ide:do nothing for identify cmd if no any device attached
Date: Fri, 14 Aug 2020 12:36:57 +0800
Message-ID: <20200814043657.5815-1-RockCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [114.242.249.230]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 203.148.12.82 (failed)
Received-SPF: pass client-ip=203.148.12.82;
 envelope-from=RockCui-oc@zhaoxin.com; helo=ZXSHCAS2.zhaoxin.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 00:37:07
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 14 Aug 2020 09:34:36 -0400
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
Cc: CobeChen@zhaoxin.com, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>,
 "zhaoxin\\rockcuioc" <RockCui-oc@zhaoxin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "zhaoxin\\rockcuioc" <RockCui-oc@zhaoxin.com>

This patch is for avoiding win7 IDE driver polling 0x1f7 when
no any device attached. During Win7 VM boot procedure, if use virtio for
disk and there is no any device be attached on hda & hdb, the win7 IDE driver
would poll 0x1f7 for a while. This action may be stop windows LOGO atomic for
a while too on a poor performance CPU.

Signed-off-by: zhaoxin\RockCuioc <RockCui-oc@zhaoxin.com>
---
 hw/ide/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index d997a78e47..07968aadfd 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2073,8 +2073,9 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
     s = idebus_active_if(bus);
     trace_ide_exec_cmd(bus, s, val);
 
-    /* ignore commands to non existent slave */
-    if (s != bus->ifs && !s->blk) {
+    /* ignore commands if no any device exist or non existent slave */
+    if ((!bus->ifs[0].blk && !bus->ifs[1].blk) || 
+	(s != bus->ifs && !s->blk)) {
         return;
     }
 
-- 
2.17.1


