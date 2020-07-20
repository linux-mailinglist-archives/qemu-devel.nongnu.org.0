Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9110A225D8C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 13:40:01 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxU9I-0000dU-5O
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 07:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7M-0007Dt-1V; Mon, 20 Jul 2020 07:38:00 -0400
Received: from charlie.dont.surf ([128.199.63.193]:46818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jxU7J-000591-S4; Mon, 20 Jul 2020 07:37:59 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 1734DBF5F1;
 Mon, 20 Jul 2020 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=irrelevant.dk;
 s=default; t=1595245076;
 bh=vsnotRhFSS5IYoynCnSdciNJb6PJVQIXYMWChraynq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yLkkJHxuHQm03PhdiQT1Syp3IU37Pba3L5z0l5plbIYU6X2aAD6DWXcstwvzS7R4a
 EEldgDsF09a3hMmn16AvWZPdKiiy339Qb+9+wJ7wfgAEc39CgQgxxYJ+/gGuatZfN5
 3bbxiIFXpDT3IBdIyTuv+loKNyaAAat1ZEdOiHzSNzojhcfEwOgUvmO438Lp031sIw
 nqHGKh72u6uXRGJ67cMd4gsEffD3feq26jAn3e2Pl+t4/mjUknRTaX5Hk5ivGOhuJg
 nr+j/bpm1Se+Dw8upC/Bswtb/2WLchVQqCfo4p1SNASpX0qYLk4pYhApXIThnypnQe
 kiEVqfUIGK3zg==
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/16] hw/block/nvme: memset preallocated requests structures
Date: Mon, 20 Jul 2020 13:37:33 +0200
Message-Id: <20200720113748.322965-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720113748.322965-1-its@irrelevant.dk>
References: <20200720113748.322965-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 07:37:55
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

This is preparatory to subsequent patches that change how QSGs/IOVs are
handled. It is important that the qsg and iov members of the NvmeRequest
are initially zeroed.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 841c18920c4e..4d7b730a62b6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -653,7 +653,7 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
     sq->size = size;
     sq->cqid = cqid;
     sq->head = sq->tail = 0;
-    sq->io_req = g_new(NvmeRequest, sq->size);
+    sq->io_req = g_new0(NvmeRequest, sq->size);
 
     QTAILQ_INIT(&sq->req_list);
     QTAILQ_INIT(&sq->out_req_list);
-- 
2.27.0


