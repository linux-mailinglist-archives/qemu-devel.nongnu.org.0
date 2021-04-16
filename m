Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61AD361A90
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:34:51 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJ06-000597-PH
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXIyz-0004EU-4G
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:33:41 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:29676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXIys-0002FR-SO
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:33:39 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210416073325epoutp01f2bf5f5c226ba51bb4b7a8efe4c41ac8~2Rkt1ojkG0067400674epoutp01H
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:33:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210416073325epoutp01f2bf5f5c226ba51bb4b7a8efe4c41ac8~2Rkt1ojkG0067400674epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618558406;
 bh=lJR5R6ERXho7N9iB9ZdCWIjTjXKgmoTrz96wMpKO3BA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hR20zOkx2HfafXmXUB+YQ6Hmx05AQL5YmGOyqxfqZuMQIKy6opthHtiOyOVlfbip8
 0Fo2kT58pILSBbH4MajuKxuBJj8RN8Eq74Qgc7ivQL2BYzH+H6w6vdfncARSvWbE8J
 VS4uH7qpOqJi/JwZJqNN60VRmhVHiHwm8JrOarVQ=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210416073325epcas5p15e75f041a0abe1da4343b35bcc0618d2~2RktT1F5g1005810058epcas5p18;
 Fri, 16 Apr 2021 07:33:25 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DC.39.41008.5CD39706; Fri, 16 Apr 2021 16:33:25 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20210416072544epcas5p26bf011c82ad4b60693cfaac32bc9e36f~2Rd-kuAmf1403414034epcas5p2U;
 Fri, 16 Apr 2021 07:25:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210416072543epsmtrp1a592ff4c5fd4cdcb4dea992dc2c84da4~2Rd-jy_oL1222812228epsmtrp1W;
 Fri, 16 Apr 2021 07:25:43 +0000 (GMT)
X-AuditID: b6c32a4b-64bff7000001a030-d3-60793dc5e5f8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 50.0E.33967.7FB39706; Fri, 16 Apr 2021 16:25:43 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210416072542epsmtip2f55739a6129e3c5507121c4cd495956b~2Rd_CACtQ0688506885epsmtip2B;
 Fri, 16 Apr 2021 07:25:42 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/block/nvme: fix lbaf formats initialization
Date: Fri, 16 Apr 2021 12:52:34 +0530
Message-Id: <20210416072234.25732-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416072234.25732-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7bCmuu5R28oEg63PRCxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroypq8+zFXwVqlg1S6KBsYeni5GDQ0LA
 ROLoMv0uRi4OIYHdjBL3p65lhHA+MUr8m3KSDcL5xijx+VAHUxcjJ1jHuivvWSASexklfmw6
 xgrhtDFJfJm0lhmkik3ASGL22zeMILaIgKTE767TYHFmkCXf5uqA2MICzhKNe7+DTWURUJW4
 /OsRG4jNK2Arsf1qByvENnmJ1RsOgPVyCthJLLy8kwlkmYTALXaJDedfM0M84SJx41E5RL2w
 xKvjW9ghbCmJl/1tQDY7kF0tcbgIorODUeLY5Q1sECX2Ev+eTWMEmcIsoCmxfpc+RFhWYuqp
 dUwQF/NJ9P5+AvU7r8SOeTC2msSCW9+hNslIzPxzG+piD4kdj46xQ4JkIqNEz/vFzBMY5WYh
 rFjAyLiKUTK1oDg3PbXYtMA4L7Vcrzgxt7g0L10vOT93EyM4UWh572B89OCD3iFGJg7GQ4wS
 HMxKIrzGnRUJQrwpiZVVqUX58UWlOanFhxilOViUxHl3GDyIFxJITyxJzU5NLUgtgskycXBK
 NTBxznwfddVaffnSV0wXTDUUV9y7WSJe7n1LIYd5zrI//Y4bBcMnMqxQnPNB8oZi4MGbzaeV
 TmS+7vqwhjPr9Bax2zGmCwQLmrlKJ79SLYhOe5p69/rNDybegdLJfnbqtUvqlwhOCasz+vj8
 z/QQXotFHZU9E7eY7RI6W39p6WyurTVFt6z++vyYsu9r0YpipiMMazteOewzz16tOfvm0skX
 NvA/0fnIveCPwdkqgdgrC274XrnPUVi09fO3oCOarzaXf5p18dyWRi7XOitNP524zW45ewu/
 /kt8wbQkfbkt34tNVZ0PEyd6M017nOplGrj6S3/Jh+15Mkf9DP9cVzhdt1Lg71TRFrkrMxT3
 H7zyQYmlOCPRUIu5qDgRAH2xP7iDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsWy7bCSvO5368oEg+2/jCxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroypq8+zFXwVqlg1S6KBsYeni5GTQ0LA
 RGLdlfcsXYxcHEICuxkljs3czwSRkJH4dWoqM4QtLLHy33N2iKIWJonL/RsZQRJsAkYSs9++
 AbNFBCQlfnedZgYpYhY4yihxuX0yC0hCWMBZonHvd7CpLAKqEpd/PWIDsXkFbCW2X+1ghdgg
 L7F6wwGwbZwCdhILL+8EqxcCqmm/t5ltAiPfAkaGVYySqQXFuem5xYYFhnmp5XrFibnFpXnp
 esn5uZsYwSGppbmDcfuqD3qHGJk4GA8xSnAwK4nwGndWJAjxpiRWVqUW5ccXleakFh9ilOZg
 URLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXApJAY5WcqaCp52+burdd+Z97a/phzZpXpMy7l
 a2znA48v7VMwmmvtPf/tVw3NmVzRoT9nXlLfovYq8j1HVHiNTJnSJ/lDS11WVUZXH2tf9fNo
 vtzXadWTQ5Zvvnfsqpb02zMnd8ebF7HsK9A6lHjhwhSthRXfNwZ3VJ1g5Qw4Xu7ybAW3fTCn
 h9TDq9v3OB+s1bB+/n56cvOm7NaLi90tqgVuPDD602JT/Y1h8WOzW5qPD1z91biGif3czu9F
 G5899nrl8V+FvWdig9dGj54THbei5Yv2a74QqZ6yMqtGuWjJ0nk9WspJyxzivrFM8C18vtfX
 Y+UOmUlcN7wuaS+dGH6aSaIjtLMgK8BSzSfkkxJLcUaioRZzUXEiAJWhSZy4AgAA
