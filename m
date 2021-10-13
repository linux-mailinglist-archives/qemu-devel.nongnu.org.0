Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB84F42CFC8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:02:18 +0200 (CEST)
Received: from localhost ([::1]:46840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1map8R-0000hA-Bi
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIY-00045O-Qv
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:34 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIX-00047X-40
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:34 -0400
Received: by mail-qt1-x835.google.com with SMTP id y11so4152583qtn.13
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HhaTOax/FfoOVfXQIocoBV26WPxX91xBz5LLueJKqw0=;
 b=elHAOTd4jvduKzgFiapnqVwKNpptdw3JT9d4SQ5mzQ3z305PRNXdrtKPgjz5KFTqkl
 E51DZHqS2UREbqXUKh6WeWCpdv8HwIQmr7tNnKPzwd7tXFXdd3t31TZAFfJk1OEfbiAv
 z3LmqOC1K8PzdSRLbcw+1vC1D3SvaHGuxXYjX7KL3L7Y/c5Bde/BnxBjYvPz8tTalZR7
 bIND3PGOLjGWBfcELHhXN+kUnl1sLbe2imCG4oaeNXrsq0VYJgiSSmI9oatIeP3qxZIV
 ySq7x+D8mek2ClbM0H0IBLgyj0JAEkfkLy+vmfkt3hYiIheQeW/6TSL9JWL04Tq4kQ6S
 gqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HhaTOax/FfoOVfXQIocoBV26WPxX91xBz5LLueJKqw0=;
 b=wVphC/4U7FR80O27M54hlBBicjLExV+XlLwrr5EeTmwGz0ZNU4iipEmYpjFNXvi/IK
 8j7luTOHt16qTVK28BTk968ppFwtk3Qqze1891p0OtsmNbqSnpGfJuIRFr4dltKIQKEE
 k8pN33hZ0wqWM0RZGoB1yl35Ie5z0aUyJKIQGaGDEAMDqnaLphTOrztQgCf8mIoGbdfU
 YRmOh9NlORDYY0JXiPnwuhyKfAzqGTz59+3WVHNOdtnVE8VCbFnnrf98mxwBgNktM2ou
 Cgidhg3efTO+E+T82MS7k08AxMqvzGFe+j62Mrusc3nOtxOWFX/90/pwKJRL/XQg2hzH
 yP5Q==
X-Gm-Message-State: AOAM533lRj1VE3UgQ9qYznbKUWMV8qoOcxqWVdlQoqtRB/2ml5wy0Nbs
 Z5/1J6rt5iDtGEQun+1Mw+x2SoS60A8c9w==
X-Google-Smtp-Source: ABdhPJzAp1YioUQdQQaTJXHwbyL6fHiGlcuQsWk4b2xTUpc0CCwWoS5Aus+rVNjbmWm010AOcSKvNQ==
X-Received: by 2002:a05:622a:1a24:: with SMTP id
 f36mr2533117qtb.321.1634166271926; 
 Wed, 13 Oct 2021 16:04:31 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:31 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] 9p: darwin: Handle struct stat(fs) differences
Date: Wed, 13 Oct 2021 19:03:57 -0400
Message-Id: <20211013230405.32170-4-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
---
 hw/9pfs/9p-proxy.c | 17 ++++++++++++++---
 hw/9pfs/9p-synth.c |  2 ++
 hw/9pfs/9p.c       | 16 ++++++++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 09bd9f1464..be1546c1be 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -123,10 +123,15 @@ static void prstatfs_to_statfs(struct statfs *stfs, ProxyStatFS *prstfs)
     stfs->f_bavail = prstfs->f_bavail;
     stfs->f_files = prstfs->f_files;
     stfs->f_ffree = prstfs->f_ffree;
+#ifdef CONFIG_DARWIN
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
@@ -143,12 +148,18 @@ static void prstat_to_stat(struct stat *stbuf, ProxyStat *prstat)
    stbuf->st_size = prstat->st_size;
    stbuf->st_blksize = prstat->st_blksize;
    stbuf->st_blocks = prstat->st_blocks;
-   stbuf->st_atim.tv_sec = prstat->st_atim_sec;
-   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
+   stbuf->st_atime = prstat->st_atim_sec;
    stbuf->st_mtime = prstat->st_mtim_sec;
-   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
    stbuf->st_ctime = prstat->st_ctim_sec;
+#ifdef CONFIG_DARWIN
+   stbuf->st_atimespec.tv_nsec = prstat->st_atim_nsec;
+   stbuf->st_mtimespec.tv_nsec = prstat->st_mtim_nsec;
+   stbuf->st_ctimespec.tv_nsec = prstat->st_ctim_nsec;
+#else
+   stbuf->st_atim.tv_nsec = prstat->st_atim_nsec;
+   stbuf->st_mtim.tv_nsec = prstat->st_mtim_nsec;
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
index 2f0e960162..17b62d72fc 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1276,11 +1276,17 @@ static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
     v9lstat->st_blksize = stbuf->st_blksize;
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
 
@@ -3503,9 +3509,15 @@ static int v9fs_fill_statfs(V9fsState *s, V9fsPDU *pdu, struct statfs *stbuf)
     f_bavail = stbuf->f_bavail / bsize_factor;
     f_files  = stbuf->f_files;
     f_ffree  = stbuf->f_ffree;
+#ifdef CONFIG_DARWIN
+    fsid_val = (unsigned int)stbuf->f_fsid.val[0] |
+               (unsigned long long)stbuf->f_fsid.val[1] << 32;
+    f_namelen = MAXNAMLEN;
+#else
     fsid_val = (unsigned int) stbuf->f_fsid.__val[0] |
                (unsigned long long)stbuf->f_fsid.__val[1] << 32;
     f_namelen = stbuf->f_namelen;
+#endif
 
     return pdu_marshal(pdu, offset, "ddqqqqqqd",
                        f_type, f_bsize, f_blocks, f_bfree,
-- 
2.33.0


