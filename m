Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503958D563
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:31:24 +0200 (CEST)
Received: from localhost ([::1]:46224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKe2-0003SE-R0
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninollx@163.com>) id 1oLDIs-00033T-5h
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 20:41:02 -0400
Received: from mail-m973.mail.163.com ([123.126.97.3]:42285)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ninollx@163.com>) id 1oLDIl-0000w9-8X
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 20:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=aiWJNppejmRxkx7z7+
 NlbLQXBKQrgl/xKt710qX+mZI=; b=bIYvDlfE5yHiH1YHhdSGZ92p4QwjFIKL+V
 M2ZfV6KYcpUkQdvxwnIJlY5nuLQxGYEYuPa2MacLkSeSN7GFTpW7ud3jdHXcLpA/
 oCxO1s4cugtgo8XKHXWgP5vsaGabCQ1WaUSur5e5Qt73cbeFQsIDh/Cd0Sb4ud2u
 QEMzQZx78=
Received: from ubuntu.localdomain (unknown [220.202.227.199])
 by smtp3 (Coremail) with SMTP id G9xpCgDnpJxoqfFiFyNXUg--.41503S3;
 Tue, 09 Aug 2022 08:25:15 +0800 (CST)
From: Lei Xiang <ninollx@163.com>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, xieming@kylinos.cn, Lei Xiang <ninollx@hotmail.com>,
 Lei Xiang <leixiang@kylinos.cn>
Subject: [PATCH] virtio-pci: fix vector_irqfd leak in
 virtio_pci_set_guest_notifiers
Date: Mon,  8 Aug 2022 17:25:09 -0700
Message-Id: <1660004709-61572-1-git-send-email-ninollx@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: G9xpCgDnpJxoqfFiFyNXUg--.41503S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr45XF1UXrW3Jw1fur1rJFb_yoWxtrbEgr
 1Y9rWfWryUXF1qkrZ7Cwn3Xr1I9a4rWFs8WrZxtr18Aw4UAa4UAry7XrnI93W7Wr4xGFW3
 Zw4rGrn0vwnIkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU804iUUUUUU==
X-Originating-IP: [220.202.227.199]
X-CM-SenderInfo: pqlq0zlo06il2tof0z/1tbivgtYzFZceVK+GwAAsl
Received-SPF: pass client-ip=123.126.97.3; envelope-from=ninollx@163.com;
 helo=mail-m973.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Aug 2022 04:25:03 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lei Xiang <ninollx@hotmail.com>

proxy->vector_irqfd did not free when set guest notifier failed.

Signed-off-by: Lei Xiang <leixiang@kylinos.cn>
Tested-by: Zeng Chi <zengchi@kylinos.cn>
Suggested-by: Xie Ming <xieming@kylinos.cn>
---
 hw/virtio/virtio-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0..75188a9 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1058,6 +1058,10 @@ assign_error:
     while (--n >= 0) {
         virtio_pci_set_guest_notifier(d, n, !assign, with_irqfd);
     }
+
+    g_free(proxy->vector_irqfd);
+    proxy->vector_irqfd = NULL;
+
     return r;
 }
 
-- 
1.9.1


