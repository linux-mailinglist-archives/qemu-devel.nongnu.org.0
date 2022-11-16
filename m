Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDA162C636
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovM3r-00030R-AL; Wed, 16 Nov 2022 12:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovM3g-0002xQ-PA
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:18:52 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ovM3c-0001z4-DY
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:18:44 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20221116171836euoutp01d92af0eac555c0b8fcf60f676526b722~oID7TTzXW1146511465euoutp01t
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 17:18:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20221116171836euoutp01d92af0eac555c0b8fcf60f676526b722~oID7TTzXW1146511465euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668619116;
 bh=K9Gq2OcbG7ibVgCFXB2LgqEKH0xYcZOgN5C2iBELMlA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=m3uSgjdonTeWKIn5GUEXblp3/IQ/zOP/CB9C9G8yto+M5nF92/dkhjy2+eZeiamkY
 YpyIXG9vcPWZQA8pbwudv1X6BA6fvXmOSXdwOQBLfBNOHhFT0JGvQUgLk8AkY9IyMm
 lGbuQ7bHvgr5Xb3vL2lEbEodOQPU3IvyC4GfYHiM=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221116171835eucas1p26c3981a867af8233c7a85e4c78e3810b~oID7GWQmB2961429614eucas1p2e;
 Wed, 16 Nov 2022 17:18:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 5B.40.09549.B6B15736; Wed, 16
 Nov 2022 17:18:35 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221116171835eucas1p1a5c58589cd0ffa35736336c663b40a62~oID6rTM261500915009eucas1p1p;
 Wed, 16 Nov 2022 17:18:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221116171835eusmtrp183d5153a73aff66e448bb1f63379437e~oID6q0DlL2593625936eusmtrp1B;
 Wed, 16 Nov 2022 17:18:35 +0000 (GMT)
X-AuditID: cbfec7f5-f47ff7000000254d-c9-63751b6bd490
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.BD.08916.B6B15736; Wed, 16
 Nov 2022 17:18:35 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221116171835eusmtip2d9f6278469925542f6c10abd30501281~oID6a1Vx71165011650eusmtip2I;
 Wed, 16 Nov 2022 17:18:35 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Nov 2022 17:18:34 +0000
From: Joel Granados <j.granados@samsung.com>
To: <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>, <k.jensen@samsung.com>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v3 1/2] nvme: Move adjustment of data_units{read,written}
Date: Wed, 16 Nov 2022 18:14:54 +0100
Message-ID: <20221116171455.3401086-2-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221116171455.3401086-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7djP87rZ0qXJBsdaTC1mvWtnszjeu4PF
 gcnjybXNTAGMUVw2Kak5mWWpRfp2CVwZk749Yim4K1Sx+PJZ9gbGl3xdjJwcEgImEit+XWMC
 sYUEVjBKvD4W18XIBWR/YZR4//EUC4TzmVHi+7dHbDAdKxc8ZIJILGeU+HVoIStc1c/Dl5gh
 Zm1mlJi8SQXEZhPQkTj/5g5YXETAR+Li66ksIDazgJbEjc9HGEFsYQFPiUdnv7OC2CwCqhJ3
 W/eD1fAK2Eqc2XSBCWKzvETb9elg9ZwCdhLftjxkhqgRlDg58wnUTHmJ5q2zmSFsCYmDL14w
 Q/QqSmyZAzFfQqBWYu2xM+wgR0sIrOWQmDe3FyrhIrHk7nyoN4UlXh3fwg5hy0icntzDAmFn
 S+ycsgtqaIHErJNTgeo5gGxrib4zORBhR4nFW0H2goT5JG68FYQ4h09i0rbpUGFeiY42oQmM
 KrOQPDALyQOzkDywgJF5FaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmBKOP3v+NcdjCte
 fdQ7xMjEwXiIUYKDWUmEN39ySbIQb0piZVVqUX58UWlOavEhRmkOFiVxXrYZWslCAumJJanZ
 qakFqUUwWSYOTqkGJs35ZTaLFYSfT3lgl/euJ9ezM+xqff36adMDJ+b3lQp1Wnh1vY/9NmPl
 FVkzfvuuhonxVl8dpr27LGTE/37Fu18LStYI63yPKr1xvEk9Ls52YZe0vtR+xjs1LNOfq9vs
 2ODlUvRlMePMx897gnrvTlG+/FrZ6nqXccoXlaMi9yw/f1y6sd7Kr7H3q3Ch+lsFydjnX/TL
 6xWc53lo6n++r553r+9z5onKzw6qwTo8vw7ckkmbX/FUj9V9mtmkltMOPop8zj+ZDj3JTeap
 +HtUfKZJ89HE0meB86arJdZXq8Vb5rF/uTFlGVfhlEz5v+oZz+YoOgj1VXxzZtM+f/K50g52
 9qMCfOmLH29ieiuoxFKckWioxVxUnAgAEhWmzXgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42I5/e/4Pd1s6dJkg0mnhCxmvWtnszjeu4PF
 gcnjybXNTAGMUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWp
 Rfp2CXoZk749Yim4K1Sx+PJZ9gbGl3xdjJwcEgImEisXPGTqYuTiEBJYyiixbtdeFoiEjMSn
 Kx/ZIWxhiT/XuthAbCGBj4wSh5+pQzRsZpT41rCNCSTBJqAjcf7NHWYQW0TAR+Li66lgg5gF
 tCRufD7CCGILC3hKPDr7nRXEZhFQlbjbuh+shlfAVuLMpgtMEMvkJdquTwer5xSwk/i25SHQ
 TA6gZbYSF+6VQpQLSpyc+QRqvLxE89bZzBC2hMTBFy+YIcYoSmyZA7FKQqBW4tX93YwTGEVm
 IWmfhaR9FpL2BYzMqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJjZtuxn5t3MM579VHvECMT
 B+MhRgkOZiUR3vzJJclCvCmJlVWpRfnxRaU5qcWHGE2B3pzILCWanA+M2rySeEMzA1NDEzNL
 A1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqbl5U/zr+Ss/Ppb5cnSQgWOc/qVTBI7
 QvJ/2rRf09jzR30l64LqP3dN7Fw17hvwmF7/suK5QDDbvrq3XlGBjps3O0gv+hR8LGvXkd0h
 J7gcs5c9XqFXrvrm2tmtvKJKz1/NDXsrf5+fzWhp3LO7O7/5Hfny7uSZ96EFS/PDPm6wvnDz
 GXewcVOU9f/+Lzo1O9X9BHIYjnw6oLM6w4tV9aWGFHPax+ZlHzXrTHlMj/I9sb+hXL5Dbucu
 xT8zzoiLaPyvy4ufsUwnqO/MWu9k9mkBl2WXajLdZtJ+GbyfJ3LO41t7r53vZQ9uu9W70eW0
 RoT24eiS1Cv9fg2Mpa/K3jlOSsgOfj45yn59c9rNnXJKLMUZiYZazEXFiQDZNQ5wIgMAAA==
X-CMS-MailID: 20221116171835eucas1p1a5c58589cd0ffa35736336c663b40a62
X-Msg-Generator: CA
X-RootMTR: 20221116171835eucas1p1a5c58589cd0ffa35736336c663b40a62
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221116171835eucas1p1a5c58589cd0ffa35736336c663b40a62
References: <20221116171455.3401086-1-j.granados@samsung.com>
 <CGME20221116171835eucas1p1a5c58589cd0ffa35736336c663b40a62@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.11;
 envelope-from=j.granados@samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


