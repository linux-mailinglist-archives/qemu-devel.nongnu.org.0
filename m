Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8222AF32D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:12:06 +0100 (CET)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqqz-0000YP-1s
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcqpp-00005B-0A
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:10:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kcqpl-0004wG-1C
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 09:10:52 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWRTJ3gLmz15MFT;
 Wed, 11 Nov 2020 22:10:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:10:29 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v2] multifd/tls: fix memoryleak of the QIOChannelSocket object
 when cancelling migration
Date: Wed, 11 Nov 2020 22:26:03 +0800
Message-ID: <1605104763-118687-1-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhengchuan@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:50:46
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When creating new tls client, the tioc->master will be referenced which results in socket
leaking after multifd_save_cleanup if we cancel migration.
Fix it by do object_unref() after tls client creation.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/multifd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 68b171f..6992761 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -752,6 +752,7 @@ static void multifd_tls_channel_connect(MultiFDSendParams *p,
         return;
     }
 
+    object_unref(OBJECT(ioc));
     trace_multifd_tls_outgoing_handshake_start(ioc, tioc, hostname);
     qio_channel_set_name(QIO_CHANNEL(tioc), "multifd-tls-outgoing");
     qio_channel_tls_handshake(tioc,
-- 
1.8.3.1


