Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05B66C36B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:16:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRCP-0003tC-9O; Mon, 16 Jan 2023 10:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuanmh12@chinatelecom.cn>)
 id 1pHOXK-0005K0-VY
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:24:26 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.219] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuanmh12@chinatelecom.cn>) id 1pHOXF-00021b-Pn
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:24:26 -0500
HMM_SOURCE_IP: 172.18.0.188:52478.1774175160
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.8.70 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 5793E2800B6;
 Mon, 16 Jan 2023 20:12:45 +0800 (CST)
X-189-SAVE-TO-SEND: yuanmh12@chinatelecom.cn
Received: from  ([10.133.8.70])
 by app0023 with ESMTP id 2e299f7331444fabae4be7e33c3eb8d7 for
 raphael.norwitz@nutanix.com; Mon, 16 Jan 2023 20:13:05 CST
X-Transaction-ID: 2e299f7331444fabae4be7e33c3eb8d7
X-Real-From: yuanmh12@chinatelecom.cn
X-Receive-IP: 10.133.8.70
X-MEDUSA-Status: 0
From: Minghao Yuan <yuanmh12@chinatelecom.cn>
To: raphael.norwitz@nutanix.com, swapnil.ingle@nutanix.com,
 peter.turschm@nutanix.com
Cc: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/1] vhost-user: Skip unnecessary duplicated
 VHOST_USER_ADD/REM_MEM_REG requests
Date: Mon,  2 Jan 2023 05:45:57 +0800
Message-Id: <20230101214557.193768-1-yuanmh12@chinatelecom.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.219;
 envelope-from=yuanmh12@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 16 Jan 2023 10:14:58 -0500
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

The VHOST_USER_ADD/REM_MEM_REG requests should be categorized into
non-vring specific messages, and should be sent only once.

Signed-off-by: Minghao Yuan <yuanmh12@chinatelecom.cn>
---
 configure              | 2 +-
 hw/virtio/vhost-user.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9e407ce2e3..8b4deca342 100755
--- a/configure
+++ b/configure
@@ -1147,7 +1147,7 @@ cat > $TMPC << EOF
 #  endif
 # endif
 #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
-# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
+# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 3)
 #  error You need at least GCC v7.4.0 to compile QEMU
 # endif
 #else
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index d9ce0501b2..3f2a8c3bdd 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -459,6 +459,8 @@ static bool vhost_user_one_time_request(VhostUserRequest request)
     case VHOST_USER_SET_MEM_TABLE:
     case VHOST_USER_GET_QUEUE_NUM:
     case VHOST_USER_NET_SET_MTU:
+    case VHOST_USER_ADD_MEM_REG:
+    case VHOST_USER_REM_MEM_REG:
         return true;
     default:
         return false;
-- 
2.27.0


