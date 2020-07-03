Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A747221347A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 08:49:02 +0200 (CEST)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrFVN-0001mj-PV
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 02:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrFIJ-0007Ap-4X; Fri, 03 Jul 2020 02:35:31 -0400
Received: from charlie.dont.surf ([128.199.63.193]:53114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrFIC-00037k-Mz; Fri, 03 Jul 2020 02:35:30 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 95166BF818;
 Fri,  3 Jul 2020 06:35:02 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 15/18] hw/block/nvme: reject invalid nsid values in active
 namespace id list
Date: Fri,  3 Jul 2020 08:34:17 +0200
Message-Id: <20200703063420.2241014-16-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200703063420.2241014-1-its@irrelevant.dk>
References: <20200703063420.2241014-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:42:13
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
Cc: Kevin Wolf <kwolf@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Reject the nsid broadcast value (0xffffffff) and 0xfffffffe in the
Active Namespace ID list.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 65c2fa3ac1f4..0dac7a41ddae 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -956,6 +956,10 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeIdentify *c)
 
     trace_pci_nvme_identify_nslist(min_nsid);
 
+    if (min_nsid == 0xfffffffe || min_nsid == NVME_NSID_BROADCAST) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
     list = g_malloc0(data_len);
     for (i = 0; i < n->num_namespaces; i++) {
         if (i < min_nsid) {
-- 
2.27.0


