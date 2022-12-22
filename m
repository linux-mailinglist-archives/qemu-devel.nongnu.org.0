Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84C654767
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:41:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SJO-0004qC-6N; Thu, 22 Dec 2022 15:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p8SJM-0004pq-A8
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:04 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p8SJK-0002KX-G1
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:37:04 -0500
Received: from fedora.. (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id B8AC1CED24;
 Thu, 22 Dec 2022 21:36:56 +0100 (CET)
From: Marcel Holtmann <marcel@holtmann.org>
To: qemu-devel@nongnu.org, mst@redhat.com, xieyongji@bytedance.com,
 pbonzini@redhat.com
Cc: marcel@holtmann.org
Subject: [PATCH v4 02/12] libvhost-user: Replace typeof with __typeof__
Date: Thu, 22 Dec 2022 21:36:41 +0100
Message-Id: <981aa822bcaaa2b8d74f245339a99a85c25b346f.1671741278.git.marcel@holtmann.org>
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

Strictly speaking only -std=gnu99 support the usage of typeof and for
easier inclusion in external projects, it is better to use __typeof__.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_log_queue_fill’:
libvhost-user.c:86:13: error: implicit declaration of function ‘typeof’ [-Werror=implicit-function-declaration]
   86 |             typeof(x) _min1 = (x);              \
      |             ^~~~~~

Changing these two users of typeof makes the compiler happy and no extra
flags or pragmas need to be provided.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b55b9e244d9a..67d75ece53b7 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -62,8 +62,8 @@
 #endif  /* !__GNUC__ */
 #ifndef MIN
 #define MIN(x, y) ({                            \
-            typeof(x) _min1 = (x);              \
-            typeof(y) _min2 = (y);              \
+            __typeof__(x) _min1 = (x);          \
+            __typeof__(y) _min2 = (y);          \
             (void) (&_min1 == &_min2);          \
             _min1 < _min2 ? _min1 : _min2; })
 #endif
-- 
2.38.1


