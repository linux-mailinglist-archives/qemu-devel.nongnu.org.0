Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E06386CE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 10:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyVNQ-0000Cg-Al; Fri, 25 Nov 2022 04:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1oyVNL-0000C6-Ki
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 04:52:03 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1oyVNI-0002kO-Qy
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 04:52:03 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221125095153euoutp02b913ec8bee4140fadbab1ae20a3b32bb~qyxdxPhrx2449024490euoutp02G
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 09:51:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221125095153euoutp02b913ec8bee4140fadbab1ae20a3b32bb~qyxdxPhrx2449024490euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669369913;
 bh=K9Gq2OcbG7ibVgCFXB2LgqEKH0xYcZOgN5C2iBELMlA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=FFFtwUM/qPCwV7EX8RwcOckGJZ3WE/T7Of7Gs035+hg2YjeqH5lnuR/pyh4PtJVsW
 FkQW3FyWROJRT4uI+HD4FxI1JN6E3IAOuM8rFkwscNz7ztni8FhoJk2BpI6lunmwnJ
 nj63bjsQAhaq1PfdsnZy76fAIbS1f+js6vLlQDnI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221125095153eucas1p22fb35f11ff697d611bca5e0b28617013~qyxdmtU7j0875008750eucas1p2l;
 Fri, 25 Nov 2022 09:51:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 96.B8.10112.93090836; Fri, 25
 Nov 2022 09:51:53 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221125095152eucas1p2e67e201303d24bd2539b056302c08847~qyxdV60w60892408924eucas1p2R;
 Fri, 25 Nov 2022 09:51:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221125095152eusmtrp2e84fc2a85a41a5bfeedfa8a6a7e60152~qyxdVZ5Cn2978629786eusmtrp2U;
 Fri, 25 Nov 2022 09:51:52 +0000 (GMT)
