Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEED509E1B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:57:40 +0200 (CEST)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUVH-0007Qg-Ip
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nhUPw-00048A-Du; Thu, 21 Apr 2022 06:52:08 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:44140 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nhUPu-0006S2-JI; Thu, 21 Apr 2022 06:52:07 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6B09943AC2;
 Thu, 21 Apr 2022 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:from:from:date:date:received
 :received:received; s=mta-01; t=1650538321; x=1652352722; bh=tSd
 GUMRbMRQrX8T/WiS7EqDhiBuqZH2WUSozgmuRUDE=; b=MyNZ8ppdbJqvQhuGsJ8
 QasGkmlo1r+1DRpssJMljZbhU4gmLoWZYsqqTjKCLMwH48l3tqSok4xyR7ldvfQR
 7a1jfJPgXBDbLoXXMinzo393oBWKgMgZJ7t7bzg9DBCDpqQ59EtTwNNaY3ljqUF7
 4MPp6JNVEGUjuaHxlVd3FLtk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjrAFQjctvJx; Thu, 21 Apr 2022 13:52:01 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0BABD42A76;
 Thu, 21 Apr 2022 13:52:01 +0300 (MSK)
Received: from localhost.localdomain (10.178.113.54) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 21 Apr 2022 13:51:59 +0300
Date: Thu, 21 Apr 2022 13:51:58 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] hw/nvme: fix copy cmd for pi enabled namespaces
Message-ID: <20220421105158.ufd3wzivaougxokx@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kbusch@kernel.org, its@irrelevant.dk, ddtikhov@gmail.com,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current implementation have problem in the read part of copy command.
Because there is no metadata mangling before nvme_dif_check invocation,
reftag error could be thrown for blocks of namespace that have not been
previously written to.

Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
---
v2:
    * remove refactoring
    * remove write part fix
---
 hw/nvme/ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 74540a03d5..08574c4dcb 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2787,6 +2787,10 @@ static void nvme_copy_in_completed_cb(void *opaque, int ret)
         size_t mlen = nvme_m2b(ns, nlb);
         uint8_t *mbounce = iocb->bounce + nvme_l2b(ns, nlb);
 
+        status = nvme_dif_mangle_mdata(ns, mbounce, mlen, slba);
+        if (status) {
+            goto invalid;
+        }
         status = nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen, prinfor,
                                 slba, apptag, appmask, &reftag);
         if (status) {
-- 
2.35.1


