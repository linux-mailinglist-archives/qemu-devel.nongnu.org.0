Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205D50E37A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:42:34 +0200 (CEST)
Received: from localhost ([::1]:47906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizv7-0000Na-HC
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgZ-0006WG-Sm
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:35 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgX-0004iK-PX
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:31 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t13so13558160pgn.8
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KrgU3+IX4XWkPyP4DiZKgG5uVyLxX2CCY6D8wOC32zw=;
 b=Q/LX7OCam4PEcRI3xgzXBE4UtssxTZzNGxzMZoeMI9Elr5gx+kw91aVHrWx7sB1N8G
 uOj9zvYre/a2qf2FqwsDpiKUhUjhqkf7Lm+5BiWqfgac9J6Q2Vpkwmq3HgZtv4++7Hvd
 v9vNGeUkO1qocu2yH6Tf520uDcgL2Yqao8AjQTnJw68gmtLTTykt39T+BhoiNc9AM/8d
 wnNUdA/ryltqcWpv0wSe7xCsx/WFXaZZf0lmFP4UuWSRARApSJN1hrg6soRM3PIUjfsn
 iQNFvt0W98Vbz70MeTGYOMLVui4pbhqELctpRRKk9j/aykyNmla3LOEi34jHIETZuYQB
 khKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KrgU3+IX4XWkPyP4DiZKgG5uVyLxX2CCY6D8wOC32zw=;
 b=Ba9U27fkSpBwDM3fldsTc86zOKQ4yrnbz75OoIru3Viyvv0/HCgWD8Iv+zx3b6CstK
 t3jBD/1QRYcCuPHjq0J2xOKZdJ4ephReHsyeyvTEKT2sRrwqGweIaVO+E4c0VmLwaOVU
 huNy1Oo3gHAtFIwK/VEMS5I0K+sN2N3BVthWzN5KhaOe4t2IS0zQ3im1Ixuc5sv2NqYu
 Rdz8wyZcp8oOQXV4djCJbJpB1CfD7z7PsxqTf6LR1D4U9QBNoaw5mboEgiugMTX2HVpH
 WHLP74oYLyqvham25ztusmODfwzGra/cpUhu4AT2HnY2cIB83aqx8maQg6JkJrPtmSJX
 ocDg==
X-Gm-Message-State: AOAM530a9ALUJH9trNaAqtP6hxKphIh0N5dLSd5pwxp/Sc9PKvzM3kVg
 ItkO79fDfeFWFlBJRybCCHW7was7HcA=
X-Google-Smtp-Source: ABdhPJxweqr0oWCPyvUdyFXzy6JvcnfGwUkp2kTFtiiZ8r6LhE84U4M4s8Cmy5cN2+NcSzCHbORx7g==
X-Received: by 2002:a63:4412:0:b0:3a9:e7e1:81a6 with SMTP id
 r18-20020a634412000000b003a9e7e181a6mr15269269pga.532.1650896847032; 
 Mon, 25 Apr 2022 07:27:27 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 4/9] fsdev: Add missing definitions for Windows in file-op-9p.h
Date: Mon, 25 Apr 2022 22:27:00 +0800
Message-Id: <20220425142705.2099270-5-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Add uid_t, gid_t and struct statfs definitions, which are currently
missing from Windows headers, but are required when we add 9p file
system support for Windows in later patches.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/file-op-9p.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 4997677460..7d9a736b66 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -27,6 +27,39 @@
 # include <sys/mount.h>
 #endif
 
+#ifdef CONFIG_WIN32
+
+/* POSIX structure not defined in Windows */
+
+typedef uint32_t uid_t;
+typedef uint32_t gid_t;
+
+/* from http://man7.org/linux/man-pages/man2/statfs.2.html */
+typedef uint32_t __fsword_t;
+typedef uint32_t fsblkcnt_t;
+typedef uint32_t fsfilcnt_t;
+
+/* from linux/include/uapi/asm-generic/posix_types.h */
+typedef struct {
+    long __val[2];
+} fsid_t;
+
+struct statfs {
+    __fsword_t f_type;
+    __fsword_t f_bsize;
+    fsblkcnt_t f_blocks;
+    fsblkcnt_t f_bfree;
+    fsblkcnt_t f_bavail;
+    fsfilcnt_t f_files;
+    fsfilcnt_t f_ffree;
+    fsid_t f_fsid;
+    __fsword_t f_namelen;
+    __fsword_t f_frsize;
+    __fsword_t f_flags;
+};
+
+#endif /* CONFIG_WIN32 */
+
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
 
-- 
2.25.1


