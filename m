Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92916232774
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 00:13:59 +0200 (CEST)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0uKk-0001rb-Nk
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 18:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uDq-0006r3-Fn; Wed, 29 Jul 2020 18:06:50 -0400
Received: from charlie.dont.surf ([128.199.63.193]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1k0uDo-0008VQ-Jn; Wed, 29 Jul 2020 18:06:50 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id A934EBFB31;
 Wed, 29 Jul 2020 22:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1596060405;
 bh=36KolzdIFQtbbT6iYuN8iBHW7GoHLWnrJfB04X+Vqy0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yzfaZoJet0EW/Ng3tOfsFlIVGVLuBuqEgCIXBTS1+oZf4PTtqOJe7l6plPIge8DEu
 tG6++IbuEzi2ghDL9hkogBHgfwdBohLdBT8OQKN91rpNuTqNdl/hHJyYzy2AATlWFl
 9malE190aqTx5Lz9eXS2USrlz/MN4bl01xxqsSYlVbJ2Y0ZJqgLdh/anmSg+3HhVFn
 Kz+9tQBPCiZ+ZO/ORHv8zS40cdf8OKPjtAXGE2bzSSegfegxv+hrEQL0h/G/OhQWbw
 diMq3dSHQ6k2SMuhJ8Zd8VFBHx993nCfu1SiYP87ccpJrJfWTLI4RWASWkUSO37MoI
 OixhyetC4FxYg==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/16] hw/block/nvme: destroy request iov before reuse
Date: Thu, 30 Jul 2020 00:06:27 +0200
Message-Id: <20200729220638.344477-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729220638.344477-1-its@irrelevant.dk>
References: <20200729220638.344477-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 14:23:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Make sure the request iov is destroyed before reuse; fixing a memory
leak.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index a9d9a2912655..8f8257e06eed 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -554,6 +554,10 @@ static void nvme_rw_cb(void *opaque, int ret)
     if (req->qsg.nalloc) {
         qemu_sglist_destroy(&req->qsg);
     }
+    if (req->iov.nalloc) {
+        qemu_iovec_destroy(&req->iov);
+    }
+
     nvme_enqueue_req_completion(cq, req);
 }
 
-- 
2.27.0


