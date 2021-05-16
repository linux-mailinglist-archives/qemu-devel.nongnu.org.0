Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D25381C2D
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:06:17 +0200 (CEST)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li76e-0003XF-H6
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74o-0000oo-LQ
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:22 -0400
Received: from m12-13.163.com ([220.181.12.13]:52205)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74k-0002db-EF
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VHEE/
 6PHj6HKMf1kg5MP8/mD9JXRubLwlPgxHpRSgv4=; b=ZlP+46gnHHsRz3rbNNmjr
 5qEga2Sn6baQeRgFtbc7ImER9fFz987xPJKlnHXzcddsCqmTezNQnpA+LL2iwUoF
 jdp7PA9VSKuH/qIHugzouI6Ws/7ZFE+2yGC8lfXBw7e9UUeFmBEwqHvbyqQKfmcu
 BB7+uBTJ1gUeALWgEQ7CNE=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S10;
 Sun, 16 May 2021 11:04:14 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] vhost-user-gpu: fix memory leak in
 'virgl_resource_attach_backing' (CVE-2021-3544)
Date: Sat, 15 May 2021 20:04:01 -0700
Message-Id: <20210516030403.107723-7-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516030403.107723-1-liq3ea@163.com>
References: <20210516030403.107723-1-liq3ea@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S10
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyxCF17Kr4UXFyDCr4xtFb_yoWfCrg_ZF
 4Fvrn7Jr4UXFWj9w43Xw18Cayay3yrZF97AFyfKayfCFyFgw15Xw1rt3s7J347Zr4DWFnr
 Zry0yr4rCa13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU85l1DUUUUU==
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZg6UbVaD74ALQQAAsh
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

If 'virgl_renderer_resource_attach_iov' failed, the 'res_iovs' will
be leaked.

Fixes: CVE-2021-3544
Reported-by: Li Qiang <liq3ea@163.com>
virtio-gpu fix: 33243031da ("virtio-gpu-3d: fix memory leak
in resource attach backing")

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



