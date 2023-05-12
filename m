Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF437006AD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:24:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrI-0005zJ-Pj; Fri, 12 May 2023 07:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrG-0005yF-DO
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:46 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrE-0002Nc-FK
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MdNwm-1qWlbl2vdw-00ZOC9; Fri, 12
 May 2023 13:22:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 4/9] linux-user: Add open_tree() syscall
Date: Fri, 12 May 2023 13:22:33 +0200
Message-Id: <20230512112238.85272-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:k31WPcUb3Wzr14sVJOGDuT4UgyB34ZMQXCpbobdXMa7ExMAIqwE
 FG9BOvRJ4Yu2DdOLW+34WMWgiWpiCKBA6Te5ZpfzmdS/wymc5YyKEA8TSeRx9auAtNKYVsq
 gEXVLkuZUqH+ovbVjPLHhMdiHnGfvR5JFIYuvpycE3xntf1aP+Erz6LUVL06F8w5agEzZrQ
 CrcD4+S94IVqzMJNdK5pA==
UI-OutboundReport: notjunk:1;M01:P0:UlQd+4hqhpw=;GCYYZISm9BDxr7x5tTbpPICd9fA
 o5qnZPs7E6sjHB0tlZkgJ3B0MfuhhHd7SgqZVO65bW6I9BxxC8OGtq3q2Zs0ySYGolcjw4TtV
 htkzajzxQcIfGuFA1i9j8vAcHGB4yAKCxHMawbNjw+u6+H4ONinRxugJxPfjmJ3LvEeqIJLQn
 VTfMI1lCjV6qdJfQD9y0SqObDqr6dXgsi/o30WcRocM1ex7CWjokhyEc9gzJD50Jf41Vaswrk
 JIibr4aYGuzURZ6McbvAg0NScuTqHPKY74DXSYQ4H/SFdWX7aD7skunc/iDTQmc/ZToB5kxWB
 iCh/Lvp1/4DqAyJfeh1fQUOUvqq92ccF8i7/TbOlpIfptwM+d5tR3ZBS103loZUy/eW5OMQGf
 3Jv7Srj82YmMKgJyBhmhvE0CGdFfWseIpfXvc4azAPmhRD3uKm5X0gak/to5fSnTKa0Dh5iPF
 ReGG1Bsl9g6mvFK1/Zb9tvR8f2QRXMvWrW90bP83OLCqtvafS9FpLDd2F//5as5tjSleQDsmx
 lX/ESqwcPdUgPPky8yAj6v0vGWHCXqD0GsWUoaN/504JQhwLgBO6IyyvSOvrxOjDXgaP9E1pV
 O/1LvWCn/lCxY3PlMS5vzbvi7C320bAtlKS6sshUQpNOUTStSxIaeiWWHM8V0Ygk8gQdo6hBN
 vhhRQ0r3A63r5JsDsrJ7GU/+TI+Mx6eb7h7nhKPr/Q==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Weißschuh <thomas@t-8ch.de>

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230424153429.276788-2-thomas@t-8ch.de>
[lv: move declaration at the beginning of the block]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index fccc46e609c6..95da74ab1234 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9196,6 +9196,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             return ret;
         }
 #endif
+#ifdef TARGET_NR_open_tree
+    case TARGET_NR_open_tree:
+        {
+            void *p2;
+            int host_flags;
+
+            if (!arg2) {
+                return -TARGET_EFAULT;
+            }
+
+            p2 = lock_user_string(arg2);
+            if (!p2) {
+                return -TARGET_EFAULT;
+            }
+
+            host_flags = arg3 & ~TARGET_O_CLOEXEC;
+            if (arg3 & TARGET_O_CLOEXEC) {
+                host_flags |= O_CLOEXEC;
+            }
+
+            ret = get_errno(open_tree(arg1, p2, host_flags));
+
+            unlock_user(p2, arg2, 0);
+
+            return ret;
+        }
+#endif
 #ifdef TARGET_NR_stime /* not on alpha */
     case TARGET_NR_stime:
         {
-- 
2.40.1


