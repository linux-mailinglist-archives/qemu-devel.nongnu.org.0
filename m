Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39DD2DE0F2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:26:27 +0100 (CET)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCxu-0004ea-2U
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvt-0002xf-B3
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:21 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:50493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvp-00074A-Kj
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:21 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MDQqe-1kyUfY3ity-00AScE; Fri, 18 Dec 2020 11:24:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 10/14] linux-user: Add most IFTUN ioctls
Date: Fri, 18 Dec 2020 11:24:03 +0100
Message-Id: <20201218102407.597566-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WX4zhIraeXJ57QngkiIZ3VOefRuMouUQGqnpfcJ6Og/w2Ds0DbP
 tNpEtW/0GGrRUCzitk0M4IA42CNz+DaB1oQ9n+GpcqegWtjDwdExK1kkxuXw0W3rUXEWHip
 w10RJwJfQCgZi95w8sXwFsmSVdxCip+Abh317HxMKiUmF/cfNzW50X6TtU4UzhMW2bnt24W
 Riy+dy3zLx6ZHVX+hIAHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B0qMyKwVQc0=:JOZBwyKfwdaX6MU8jtQHTP
 2at2DlsSpeO0ms0LVapSh4+on2BMfoAmVy5YHzIA4xUXW3uS09ZwdQ2G6CuHoV/eSdy8xsIRf
 zAT/tPCFEY/u3qH0FQ7PJnp9AsSByCKVrN5NBP8KSxQzRJeIyHXeIACSHPrcYPR3wRqIVEGOW
 POz2hopNn5GXM5ghyEtJci6mnFiTH1bEKEAuR8i1dOHBCqgx/gZXX+akMNpRpqFsanewppOBJ
 yzKj5ZSr+7PQ587e6+vgDnggOZeeFSckj3HM/OVMnOjiPztzhmHAeIHuaXZ6mjjKR7Fuf8vCo
 4sUO9dgHYxZ3sCUFk55nCTFdmRfdzvZX/FfCoQhstfElMOqhdQxgj24jxPgwfwIVD0zOpB+NF
 r2rFaZkETjfOfHZkcU+bAFPfzzocDt0i+MPvLYOYI74cILPGkhAn//co/TFP+
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Josh Kunz <jkz@google.com>, Shu-Chun Weng <scw@google.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

The three options handling `struct sock_fprog` (TUNATTACHFILTER,
TUNDETACHFILTER, and TUNGETFILTER) are not implemented. Linux kernel
keeps a user space pointer in them which we cannot correctly handle.

Signed-off-by: Josh Kunz <jkz@google.com>
Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20200929014801.655524-1-scw@google.com>
[lv: use 0 size in unlock_user()]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h       | 46 +++++++++++++++++++++++++++++++++++++++
 linux-user/syscall.c      | 37 +++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h | 32 +++++++++++++++++++++++++++
 3 files changed, 115 insertions(+)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 8efb4d38c014..661b5daa9fd8 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -720,3 +720,49 @@
   IOCTL(KCOV_DISABLE, 0, TYPE_NULL)
   IOCTL(KCOV_INIT_TRACE, IOC_R, TYPE_ULONG)
 #endif