X-CMS-MailID: 20210416072544epcas5p26bf011c82ad4b60693cfaac32bc9e36f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210416072544epcas5p26bf011c82ad4b60693cfaac32bc9e36f
References: <20210416072234.25732-1-anaidu.gollu@samsung.com>
 <CGME20210416072544epcas5p26bf011c82ad4b60693cfaac32bc9e36f@epcas5p2.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently LBAF formats are being intialized based on metadata
size if and only if nvme-ns "ms" parameter is non-zero value.
Since FormatNVM command being supported device parameter "ms"
may not be the criteria to initialize the supported LBAFs.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme-ns.c | 48 ++++++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f182..573dbb5a9d 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -85,38 +85,28 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
-    if (ns->params.ms) {
-        id_ns->mc = 0x3;
+    id_ns->mc = 0x3;
 
-        if (ns->params.mset) {
-            id_ns->flbas |= 0x10;
-        }
+    if (ms && ns->params.mset) {
+        id_ns->flbas |= 0x10;
+    }
 
-        id_ns->dpc = 0x1f;
-        id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
-
-        NvmeLBAF lbaf[16] = {
-            [0] = { .ds =  9           },
-            [1] = { .ds =  9, .ms =  8 },
-            [2] = { .ds =  9, .ms = 16 },
-            [3] = { .ds =  9, .ms = 64 },
-            [4] = { .ds = 12           },
-            [5] = { .ds = 12, .ms =  8 },
-            [6] = { .ds = 12, .ms = 16 },
-            [7] = { .ds = 12, .ms = 64 },
-        };
-
-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-        id_ns->nlbaf = 7;
-    } else {
-        NvmeLBAF lbaf[16] = {
-            [0] = { .ds =  9 },
-            [1] = { .ds = 12 },
-        };
+    id_ns->dpc = 0x1f;
+    id_ns->dps = ((ns->params.pil & 0x1) << 3) | ns->params.pi;
 
-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-        id_ns->nlbaf = 1;
-    }
+    NvmeLBAF lbaf[16] = {
+        [0] = { .ds =  9           },
+        [1] = { .ds =  9, .ms =  8 },
+        [2] = { .ds =  9, .ms = 16 },
+        [3] = { .ds =  9, .ms = 64 },
+        [4] = { .ds = 12           },
+        [5] = { .ds = 12, .ms =  8 },
+        [6] = { .ds = 12, .ms = 16 },
+        [7] = { .ds = 12, .ms = 64 },
+    };
+
+    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
+    id_ns->nlbaf = 7;
 
     for (i = 0; i <= id_ns->nlbaf; i++) {
         NvmeLBAF *lbaf = &id_ns->lbaf[i];
-- 
2.17.1


