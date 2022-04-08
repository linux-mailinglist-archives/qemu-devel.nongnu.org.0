Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D62E4F9B62
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:13:11 +0200 (CEST)
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsAY-000873-90
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs88-0005sC-72
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:40 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ncs7x-0006jP-NX
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:10:39 -0400
Received: by mail-pf1-x434.google.com with SMTP id p8so8882069pfh.8
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KrgU3+IX4XWkPyP4DiZKgG5uVyLxX2CCY6D8wOC32zw=;
 b=droalD/Zv1tJmCYNhwE3CY/b/v0EZw72OyZMxxCSCnl2B21u/eHAOE4hf9BTAYEFqB
 CHTpF7ImC2ehTWfzmskevM2QqHVIjCgWvt2xcE9gfmrhz6cFoDi7zM4lYgrU656mSD8S
 Sfpm0Tn40Tr+P+Sh28keTRNAc36fHG3G2x+7MXk6Svn+N72Df/2061tJLb5t8isrZEGO
 f9lv7RjxS9oEDiVUWgvtxGKlqtBxhad0Fjrw5S1RBZuXB8B0UO41+xh7PLwivZ1v4/VR
 wkuG9uf8ZQcF4hxTmdIqnJcuh4swCQ/MNc3v1lDGkQWNzRcV4/cYt0i2sWWFRUZ174D1
 BeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KrgU3+IX4XWkPyP4DiZKgG5uVyLxX2CCY6D8wOC32zw=;
 b=0tipOZxIV2iorBcjjlDTS2L9prZdNp5n7yvcGaWqeXFfHaXSNDtVpWzweKXtThy4tR
 0mno3OtNILOTXl8ojMcs4hmqRvTuJ4KAELY8ACu/LTmqOrdIOK71al4Udxy6GixFSB0+
 ar7ohpbBD1TlqJRU2pmkj06NazgJlINIrKz8uuLI7NohJyC/7t7ahpjPrchGZHIEpJNJ
 gAaWh71hrduICB5N9KqF4A6Gc7uREh3P3a248sQZWnrJSULumr/m77y8sSjVOQWAjnaR
 51LglT0vFxezdAbGI9NC+C+wCkGQo3HJyDC4nKOPg0BijIQJ/PIuolqC8q0eJUZv2AHD
 IYMA==
X-Gm-Message-State: AOAM531wM1agl3n802DK/GM5xG/sEGWBu6Tb8qrYH1fkWzoJsGHoGN2O
 8mDsrUpnnoZyMzTjK+oL/HCDyT9lxv1cdw==
X-Google-Smtp-Source: ABdhPJzptDpu80+bbuyYfmb5prDEHhhQov2rD2VP6VSHgPz4JxzpUwli8c1Oi/KD+CkYrMwCAx3rxA==
X-Received: by 2002:a63:e805:0:b0:39d:170f:fc29 with SMTP id
 s5-20020a63e805000000b0039d170ffc29mr259534pgh.427.1649437824090; 
 Fri, 08 Apr 2022 10:10:24 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 k15-20020a63ab4f000000b00381eef69bfbsm22263494pgp.3.2022.04.08.10.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:10:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 1/4] fsdev: Add missing definitions for Windows in
 file-op-9p.h
Date: Sat,  9 Apr 2022 01:10:10 +0800
Message-Id: <20220408171013.912436-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408171013.912436-1-bmeng.cn@gmail.com>
References: <20220408171013.912436-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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


