Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456E2D41BE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:08:27 +0100 (CET)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyGg-0007l3-8U
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kmy91-0002zX-5F
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:00:31 -0500
Received: from mail-m975.mail.163.com ([123.126.97.5]:53000)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ruc_gongyuanjun@163.com>)
 id 1kmy8r-0003Rt-1o
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=AVWdkHG5WoThYBKLLt
 u3cbpUUL5nyJBy7Y8Z9+SXeAY=; b=ewmyWTnRnRyA8u5TAY8IFpbHD4vL0lrKYv
 1sXWtwfx/N+Zngwd55fgAa5xzBR0jVoV4hn1t8mQbth48wX6Gi6vteaJn2fUjeGj
 IPZ8biCo/gGXLBvH77JzO7hYHzTiQG+gKdBeZAls9pf37w0ygx+4oIYpZCMadHZx
 mYz3TfcBE=
Received: from localhost.localdomain (unknown [218.106.182.234])
 by smtp5 (Coremail) with SMTP id HdxpCgDH3ylAvNBfw1ZwEQ--.714S4;
 Wed, 09 Dec 2020 20:00:03 +0800 (CST)
From: ruc_gongyuanjun@163.com
To: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 1/1] /hw/scsi/vhost-scsi.c: Fix a memory leak
Date: Wed,  9 Dec 2020 19:59:55 +0800
Message-Id: <20201209115955.13191-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: HdxpCgDH3ylAvNBfw1ZwEQ--.714S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrJrWDXw1kZw1xGrW8tw13Jwb_yoWxXFb_u3
 yFvr4kGrn8Cr4IkFykAa45Xw1Svr4UGryxC3W0ya1DuryUW3s8W3Z2krnrZay5XasrG34q
 van8XF909w1UKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb1SrUUUUUU==
X-Originating-IP: [218.106.182.234]
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/xtbB0AP15VUMO7y9uwAAsb
Received-SPF: pass client-ip=123.126.97.5;
 envelope-from=ruc_gongyuanjun@163.com; helo=mail-m975.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: yuanjungong <ruc_gongyuanjun@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: yuanjungong <ruc_gongyuanjun@163.com>

close vhostfd before returning.

Signed-off-by: yuanjungong <ruc_gongyuanjun@163.com>
---
 hw/scsi/vhost-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 4d70fa0..9d12034 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -232,7 +232,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     /* Note: we can also get the minimum tpgt from kernel */
     vsc->target = vs->conf.boot_tpgt;
 
-    return;
+    goto clode_fd;
 
  free_vqs:
     if (!vsc->migratable) {
-- 
2.17.1


