Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E66B53ED
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvk-0008CY-Al; Fri, 10 Mar 2023 17:09:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvi-0008Bf-IL
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:38 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvg-000313-T6
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:38 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MEmpp-1pku4f0FSt-00GKMC; Fri, 10
 Mar 2023 23:09:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mathis Marion <mathis.marion@silabs.com>
Subject: [PULL 02/28] linux-user: fix timerfd read endianness conversion
Date: Fri, 10 Mar 2023 23:09:01 +0100
Message-Id: <20230310220927.326606-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vZDUNLPbEX0Y9qm+03pl5iXrUthIvM4z1NHlwukAYefAVlWrNRH
 LPu54NqOQuGAgZmdZ3wwI1bpuS1qTFUtMBoYBwClrcQby46NYE2T3f8Scx8JTLuCP2x8wbi
 /XOnKHuhdakDTayW9M3MrS+jxQMc3G6fLrNVnmwsF3w0KblyXNdrcQHPf9uhAi1hicJn7yz
 1MigRnoJnej48zFSENn/w==
UI-OutboundReport: notjunk:1;M01:P0:x9piBhp1/C8=;bRuHmchImxSYVV71P1Y5SKTNb8C
 jUtuYV32JskBDpxoui7vxez1jRBd+dM22aaNGBH4mVFG6BEI1TNIFpGSGLh9VY+1QAnYo/ev0
 vlZ5sWAxtNFlTtFv1x/GiYD1J3m7XQYpVDVk6OLa3sN5JHoNqhI/g84yoivkFEjCpf/Ik7Z6P
 6wTHOAcLMPi8w2qSerkfhKs7XBoCh7vr8clh9OVMNJZOaLOZlOg3goRkr5mX+OD0u8fv+Eaah
 FD3ydXV3ElH/y4DmFgvfMO7NZ+Vj8Y9L43/yE4n8Z1fS4g+VQNlysNf8quFz5hNItzXtbfk6i
 M72NEWZNMxILuRdtrziV7UlubO/FKnkxbm4JtllZSHOr3C9AAIBvqFRbM8x463Hugt8ZEwaZy
 qudBx1/p0mmTtR+IzFjakPz+09L/1RBaGGK86eitR1KnQfvSLLm39e8SbGoPcEOS2ufeeSP2B
 i/0ZcNJ4cxe008gzbIhYTklsAt7a4CDLfyaJV/URzn17AF92qAJeThdWYhrS8zpVH/tR+gZcw
 UVjmpveI2HwxuCLdaD7qV6lL1DwvDJ9ebgKeI8Wt9rv903nVOYq9K7tMPwqb2/lguLNiggobk
 4HUWL5annmQNIyZMI/c+n18GfPnqzmc2kkHshTam/xHNEKDakW0S4hcjhRLbekc9uT3vZyNRh
 uvlYliSpQanpsVg4atk9f5sjF6vwRrsb4vJMyAsb7g==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Mathis Marion <mathis.marion@silabs.com>

When reading the expiration count from a timerfd, the endianness of the
64bit value read is the one of the host, just as for eventfds.

Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230220085822.626798-2-Mathis.Marion@silabs.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 10 +++++++---
 linux-user/fd-trans.h |  1 +
 linux-user/syscall.c  |  8 ++++++--
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 7b25468d0208..146aaaafaa13 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -1622,7 +1622,7 @@ TargetFdTrans target_signalfd_trans = {
     .host_to_target_data = host_to_target_data_signalfd,
 };
 
-static abi_long swap_data_eventfd(void *buf, size_t len)
+static abi_long swap_data_u64(void *buf, size_t len)
 {
     uint64_t *counter = buf;
     int i;
@@ -1640,8 +1640,12 @@ static abi_long swap_data_eventfd(void *buf, size_t len)
 }
 
 TargetFdTrans target_eventfd_trans = {
-    .host_to_target_data = swap_data_eventfd,
-    .target_to_host_data = swap_data_eventfd,
+    .host_to_target_data = swap_data_u64,
+    .target_to_host_data = swap_data_u64,
+};
+
+TargetFdTrans target_timerfd_trans = {
+    .host_to_target_data = swap_data_u64,
 };
 
 #if defined(CONFIG_INOTIFY) && (defined(TARGET_NR_inotify_init) || \
diff --git a/linux-user/fd-trans.h b/linux-user/fd-trans.h
index 1b9fa2041c06..910faaf237cc 100644
--- a/linux-user/fd-trans.h
+++ b/linux-user/fd-trans.h
@@ -130,6 +130,7 @@ extern TargetFdTrans target_netlink_route_trans;
 extern TargetFdTrans target_netlink_audit_trans;
 extern TargetFdTrans target_signalfd_trans;
 extern TargetFdTrans target_eventfd_trans;
+extern TargetFdTrans target_timerfd_trans;
 #if (defined(TARGET_NR_inotify_init) && defined(__NR_inotify_init)) || \
     (defined(CONFIG_INOTIFY1) && defined(TARGET_NR_inotify_init1) && \
      defined(__NR_inotify_init1))
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index cc650d4ccbd6..64b71b1ff94b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -13108,8 +13108,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
 #if defined(TARGET_NR_timerfd_create) && defined(CONFIG_TIMERFD)
     case TARGET_NR_timerfd_create:
-        return get_errno(timerfd_create(arg1,
-                          target_to_host_bitmask(arg2, fcntl_flags_tbl)));
+        ret = get_errno(timerfd_create(arg1,
+                        target_to_host_bitmask(arg2, fcntl_flags_tbl)));
+        if (ret >= 0) {
+            fd_trans_register(ret, &target_timerfd_trans);
+        }
+        return ret;
 #endif
 
 #if defined(TARGET_NR_timerfd_gettime) && defined(CONFIG_TIMERFD)
-- 
2.39.2


