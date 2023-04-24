Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912E76ED174
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:35:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyDI-0004kF-BM; Mon, 24 Apr 2023 11:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqyDG-0004jz-5C
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:34:46 -0400
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqyDD-00009W-Av
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:34:45 -0400
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1682350477; bh=P9tyNGNxHJX211Vz+lIfKuXsNXpoPIePLLOEAPu224k=;
 h=From:To:Cc:Subject:Date:From;
 b=fwqHItkehhYj9e4KdvIslU5HQIB3Gs2hXAx12gODJhqgQpAnPoaY6yyrAYRC5rYwk
 QGrvJGBSOV0l0Ell2pIHi92toRAU2NpwNXKUzBvIKM28EKuLF68dNW2IHRyVXo5HLM
 eTWWJNT0qeMvKZJ27JrduFGWgVQMZOod9TrE0hyY=
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Laurent Vivier" <laurent@vivier.eu>
Subject: [PATCH 1/2] linux-user: Add move_mount() syscall
Date: Mon, 24 Apr 2023 17:34:28 +0200
Message-Id: <20230424153429.276788-1-thomas@t-8ch.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:c010:41de::1;
 envelope-from=thomas@t-8ch.de; helo=todd.t-8ch.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 linux-user/syscall.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98c8..95e370130cee 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9139,6 +9139,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         unlock_user(p, arg1, 0);
         return ret;
 #endif
+#ifdef TARGET_NR_move_mount
+    case TARGET_NR_move_mount:
+        {
+            void *p2, *p4;
+
+            if (!arg2 || !arg4) {
+                return -TARGET_EFAULT;
+            }
+
+            p2 = lock_user_string(arg2);
+            if (!p2) {
+                return -TARGET_EFAULT;
+            }
+
+            p4 = lock_user_string(arg4);
+            if (!p4) {
+                unlock_user(p2, arg2, 0);
+                return -TARGET_EFAULT;
+            }
+            ret = get_errno(move_mount(arg1, p2, arg3, p4, arg5));
+
+            unlock_user(p2, arg2, 0);
+            unlock_user(p4, arg4, 0);
+
+            return ret;
+        }
+#endif
 #ifdef TARGET_NR_stime /* not on alpha */
     case TARGET_NR_stime:
         {

base-commit: 81072abf1575b11226b3779af76dc71dfa85ee5d
-- 
2.40.0


