Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5758A132
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:26:42 +0200 (CEST)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgUS-0003Lh-C3
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQZ-0006UI-Qn; Thu, 04 Aug 2022 15:22:40 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJgQJ-0002iJ-FI; Thu, 04 Aug 2022 15:22:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M9nhF-1oNEnW0KJh-005nrA; Thu, 04
 Aug 2022 21:22:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 2/5] vdpa: Fix file descriptor leak on get features error
Date: Thu,  4 Aug 2022 21:22:13 +0200
Message-Id: <20220804192216.1958922-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220804192216.1958922-1-laurent@vivier.eu>
References: <20220804192216.1958922-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PlZEuQe6wSNNL5X/r8CICuAdM952zMYMC/hWWDjDoXTNU6HwTGh
 d68/QkLvYlRWn/C3cC/tugAScBcTmgmMOuNGD2E5BJEFOzVBYFdfeCjTcVqm8cEKzN+k0hL
 N4Q+y2zZgx0qKxsaqlBky0Di8COR9aK9vPudHo8Da5nwaJ3qs4BOjzzVT7gzUsPI1wSkvsn
 3S7OX3M2l/DIRt2XCIm4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X4j78tE9pa8=:13U/IYdnftaUiecrIzzeVA
 prZCs9NRtA0KVfEcRPY0mRmauACCqKjjaEWF4SkDR4cgLCXscwWOtXQKMfyEz3l+3q78/wp9x
 4U6JHxdKfzFy0Jh0fMSF5Uuy+49rO3kIdM78SKsBTMUPrKsk2W1eMEWYuim0AVk9wtE0/1G5y
 12NbjlMFxq6ZAZ8cpZ8nNsGHZkhkEvZ+FXqsvX0yIci6fK2q3j5kjDT1BhkLk7zKxW1tTJdj1
 HBXs7HIo4cQalR2+aRwqVBiwWhmM5BeOAKmEWJXUd6KxNAW8sDlsF2gHND6nHIUVW48ixI2Vh
 hcl1AsEUmaDnnX40i458ahJj+zGUF4iwWd0SvOZOjIJAjBwLdt09U0lasEm84eAqzEiOSFMKc
 vN9o9dzlyRzC80zLc+C9xBDfh4lP1Km778rPp597WS2Z+Pc8GiKn+i2YX6UsffnAL5FCb6YRU
 yJlIF2y6nNnyqY4NvkzMKLGBuPjuMGShuK0BIWghUewR2VuFvtjLDuGY0puw3z28F+aB3SEgL
 zm4V5wpXRxs1LsHQQHfmAnzmAWTFZaXj6Q+6s6Fb8rg7nTcIwv9BnGfIuroWRSZuOHaPDwFx0
 uCknciSGswIZawweMcnjWbWnKG7qP804yIU24rbsH79k0W2HxKSIN/k8G6aAd74TI4voW2cvl
 2goqZMZu6v6XTxRxSjbtVvOOtdQ5ZXEpH2c7AS9kGq8IavPEYzo7t+tGmm3kOIVkmFEqkw5si
 nkorMlyqWOP6w39EYm6rill+JXneL7+kfcnKpA==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

File descriptor vdpa_device_fd is not free in the case of returning
error from vhost_vdpa_get_features. Fixing it by making all errors go to
the same error path.

Resolves: Coverity CID 1490785
Fixes: 8170ab3f43 ("vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220802112447.249436-2-eperezma@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 net/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6abad276a61a..303447a68e8b 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -566,7 +566,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     g_autofree NetClientState **ncs = NULL;
     g_autoptr(VhostIOVATree) iova_tree = NULL;
     NetClientState *nc;
-    int queue_pairs, r, i, has_cvq = 0;
+    int queue_pairs, r, i = 0, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -582,7 +582,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
 
     r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
     if (unlikely(r < 0)) {
-        return r;
+        goto err;
     }
 
     queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
-- 
2.37.1


