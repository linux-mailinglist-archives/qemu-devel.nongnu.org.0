Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71734C5F79
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:37:51 +0100 (CET)
Received: from localhost ([::1]:45624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSAm-0000OA-Mq
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:37:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8s-00064K-JZ
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:50 -0500
Received: from [2607:f8b0:4864:20::82c] (port=45587
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8n-00032P-2E
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:50 -0500
Received: by mail-qt1-x82c.google.com with SMTP id e2so7498045qte.12
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/9yV7bRN6OBkNxsaJNqx6IRx9uWTGL8PDPo9dIDyd0E=;
 b=JbitSNDJL99E+aCcHHBxiJap3bb4/1eINwQZY4crboGJREola+ZLqJvH1wecYZIEBk
 cMZiFawwiByy9ZdjHfuUf1Jxpb/DBUCe4s2cZYKKmn4MFVXvqvLGy8ll4JgAgnS3Nw49
 fAwcf9U1Oy/E1n26VJ66UMIB5W3vb4uJnbv/dSY/EehWKIDi4BTQp/UG96OicKAWqxCY
 RIsCur9qhd67N25gKXIMh2HW2Nx8o2/qKvHGXxVpHDc3jHJeJ0U5RQUSaEwFrPL6dTkf
 sFqOHuB1VHXm9tB2mV2K7CdJ1sGtDCOfwg6RDds3iS4UoV+jrwKp3YUDM1f3cUc9Yx3B
 xd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/9yV7bRN6OBkNxsaJNqx6IRx9uWTGL8PDPo9dIDyd0E=;
 b=441Ue2H2a6ZjKE+1wcpiEhp1WutSUVbMsxWir7XE6+DlQWYtKAILcnwV5mYsbWmJOV
 PMwXHMZwuuoo0rfm19DrLmNbd7v1NOS3iVsVa1O8ZDLQQ70D46xsZJNMrdz+v/sMjEn8
 mD1dMFoJ9PixTqHFs9wI50xmZ45rVlXRJe5owTgO71WdYLc21l3IbOHLMLe/pyJoWvpb
 XfRvt2U1fTvGrVVXifeQquip2UyPjx7874G0uTA4bgH8ONDieI3Qz7/ZJVPGdq+6KbsC
 qR0QgiwbzsvCOosr69dtgrD4LGPJz7CLm9BvgliMkMFr18pPXr5CkhWUy4wqe49u6TZ2
 48nA==
X-Gm-Message-State: AOAM5332Pm2v2hXk7ssXRmWCc4c9CODJDVTEXGEB6sycO/986QijDD29
 d+de+H4WEm4y249rOQFVQ9HZfTvK1MMhGg==
X-Google-Smtp-Source: ABdhPJxR2QBN3+smjeOveVagEr2SX1XUcvTfcwNsW29QFvQknAeP7Y8PpI29SKbcQe31BjobmD/zlw==
X-Received: by 2002:a05:622a:11d6:b0:2dd:da66:b064 with SMTP id
 n22-20020a05622a11d600b002ddda66b064mr14701644qtk.8.1646001343639; 
 Sun, 27 Feb 2022 14:35:43 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:43 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/11] 9p: darwin: Handle struct stat(fs) differences
Date: Sun, 27 Feb 2022 17:35:14 -0500
Message-Id: <20220227223522.91937-4-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
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
2.35.1


