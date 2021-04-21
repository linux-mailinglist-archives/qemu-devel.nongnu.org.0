Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024423678AA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:26:08 +0200 (CEST)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQul-0005Ci-2C
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQsi-0002yi-5Z
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:24:01 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:64874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQse-0001DF-Vz
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:23:59 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210422042354epoutp03a19a3973b9f6598d841d40400c790c28~4E28eeUkz0254902549epoutp03i
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:23:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210422042354epoutp03a19a3973b9f6598d841d40400c790c28~4E28eeUkz0254902549epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619065434;
 bh=+MRE7TPmJtiJjbLiVsNYxuuuuAJ+quryeLT4dCLMwls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z5Jcd6gSoi5vmudbJRkFI6o3VhRIBw5atYQiYxsgP50sCac23oPf/MmE3rBSS8fyv
 4tb1BNQRmsm3s0aVggrg8WZ9Oc+xiJbjxZk42MQoth7+CCfzzLVn1Q6BvtNePj+2rg
 3KLVq3jkEQPVbUN+5TKeLYNkWVF8akJvTO+akpWg=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210422042353epcas5p292ec9ed25c8e4f07be09f7782cfa09b1~4E28OhO5S1269612696epcas5p2c;
 Thu, 22 Apr 2021 04:23:53 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2E.08.09697.95AF0806; Thu, 22 Apr 2021 13:23:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210421125424epcas5p4f88500b9f49948e24e6f362375860745~34LYvBGsg2794727947epcas5p4L;
 Wed, 21 Apr 2021 12:54:24 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210421125424epsmtrp2aacd3a9ed3e131c9b33a15dac2fa6106~34LYuH1p22654826548epsmtrp2Q;
 Wed, 21 Apr 2021 12:54:24 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-ad-6080fa594d38
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 3A.64.08163.F7020806; Wed, 21 Apr 2021 21:54:24 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210421125422epsmtip187bba9af69ce226d99bd3d1c8de68173~34LXSti-j1949819498epsmtip1T;
 Wed, 21 Apr 2021 12:54:22 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/block/nvme: fix lbaf formats initialization
