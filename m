Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E050E0A5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 14:44:53 +0200 (CEST)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niy5D-0000kk-88
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 08:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e0293bfec97b3ccf350f47903a4e8c8fc65d9826@lizzy.crudebyte.com>)
 id 1niy2E-00069W-UD; Mon, 25 Apr 2022 08:41:46 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:37153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e0293bfec97b3ccf350f47903a4e8c8fc65d9826@lizzy.crudebyte.com>)
 id 1niy2C-0002Ed-G7; Mon, 25 Apr 2022 08:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=vq90Q4vtQmJgyHCseX/Xdws1yT3xxELHmtULnL9IalE=; b=miduV
 LNsXIVulmK1RA/BS9fdzWGKzotLPA9J8sgWsY5T7pTLrwiXRzR0uAaxhUoMFXvzdBZwdXoAgRUzxO
 HLk1SGFgPs2VZXvGY8ZiwnhbU62UAlnPUynR7xj0skI19pGDFkfMgNiKpJAxXHNhw85+Qu9ns9HgY
 LFkLx8l92EViXpSjkol7Qv2oNQjNkyD1eiy/U8U8HGO+GeUcipgj8HQFwwPF2xskDz3q+UDbqpUvd
 tDHjHfnSu4jIkhMLZjK4RYNLwJFxqUcmlB9Rd+gVh8kjMk8JdFxgj5s14oPVoRApjzx5mEx62/Awx
 pQhMf3UUfQ6PWdt1mZBJOruI1/Pzw==;
Message-Id: <e0293bfec97b3ccf350f47903a4e8c8fc65d9826.1650889269.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1650889268.git.qemu_oss@crudebyte.com>
References: <cover.1650889268.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 25 Apr 2022 14:20:49 +0200
Subject: [PATCH v3 3/6] 9pfs: fix wrong encoding of rdev field in Rgetattr on
 macOS
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-stable@nongnu.org
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e0293bfec97b3ccf350f47903a4e8c8fc65d9826@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'rdev' field in 9p reponse 'Rgetattr' is of type dev_t,
which is actually a system dependant type and therefore both the
size and encoding of dev_t differ between macOS and Linux.

So far we have sent 'rdev' to guest in host's dev_t format as-is,
which caused devices to appear with wrong device numbers on
guests running on macOS hosts, eventually leading to various
misbehaviours on guest in conjunction with device files.

This patch fixes this issue by converting the device number from
host's dev_t format to Linux dev_t format. As 9p request
'Tgettattr' is exclusive to protocol version 9p2000.L, it should
be fair to assume that 'rdev' field is assumed to be in Linux dev_t
format by client as well.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Link: https://lore.kernel.org/qemu-devel/20220421093056.5ab1e7ed@bahia/
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p-util.h | 39 +++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c      |  2 +-
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 97e681e167..2cc9a5dbfb 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -19,6 +19,45 @@
 #define O_PATH_9P_UTIL 0
 #endif
 
+#if !defined(CONFIG_LINUX)
+
+/*
+ * Generates a Linux device number (a.k.a. dev_t) for given device major
+ * and minor numbers.
+ *
+ * To be more precise: it generates a device number in glibc's format
+ * (MMMM_Mmmm_mmmM_MMmm, 64 bits) actually, which is compatible with
+ * Linux's format (mmmM_MMmm, 32 bits), as described in <bits/sysmacros.h>.
+ */
+static inline uint64_t makedev_dotl(uint32_t dev_major, uint32_t dev_minor)
+{
+    uint64_t dev;
+
+    // from glibc sysmacros.h:
+    dev  = (((uint64_t) (dev_major & 0x00000fffu)) <<  8);
+    dev |= (((uint64_t) (dev_major & 0xfffff000u)) << 32);
+    dev |= (((uint64_t) (dev_minor & 0x000000ffu)) <<  0);
+    dev |= (((uint64_t) (dev_minor & 0xffffff00u)) << 12);
+    return dev;
+}
+
+#endif
+
+/*
+ * Converts given device number from host's device number format to Linux
+ * device number format. As both the size of type dev_t and encoding of
+ * dev_t is system dependant, we have to convert them for Linux guests if
+ * host is not running Linux.
+ */
+static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
+{
+#ifdef CONFIG_LINUX
+    return dev;
+#else
+    return makedev_dotl(major(dev), minor(dev));
+#endif
+}
+
 #ifdef CONFIG_DARWIN
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
 #define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 225f31fc31..4a296a0b94 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1327,7 +1327,7 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_nlink = stbuf->st_nlink;
     v9lstat->st_uid = stbuf->st_uid;
     v9lstat->st_gid = stbuf->st_gid;
-    v9lstat->st_rdev = stbuf->st_rdev;
+    v9lstat->st_rdev = host_dev_to_dotl_dev(stbuf->st_rdev);
     v9lstat->st_size = stbuf->st_size;
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
     v9lstat->st_blocks = stbuf->st_blocks;
-- 
2.32.0 (Apple Git-132)


