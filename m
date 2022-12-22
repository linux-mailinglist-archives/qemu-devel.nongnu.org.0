Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A103465474D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:37:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SJS-0004t2-1w; Thu, 22 Dec 2022 15:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SJP-0004rv-7G
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:07 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SJN-0002Ln-Rk
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:06 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 39BF9CED28;
 Thu, 22 Dec 2022 21:36:59 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org, mst@redhat.com, xieyongji@bytedance.com,
 pbonzini@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH v4 10/12] libvhost-user: Fix assignment in
 vring_set_avail_event
Date: Thu, 22 Dec 2022 21:36:49 +0100
Message-Id: <502b22723264db064e4b05008233a9c1f2f8aaaa.1671741278.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671741278.git.marcel@holtmann.org>
References: <cover.1671741278.git.marcel@holtmann.org>
MIME-Version: 1.0
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

Since it was proposed to change the code in libvduse.c to use memcpy
instead of an assignment, the code in libvhost-user.c should also be
changed to use memcpy.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b28b66cdb159..fc69783d2bf6 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2478,14 +2478,13 @@ vring_used_flags_unset_bit(VuVirtq *vq, int mask)
 static inline void
 vring_set_avail_event(VuVirtq *vq, uint16_t val)
 {
-    uint16_t *avail;
+    uint16_t val_le = htole16(val);
 
     if (!vq->notification) {
         return;
     }
 
-    avail = (uint16_t *)&vq->vring.used->ring[vq->vring.num];
-    *avail = htole16(val);
+    memcpy(&vq->vring.used->ring[vq->vring.num], &val_le, sizeof(uint16_t));
 }
 
 void
-- 
2.38.1


