Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C240C8A7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:46:51 +0200 (CEST)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQX7Z-0000y4-VC
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.raghav@samsung.com>)
 id 1mQX4d-0006qu-6g
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:43:47 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <p.raghav@samsung.com>)
 id 1mQX4Y-0005w2-5V
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:43:46 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210915154334euoutp022a94ec2a0c1fa444d88eefb52c8b50b4~lCUD3ZRhI1952419524euoutp02B
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 15:43:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20210915154334euoutp022a94ec2a0c1fa444d88eefb52c8b50b4~lCUD3ZRhI1952419524euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1631720614;
 bh=E8hh5N5e4xIrYlSuFUfDzK64J/1rO68kGv4gn3NA4Xo=;
 h=To:CC:From:Subject:Date:References:From;
 b=XTY4kE4IInvGlbFHdClUDIgerG/JPtjQLBYGNLKsariQCRZBhbCFrrjokvqyvxkBA
 GyNRefUOWgoPqx1RF2mAJP2VcpjjZ6dMTzgCjx2X1J6cUWOHNZfGdagrerVxFIdvWU
 K3VBv18ino79AsDIfY57lANmRF0hyR2CskdhbK60=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210915154334eucas1p13c36539200177a01e7bcb3156f6b0543~lCUDU-4WY2567525675eucas1p1q;
 Wed, 15 Sep 2021 15:43:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 81.41.42068.5A412416; Wed, 15
 Sep 2021 16:43:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210915154333eucas1p2baf6aabb3bd0325233dae156f8bbbb32~lCUC-TZ4L3097630976eucas1p2A;
 Wed, 15 Sep 2021 15:43:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210915154333eusmtrp17fc19dfcfe86365a095c9e502917c2a5~lCUC_uKvc2730027300eusmtrp1E;
 Wed, 15 Sep 2021 15:43:33 +0000 (GMT)
X-AuditID: cbfec7f4-c71ff7000002a454-a6-614214a56610
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 36.24.20981.5A412416; Wed, 15
 Sep 2021 16:43:33 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210915154333eusmtip1dbd5a71a21315227e8959ecc32033684~lCUC0RFq72109521095eusmtip1P;
 Wed, 15 Sep 2021 15:43:33 +0000 (GMT)
