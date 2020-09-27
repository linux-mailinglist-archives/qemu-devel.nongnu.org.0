Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250A227A127
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Sep 2020 15:06:59 +0200 (CEST)
Received: from localhost ([::1]:56088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMWOH-00013b-JF
	for lists+qemu-devel@lfdr.de; Sun, 27 Sep 2020 09:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kMWMR-0007qX-DZ
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 09:05:03 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60242 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kMWMP-0003N3-5j
 for qemu-devel@nongnu.org; Sun, 27 Sep 2020 09:05:03 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A1FD2B9EE6899670B86C;
 Sun, 27 Sep 2020 21:04:48 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sun, 27 Sep 2020
 21:04:42 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 6/7] qemu-option: add I/O hang timeout option
Date: Sun, 27 Sep 2020 21:04:19 +0800
Message-ID: <20200927130420.1095-7-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200927130420.1095-1-fangying1@huawei.com>
References: <20200927130420.1095-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/27 09:04:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, Ying Fang <fangying1@huawei.com>,
 Jiahui Cen <cenjiahui@huawei.com>, zhang.zhanghailiang@huawei.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I/O hang timeout should be different under different situations. So it is
better to provide an option for user to determine I/O hang timeout for
each block device.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 blockdev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/blockdev.c b/blockdev.c
index 7f2561081e..ff8cdcd497 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -500,6 +500,7 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
     BlockdevDetectZeroesOptions detect_zeroes =
         BLOCKDEV_DETECT_ZEROES_OPTIONS_OFF;
     const char *throttling_group = NULL;
+    int64_t iohang_timeout = 0;
 
     /* Check common options by copying from bs_opts to opts, all other options
      * stay in bs_opts for processing by bdrv_open(). */
@@ -622,6 +623,12 @@ static BlockBackend *blockdev_init(const char *file, QDict *bs_opts,
 
         bs->detect_zeroes = detect_zeroes;
 
+        /* init timeout value for I/O Hang */
+        iohang_timeout = qemu_opt_get_number(opts, "iohang-timeout", 0);
+        if (iohang_timeout > 0) {
+            blk_iohang_init(blk, iohang_timeout);
+        }
+
         block_acct_setup(blk_get_stats(blk), account_invalid, account_failed);
 
         if (!parse_stats_intervals(blk_get_stats(blk), interval_list, errp)) {
@@ -3786,6 +3793,10 @@ QemuOptsList qemu_common_drive_opts = {
             .type = QEMU_OPT_BOOL,
             .help = "whether to account for failed I/O operations "
                     "in the statistics",
+        },{
+            .name = "iohang-timeout",
+            .type = QEMU_OPT_NUMBER,
+            .help = "timeout value for I/O Hang",
         },
         { /* end of list */ }
     },
-- 
2.23.0


