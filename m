Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F386531BF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yrn-0005WT-Fq; Wed, 21 Dec 2022 08:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7yri-0005ID-ST
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:10:34 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7yrg-0005Cj-Vq
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:10:34 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id A2553CED1A;
 Wed, 21 Dec 2022 14:10:31 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	xieyongji@bytedance.com
Cc: marcel@holtmann.org
Subject: [PATCH v3 07/10] libvhost-user: Switch to unsigned int for inuse
 field in struct VuVirtq
Date: Wed, 21 Dec 2022 14:10:23 +0100
Message-Id: <274beb32eacf3bc1022bb48f5902425c3e959468.1671628158.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1671628158.git.marcel@holtmann.org>
References: <cover.1671628158.git.marcel@holtmann.org>
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

It seems there is no need to keep the inuse field signed and end up with
compiler warnings for sign-compare.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_queue_pop’:
libvhost-user.c:2763:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘unsigned int’ [-Werror=sign-compare]
 2763 |     if (vq->inuse >= vq->vring.num) {
      |                   ^~
libvhost-user.c: In function ‘vu_queue_rewind’:
libvhost-user.c:2808:13: error: comparison of integer expressions of different signedness: ‘unsigned int’ and ‘int’ [-Werror=sign-compare]
 2808 |     if (num > vq->inuse) {
      |             ^

Instead of casting the comparison to unsigned int, just make the inuse
field unsigned int in the fist place.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 subprojects/libvhost-user/libvhost-user.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index aea7ec5061d5..8cda9b8f577a 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -343,7 +343,7 @@ typedef struct VuVirtq {
     /* Notification enabled? */
     bool notification;
 
-    int inuse;
+    unsigned int inuse;
 
     vu_queue_handler_cb handler;
 
-- 
2.38.1


