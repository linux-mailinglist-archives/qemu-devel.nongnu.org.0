Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22C025DB7C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 16:25:00 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kECeB-00030Z-OS
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 10:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kECa1-0002Sv-Al; Fri, 04 Sep 2020 10:20:41 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kECZy-0002ib-Um; Fri, 04 Sep 2020 10:20:40 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 58BC9BFADA;
 Fri,  4 Sep 2020 14:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1599229233;
 bh=N75pEHGwe0j3jOW0KRkVA1wliaihAHhbFGlpZBmtj/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QX4jBVAMWHYNWxnkk9nNh/OkCmyRal3Bjvde4bA4efFFu/4gozzlnBjcvrgrPUcFr
 eVXkcOmwd7UmMsOlao/O625yA64+amgVo9GBy+SI7h21leT7LjlmDSOfkUpjetwVoP
 kftxb3EmuAJVcWrsem2GBz92CTfTqAwJHGPxkKJNXNH/P/hg34qYMTaaOs1+OoPSat
 JbEPwvNSGzDLRfcQyZFuap9SK2CFex43hV63ri1hU1HpGCqjEFUsbuACv7y009eiKF
 k9RMqFYX44dC8Bepml3LfJOcIPesczLNzuLX6Hw9plwIU2yMBOhMIWbvIlq7/lYN6c
 yWfVAf+lDs4Lg==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] hw/block/nvme: fix endian conversion
Date: Fri,  4 Sep 2020 16:19:45 +0200
Message-Id: <20200904141956.576630-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904141956.576630-1-its@irrelevant.dk>
References: <20200904141956.576630-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 10:20:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The raw NLB field is a 16 bit value, so use le16_to_cpu instead of
le32_to_cpu and cast to uint32_t before incrementing the value to not
wrap around.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 08f824dd807d..50851ab8d90f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -645,7 +645,7 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
     uint64_t slba = le64_to_cpu(rw->slba);
-    uint32_t nlb  = le16_to_cpu(rw->nlb) + 1;
+    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t offset = nvme_l2b(ns, slba);
     uint32_t count = nvme_l2b(ns, nlb);
     uint16_t status;
@@ -669,7 +669,7 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
     NvmeNamespace *ns = req->ns;
-    uint32_t nlb  = le32_to_cpu(rw->nlb) + 1;
+    uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
     uint64_t slba = le64_to_cpu(rw->slba);
 
     uint64_t data_size = nvme_l2b(ns, nlb);
-- 
2.28.0


