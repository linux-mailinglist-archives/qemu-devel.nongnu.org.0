Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709926DEC65
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 09:18:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmUiz-0005Gc-B9; Wed, 12 Apr 2023 03:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmUiv-0005Fz-6j
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:16:57 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmUit-0002eL-BX
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 03:16:56 -0400
X-UUID: 8d41a86644074cf2bee6c47b4c009e0b-20230412
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:2f274e48-76c1-41b0-885a-06e8411c4ecb, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-INFO: VERSION:1.1.22, REQID:2f274e48-76c1-41b0-885a-06e8411c4ecb, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-10
X-CID-META: VersionHash:120426c, CLOUDID:f6ec0fa1-8fcb-430b-954a-ba3f00fa94a5,
 B
 ulkID:230412151645VCI6ZDN8,BulkQuantity:0,Recheck:0,SF:19|44|38|24|17|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8d41a86644074cf2bee6c47b4c009e0b-20230412
X-User: zenghao@kylinos.cn
Received: from zdzh5-qitianm428-a376.. [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1775056606; Wed, 12 Apr 2023 15:16:43 +0800
From: Hao Zeng <zenghao@kylinos.cn>
To: jonathan.cameron@huawei.com, fan.ni@samsung.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org
Cc: Hao Zeng <zenghao@kylinos.cn>,
	Xie Ming <xieming@kylinos.cn>
Subject: [PATCH v2 1/2] cxl-cdat:Fix open file not closed in ct3_load_cdat
Date: Wed, 12 Apr 2023 15:16:32 +0800
Message-Id: <20230412071633.2660412-2-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230412071633.2660412-1-zenghao@kylinos.cn>
References: <20230412071633.2660412-1-zenghao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

opened file processor not closed,May cause file processor leaks
Fixes:aba578bdace5303a441f8a37aad781b5cb06f38c

Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
Suggested-by: Xie Ming <xieming@kylinos.cn>
---
 hw/cxl/cxl-cdat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index 137abd0992..ba7ed1aafd 100644
--- a/hw/cxl/cxl-cdat.c
+++ b/hw/cxl/cxl-cdat.c
@@ -128,6 +128,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
 
     if (fread(cdat->buf, file_size, 1, fp) == 0) {
         error_setg(errp, "CDAT: File read failed");
+        fclose(fp);
         return;
     }
 
-- 
2.37.2


No virus found
		Checked by Hillstone Network AntiVirus

