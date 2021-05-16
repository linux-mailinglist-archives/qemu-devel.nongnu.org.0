Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBA9381C2C
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:06:17 +0200 (CEST)
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li76e-0003Wf-FC
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74p-0000pN-Qx
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:23 -0400
Received: from m12-13.163.com ([220.181.12.13]:52132)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74k-0002dJ-U8
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=BzYCD
 09ffMe45pwQvIaWImz53+dVi8gD6dIwEE++i/w=; b=jpCYDOB6wxrLE5Q4hv6nQ
 sGnRnZq0em23rFKL3ZxjWXMUbNdu4UL3XThMGr6PXLw0YZ9O357zTyPAgBKgpC5V
 w4mt6GzsgUbYz/Y4rHwvFf+JNxHG8yosgEWIJVWoUH8ok9H1ukeAMQbqh9F2pUUQ
 1HPs/zh3RMhVNo94aDsOSk=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S9;
 Sun, 16 May 2021 11:04:13 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] vhost-user-gpu: fix memory leak in
 'virgl_cmd_resource_unref' (CVE-2021-3544)
Date: Sat, 15 May 2021 20:04:00 -0700
Message-Id: <20210516030403.107723-6-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1DXF1UGFW3Xw4rWFW3Jrb_yoWkGFg_ZF
 4YkF18Ar45GFy093y5Zw1rAayaywna9FyqvFyfKa4Fk34rWr1jqw10q3s7Gry29r4kGF4D
 JryFyw4rCw4a9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU85CzJUUUUU==
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZgyUbVaD74ALNQABsW
Received-SPF: pass client-ip=220.181.12.13; envelope-from=liq3ea@163.com;
 helo=m12-13.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'res->iov' will be leaked if the guest trigger following sequences:

	virgl_cmd_create_resource_2d
	virgl_resource_attach_backing
	virgl_cmd_resource_unref

This patch fixes this.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 5e8e3c4c75 ("virtio-gpu: fix resource leak
in virgl_cmd_resource_unref"

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/virgl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 6a332d601f..c669d73a1d 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -108,9 +108,16 @@ virgl_cmd_resource_unref(VuGpu *g,
                          struct virtio_gpu_ctrl_command *cmd)
 {
     struct virtio_gpu_resource_unref unref;
+    struct iovec *res_iovs = NULL;
+    int num_iovs = 0;
 
     VUGPU_FILL_CMD(unref);
 
+    virgl_renderer_resource_detach_iov(unref.resource_id,
+                                       &res_iovs,
+                                       &num_iovs);
+    g_free(res_iovs);
+
     virgl_renderer_resource_unref(unref.resource_id);
 }
 
-- 
2.25.1



