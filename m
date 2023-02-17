Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682FB69A92F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 11:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSyCM-00021n-Eu; Fri, 17 Feb 2023 05:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSyCK-00021e-20
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:42:36 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pSyCE-0007Yy-De
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 05:42:31 -0500
Received: from lenovo-t14s.redhat.com ([82.142.8.70]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MEVqu-1pLpKU0SJm-00FyFS; Fri, 17 Feb 2023 11:42:24 +0100
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] vhost: svq: fix uninitialized variable
Date: Fri, 17 Feb 2023 11:42:19 +0100
Message-Id: <20230217104219.1675667-1-lvivier@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DqODt38SfGnZQzmo+7tYYJqZB0hVny24ayFTjpo/h+7GjLo/Jiu
 prl1v1Uv3SYwK93MzKx6CN6PZ/dKSFb/8Mb1Ov9AJeST5e7vOfDfC1ejO0kGZwH4EPte3GV
 LKWxfNXmvBr9Fh+3HMA9Q8OkRcpQ8m9bHoivCQwK07+Ku/VxrmHgTL/q0hPcbrOtSyZV65Z
 xC0pZ5SuPIHSwWTsFWdNA==
UI-OutboundReport: notjunk:1;M01:P0:mdV92zthZZI=;uulAEe3RWLSkRoYQ6OpiK2Ovo3y
 qAC8sFLnpCIHjJp2KDfNQjVr/H/y5pjVBr5L3JKMkB2o22yOYZ/+0CDe3yd14BVsd/3WIbaqX
 gBaKeKs0hjOLXHDtN26D2gfIPibqPIsUNvFAoWoFwpH2EyFpCC7Ky6s5YjDr9rdKTz4tjbf6r
 MFx4U/IwLyTCYZd/ebfXKIRW4YlhseuFeGv9RP57ZxyUNSstxbs7qiXaWKL0yZpsNm7Iv+Ev/
 3ee/Zu8A1idYnzv6E1erPiC0tpzcfrpVSTz7smg5Q7BUR1SfrqCVe/EcmQI9Z1tB5aiGJCShH
 eLEyw0wK7bnE2vLuKsmHXGvEG777WuSFbnKJbfzMSw4rdWCyFLghRdGU4YYaplJJVrRlRIeMH
 lPR3Ke9KJalKbveqcLoNDxoivVvokPwmnkl8PXy4TXq7ssWYo7KKCuJ26YEC11gblkQFgSwRm
 HhWA2/hy3h9Lp7VW6VOl86dgsj7wv1Tkg8kGL87/qvRQmLFG0nnJ0sEgrZXiLSe08WFkXKlVj
 uXIy08UEEapQUyXhIdm1CVOj139sxNcm5/phG68nXB62FlWlrEQthZk5b6UxS6ByDviMg1uc2
 RYqsH6DmbB9t7zTdQkNrazM96wV7ghHubaUwlBqUesZ1IKgV1aBybNwQaAzdfiezPzqGGKFKy
 wGC+ZuO/fRIYDqUnHfvf88FeS0LxLwYsugOQAmzrhA==
Received-SPF: permerror client-ip=212.227.17.10;
 envelope-from=lvivier@redhat.com; helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_FAIL=0.001,
 SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The problem has been reported by gcc with CFLAGS=-O3:

.../hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_svq_poll’:
.../hw/virtio/vhost-shadow-virtqueue.c:538:12:
error: ‘len’ may be used uninitialized [-Werror=maybe-uninitialized]
  538 |     return len;
      |            ^~~

vhost_svq_get_buf() returns NULL if SVQ is empty but doesn't set len to 0,
and vhost_svq_poll() returns len without checking the return of
vhost_svq_get_buf(). So if the SVQ is empty vhost_svq_poll() can return
an random value.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 430729635815..31cf642db267 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -420,6 +420,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     vring_used_elem_t used_elem;
     uint16_t last_used, last_used_chain, num;
 
+    *len = 0;
     if (!vhost_svq_more_used(svq)) {
         return NULL;
     }
-- 
2.39.1