Date: Wed, 21 Apr 2021 18:21:00 +0530
Message-Id: <20210421125100.12789-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421125100.12789-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGIsWRmVeSWpSXmKPExsWy7bCmhm7kr4YEg/nz1Sxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC16l/1mt5j1rp3N4njvDhaL15P+szpwefw4187mcW7HeXaP
 Tas62TyeXNvM5PF+31U2j74tqxgD2KK4bFJSczLLUov07RK4Mq62fmUt2CtS0dZ0j62BcTFv
 FyMHh4SAicScv0VdjFwcQgK7GSWaP81kgnA+MUp8+nuWBcL5zCjRcvkHaxcjJ1jHyZ5tzCC2
 kMAuRolzfdwQRW1MEjOaLjKCJNgEjCRmv30DZosISEr87jrNDFLELHCOUaL91Us2kISwgLPE
 zs1zwaayCKhKHNi8DKyBV8BW4lvnAxaIbfISqzccANvGKWAncWD3TkaI+CN2iSdP6yBsF4kV
 szaxQdjCEq+Ob2GHsKUkPr/bCxRnB7KrJQ6DvSkh0MEocezyBqhye4l/z6YxgoKCWUBTYv0u
 fYiwrMTUU+uYQGxmAT6J3t9PmCDivBI75sHYahILbn2H2iQjMfPPbWj4eEg87ljNBgmTiYwS
 F56/YpvAKDcLYcUCRsZVjJKpBcW56anFpgVGeanlesWJucWleel6yfm5mxjBSUPLawfjwwcf
 9A4xMnEwHmKU4GBWEuFdW9yQIMSbklhZlVqUH19UmpNafIhRmoNFSZxX0Lk6QUggPbEkNTs1
 tSC1CCbLxMEp1cDE+tbtkn3jihn745mXvdV5fjBuxST1HYIitcJuu350VrT39GaFijxvn63p
 cn2KXx6j4p9y+fj8lGkrL3+3+fcypPfa9siiEC9G/0LrK8/Ftu+uyG+v//uz775mvW/VrLXr
 pY5FzfD/2ff23GS270JxCwp6N/h8sma6wlzU7OJ1/vS2bRxLave+bkx6VbmRe63m0s1ZfkJM
 8s3zzmaovPp3MfS8j1H7un01Z5lTIrvLNxYt1Yu35U+14olocDR8vcjih7Dz1tUpqSx3Xs5s
 aHaum3Lr6fYU75TbZqyf7n71K1u4YuLqOac8DnBPYDNMnifS/klnTuWtC1uXuNq/a3K/oc+9
 ePmj9fU6NrX+weuVWIozEg21mIuKEwECMWXeiQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsWy7bCSnG6DQkOCwfYjTBavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyha9y36zW8x6185mcbx3B4vF60n/WR24PH6ca2fzOLfjPLvH
 plWdbB5Prm1m8ni/7yqbR9+WVYwBbFFcNimpOZllqUX6dglcGVdbv7IW7BWpaGu6x9bAuJi3
 i5GTQ0LAROJkzzbmLkYuDiGBHYwS7w9MYIFIyEj8OjWVGcIWllj57zk7RFELk8Sx029ZQRJs
 AkYSs9++YQSxRQQkJX53nQabxCxwi1Fi19dLTCAJYQFniZ2b54I1sAioShzYvAysgVfAVuJb
 5wOobfISqzccANvGKWAncWD3TrAaIaCazc9PM01g5FvAyLCKUTK1oDg3PbfYsMAoL7Vcrzgx
 t7g0L10vOT93EyM4PLW0djDuWfVB7xAjEwfjIUYJDmYlEd77tTUJQrwpiZVVqUX58UWlOanF
 hxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTD1TNZ986bEKrBlcufj5pX374knFh+o
 tH4j6aTjb91ybf+vyN0Z+/+6ykzhbTh9h0n6+C7Ow4bvnp7el/a6ocK57OXRx4/zedYYPvj7
 SlvL6lSwvarLnBl5y+PK6qrtt0/mTNU4vm/TiheeWS3Wi068Wfjbf/b8d4kfAmcELQ/o+L+6
 7p1z+7zbNVnrSo651AZKe0n6bz+mnLhNTkbRebvgle+Kcg+E1eZsmKmpH5B2LiDFcFX6M/Pf
 avvE9fyOXlva3hU4N223+oVNE18mBx/U33LjzlGdd/aKTSdL+K0uGXcJbs9/72T1/2mBsXxb
 8U+5GbOrzmQyyPnVFiqzPP3y490B/UfSAmLlsRqPVi1SYinOSDTUYi4qTgQAUzTlbL4CAAA=
X-CMS-MailID: 20210421125424epcas5p4f88500b9f49948e24e6f362375860745
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210421125424epcas5p4f88500b9f49948e24e6f362375860745
References: <20210421125100.12789-1-anaidu.gollu@samsung.com>
 <CGME20210421125424epcas5p4f88500b9f49948e24e6f362375860745@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
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
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently LBAF formats are being intialized based on metadata
size if and only if nvme-ns "ms" parameter is non-zero value.
Since FormatNVM command being supported device parameter "ms"
may not be the criteria to initialize the supported LBAFs.

And make LBAF array as read-only.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme-ns.c | 51 ++++++++++++++++++++--------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f182..ae56142fcd 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -85,39 +85,32 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
-    if (ns->params.ms) {
-        id_ns->mc = 0x3;
+    id_ns->mc = 0x3;
 
-        if (ns->params.mset) {
-            id_ns->flbas |= 0x10;
-        }
-
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
+    if (ms && ns->params.mset) {
+        id_ns->flbas |= 0x10;
+    }
 
-        memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-        id_ns->nlbaf = 1;
+    id_ns->dpc = 0x1f;
+    id_ns->dps = ns->params.pi;
+    if (ns->params.pi && ns->params.pil) {
+        id_ns->dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
     }
 
+    static const NvmeLBAF lbaf[16] = {
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
+
     for (i = 0; i <= id_ns->nlbaf; i++) {
         NvmeLBAF *lbaf = &id_ns->lbaf[i];
         if (lbaf->ds == ds) {
-- 
2.17.1


