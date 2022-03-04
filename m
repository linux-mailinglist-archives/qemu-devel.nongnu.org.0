Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657EC4CD5D9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:05:01 +0100 (CET)
Received: from localhost ([::1]:54622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8YG-0007hF-G2
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:05:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f0cd1d0069f92bfced8b0d8002da6093850c4ebc@lizzy.crudebyte.com>)
 id 1nQ80U-0005yo-5o
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:30:07 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:37391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f0cd1d0069f92bfced8b0d8002da6093850c4ebc@lizzy.crudebyte.com>)
 id 1nQ80Q-0007Gw-A3
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Q5FQJ2Reo2gOK3Lkjz7qs1014MSz8wpQlPECzV97A/A=; b=SBWVD
 OVNn8JZku/PRIAZg7ttx8oRblcwEG6Bj6ORFbdOw3SxIbuVfbtZZBQ3GR6PK+6Q+RRn/StJF6YjmP
 VzACYTDRls1vZhYGhT37k4E8bUUgI+Oty/GbiVNv3YFMx1E9vyiiSW1rZl1TIMhiGpFnl6GEm8tAC
 gk8vU9wdhIzrSoauV1ipIHUpzI5wZiVqipY0L5JgvWuwmChUAf7stKNLezuexbqYIg1CfZV0uf0La
 FsCoMuBFfQwC5HSu+u88oIp1K+L0Cl/gR/E99Kn0oZuKglyTqa1zB6tMge+g8etTH6mMWbrOlboqJ
 jD7rVx6t7CVTsJlrx4w2+Sn4Gb6eA==;
Message-Id: <f0cd1d0069f92bfced8b0d8002da6093850c4ebc.1646396869.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646396869.git.qemu_oss@crudebyte.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 04 Mar 2022 13:27:49 +0100
Subject: [PULL 03/19] 9p: darwin: Handle struct stat(fs) differences
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f0cd1d0069f92bfced8b0d8002da6093850c4ebc@lizzy.crudebyte.com;
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

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Note lack of f_namelen and f_frsize on Darwin
             - Ensure that tv_sec and tv_nsec are both
               initialized for Darwin and non-Darwin]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Message-Id: <20220227223522.91937-4-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-proxy.c | 22 ++++++++++++++++++++--
 hw/9pfs/9p-synth.c |  2 ++
 hw/9pfs/9p.c       | 16 ++++++++++++++--
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 09bd9f1464..b1664080d8 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -123,10 +123,16 @@ static void prstatfs_to_statfs(struct statfs *stfs, ProxyStatFS *prstfs)
     stfs->f_bavail = prstfs->f_bavail;
     stfs->f_files = prstfs->f_files;
     stfs->f_ffree = prstfs->f_ffree;
+#ifdef CONFIG_DARWIN
+    /* f_namelen and f_frsize do not exist on Darwin */
+    stfs->f_fsid.val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
+    stfs->f_fsid.val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
+#else
     stfs->f_fsid.__val[0] = prstfs->f_fsid[0] & 0xFFFFFFFFU;
     stfs->f_fsid.__val[1] = prstfs->f_fsid[1] >> 32 & 0xFFFFFFFFU;
     stfs->f_namelen = prstfs->f_namelen;
     stfs->f_frsize = prstfs->f_frsize;
+#endif
 }
 
 /* Converts proxy_stat structure to VFS stat structure */
@@ -143,12 +149,24 @@ static void prstat_to_stat(struct stat *stbuf, ProxyStat *prstat)
    stbuf->st_size = prstat->st_size;
    stbuf->st_blksize = prstat->st_blksize;
    stbuf->st_blocks = prstat->st_blocks;
+   stbuf->st_atime = prstat->st_atim_sec;
+   stbuf->st_mtime = prstat->st_mtim_sec;
+   stbuf->st_ctime = prstat->st_ctim_sec;
+#ifdef CONFIG_DARWIN
+   stbuf->st_atimespec.tv_sec = prstat->st_atim_sec;
+   stbuf->st_mtimespec.tv_sec = prstat->st_mtim_sec;
+   stbuf->st_ctimespec.tv_sec = prstat->st_ctim_sec;
+   stbuf->st_atimespec.tv_nsec = prstat->st_atim_nsec;
+   stbuf->st_mtimespec.tv_nsec = prstat->st_mtim_nsec;
+   stbuf->st_ctimespec.tv_nsec = prstat->st_ctim_nsec;
+#else
    stbuf->st_atim.tv_sec = prstat->st_atim_sec;
+   stbuf->st_mtim.tv_sec = prstat->st_mtim_sec;
+   stbuf->st_ctim.tv_sec = prstat->st_ctim_sec;
    stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
-   stbuf->st_mtime = prstat->st_mtim_sec;
    stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
-   stbuf->st_ctime = prstat->st_ctim_sec;
    stbuf->st_ctim.tv_nsec = prstat->st_ctim_nsec;
+#endif
 }
 
 /*
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 7a7cd5c5ba..bf9b0c5ddd 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -439,7 +439,9 @@ static int synth_statfs(FsContext *s, V9fsPath *fs_path,
     stbuf->f_bsize = 512;
     stbuf->f_blocks = 0;
     stbuf->f_files = synth_node_count;
+#ifndef CONFIG_DARWIN
     stbuf->f_namelen = NAME_MAX;
+#endif
     return 0;
 }
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9c63e14b28..1563d7b7c6 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1313,11 +1313,17 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_blksize = stat_to_iounit(pdu, stbuf);
     v9lstat->st_blocks = stbuf->st_blocks;
     v9lstat->st_atime_sec = stbuf->st_atime;
-    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
     v9lstat->st_mtime_sec = stbuf->st_mtime;
-    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_sec = stbuf->st_ctime;
+#ifdef CONFIG_DARWIN
+    v9lstat->st_atime_nsec = stbuf->st_atimespec.tv_nsec;
+    v9lstat->st_mtime_nsec = stbuf->st_mtimespec.tv_nsec;
+    v9lstat->st_ctime_nsec = stbuf->st_ctimespec.tv_nsec;
+#else
+    v9lstat->st_atime_nsec = stbuf->st_atim.tv_nsec;
+    v9lstat->st_mtime_nsec = stbuf->st_mtim.tv_nsec;
     v9lstat->st_ctime_nsec = stbuf->st_ctim.tv_nsec;
+#endif
     /* Currently we only support BASIC fields in stat */
     v9lstat->st_result_mask = P9_STATS_BASIC;
 
@@ -3519,9 +3525,15 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsPDU *pdu, struct statfs *stbuf)
     f_bavail = stbuf->f_bavail / bsize_factor;
     f_files  = stbuf->f_files;
     f_ffree  = stbuf->f_ffree;
+#ifdef CONFIG_DARWIN
+    fsid_val = (unsigned int)stbuf->f_fsid.val[0] |
+               (unsigned long long)stbuf->f_fsid.val[1] << 32;
+    f_namelen = NAME_MAX;
+#else
     fsid_val = (unsigned int) stbuf->f_fsid.__val[0] |
                (unsigned long long)stbuf->f_fsid.__val[1] << 32;
     f_namelen = stbuf->f_namelen;
+#endif
 
     return pdu_marshal(pdu, offset, "ddqqqqqqd",
                        f_type, f_bsize, f_blocks, f_bfree,
-- 
2.20.1


