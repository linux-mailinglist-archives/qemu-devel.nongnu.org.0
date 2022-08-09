Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848858DCAE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:01:56 +0200 (CEST)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSc7-0003U9-9j
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oLSWW-0003Xz-4r; Tue, 09 Aug 2022 12:56:09 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:58625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oLSWU-0000Wk-6o; Tue, 09 Aug 2022 12:56:07 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N95Rn-1nIF3K45vr-0169qg; Tue, 09
 Aug 2022 18:55:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/2] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Date: Tue,  9 Aug 2022 18:55:54 +0200
Message-Id: <20220809165555.2415931-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809165555.2415931-1-laurent@vivier.eu>
References: <20220809165555.2415931-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vOaBaH04CsT0F8fPesA4TNAeT/+UBajDQyUkC7HbuZCH3SvXAFn
 75au4RXBYn13h9BZRLuS3CTcL4ndeptNvzmFMgNvHTr20eue6Gj65bHrO76+QLpO029uI45
 DYMwZR8hUNwfTSbjAM7+ImZXd5h73EKnOjT44FF+/EzC3hoXDsUTx/obx+YSria2McPoCnA
 QjbPM0NBP1MK7y5YvQG4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:on+ghYYnXEU=:6EDhcLfUFt38Or4sVVYdCx
 MluOvi4tJqfqQI8T0V18fuGK85x87kxqgxSw5shQKt1m/hXiiP+mmFYOdm0X5mHTtpuTGu2xc
 2Y5DuWDUBCnL/Mgrp6QOLNhBqLvhSkSWVTN6T0fjdncoXSicFHi2Jql66BMFgkfLtohGpkUbY
 zYNlL+ArQfTvHuWqst6nDpY0jmZoc6PSjXZMrkyp5Q3GoBQqB18CSTjc0Kghg9vsoPTHY56aD
 uci8wIs2UNuXUj9pnGsx3/0S/t6nUxQGU1Ekwb3Ifg/6DJckDPM78MR1YwUZ6aDolrk7W2Nao
 tQwFp7MDcQd9Naz/62ujoPiR1DDm/q2B3hHhR+mjGdpeBNc7E/J3RcgK2kvc5JapayNw59Q/i
 TvUwfZbMJsZynTw4l4DQkAgicXQ8uqo+ICEpT+h+fF2vxJX+Nwh1tRNP11+jMUsmBdfsFcbug
 69I8J7YwzKuKrwUTHIKfOmIKmVTWap5ipHgMOj/LX7cp1J+r48u4n1sM9QmvIksad+AYyRJKJ
 mC1ce2cm9zChhv8q58XBC+JXSl1GrDASV8KtxHPHhj5G8SPeu0P69IYyALpOL+TBp9CBqaScx
 /d6KgGuXr+uiPXjIo1/0PJcxYD8nVceRNTB1LolJ8nUpF1YNFOjy2z3iVA/LFSiS021e1pOyj
 fxyt+n86s/bKHqCAzRVEEp0Ygwyn0YG78SFmggNBwZAPU+y8kxxGb8jkNSOQFxirp0sGC/MUX
 LqtOTxpeTu/FzPBId3pDRSDovn6LjO/JbZo7ew==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Markus Armbruster <armbru@redhat.com>

We allocate VuVirtqElement with g_malloc() in
virtqueue_alloc_element(), but free it with free() in
vhost-user-blk.c.  Harmless, but use g_free() anyway.

One of the calls is guarded by a "not null" condition.  Useless,
because it cannot be null (it's dereferenced right before), and even
it it could be, free() and g_free() do the right thing.  Drop the
conditional.

Fixes: Coverity CID 1490290
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220630085219.1305519-1-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index 9cb78ca1d0df..d6932a264573 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -106,10 +106,7 @@ static void vub_req_complete(VubReq *req)
                   req->size + 1);
     vu_queue_notify(vu_dev, req->vq);
 
-    if (req->elem) {
-        free(req->elem);
-    }
-
+    g_free(req->elem);
     g_free(req);
 }
 
@@ -243,7 +240,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
     /* refer to hw/block/virtio_blk.c */
     if (elem->out_num < 1 || elem->in_num < 1) {
         fprintf(stderr, "virtio-blk request missing headers\n");
-        free(elem);
+        g_free(elem);
         return -1;
     }
 
@@ -325,7 +322,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
     return 0;
 
 err:
-    free(elem);
+    g_free(elem);
     g_free(req);
     return -1;
 }
-- 
2.37.1


