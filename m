Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93017628E2C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujB3-0001Y4-LS; Mon, 14 Nov 2022 18:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ouifE-0004Vp-EW
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:53 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1oua1X-00024z-72
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 09:01:35 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221114135428euoutp015071fc602edc6891f40bbefeeadd1f8c~nd-H_wfSO1925119251euoutp01V
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 13:54:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221114135428euoutp015071fc602edc6891f40bbefeeadd1f8c~nd-H_wfSO1925119251euoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668434068;
 bh=iMwST7AdxVjY1n+TKgEyrOBOqDS0BGwV9ESCrr4JkOc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=n82X6nDveItyM9uBGQNMVazyczZtzq3RU/piKZ7HWpptIxl+EW7IZiDVsfxFdfuvy
 Ro/KDsSPeUIm4N3XeQEkOateOZd7NXJEjzREYHB+/kPqLQCVflhFSARkV/aXoPmFjh
 Zrbc0DyBPdEHzyQJEG1fyOPdzV/WofmvVqTRT5P8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221114135428eucas1p2448d8cf7c00c6259737e32d2a02fa3de~nd-H4C5Hl1591315913eucas1p29;
 Mon, 14 Nov 2022 13:54:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id AB.28.10112.39842736; Mon, 14
 Nov 2022 13:54:27 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221114135427eucas1p1159db5cc4719af64f8a8449853815c4b~nd-HDuhzO3270632706eucas1p1t;
 Mon, 14 Nov 2022 13:54:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221114135427eusmtrp258c9cb6c2dd8f678b05ccd659bc7a588~nd-HC8mqf0116501165eusmtrp26;
 Mon, 14 Nov 2022 13:54:27 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-2d-63724893dd24
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A6.D3.08916.39842736; Mon, 14
 Nov 2022 13:54:27 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221114135427eusmtip126ea1ad0cc6af17c5db5acef16726016~nd-G6PZDR2644826448eusmtip1M;
 Mon, 14 Nov 2022 13:54:27 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Nov 2022 13:54:26 +0000
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v2 1/3] nvme: Move adjustment of data_units{read,written}
Date: Mon, 14 Nov 2022 14:50:41 +0100
Message-ID: <20221114135043.2958100-2-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114135043.2958100-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djPc7qTPYqSDWa+0beY9a6dzeJ47w4W
 ByaPJ9c2MwUwRnHZpKTmZJalFunbJXBl7O5by1SwR7Dix9z7jA2Mr3m6GDk5JARMJK593MHY
 xcjFISSwglFi49+jbBDOF0aJ/ofPmSGcz4wS827dZIJpOfsVpmU5o8Sj1fuY4Kr6+h9DOZsZ
 JR7sfs8K0sImoCNx/s0dZhBbRMBHYsXstWCjmAW0JG58PsIIYgsLeEo0X3vBDmKzCKhKPF3+
 hQ3E5hWwlZj/8CIrxGp5ibbr08HqOQXsJM7+3sIOUSMocXLmExaImfISzVtnM0PYEhIHX7xg
 huhVlNgy5zvUnFqJB296wH6TEFjLIbG57QlUkYtE98SvULawxKvjEAskBGQk/u+cD/V/tsTO
 KbugagokZp2cCnQoB5BtLdF3Jgci7Cix4fAGdogwn8SNt4IQ5/BJTNo2nRkizCvR0SY0gVFl
 FpIHZiF5YBaSBxYwMq9iFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITAun/x3/soNx+auP
 eocYmTgYDzFKcDArifDOk8lPFuJNSaysSi3Kjy8qzUktPsQozcGiJM7LNkMrWUggPbEkNTs1
 tSC1CCbLxMEp1cAU3LKU2fCXfFGfQVmt6dJZzfv2y+So/5SobWlKbNY6X1DWdstZMe7ZhSN8
 E9dnSkvvlfL+rcs0T8PUavkT7+AdMRMOCBSUxl+veqyh8nef/JG5uyzmpOetq7T2ilRZoKvr
 uavP52qL1zvlpEPRje7Tnxb3XXfRD82+XPdI2CJprgvrhRlT59rqbzljHHos25J3Tp5ds3On
 dchxzicLClokb2aUrmgJ/Pnt9arHvSxisiFiC76usLU+5GKw+9m9l1NuL1G8eGLDZ52JDzd8
 T849+a5h/tZPDHFbso4tPL73wmPOIxfvuvI7+K0sn3d2tca2ZfpJmzO8d1or+ZZ0ngw9XZgS
 tP+oWlf/eT71P5JKLMUZiYZazEXFiQDItXKLegMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsVy+t/xu7qTPYqSDX5O4rKY9a6dzeJ47w4W
 ByaPJ9c2MwUwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehl7O5by1SwR7Dix9z7jA2Mr3m6GDk5JARMJM5+3cHYxcjFISSwlFGiaeMbRoiEjMSn
 Kx/ZIWxhiT/Xutggij4ySny8f5QJwtnMKPHvx3YWkCo2AR2J82/uMIPYIgI+Eitmr2UCsZkF
 tCRufD4CNlVYwFOi+doLsKksAqoST5d/YQOxeQVsJeY/vMgKsU1eou36dLB6TgE7ibO/t4DV
 CwHVbLm/ixmiXlDi5MwnLBDz5SWat85mhrAlJA6+eMEMMUdRYsuc71AzayU2vV7PNIFRZBaS
 9llI2mchaV/AyLyKUSS1tDg3PbfYUK84Mbe4NC9dLzk/dxMjMG62Hfu5eQfjvFcf9Q4xMnEw
 HmKU4GBWEuGdJ5OfLMSbklhZlVqUH19UmpNafIjRFOjPicxSosn5wMjNK4k3NDMwNTQxszQw
 tTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgOmanPyf200PPHVtPntzI/+xo5rZd7pmi
 54NLHxfvzjrU8MpApeCQidPlB5u3Noeoftbce3TF4nvrjx6TYzZ490vVLODLxEl3rKWLFOoW
 PTZolEjpnFHza+Lm5NgLVnuX6Fjp7r7w+e+MV4XN5qd7Sj9zaDXb7M+b9ChewL98ziSDE/Nc
 4pSClib1zZrDl+XYcf3LqiVzLPL+/n3gbrdtZkHE86Uhbgorf7qmsrtPbwgzurN4h9DbFZ1i
 KV2Ji7/p7ayJbRdyaUv4WDnHpG/30bKA2oyjZYey+A8+W5u+/W/DvieCi9W2Wj1dJpAh0TAn
 6efFpprTtkcf3Y9e+XRHydSeJNc1nOKBjtGNkdNtjiuxFGckGmoxFxUnAgDtrl1XJAMAAA==
