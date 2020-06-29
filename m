Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3C20DCF0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 22:45:40 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jq0eo-0004Bi-Mp
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 16:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jq0ct-0002ko-54; Mon, 29 Jun 2020 16:43:39 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jq0cr-000633-4i; Mon, 29 Jun 2020 16:43:38 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 9123EBF724;
 Mon, 29 Jun 2020 20:43:34 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH 1/4] hw/block/nvme: refactor identify active namespace id list
Date: Mon, 29 Jun 2020 22:43:24 +0200
Message-Id: <20200629204327.1239520-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629204327.1239520-1-its@irrelevant.dk>
References: <20200629204327.1239520-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 14:26:53
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Prepare to support inactive namespaces.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4bcd114f76b1..eaee420219fd 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1573,16 +1573,16 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     uint32_t min_nsid = le32_to_cpu(c->nsid);
     uint32_t *list;
     uint16_t ret;
-    int i, j = 0;
+    int j = 0;
 
     trace_pci_nvme_identify_nslist(min_nsid);
 
     list = g_malloc0(data_len);
-    for (i = 0; i < n->num_namespaces; i++) {
-        if (i < min_nsid) {
+    for (int i = 1; i <= n->num_namespaces; i++) {
+        if (i <= min_nsid) {
             continue;
         }
-        list[j++] = cpu_to_le32(i + 1);
+        list[j++] = cpu_to_le32(i);
         if (j == data_len / sizeof(uint32_t)) {
             break;
         }
-- 
2.27.0


