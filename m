Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD83349407
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:28:49 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQyc-0002KZ-Sj
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQxM-0000tQ-PS; Thu, 25 Mar 2021 10:27:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPQxK-0008Rm-6a; Thu, 25 Mar 2021 10:27:28 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5nRw3tCKzPltK;
 Thu, 25 Mar 2021 22:24:44 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 22:27:07 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
Date: Thu, 25 Mar 2021 22:27:02 +0800
Message-ID: <20210325142702.790-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They were introduced in commit 9bde7f0674fe ("hw/arm/smmuv3: Implement
translate callback") but never actually used. Drop them.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/smmuv3-internal.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index b6f7e53b7c..3dac5766ca 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -595,13 +595,6 @@ static inline int pa_range(STE *ste)
 #define CD_A(x)          extract32((x)->word[1], 14, 1)
 #define CD_AARCH64(x)    extract32((x)->word[1], 9 , 1)
 
-#define CDM_VALID(x)    ((x)->word[0] & 0x1)
-
-static inline int is_cd_valid(SMMUv3State *s, STE *ste, CD *cd)
-{
-    return CD_VALID(cd);
-}
-
 /**
  * tg2granule - Decodes the CD translation granule size field according
  * to the ttbr in use
-- 
2.19.1