X-CMS-MailID: 20221114135427eucas1p1159db5cc4719af64f8a8449853815c4b
X-Msg-Generator: CA
X-RootMTR: 20221114135427eucas1p1159db5cc4719af64f8a8449853815c4b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221114135427eucas1p1159db5cc4719af64f8a8449853815c4b
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135427eucas1p1159db5cc4719af64f8a8449853815c4b@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Nov 2022 18:47:40 -0500
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

In order to return the units_{read/written} required by the SMART log we
need to shift the number of bytes value by BDRV_SECTORS_BITS and multiply
by 1000. This is a prep patch that moves this adjustment to where the SMART
log is calculated in order to use the stats struct for calculating OCP
extended smart log values.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 hw/nvme/ctrl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..220683201a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4449,8 +4449,8 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, struct nvme_stats *stats)
 {
     BlockAcctStats *s = blk_get_stats(ns->blkconf.blk);
 
-    stats->units_read += s->nr_bytes[BLOCK_ACCT_READ] >> BDRV_SECTOR_BITS;
-    stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE] >> BDRV_SECTOR_BITS;
+    stats->units_read += s->nr_bytes[BLOCK_ACCT_READ];
+    stats->units_written += s->nr_bytes[BLOCK_ACCT_WRITE];
     stats->read_commands += s->nr_ops[BLOCK_ACCT_READ];
     stats->write_commands += s->nr_ops[BLOCK_ACCT_WRITE];
 }
@@ -4490,10 +4490,12 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     trans_len = MIN(sizeof(smart) - off, buf_len);
     smart.critical_warning = n->smart_critical_warning;
 
-    smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
-                                                        1000));
-    smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_written,
-                                                           1000));
+    smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(
+                                           stats.units_read >> BDRV_SECTOR_BITS,
+                                           1000));
+    smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(
+                                              stats.units_written >> BDRV_SECTOR_BITS,
+                                              1000));
     smart.host_read_commands[0] = cpu_to_le64(stats.read_commands);
     smart.host_write_commands[0] = cpu_to_le64(stats.write_commands);
 
-- 
2.30.2


