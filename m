Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7727E6B0957
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtre-00020m-M1; Wed, 08 Mar 2023 08:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr1-0001k4-Vx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:19 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtqw-00065e-83
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:11 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MbSXf-1q71br0um9-00brcT; Wed, 08
 Mar 2023 14:29:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Mathis Marion <mathis.marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/28] linux-user: fix timerfd read endianness conversion
Date: Wed,  8 Mar 2023 14:28:31 +0100
Message-Id: <20230308132857.161793-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d12lBiK689hBH/JKKhwbKLB1xuDTnAabjs8sbWCHcqFa+nbMX9w
 ba7kmDddhKUJ42/cW+6KprINdDmGv/VtwBCSAOt29xYjte5vekkTqn9foXEcVQVE20OfWdH
 8nhiAhr1OGLezw79ajBQIufhY0KAtQr+yg/l8ggLSBfwwe/JBz3nePduigPOVZ4AtVyNFvS
 37xFZEMIyDrcVDVXnPEKw==
UI-OutboundReport: notjunk:1;M01:P0:lpe0SdTvPmI=;0Lu7d3996+FsxCZtnwJB9IlM+XB
 ZbfiIR25oPi0gHaH80kSaiJJpYuH0cdtyjeHmHzWlezEhNqQEg8FHeuKjjfU4GDaMCHSS7HfQ
 lPm7VYYnCkDgcXSzE8oo1mKIsc4xbQ2iQyw04zUMtscLzNaG5UX6gCjroBwTmxmpLShZDWp1M
 9iMkkq25SCfKD8fnXDrZTq3wz0a5I7/flKNt0RbHx8uDifa0fUGIIn/OUzFyIUQuJpAYHDjoE
 OIUINsHGTj6EwTeingiHdxlVbWEfS7Y/GZqNs413Rk+swzLcLx1XgBpMMZwBzGem3p/YL5pWV
 4z3XNGuX4jSIUI5m688fwWR1QXqAs2/OhreA24NNVPzTQcB6rcP7y1mxrdnVSJOVDyF3aGLhz
 NVKPgzzWo/Tl6SHFETYK0GkKNwxaEWNSOo1Q6WT3CsMshKQuuzJeuPths72cT5cQB1XGekV7x
 dBd6Uv4akRTuHJq3z5SNvhAjNXZ9/SjCc2PfjVuFt+iqLfd/CP57EgWw4divOozNnfY5GIsZA
 fmwL0XNNrlytJkBpXzdgYeMGDk/NexmNG+Dr7rOCoVYXmAjwrLenW2nKxbHF+T4wUVBKehRVS
 qKRdCYQWpz5aVgno1QMI387hegBVFFAkaCsoxDAHBTCAGMeLDj2DSzgfnlpSaXasLrGWmVLxz
 7bMlx9rH95wQZiWJIRTsCJ0CVSFClA4SV9cyywxNqA==
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
index 6525a9c57a39..4f4c1fbc5b0f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -13104,8 +13104,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 
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


