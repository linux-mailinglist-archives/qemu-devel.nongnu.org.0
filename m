Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A008243CA5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 17:37:45 +0200 (CEST)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6FIW-0004sE-JD
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 11:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1k6FHV-0003zM-1t
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 11:36:41 -0400
Received: from mail-m971.mail.163.com ([123.126.97.1]:42274)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liq3ea@163.com>) id 1k6FHQ-0002kh-Vd
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 11:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=FN6mz3sW4mBtqTzNsJ
 TVCaNHFxut/GV4/Aj3CjanWw0=; b=qdP1dU2Xbofdrajyk9qZ58Z7NnOwbx1w4U
 0oWG62sOedgngQ6sZS3kbmKzaJH6hmEd0jctjMkoLm+9aDfC259zUNl8adjhKTB3
 tTbYalmPsC6VCN8aVLiriEtr8sd1OCy3eGbFbdJdPBDJoR0jPNamGiO2O0TIPXyK
 /8QOBYD8I=
Received: from localhost.localdomain (unknown [115.204.177.14])
 by smtp1 (Coremail) with SMTP id GdxpCgCnldXxXTVfC8hsAg--.392S4;
 Thu, 13 Aug 2020 23:36:21 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: mst@redhat.com,
	kraxel@redhat.com
Subject: [PATCH] hw: virtio-gpu: remove duplicated 'virtqueue_pop'
Date: Thu, 13 Aug 2020 08:36:14 -0700
Message-Id: <20200813153614.39917-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: GdxpCgCnldXxXTVfC8hsAg--.392S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1kJFyrurWUAFy3tw1UJrb_yoWfCrc_Ar
 y7ZF13JF47A3WkZFWUAr4fXFyIga1kJF18ua4aqrykJ3srJanIvrn2qFnIgF13JF4akFW5
 A3yfJF1qkw1SgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRtID27UUUUU==
X-Originating-IP: [115.204.177.14]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbitBV-bVSIiRyu6AAAs8
Received-SPF: pass client-ip=123.126.97.1; envelope-from=liq3ea@163.com;
 helo=mail-m971.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 11:36:23
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use 'while (true)' to avoid duplicated.
No function change.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/display/virtio-gpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5f0dd7c150..9cef313f5e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -869,13 +869,15 @@ static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     }
 #endif
 
-    cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
-    while (cmd) {
+    while (true) {
+        cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
+        if (!cmd) {
+            break;
+        }
         cmd->vq = vq;
         cmd->error = 0;
         cmd->finished = false;
         QTAILQ_INSERT_TAIL(&g->cmdq, cmd, next);
-        cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
     }
 
     virtio_gpu_process_cmdq(g);
-- 
2.17.1