Received: from [192.168.8.130] (106.210.248.54) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 15 Sep 2021 16:43:32 +0100
To: <kbusch@kernel.org>, <its@irrelevant.dk>, <qemu-block@nongnu.org>
From: Pankaj Raghav <p.raghav@samsung.com>
Subject: [PATCH v2] hw/nvme: Return error for fused operations
Message-ID: <8df37610-0200-d02a-7281-30b22718201d@samsung.com>
Date: Wed, 15 Sep 2021 17:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [106.210.248.54]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphleLIzCtJLcpLzFFi42LZduzned2lIk6JBouvWFrsP/iN1WLSoWuM
 FrPetbNZHO/dweLA4nFux3l2j02rOtk8nlzbzBTAHMVlk5Kak1mWWqRvl8CVsaPlM1PBC86K
 nau3MzcwHmfvYuTkkBAwkbjzbzkjiC0ksIJR4uCv8C5GLiD7C6PEst0gCRDnM6PEpGXvmWA6
 uv71MUMkljNKnNuxnhmuqun8dxYIZxejxIKvm1hBWkQEXCW671xnBrGZBaQlmv+9ASri4GAT
 0JJo7AS7Q1jATmLFgltgd/AC2U9O/GYDsVkEVCUu/DgBZosKREr8PbmLFaJGUOLkzCdgY5gF
 NCXW79KHmC4ucevJfCYIW15i+9s5zBBHK0msWDeNDcKulTi15RYTyJkSAgc4JI70noT6zEXi
 5OF10HARlnh1fAuULSNxenIPC4Q9mVHi2KpEiOb1jBIt3QtYQY6QELCW6DuTA1HjKPH49wRG
 iDCfxI23ghD38ElM2jadGSLMK9HRJjSBUWUWkmdmITwzC8kzs5A8s4CRZRWjeGppcW56arFR
 Xmq5XnFibnFpXrpecn7uJkZgQjn97/iXHYzLX33UO8TIxMF4iFGCg1lJhPdCjWOiEG9KYmVV
 alF+fFFpTmrxIUZpDhYlcd6kLWvihQTSE0tSs1NTC1KLYLJMHJxSDUy75vTOtuOK9No9Y/ME
 to1ymxY885vsFHcyc6XgU8PHx/lWBuxpbA5zC5+9XfFWZwCvR5Vlpdi7E0vU7t5JuxsuwLyg
 /m/Vhhsbj2ZdUYn99FonpGNZObPJrRm8Gm6V4nZ3vP/mac+p6925+bPXK3HvOAHBza2bF+j+
 E1f5NCdGhnmTWuqC1fytGat8LS79SrYpWjPdatsivrPHYjctqw57ZSUvVXdyqv2jkq1zG7Zf
 7Aj7d0aPT/bce/db2Q8k+l0OT2JwnH9DpljdIS+cae7nY6slWXjSLDI2xU69rbH659QTXtqH
 ZHvN575892f/hKPMz/sj59Zx6zKwVJg52fOWbkuayXsm7Kye8Rah+F9KLMUZiYZazEXFiQBI
 GDRGlwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xu7pLRZwSDc53qlrsP/iN1WLSoWuM
 FrPetbNZHO/dweLA4nFux3l2j02rOtk8nlzbzBTAHKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmh
 Z2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsaPlM1PBC86Knau3MzcwHmfvYuTkkBAwkej6
 18fcxcjFISSwlFHi2Y0NzBAJGYlPVz5CFQlL/LnWxQZR9JFRYu236awQzi5GiZ9XtrGBVIkI
 uEp037kO1s0sIC3R/O8NSxcjBwebgJZEYyfYIGEBO4kVC24xgti8QPaTE7/BWlkEVCUu/DgB
 ZosKREo0ndjKBlEjKHFy5hOwMcwCmhLrd+lDTBeXuPVkPhOELS+x/e0cqJuVJFasm8YGYddK
 fP77jHECo/AsJJNmIUyahWTSLCSTFjCyrGIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMrG3H
 fm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeC/UOCYK8aYkVlalFuXHF5XmpBYfYjQF+mwis5Rocj4w
 tvNK4g3NDEwNTcwsDUwtzYyVxHlNjqyJFxJITyxJzU5NLUgtgulj4uCUamBa2Zd7s9epT0fk
 wbTbvJes786UPrthS3vogtYNG1kiGm2urYyRX1ukkbj+E1th5VGTgFcLb029+URqn3T8xD0x
 pWsWRW2fuar9WOOzp082zIjYoPk8yj9usV3FifsrTr8VfSlwNLPl+dQDRftNuVXmKIotzv70
 INXd/5mt0/k85gvXfjbfM+2L/xwzp6H6o+er91xmUnEftM7MDvv3xlXfZ1vEn92xDhEJN/68
 iH/nc1V9Pe+xb6FK+7u38H74c1L8tO32+bwsk0Uv7q1y7MqZIFTz4sK/eR+OlXxmnhfo8e1n
 2WulmrA7/He5/LW7Jkrv3fHprZDYxYpbG7ybX+7KtnO23LYi70Zcs42umGLJbSWW4oxEQy3m
 ouJEAP+fprQ1AwAA
X-CMS-MailID: 20210915154333eucas1p2baf6aabb3bd0325233dae156f8bbbb32
X-Msg-Generator: CA
X-RootMTR: 20210915154333eucas1p2baf6aabb3bd0325233dae156f8bbbb32
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210915154333eucas1p2baf6aabb3bd0325233dae156f8bbbb32
References: <CGME20210915154333eucas1p2baf6aabb3bd0325233dae156f8bbbb32@eucas1p2.samsung.com>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=p.raghav@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, FUSED operations are not supported by QEMU. As per the 1.4 SPEC,
controller should abort the command that requested a fused operation with 
an INVALID FIELD error code if they are not supported.

Changes from v1:
Added FUSE flag check also to the admin cmd processing as the FUSED 
operations are mentioned in the general SQE section in the SPEC. 

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 hw/nvme/ctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index dc0e7b0030..2f247a9275 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -3893,6 +3893,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return ns->status;
     }
 
+    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
+        return NVME_INVALID_FIELD;
+    }
+
     req->ns = ns;
 
     switch (req->cmd.opcode) {
@@ -5475,6 +5479,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
+    if (NVME_CMD_FLAGS_FUSE(req->cmd.flags)) {
+        return NVME_INVALID_FIELD;
+    }
+
     switch (req->cmd.opcode) {
     case NVME_ADM_CMD_DELETE_SQ:
         return nvme_del_sq(n, req);
-- 
2.25.1