+
+  IOCTL(TUNSETDEBUG,     IOC_W, TYPE_INT)
+  IOCTL(TUNSETIFF,       IOC_RW, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
+  IOCTL(TUNSETPERSIST,   IOC_W, TYPE_INT)
+  IOCTL(TUNSETOWNER,     IOC_W, TYPE_INT)
+  IOCTL(TUNSETLINK,      IOC_W, TYPE_INT)
+  IOCTL(TUNSETGROUP,     IOC_W, TYPE_INT)
+  IOCTL(TUNGETFEATURES,  IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(TUNSETOFFLOAD,   IOC_W, TYPE_LONG)
+  IOCTL_SPECIAL(TUNSETTXFILTER, IOC_W, do_ioctl_TUNSETTXFILTER,
+                /*
+                 * We can't represent `struct tun_filter` in thunk so leaving
+                 * it uninterpreted. do_ioctl_TUNSETTXFILTER will do the
+                 * conversion.
+                 */
+                TYPE_PTRVOID)
+  IOCTL(TUNGETIFF,       IOC_R, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
+  IOCTL(TUNGETSNDBUF,    IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(TUNSETSNDBUF,    IOC_W, MK_PTR(TYPE_INT))
+  /*
+   * TUNATTACHFILTER and TUNDETACHFILTER are not supported. Linux kernel keeps a
+   * user pointer in TUNATTACHFILTER, which we are not able to correctly handle.
+   */
+  IOCTL(TUNGETVNETHDRSZ, IOC_R, MK_PTR(TYPE_INT))
+  IOCTL(TUNSETVNETHDRSZ, IOC_W, MK_PTR(TYPE_INT))
+  IOCTL(TUNSETQUEUE,     IOC_W, MK_PTR(MK_STRUCT(STRUCT_short_ifreq)))
+  IOCTL(TUNSETIFINDEX ,  IOC_W, MK_PTR(TYPE_INT))
+  /* TUNGETFILTER is not supported: see TUNATTACHFILTER. */
+  IOCTL(TUNSETVNETLE,    IOC_W, MK_PTR(TYPE_INT))
+  IOCTL(TUNGETVNETLE,    IOC_R, MK_PTR(TYPE_INT))
+#ifdef TUNSETVNETBE
+  IOCTL(TUNSETVNETBE,    IOC_W, MK_PTR(TYPE_INT))
+  IOCTL(TUNGETVNETBE,    IOC_R, MK_PTR(TYPE_INT))
+#endif
+#ifdef TUNSETSTEERINGEBPF
+  IOCTL(TUNSETSTEERINGEBPF, IOC_W, MK_PTR(TYPE_INT))
+#endif
+#ifdef TUNSETFILTEREBPF
+  IOCTL(TUNSETFILTEREBPF, IOC_W, MK_PTR(TYPE_INT))
+#endif
+#ifdef TUNSETCARRIER
+  IOCTL(TUNSETCARRIER,   IOC_W, MK_PTR(TYPE_INT))
+#endif
+#ifdef TUNGETDEVNETNS
+  IOCTL(TUNGETDEVNETNS,  IOC_R, TYPE_NULL)
+#endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6091a449fbf0..d182890ff04a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -56,6 +56,7 @@
 #include <linux/wireless.h>
 #include <linux/icmp.h>
 #include <linux/icmpv6.h>
+#include <linux/if_tun.h>
 #include <linux/errqueue.h>
 #include <linux/random.h>
 #ifdef CONFIG_TIMERFD
@@ -5709,6 +5710,42 @@ static abi_long do_ioctl_drm_i915(const IOCTLEntry *ie, uint8_t *buf_temp,
 
 #endif
 
+static abi_long do_ioctl_TUNSETTXFILTER(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                        int fd, int cmd, abi_long arg)
+{
+    struct tun_filter *filter = (struct tun_filter *)buf_temp;
+    struct tun_filter *target_filter;
+    char *target_addr;
+
+    assert(ie->access == IOC_W);
+
+    target_filter = lock_user(VERIFY_READ, arg, sizeof(*target_filter), 1);
+    if (!target_filter) {
+        return -TARGET_EFAULT;
+    }
+    filter->flags = tswap16(target_filter->flags);
+    filter->count = tswap16(target_filter->count);
+    unlock_user(target_filter, arg, 0);
+
+    if (filter->count) {
+        if (offsetof(struct tun_filter, addr) + filter->count * ETH_ALEN >
+            MAX_STRUCT_SIZE) {
+            return -TARGET_EFAULT;
+        }
+
+        target_addr = lock_user(VERIFY_READ,
+                                arg + offsetof(struct tun_filter, addr),
+                                filter->count * ETH_ALEN, 1);
+        if (!target_addr) {
+            return -TARGET_EFAULT;
+        }
+        memcpy(filter->addr, target_addr, filter->count * ETH_ALEN);
+        unlock_user(target_addr, arg + offsetof(struct tun_filter, addr), 0);
+    }
+
+    return get_errno(safe_ioctl(fd, ie->host_cmd, filter));
+}
+
 IOCTLEntry ioctl_entries[] = {
 #define IOCTL(cmd, access, ...) \
     { TARGET_ ## cmd, cmd, #cmd, access, 0, {  __VA_ARGS__ } },
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index b934d0b60676..a00bfc2647c7 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -929,6 +929,38 @@ struct target_rtc_pll_info {
 
 #define TARGET_SIOCGIWNAME     0x8B01          /* get name == wireless protocol */
 
+/* From <linux/if_tun.h> */
+
+#define TARGET_TUNSETDEBUG        TARGET_IOW('T', 201, int)
+#define TARGET_TUNSETIFF          TARGET_IOW('T', 202, int)
+#define TARGET_TUNSETPERSIST      TARGET_IOW('T', 203, int)
+#define TARGET_TUNSETOWNER        TARGET_IOW('T', 204, int)
+#define TARGET_TUNSETLINK         TARGET_IOW('T', 205, int)
+#define TARGET_TUNSETGROUP        TARGET_IOW('T', 206, int)
+#define TARGET_TUNGETFEATURES     TARGET_IOR('T', 207, unsigned int)
+#define TARGET_TUNSETOFFLOAD      TARGET_IOW('T', 208, unsigned int)
+#define TARGET_TUNSETTXFILTER     TARGET_IOW('T', 209, unsigned int)
+#define TARGET_TUNGETIFF          TARGET_IOR('T', 210, unsigned int)
+#define TARGET_TUNGETSNDBUF       TARGET_IOR('T', 211, int)
+#define TARGET_TUNSETSNDBUF       TARGET_IOW('T', 212, int)
+/*
+ * TUNATTACHFILTER and TUNDETACHFILTER are not supported. Linux kernel keeps a
+ * user pointer in TUNATTACHFILTER, which we are not able to correctly handle.
+ */
+#define TARGET_TUNGETVNETHDRSZ    TARGET_IOR('T', 215, int)
+#define TARGET_TUNSETVNETHDRSZ    TARGET_IOW('T', 216, int)
+#define TARGET_TUNSETQUEUE        TARGET_IOW('T', 217, int)
+#define TARGET_TUNSETIFINDEX      TARGET_IOW('T', 218, unsigned int)
+/* TUNGETFILTER is not supported: see TUNATTACHFILTER. */
+#define TARGET_TUNSETVNETLE       TARGET_IOW('T', 220, int)
+#define TARGET_TUNGETVNETLE       TARGET_IOR('T', 221, int)
+#define TARGET_TUNSETVNETBE       TARGET_IOW('T', 222, int)
+#define TARGET_TUNGETVNETBE       TARGET_IOR('T', 223, int)
+#define TARGET_TUNSETSTEERINGEBPF TARGET_IOR('T', 224, int)
+#define TARGET_TUNSETFILTEREBPF   TARGET_IOR('T', 225, int)
+#define TARGET_TUNSETCARRIER      TARGET_IOW('T', 226, int)
+#define TARGET_TUNGETDEVNETNS     TARGET_IO('T', 227)
+
 /* From <linux/random.h> */
 
 #define TARGET_RNDGETENTCNT    TARGET_IOR('R', 0x00, int)
-- 
2.29.2


