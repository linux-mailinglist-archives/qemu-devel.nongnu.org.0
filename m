Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF39245B24
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 05:45:38 +0200 (CEST)
Received: from localhost ([::1]:43462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7W5Z-00018g-Gx
	for lists+qemu-devel@lfdr.de; Sun, 16 Aug 2020 23:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1k7W4i-0000jJ-9F
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 23:44:44 -0400
Received: from [203.148.12.81] (port=12059 helo=ZXSHCAS1.zhaoxin.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <RockCui-oc@zhaoxin.com>)
 id 1k7W4f-00053x-Jz
 for qemu-devel@nongnu.org; Sun, 16 Aug 2020 23:44:43 -0400
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 17 Aug
 2020 11:38:14 +0800
Received: from zhaoxin-ubuntu20.04 (124.64.19.137) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 17 Aug
 2020 11:38:13 +0800
From: "zhaoxin\\RockCuioc" <RockCui-oc@zhaoxin.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] ide:do nothing for identify cmd if no any device attached
Date: Mon, 17 Aug 2020 11:38:03 +0800
Message-ID: <20200817033803.14014-1-RockCui-oc@zhaoxin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [124.64.19.137]
X-ClientProxiedBy: ZXSHCAS1.zhaoxin.com (10.28.252.161) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 203.148.12.81 (failed)
Received-SPF: pass client-ip=203.148.12.81;
 envelope-from=RockCui-oc@zhaoxin.com; helo=ZXSHCAS1.zhaoxin.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/16 23:38:19
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: CobeChen@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index d997a78e47..26d86f4b40 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2073,8 +2073,9 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
     s = idebus_active_if(bus);
     trace_ide_exec_cmd(bus, s, val);
 
-    /* ignore commands to non existent slave */
-    if (s != bus->ifs && !s->blk) {
+    /* ignore commands if no any device exist or non existent slave */
+    if ((!bus->ifs[0].blk && !bus->ifs[1].blk) ||
+        (s != bus->ifs && !s->blk)) {
         return;
     }
 
-- 
2.17.1


