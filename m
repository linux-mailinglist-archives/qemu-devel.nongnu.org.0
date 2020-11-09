Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72EC2AB299
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 09:41:29 +0100 (CET)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc2jw-0004s9-Vq
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 03:41:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2iE-0003bH-Q1; Mon, 09 Nov 2020 03:39:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2iC-0004a6-T6; Mon, 09 Nov 2020 03:39:42 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CV4DC68GDzLtwp;
 Mon,  9 Nov 2020 16:39:23 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 16:39:26 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <alex.bennee@linaro.org>, <mjt@tls.msk.ru>, <laurent@vivier.eu>
Subject: [PATCH v3 1/2] plugins: Fix resource leak in connect_socket()
Date: Mon, 9 Nov 2020 08:28:28 +0000
Message-ID: <20201109082829.87496-2-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201109082829.87496-1-alex.chen@huawei.com>
References: <20201109082829.87496-1-alex.chen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 03:39:34
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 zhengchuan@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Close the fd when the connect() fails.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 contrib/plugins/lockstep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index a696673dff..319bd44b83 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -292,6 +292,7 @@ static bool connect_socket(const char *path)
 
     if (connect(fd, (struct sockaddr *)&sockaddr, sizeof(sockaddr)) < 0) {
         perror("failed to connect");
+        close(fd);
         return false;
     }
 
-- 
2.19.1


