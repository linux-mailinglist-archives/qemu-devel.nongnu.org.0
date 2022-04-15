Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A982502FF3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 23:13:48 +0200 (CEST)
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfTGE-0003m9-K6
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 17:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nfRbQ-0000AC-S3; Fri, 15 Apr 2022 15:27:33 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:32864 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nfRbO-0007mj-PM; Fri, 15 Apr 2022 15:27:32 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C974E45974;
 Fri, 15 Apr 2022 19:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:from:from:date:date:received
 :received:received; s=mta-01; t=1650050845; x=1651865246; bh=jhV
 cgHOGLI3pCnUfrwtZbUAiebPSWXtzOhl5L7TDvKg=; b=S9YW3ARHKQya3t6ozbA
 lGdusNjIOmx8cqHiDHsJANqEJlIfqFxOhC7vAV2BQCL5yXzsOqVBc8SN3Ip5qBGY
 l2GjyopY7flnX+Wbq1xBSyZYnNfG2JIg2xIMcMh4TQldHwPVBS86PS/kcMT5E5TV
 keyvcp3suH/Q+/GZ5ORGYc7U=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhtzuTYMF0_o; Fri, 15 Apr 2022 22:27:25 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 473904596E;
 Fri, 15 Apr 2022 22:27:24 +0300 (MSK)
Received: from localhost.localdomain (10.178.113.54) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 15 Apr 2022 22:27:22 +0300
Date: Fri, 15 Apr 2022 22:27:21 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] hw/nvme: fix control flow statement
Message-ID: <20220415192721.tkbokbl65rrwkbew@localhost.localdomain>
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
X-Mailman-Approved-At: Fri, 15 Apr 2022 17:12:18 -0400
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

Since there is no else after nvme_dsm_cb invocation, metadata associated
with non-zero block range is currently zeroed. Also this behaviour leads
to segfault since we schedule iocb->bh two times. First when entering
nvme_dsm_cb with iocb->idx == iocb->nr and second on call stack unwinding
by calling blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback
because of missing else statement.

Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
---
 hw/nvme/ctrl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 03760ddeae..7ebd2aa326 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -2372,11 +2372,12 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
         }
 
         nvme_dsm_cb(iocb, 0);
+    } else {
+        iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
+                                            nvme_m2b(ns, nlb), BDRV_REQ_MAY_UNMAP,
+                                            nvme_dsm_cb, iocb);
     }
 
-    iocb->aiocb = blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns, slba),
-                                        nvme_m2b(ns, nlb), BDRV_REQ_MAY_UNMAP,
-                                        nvme_dsm_cb, iocb);
     return;
 
 done:
-- 
2.35.1


