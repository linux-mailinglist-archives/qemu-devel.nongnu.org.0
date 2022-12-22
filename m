Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28AC654752
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SJb-0004v2-5L; Thu, 22 Dec 2022 15:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SJZ-0004uk-AJ
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:17 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SJX-0002Lm-Sz
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:17 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id D1933CED2C;
 Thu, 22 Dec 2022 21:36:58 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org, mst@redhat.com, xieyongji@bytedance.com,
 pbonzini@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH v4 09/12] libvduse: Fix assignment in vring_set_avail_event
Date: Thu, 22 Dec 2022 21:36:48 +0100
Message-Id: <4a0fe2a6436464473119fdbf0bc4076b36fbb37f.1671741278.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671741278.git.marcel@holtmann.org>
References: <cover.1671741278.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since the assignment is causing a compiler warning, fix it by using
memcpy instead.

  CC       libvduse.o
libvduse.c: In function ‘vring_set_avail_event’:
libvduse.c:603:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasin]
  603 |     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
      |      ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Suggested-by: Xie Yongji <xieyongji@bytedance.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvduse/libvduse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 338ad5e352e7..377959a0b4fb 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -582,7 +582,8 @@ void vduse_queue_notify(VduseVirtq *vq)
 
 static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
 {
-    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
+    uint16_t val_le = htole16(val);
+    memcpy(&vq->vring.used->ring[vq->vring.num], &val_le, sizeof(uint16_t));
 }
 
 static bool vduse_queue_map_single_desc(VduseVirtq *vq, unsigned int *p_num_sg,
-- 
2.38.1


