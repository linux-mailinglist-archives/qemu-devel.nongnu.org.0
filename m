Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBDD37349E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 07:16:19 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le9tS-0007Rt-B2
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 01:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rd-00068h-E9
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:25 -0400
Received: from m12-16.163.com ([220.181.12.16]:58168)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1le9rX-00017F-L6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 01:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=P1b/7
 n0WfNJIVr+gBpZKF2Ry0uGkFvSi0n+ot3liv28=; b=CmqRQRkvzKbgoYYqziLDJ
 ++ouCz7IpDnAc0wq0k2y0VPrVnk0rvmsk1zb5xr6ca4gcKMrRtOFeZKjSRCoLVJJ
 YonxzxG+w1KRRmDt0FHg+IQ7Dp7eKKpOURJ2CnBLbqZp2NO/b0IkUpOinEtDdbRR
 TKrznLRlvKUAdvfd9YG9eY=
Received: from ubuntu.localdomain (unknown [36.22.237.185])
 by smtp12 (Coremail) with SMTP id EMCowACXET7zJZJg8VpupQ--.18216S9;
 Wed, 05 May 2021 12:58:34 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com,
	kraxel@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 5/7] vhost-user-gpu: fix memory leak in
 'virgl_cmd_resource_unref'
Date: Tue,  4 May 2021 21:58:22 -0700
Message-Id: <20210505045824.33880-6-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505045824.33880-1-liq3ea@163.com>
References: <20210505045824.33880-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXET7zJZJg8VpupQ--.18216S9
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1DXF1UGFW3WF1rtFy3twb_yoWftrX_ZF
 4YkF1kAr15GFy09ay5Zw1rAayay34S9FyvvFyfKa4rKFy5ur1qqw18X34kGry29r4DGF4D
 XryFyw4rCw43ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbTmh7UUUUU==
X-Originating-IP: [36.22.237.185]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbCCgqJbV2Ma3VztQAAst
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

The 'res->iov' will be leaked if the guest trigger following sequences:

	virgl_cmd_create_resource_2d
	virgl_resource_attach_backing
	virgl_cmd_resource_unref

This patch fixes this.

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



