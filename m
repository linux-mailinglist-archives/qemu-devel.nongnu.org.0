Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D30565475E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:40:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SJP-0004s2-QO; Thu, 22 Dec 2022 15:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SJN-0004qD-DC
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:05 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SJK-0002Kb-G2
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:05 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id EE9ADCED25;
 Thu, 22 Dec 2022 21:36:56 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org, mst@redhat.com, xieyongji@bytedance.com,
 pbonzini@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH v4 03/12] libvhost-user: Cast rc variable to avoid compiler
 warning
Date: Thu, 22 Dec 2022 21:36:42 +0100
Message-Id: <7a791e27b7bd3e0a8b8cc8fbb15090a870d226d5.1671741278.git.marcel@holtmann.org>
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

The assert from recvmsg() return value against an uint32_t size field
from a protocol struct throws a compiler warning.

  CC       libvhost-user.o
In file included from libvhost-user.c:27:
libvhost-user.c: In function ‘vu_message_read_default’:
libvhost-user.c:363:19: error: comparison of integer expressions of different signedness: ‘int’ and ‘uint32_t’ {aka ‘unsigned int’} [-Werror=sign-compare]
  363 |         assert(rc == vmsg->size);
      |                   ^~

This is not critical, but annoying when the libvhost-user source are
used in an external project that has this compiler warning switched on.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 subprojects/libvhost-user/libvhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 67d75ece53b7..bcdf32a24f60 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -339,7 +339,7 @@ vu_message_read_default(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
             goto fail;
         }
 
-        assert(rc == vmsg->size);
+        assert((uint32_t)rc == vmsg->size);
     }
 
     return true;
-- 
2.38.1


