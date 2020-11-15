Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A300F2B3FD4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 10:34:33 +0100 (CET)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keau8-0002j5-L2
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 04:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keaj3-00071z-03; Mon, 16 Nov 2020 04:23:05 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keaj1-0004Gu-0o; Mon, 16 Nov 2020 04:23:04 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZNrx2lt5zkYxC;
 Mon, 16 Nov 2020 17:22:41 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 17:22:50 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835 cprman
 into the 'misc' category
Date: Mon, 16 Nov 2020 02:49:03 +0800
Message-ID: <20201115184903.1292715-14-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201115184903.1292715-1-ganqixin@huawei.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:22:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kuhn.chenqun@huawei.com, thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 Gan Qixin <ganqixin@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some peripherals of bcm2835 cprman have no category, put them into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/bcm2835_cprman.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 7e415a017c..c62958a99e 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -136,6 +136,7 @@ static void pll_class_init(ObjectClass *klass, void *data)
 
     dc->reset = pll_reset;
     dc->vmsd = &pll_vmstate;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo cprman_pll_info = {
@@ -239,6 +240,7 @@ static void pll_channel_class_init(ObjectClass *klass, void *data)
 
     dc->reset = pll_channel_reset;
     dc->vmsd = &pll_channel_vmstate;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo cprman_pll_channel_info = {
@@ -359,6 +361,7 @@ static void clock_mux_class_init(ObjectClass *klass, void *data)
 
     dc->reset = clock_mux_reset;
     dc->vmsd = &clock_mux_vmstate;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo cprman_clock_mux_info = {
@@ -411,6 +414,7 @@ static void dsi0hsck_mux_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &dsi0hsck_mux_vmstate;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo cprman_dsi0hsck_mux_info = {
-- 
2.23.0


