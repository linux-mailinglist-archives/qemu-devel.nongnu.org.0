Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDC4B748D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:07:19 +0100 (CET)
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3AU-00035B-LK
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:07:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK383-0000Zn-Gh
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:47 -0500
Received: from [2607:f8b0:4864:20::834] (port=43597
 helo=mail-qt1-x834.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK381-0002js-MT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:47 -0500
Received: by mail-qt1-x834.google.com with SMTP id x5so19491407qtw.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s9PuenkLpugsLgi/PBoKGw80paVQIWqbF1SUukEIRZI=;
 b=gIKy3LatdgoFnH8Afv6Kr9zuAR4LD75qgIY0IP4MPhXsaX73jm8hcajPgVEQVB7e3J
 6WVvyAMLuAZgj27m+7n2stRB1DPiGMfhmAGS/fJ0U3yaMymHwhIXYbqM1dF6V0CP4Ffw
 wsF20ijraqRjxV2MmhWs7FNY/uf+gxlAV0FQtC2Vl11HX1tr7CqImRkH3Suralp7g9UB
 u8tcrXfzaXoWjzBRr+OaZYtnCl3wrLVK1vKy0iTFjiyhno+kflS44MSmVNDpeGPOv6I0
 QCCXHdG0dITerYgXcI5qhPHQK5YvNOdxB7KH5XLwkvnESFJZTtd6OBMd0bH80BPABwzO
 UbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s9PuenkLpugsLgi/PBoKGw80paVQIWqbF1SUukEIRZI=;
 b=RUC4Vrz+pBcSd5xzQFoOKsD2knc6S+TjT7LBtK1jMWuWv1yBME0oVaxaGIQEPDGuJl
 wDJri25GRWd11Gyguq6F7s5obmjqLjOgVVFdfxWdMVLRvRqnfMKawbNCAHfckHV1iVh7
 ADdW/+T9sJkXGGBhflnVptn6NLwRDppgy4NDOgUs8Pz+cJRj5ImaAb6TIrfa+lcLgRiQ
 z42D/eXxhGxm8M46bjgXNLXclRlDOci5wDVbQFS3aIaxKTkbCqsNXylsYVZMyzgTC0Mq
 S4uWy3dNGPG+J3ZIAEO5tCgnnIdUko5GiardzoyPKuQYU+LoQp+046HbYvhul5K5XU6J
 tfNQ==
X-Gm-Message-State: AOAM533GxkIzMj86QwnvdkdqIAEAir4sJCwyD05ijrCCbGYySofJZQ0m
 7noNkwXo6+5Dp5idT7rfn4CXYycmsrmKgA==
X-Google-Smtp-Source: ABdhPJyYSlhjSMyzkC9QqKEveWO0+usekEEpPSZpj0z36jA8ZngmAj8yeDrd727a929FKnwzbFCiRA==
X-Received: by 2002:a05:622a:54d:: with SMTP id
 m13mr461162qtx.106.1644951884293; 
 Tue, 15 Feb 2022 11:04:44 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:43 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/11] 9p: darwin: Handle struct stat(fs) differences
Date: Tue, 15 Feb 2022 14:04:18 -0500
Message-Id: <20220215190426.56130-4-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::834
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Note lack of f_namelen and f_frsize on Darwin
             - Ensure that tv_sec and tv_nsec are both
               initialized for Darwin and non-Darwin]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
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
index b38088e066..4a4a776d06 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -427,7 +427,9 @@ static int synth_statfs(FsContext *s, V9fsPath *fs_path,
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
2.34.1


