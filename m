Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED62C606D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 08:21:31 +0100 (CET)
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiY4Q-0003a0-G3
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 02:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1l-0002Ah-Vd; Fri, 27 Nov 2020 02:18:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1j-0007eB-LZ; Fri, 27 Nov 2020 02:18:45 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cj5Z728fHz74dv;
 Fri, 27 Nov 2020 15:18:07 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:19 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 0/7] Fix some memleaks caused by ptimer_init
Date: Fri, 27 Nov 2020 15:17:56 +0800
Message-ID: <20201127071803.2479462-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ganqixin@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

When running device-introspect-test, I found some memory leaks caused by
ptimer_init in the init function, so I released it in the finalize function.


Gan Qixin (7):
  allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid
    memleaks
  digic-timer: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_mct: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_pwm: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_rtc: Use ptimer_free() in the finalize function to avoid
    memleaks
  mss-timer: Use ptimer_free() in the finalize function to avoid
    memleaks
  musicpal: Use ptimer_free() in the finalize function to avoid memleaks

 hw/arm/musicpal.c            | 22 +++++++++++++++++-----
 hw/rtc/exynos4210_rtc.c      | 19 ++++++++++++++-----
 hw/timer/allwinner-a10-pit.c | 21 ++++++++++++++++-----
 hw/timer/digic-timer.c       | 18 +++++++++++++-----
 hw/timer/exynos4210_mct.c    | 24 +++++++++++++++++++-----
 hw/timer/exynos4210_pwm.c    | 21 ++++++++++++++++-----
 hw/timer/mss-timer.c         | 23 ++++++++++++++++++-----
 7 files changed, 113 insertions(+), 35 deletions(-)

-- 
2.23.0


