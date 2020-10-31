Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150E02A1564
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Oct 2020 12:07:01 +0100 (CET)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYoip-0007Cc-Ma
	for lists+qemu-devel@lfdr.de; Sat, 31 Oct 2020 07:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYog7-0005nq-7Z; Sat, 31 Oct 2020 07:04:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYog3-0001Uy-TA; Sat, 31 Oct 2020 07:04:10 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CNbsB4czJzkbWD;
 Sat, 31 Oct 2020 19:03:58 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 19:03:54 +0800
Message-ID: <5F9D449A.900@huawei.com>
Date: Sat, 31 Oct 2020 19:03:54 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <mjt@tls.msk.ru>
Subject: [PATCH] util: Remove redundant checks in the openpty()
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/31 07:04:00
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As we can see from the following function call stack, the amaster and the aslave
cannot be NULL: char_pty_open() -> qemu_openpty_raw() -> openpty().
In addition, the amaster and the aslave has been dereferenced at the beginning
of the openpty(). So the checks on amaster and aslave in the openpty() are redundant.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 util/qemu-openpty.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
index eb17f5b0bc..427f43a769 100644
--- a/util/qemu-openpty.c
+++ b/util/qemu-openpty.c
@@ -80,10 +80,9 @@ static int openpty(int *amaster, int *aslave, char *name,
             (termp != NULL && tcgetattr(sfd, termp) < 0))
                 goto err;

-        if (amaster)
-                *amaster = mfd;
-        if (aslave)
-                *aslave = sfd;
+        *amaster = mfd;
+        *aslave = sfd;
+
         if (winp)
                 ioctl(sfd, TIOCSWINSZ, winp);

-- 
2.19.1

