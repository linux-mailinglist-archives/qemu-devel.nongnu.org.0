Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D4533EA62
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:15:11 +0100 (CET)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQOb-0002Ff-Dj
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangliangzz@126.com>)
 id 1lMMch-0003uO-9f
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:13:27 -0400
Received: from m15112.mail.126.com ([220.181.15.112]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wangliangzz@126.com>)
 id 1lMMcY-0003qn-2I
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:13:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=j8gVx
 /MCBNv8H6yTTmYihEOP3Ok+OEWnaq6RikILFZ8=; b=lZ6WOpQV//rZRRu4s/6Zs
 U1ePplUHcOzYKR+FnNHa14g2L6eFFehWsDoxpKaAit3PBvLocdfvBauLYfXlX1y0
 eZ4ElFOXObJm0Mes3Axct5O3ld0f6MxMNpd+HQXv1fBJYOY6/8Hw6pTAyRisNvYu
 9v0z/01MjB83sQ8aJ9gPzM=
Received: from localhost.localdomain (unknown [171.8.76.20])
 by smtp2 (Coremail) with SMTP id DMmowAD3yfZqbFFgYiVFMw--.21308S4;
 Wed, 17 Mar 2021 10:41:47 +0800 (CST)
From: wangliangzz@126.com
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-pmem: fix virtio_pmem_resp assign problem
Date: Tue, 16 Mar 2021 22:41:45 -0400
Message-Id: <20210317024145.271212-1-wangliangzz@126.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowAD3yfZqbFFgYiVFMw--.21308S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry5Kw1xWryfAr48uF15urg_yoW3uwb_Kr
 y8Way7WryUXa4jkrWUAw1fXF42kayfXa1vkr4YqF1rCF1DJ3WUJrn7Gr4FgFs7XrWUGFZr
 Cr4Ygrs8Aw1agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1j2M5UUUUU==
X-Originating-IP: [171.8.76.20]
X-CM-SenderInfo: pzdqwzpldqw6b26rjloofrz/1tbiuwpY1lpEDLg73gAAsw
Received-SPF: pass client-ip=220.181.15.112; envelope-from=wangliangzz@126.com;
 helo=m15112.mail.126.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Mar 2021 03:14:10 -0400
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
Cc: pagupta@redhat.com, david@redhat.com, mst@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, dan.j.williams@intel.com,
 Wang Liang <wangliangzz@inspur.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wang Liang <wangliangzz@inspur.com>

ret in virtio_pmem_resp is a uint32_t variable, which should be assigned
using virtio_stl_p.

The kernel side driver does not guarantee virtio_pmem_resp to be initialized
to zero in advance, So sometimes the flush operation will fail.

Signed-off-by: Wang Liang <wangliangzz@inspur.com>
---
 hw/virtio/virtio-pmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index a3e0688a89..d1aeb90a31 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -47,7 +47,7 @@ static int worker_cb(void *opaque)
         err = 1;
     }
 
-    virtio_stw_p(req_data->vdev, &req_data->resp.ret, err);
+    virtio_stl_p(req_data->vdev, &req_data->resp.ret, err);
 
     return 0;
 }
-- 
2.27.0


