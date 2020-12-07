Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78CF2D09CF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 05:49:25 +0100 (CET)
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8Si-0001Rw-NY
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 23:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qk-0008Jo-Ub
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:22 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:51360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1km8Qi-00019U-7X
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 23:47:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3134118|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.0257363-0.000906421-0.973357;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.J3tRDLu_1607316427; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.J3tRDLu_1607316427)
 by smtp.aliyun-inc.com(10.147.41.199);
 Mon, 07 Dec 2020 12:47:07 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/arm bug fix
Date: Mon,  7 Dec 2020 12:46:51 +0800
Message-Id: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found some bugs in target/arm.

The first one is about SVE first-fault or no-fault load/store.
The second is SIMD fcmla(by element).
The third is about CPTR_EL2.

I am not sure I really understand this code. Please confirm the patch set and let me know if I am wrong.

LIU Zhiwei (4):
  target/arm: Fixup special cross page case for sve continuous
    load/store
  target/arm: Fixup contiguous first-fault and no-fault loads
  target/arm: Fixup SIMD fcmla(by element) in 4H arrangement
  target/arm: adjust CPTR_EL2 according to HCR_EL2.E2H

 target/arm/helper.c     | 55 ++++++++++++++++++++++++++++++++++-------
 target/arm/sve_helper.c | 42 ++++++++++++++++++++-----------
 target/arm/vec_helper.c |  8 ++++++
 3 files changed, 82 insertions(+), 23 deletions(-)

-- 
2.23.0