X-AuditID: cbfec7f4-cf3ff70000002780-ee-6380903988f4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 64.92.08916.83090836; Fri, 25
 Nov 2022 09:51:52 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221125095152eusmtip15517953a3f113ca29c86de000e96e255~qyxdLbVy52459524595eusmtip1S;
 Fri, 25 Nov 2022 09:51:52 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Nov 2022 09:51:52 +0000
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v4 1/2] nvme: Move adjustment of data_units{read,written}
Date: Fri, 25 Nov 2022 10:48:07 +0100
Message-ID: <20221125094808.1856024-2-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221125094808.1856024-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djPc7qWExqSDc418FjMetfOZnG8dweL
 A5PHk2ubmQIYo7hsUlJzMstSi/TtErgyJn17xFJwV6hi8eWz7A2ML/m6GDk5JARMJBoOtLF0
 MXJxCAmsYJRYcfQJlPOFUWLZuzdsEM5nRol15z+zw7RM3XONCSKxnFFi7qoWVriqA9s62CGc
 zYwSF3Y0gLWwCehInH9zhxnEFhHwkVgxey0TiM0soCVx4/MRRhBbWMBT4tPeWUA2BweLgKrE
 snuuIGFeAVuJ7iUXGSE2y0u0XZ8OZnMK2EncmzGbHaJGUOLkTJC7QUbKSzRvnc0MYUtIHHzx
 ghmiV1Fiy5zvrBB2rcSpLbfAPpAQWMkh8XzfS6gFLhL9mzqZIGxhiVfHt0C9LCPxf+d8qHi2
 xM4pu6CGFkjMOjmVDeRmCQFrib4zORCmo0T7Um4Ik0/ixltBiGv4JCZtm84MEeaV6GgTmsCo
 MgvJ/bOQ3D8Lyf0LGJlXMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBKaE0/+Of9nBuPzV
 R71DjEwcjIcYJTiYlUR4RewakoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzss3QShYSSE8sSc1O
 TS1ILYLJMnFwSjUwFW07uNVM9IrStX/ftFrvaVWKpN+fYbkxle3Jn/+vWrXZrMPMWfv/SVsp
 nFXZoScjU9mmfXTykquuB2+8/3llMmd4+SP+Y/wlJ7qcli9b8fe/ztLHjB6LWm7nPovdnxTi
 xDNxbv/pbvtr3ob3+LXCgvWvzFOWKvCqMRWd3fFQ8MqeiRviHBK8DjaI1Wz0V9LM2HR+Y0Oy
 imrH/XMuO/Vy5ojfvDPlQIni4oii/sZXIo9ELdRrJ4b+sOp9eGxZlahSu8NFZ4UbEtWmk1K6
 VunMkFj6qmjzhKfqGz4z7dpnu74g8WyBssfPA5PuZcfNUrffrnA88cWWJaGnP1y9V1Ap1fWE
 V6vrnltK3tYzehctlFiKMxINtZiLihMBRnA+LHgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4XV2LCQ3JBl9em1vMetfOZnG8dweL
 A5PHk2ubmQIYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstS
 i/TtEvQyJn17xFJwV6hi8eWz7A2ML/m6GDk5JARMJKbuucbUxcjFISSwlFFi7a7vzBAJGYlP
 Vz6yQ9jCEn+udbGB2EICHxklrjc7QDRsZpRonH0OLMEmoCNx/s0dsGYRAR+JFbPXMoHYzAJa
 Ejc+H2EEsYUFPCU+7Z0FZHNwsAioSiy75woS5hWwlehecpERYpe8RNv16WA2p4CdxL0Zs9kh
 9tpKvDi5lRGiXlDi5MwnLBDj5SWat85mhrAlJA6+eAF1v6LEljnfWSHsWonPf58xTmAUmYWk
 fRaS9llI2hcwMq9iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjJltx35u3sE479VHvUOMTByM
 hxglOJiVRHhF7BqShXhTEiurUovy44tKc1KLDzGaAr05kVlKNDkfGLV5JfGGZgamhiZmlgam
 lmbGSuK8ngUdiUIC6YklqdmpqQWpRTB9TBycUg1MhemvxFyXs29YFeBu5S65gzciUMp9wmVZ
 w1v+K07Wbtt8flVBTfYL52uHDL/Wv7upLPz25Hb1FcxGddrekbs80n+pCbD7p5gs0KzYL+W+
 JeppU2Bb3teMPKMOlhccZh3vKqSlr6ROuyu12lRlQeCaJ5PTpl5Rf7Ag3cq7xnqVZoLz/k+y
 51wbqyJYU2r4gl5zC0TM0jwRsO7Q7rxn877vLuh4VHZDPMND+L291dnb7fHvN92QVD/tfZhb
 t0J545Irf+LYz+nzz7XWuPVij+KDC7zcZtNv3vzLcOVij6Fk9qRol0j1qNWWCxddSJG1i2oz
 LWSQsbo3750o4ysrtuCYDQt6Je18ru468O/cPmclluKMREMt5qLiRABrsJrZIgMAAA==
X-CMS-MailID: 20221125095152eucas1p2e67e201303d24bd2539b056302c08847
X-Msg-Generator: CA
X-RootMTR: 20221125095152eucas1p2e67e201303d24bd2539b056302c08847
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221125095152eucas1p2e67e201303d24bd2539b056302c08847
References: <20221125094808.1856024-1-j.granados@samsung.com>
 <CGME20221125095152eucas1p2e67e201303d24bd2539b056302c08847@eucas1p2.samsung.com>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=j.granados@samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 87aeba0564..bf291f7ffe 100644
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
@@ -4464,6 +4464,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     uint32_t trans_len;
     NvmeNamespace *ns;
     time_t current_ms;
+    uint64_t u_read, u_written;
 
     if (off >= sizeof(smart)) {
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -4490,10 +4491,11 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     trans_len = MIN(sizeof(smart) - off, buf_len);
     smart.critical_warning = n->smart_critical_warning;
 
-    smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
-                                                        1000));
-    smart.data_units_written[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_written,
-                                                           1000));
+    u_read = DIV_ROUND_UP(stats.units_read >> BDRV_SECTOR_BITS, 1000);
+    u_written = DIV_ROUND_UP(stats.units_written >> BDRV_SECTOR_BITS, 1000);
+
+    smart.data_units_read[0] = cpu_to_le64(u_read);
+    smart.data_units_written[0] = cpu_to_le64(u_written);
     smart.host_read_commands[0] = cpu_to_le64(stats.read_commands);
     smart.host_write_commands[0] = cpu_to_le64(stats.write_commands);
 
-- 
2.30.2


