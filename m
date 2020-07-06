Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17E421527A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 08:17:29 +0200 (CEST)
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsKRU-0006uq-QA
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 02:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsKNt-0001gg-Em; Mon, 06 Jul 2020 02:13:45 -0400
Received: from charlie.dont.surf ([128.199.63.193]:58130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jsKNr-0000wT-Ov; Mon, 06 Jul 2020 02:13:45 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 571A3BF854;
 Mon,  6 Jul 2020 06:13:16 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v3 10/18] hw/block/nvme: flush write cache when disabled
Date: Mon,  6 Jul 2020 08:12:55 +0200
Message-Id: <20200706061303.246057-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706061303.246057-1-its@irrelevant.dk>
References: <20200706061303.246057-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 02:13:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

If the write cache is disabled with a Set Features command, flush it if
currently enabled.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 80c7285bc1cf..8fce2ebf69e7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1166,6 +1166,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
 
         break;
     case NVME_VOLATILE_WRITE_CACHE:
+        if (!(dw11 & 0x1) && blk_enable_write_cache(n->conf.blk)) {
+            blk_flush(n->conf.blk);
+        }
+
         blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
         break;
     case NVME_NUMBER_OF_QUEUES:
-- 
2.27.0


