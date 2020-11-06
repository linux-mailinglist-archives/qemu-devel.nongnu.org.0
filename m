Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B72D2A8C68
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 03:03:42 +0100 (CET)
Received: from localhost ([::1]:50224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kar6L-0003Vn-I6
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 21:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kar2p-0000q8-4f; Thu, 05 Nov 2020 21:00:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kar2m-0004X2-MA; Thu, 05 Nov 2020 21:00:02 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CS3Vc5ctJzhfrR;
 Fri,  6 Nov 2020 09:59:52 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Fri, 6 Nov 2020 09:59:48 +0800
Message-ID: <5FA4AE14.5040908@huawei.com>
Date: Fri, 6 Nov 2020 09:59:48 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH V2 2/2] plugins: Fix two resource leaks in setup_socket()
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 20:40:48
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Either accept() fails or exits normally, we need to close the fd.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 contrib/plugins/lockstep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 319bd44b83..5aad50869d 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -268,11 +268,13 @@ static bool setup_socket(const char *path)
     socket_fd = accept(fd, NULL, NULL);
     if (socket_fd < 0 && errno != EINTR) {
         perror("accept socket");
+        close(fd);
         return false;
     }

     qemu_plugin_outs("setup_socket::ready\n");

+    close(fd);
     return true;
 }

-- 
2.19.1

