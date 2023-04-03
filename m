Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC646D44E5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:52:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJet-00079e-Ip; Mon, 03 Apr 2023 08:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pjFmK-0004EU-TB
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:43:04 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pjFmG-0004CU-AN
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 04:43:04 -0400
X-UUID: 1198205ec8a04f4d8fbc139b5f3358e5-20230403
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:09f78152-36f1-459e-8efe-dfa07e941b81, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:15
X-CID-INFO: VERSION:1.1.22, REQID:09f78152-36f1-459e-8efe-dfa07e941b81, IP:5,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:15
X-CID-META: VersionHash:120426c, CLOUDID:b622422a-564d-42d9-9875-7c868ee415ec,
 B
 ulkID:230403164248EQ1HA7PS,BulkQuantity:0,Recheck:0,SF:24|17|19|44|102,TC:
 nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 1198205ec8a04f4d8fbc139b5f3358e5-20230403
X-User: zenghao@kylinos.cn
Received: from zdzh5-qitianm428-a376.. [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 224484145; Mon, 03 Apr 2023 16:42:47 +0800
From: zenghao <zenghao@kylinos.cn>
To: jonathan.cameron@huawei.com
Cc: fan.ni@samsung.com, qemu-devel@nongnu.org, xieming@kylinos.cn,
 zenghao <zenghao@kylinos.cn>
Subject: [PATCH] Subject:[PATCH] cxl-cdat:Fix open file not closed in
 ct3_load_cdat
Date: Mon,  3 Apr 2023 16:42:45 +0800
Message-Id: <20230403084245.54861-1-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
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
X-Mailman-Approved-At: Mon, 03 Apr 2023 08:51:34 -0400
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

