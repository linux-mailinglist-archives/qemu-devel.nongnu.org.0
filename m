Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BAF6B0FAF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8W-0004mb-Og; Wed, 08 Mar 2023 11:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8S-0004jF-TJ; Wed, 08 Mar 2023 11:59:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8N-00048h-Qq; Wed, 08 Mar 2023 11:59:28 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A978D400EB;
 Wed,  8 Mar 2023 19:58:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 71E8013A;
 Wed,  8 Mar 2023 19:58:56 +0300 (MSK)
Received: (nullmailer pid 2098377 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 41/47] libvhost-user: check for NULL when allocating a
 virtqueue element
Date: Wed,  8 Mar 2023 19:57:44 +0300
Message-Id: <20230308165815.2098148-41-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Carlos López <clopez@suse.de>

Check the return value for malloc(), avoiding a NULL pointer
dereference, and propagate error in function callers.

Found with GCC 13 and -fanalyzer:

../subprojects/libvhost-user/libvhost-user.c: In function ‘virtqueue_alloc_element’:
../subprojects/libvhost-user/libvhost-user.c:2556:19: error: dereference of possibly-NULL ‘elem’ [CWE-690] [-Werror=analyzer-possible-null-dereference]
 2556 |     elem->out_num = out_num;
      |     ~~~~~~~~~~~~~~^~~~~~~~~
  ‘virtqueue_alloc_element’: event 1
    |
    | 2554 |     assert(sz >= sizeof(VuVirtqElement));
    |      |     ^~~~~~
    |      |     |
    |      |     (1) following ‘true’ branch (when ‘sz > 31’)...
    |
  ‘virtqueue_alloc_element’: events 2-4
    |
    | 2555 |     elem = malloc(out_sg_end);
    |      |     ^~~~   ~~~~~~~~~~~~~~~~~~
    |      |     |      |
    |      |     |      (3) this call could return NULL
    |      |     (2) ...to here
    | 2556 |     elem->out_num = out_num;
    |      |     ~~~~~~~~~~~~~~~~~~~~~~~
    |      |                   |
    |      |                   (4) ‘elem’ could be NULL: unchecked value from (3)
    |

Signed-off-by: Carlos López <clopez@suse.de>
Message-Id: <20230210112514.16858-1-clopez@suse.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 9c1916057a8b14411116106e5a5c0c33d551cfeb)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 subprojects/libvhost-user/libvhost-user.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index d6ee6e7d91..b17e82b2b0 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2547,6 +2547,10 @@ virtqueue_alloc_element(size_t sz,
 
     assert(sz >= sizeof(VuVirtqElement));
     elem = malloc(out_sg_end);
+    if (!elem) {
+        DPRINT("%s: failed to malloc virtqueue element\n", __func__);
+        return NULL;
+    }
     elem->out_num = out_num;
     elem->in_num = in_num;
     elem->in_sg = (void *)elem + in_sg_ofs;
@@ -2633,6 +2637,9 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
 
     /* Now copy what we have collected and mapped */
     elem = virtqueue_alloc_element(sz, out_num, in_num);
+    if (!elem) {
+        return NULL;
+    }
     elem->index = idx;
     for (i = 0; i < out_num; i++) {
         elem->out_sg[i] = iov[i];
-- 
2.30.2


