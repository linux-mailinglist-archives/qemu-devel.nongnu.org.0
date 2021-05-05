Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20F83734A2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:18:58 +0200 (CEST)
Received: from localhost ([::1]:42386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9w2-0002FA-3B
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9ri-0006Iu-Pw
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:30 -0400
Received: from m12-16.163.com ([220.181.12.16]:58932)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rg-0001G5-9t
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VB6Lx
 2qoSlaoSWWnEIymTr6B23IGQf/fSdRoCCDV7Zg=; b=kr6LST3Y8HNLGj+JxibT7
 PkalJHP3KvSIxCSVMYPY+v7DJFqKYzIzz+lGWxflv7t5UhOgx5ovWBlnb19NiVvd
 Y3L/UqJSCdSxGI3SxeN447j3UmbnKTyS8sHqKZ3s7kghDzhucYd3gtO4oQ2Q4psf
 gjlcXw3babFWDA4xxSzykU=
Received: from ubuntu.localdomain (unknown [36.22.237.185])
 by smtp12 (Coremail) with SMTP id EMCowACXET7zJZJg8VpupQ--.18216S10;
 Wed, 05 May 2021 12:58:35 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com,
	kraxel@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] vhost-user-gpu: fix memory leak in
 'virgl_resource_attach_backing'
Date: Tue,  4 May 2021 21:58:23 -0700
Message-Id: <20210505045824.33880-7-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505045824.33880-1-liq3ea@163.com>
References: <20210505045824.33880-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXET7zJZJg8VpupQ--.18216S10
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy7ZrW5AF17XFWfXFWDurg_yoW3Xrb_ZF
 4FkFn7Ar1UWFyj9wsxXw1rCayayrWrZF97GF97Ka4fCFyYgw15Jw1rJ3s7J3429w1DWFnr
 Zryvyw4rCa13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbZa9DUUUUU==
X-Originating-IP: [36.22.237.185]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbiKRuJbVXl0Y5R3gAAs2
Received-SPF: pass client-ip=220.181.12.16; envelope-from=liq3ea@163.com;
 helo=m12-16.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

If 'virgl_renderer_resource_attach_iov' failed, the 'res_iovs' will
be leaked.

Signed-off-by: Li Qiang <liq3ea@163.com>
---
 contrib/vhost-user-gpu/virgl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index c669d73a1d..a16a311d80 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -287,8 +287,11 @@ virgl_resource_attach_backing(VuGpu *g,
         return;
     }
 
-    virgl_renderer_resource_attach_iov(att_rb.resource_id,
+    ret = virgl_renderer_resource_attach_iov(att_rb.resource_id,
                                        res_iovs, att_rb.nr_entries);
+    if (ret != 0) {
+        g_free(res_iovs);
+    }
 }
 
 static void
-- 
2.25.1



