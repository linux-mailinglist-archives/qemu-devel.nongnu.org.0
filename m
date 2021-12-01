Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5964649C5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 09:35:58 +0100 (CET)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msL5p-0007nb-7V
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 03:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1msKnf-0006NZ-B5
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:17:11 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59358 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1msKnc-00085R-C9
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:17:11 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxaslZL6dhBv8BAA--.4388S20; 
 Wed, 01 Dec 2021 16:16:52 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 18/26] linux-user: Add LoongArch specific structures
Date: Wed,  1 Dec 2021 16:16:17 +0800
Message-Id: <1638346585-3436-19-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
References: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxaslZL6dhBv8BAA--.4388S20
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xCw4DXrWDKr4rZF4ruFg_yoW8Cw4UpF
 4rA3Z8Aw43JrWIq3sxKFyUXry3XF18uFW3Za4Ikry8A3yxt3yFvF1UKrZxAasxW34UCry3
 ZFWktr15Ca1UGFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 linux-user/loongarch64/target_structs.h | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 linux-user/loongarch64/target_structs.h

diff --git a/linux-user/loongarch64/target_structs.h b/linux-user/loongarch64/target_structs.h
new file mode 100644
index 0000000..8be3609
--- /dev/null
+++ b/linux-user/loongarch64/target_structs.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch specific structures for linux-user
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_STRUCTS_H
+#define LOONGARCH_TARGET_STRUCTS_H
+
+struct target_ipc_perm {
+    abi_int __key;                      /* Key.  */
+    abi_uint uid;                       /* Owner's user ID.  */
+    abi_uint gid;                       /* Owner's group ID.  */
+    abi_uint cuid;                      /* Creator's user ID.  */
+    abi_uint cgid;                      /* Creator's group ID.  */
+    abi_ushort mode;                    /* Read/write permission.  */
+    abi_ushort __pad1;
+    abi_ushort __seq;                   /* Sequence number.  */
+    abi_ushort __pad2;
+    abi_ulong __unused1;
+    abi_ulong __unused2;
+};
+
+struct target_shmid_ds {
+    struct target_ipc_perm shm_perm;    /* operation permission struct */
+    abi_long shm_segsz;                 /* size of segment in bytes */
+    abi_ulong shm_atime;                /* time of last shmat() */
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused1;
+#endif
+    abi_ulong shm_dtime;                /* time of last shmdt() */
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused2;
+#endif
+    abi_ulong shm_ctime;                /* time of last change by shmctl() */
+#if TARGET_ABI_BITS == 32
+    abi_ulong __unused3;
+#endif
+    abi_int shm_cpid;                   /* pid of creator */
+    abi_int shm_lpid;                   /* pid of last shmop */
+    abi_ulong shm_nattch;               /* number of current attaches */
+    abi_ulong __unused4;
+    abi_ulong __unused5;
+};
+
+#endif
-- 
1.8.3.1


