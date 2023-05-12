Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E57006A7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:23:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrH-0005yR-6t; Fri, 12 May 2023 07:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrF-0005xy-9J
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:45 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrD-0002NQ-M9
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Ml3ym-1qcFGX1HEC-00lT0P; Fri, 12
 May 2023 13:22:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/9] linux-user: Add move_mount() syscall
Date: Fri, 12 May 2023 13:22:32 +0200
Message-Id: <20230512112238.85272-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hvN8bIFdImY//8+dCAbzXbVCpAbVL3mEo7cifPGLTgquh5CxzDm
 bUtuXK0LvWkc7q9hK2lfMHyTrRyTmvpBmkXGJjDqMkkiWw36jnYIR7qkh1DMTvnvjlowk7X
 Cmu2bDcSxEUbpiyfsepf7qIWkXOZ7FUlygfRS9nUJ9J4b/ZLnJjKYXRh2Knxfg0uK11t8uR
 M2fgf9Gw1CRFdfcEBStgQ==
UI-OutboundReport: notjunk:1;M01:P0:6Hmxy6q8dyU=;YHT11MqpgHSKdcQXj1eSynI4bTQ
 1TmNCwdVdYxJX8SCzZUPOV/8e9imvu0Wu0NehZvcGBRiwPuzGGpvElpIZmRIJkNT2IG2lio51
 mQDuqrZ0Ds0fMtO3vKBTcYlSq20vyEgweZS2RLCYSf+TxXjFEtC1IQwJv4KVvN73Odifc1nLP
 W4kyHKfEaBm2QDdI7C6dXrxGMutZDJHLsZ2XHU01YIMOgpXvjxT+JFgOUVcG7B8p+P7QS8GX7
 BSoo62ziYloCxzfn8XnuyjgeHW84+Y9QDHjhYqQSY1D0ziyK/LcCEz50nd3U3ZILQqMok3uBH
 8DFv6ewYXuNT5CSUpdha0cPaP5GiswkCQv4Be8K7pYWe4lZ04ZEHMo8/DcxOk9C1BtMURGaAO
 XKDsYJGzzDu8BQ0GzLgkfRnaqHBUm55MjV6+2PfhxWNnPPwWWNgHFlH6c1tE0D0DrvIWGHUzi
 o0zmFcWsptDmOrOOuyf91KI8b5K7DKntxrYeRV31Ivnz36u0I4pSaUz7kFVI36Cr8SbH9Aar9
 J10z0N3/RdJlnk76N7100gfSfgxrWOAX74ushLro7r8RK8WjG69pnVtrFeTe2SdU/vmNINGaN
 pf52I9I4HQzJnxmTvf4i7h2afGam5HJhZqhMv3pAmXaUyXOY4tI4k4cZcj4LhBvWq/CojyjMk
 aorR3KKVXdQGgxUo5/uDUpFDAZuPAY/z+Pa2ugf63g==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Weißschuh <thomas@t-8ch.de>

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230424153429.276788-1-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 954ed14df4c0..fccc46e609c6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9169,6 +9169,33 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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
-- 
2.40.1


