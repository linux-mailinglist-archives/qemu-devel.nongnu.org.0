Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721A16362AC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 16:03:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxrGY-000513-4O; Wed, 23 Nov 2022 10:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1oxo5C-00027T-Al; Wed, 23 Nov 2022 06:38:26 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@huawei.com>)
 id 1oxo59-0003SP-DF; Wed, 23 Nov 2022 06:38:25 -0500
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NHJtW1lRCzXdYd;
 Wed, 23 Nov 2022 19:34:11 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 23 Nov
 2022 19:38:05 +0800
Date: Thu, 24 Nov 2022 11:38:02 +0800
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, liyang
 <liyang281@huawei.com>, Hui Wang <hw.huiwang@huawei.com>
Subject: arm: gdb-stub is broken by FEAT_HAFDBS
Message-ID: <20221124033802.meuiphlcskwu3aty@M910t>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=changbin.du@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Nov 2022 10:02:15 -0500
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
Reply-to:  Changbin Du <changbin.du@huawei.com>
From:  Changbin Du via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello, Richard,
We just noticed the gdb-stub is broken and probably caused by commit 4a3585568
("target/arm: Plumb debug into S1Translate").

(gdb) target remote :1234
Remote debugging using :1234
0x000000000e1716d0 in ?? ()
=> 0x000000000e1716d0:  Cannot access memory at address 0xe1716d0

This issue can be workaround by below change.

--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2879,7 +2879,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     S1Translate ptw = {
         .in_mmu_idx = arm_mmu_idx(env),
         .in_secure = arm_is_secure(env),
-        .in_debug = true,
+        .in_debug = false,
     };

Could you take a look at this? Thank you!

-- 
Cheers,
Changbin Du

