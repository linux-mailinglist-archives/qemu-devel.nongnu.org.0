Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557C1C4DD6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 07:52:43 +0200 (CEST)
Received: from localhost ([::1]:40372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVqVW-0004rG-2T
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 01:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jVqS8-00075I-Eg; Tue, 05 May 2020 01:49:12 -0400
Received: from charlie.dont.surf ([128.199.63.193]:56332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jVqS7-0005D7-Ac; Tue, 05 May 2020 01:49:12 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id BD440BFB2B;
 Tue,  5 May 2020 05:49:05 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v5 05/18] nvme: use constants in identify
Date: Tue,  5 May 2020 07:48:27 +0200
Message-Id: <20200505054840.186586-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505054840.186586-1-its@irrelevant.dk>
References: <20200505054840.186586-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:31:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c      | 8 ++++----
 include/block/nvme.h | 8 ++++++++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e26db7591574..4058f2c79796 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -693,7 +693,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeIdentify *c)
 
 static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeIdentify *c)
 {
-    static const int data_len = 4 * KiB;
+    static const int data_len = NVME_IDENTIFY_DATA_SIZE;
     uint32_t min_nsid = le32_to_cpu(c->nsid);
     uint64_t prp1 = le64_to_cpu(c->prp1);
     uint64_t prp2 = le64_to_cpu(c->prp2);
@@ -723,11 +723,11 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
     NvmeIdentify *c = (NvmeIdentify *)cmd;
 
     switch (le32_to_cpu(c->cns)) {
-    case 0x00:
+    case NVME_ID_CNS_NS:
         return nvme_identify_ns(n, c);
-    case 0x01:
+    case NVME_ID_CNS_CTRL:
         return nvme_identify_ctrl(n, c);
-    case 0x02:
+    case NVME_ID_CNS_NS_ACTIVE_LIST:
         return nvme_identify_nslist(n, c);
     default:
         trace_pci_nvme_err_invalid_identify_cns(le32_to_cpu(c->cns));
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 5525c8e34308..1720ee1d5158 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -705,6 +705,14 @@ typedef struct NvmePSD {
     uint8_t     resv[16];
 } NvmePSD;
 
+#define NVME_IDENTIFY_DATA_SIZE 4096
+
+enum {
+    NVME_ID_CNS_NS             = 0x0,
+    NVME_ID_CNS_CTRL           = 0x1,
+    NVME_ID_CNS_NS_ACTIVE_LIST = 0x2,
+};
+
 typedef struct NvmeIdCtrl {
     uint16_t    vid;
     uint16_t    ssvid;
-- 
2.26.2


