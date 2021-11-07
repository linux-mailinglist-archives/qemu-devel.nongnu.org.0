Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D859B4472E5
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 13:52:17 +0100 (CET)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjhej-00087X-1Z
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 07:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbP-000343-9P
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:52 -0500
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:38519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbN-00026G-Ax
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:50 -0500
Received: by mail-qt1-x829.google.com with SMTP id c12so6803358qtd.5
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 04:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgWRpb6eD25eDJnCmvoWcYOQSpkeHkzdEszyRb0jyTc=;
 b=LHECL2AxH4ua7CW9c++czvjfYDapl6y+B5lIuI8XiO6N1nTsUJcbZphl9Mrak7QoY6
 OrP2iMAhiT3Od+UfrUyOx+wR4dM2JxkaxCzPktxdEGUqaoP1R4Ld5/Mw1D+1lleCVbnQ
 ld+xQ07OYAvanqgFE/0i85tY8dwy5Tgdfztv30ZcfGYIvYphrNmw3OYH/XwiL5V2UIqN
 4lTilUqnl/Q4nH9wtikfTsChP2TjoizrKWiStWtIwO3Op3koPeTAs6DFetB9Bl7MH6OB
 mq65Vw+YW5rtrsJb8R/tsuktpm0/1yaWMY8KlccFY+NxVKzf0Gxb95lcsmPOUi94QD3N
 HwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgWRpb6eD25eDJnCmvoWcYOQSpkeHkzdEszyRb0jyTc=;
 b=0B1vJnV5ZvgUh04S4C3CTYjc/eokM4y0TfLE/FWCvwrkEb63YP9l2awFQ9lvjqYYP+
 PCmJc7lR//jszA+3rJBFegZXnzQH9ptoSFQC4QKwnn6PHPr36SaMc0WabLamluCKz+1Y
 uFdFdvZaVGg63FAP3vvW/IytnaSoown0J0CEG1/RcXi5VRQ3rKHA2lgAK74JolXd5sXw
 BPsgArChwm6z2I4ujymi+dPBqhpYQoORZiO3aF7lB4XQbMaRVypSf2j8lQAkv5LjL2Ta
 kGadTAC29DIMOGKGi6xU4QI+XAPPmPuhkBd/XN9xNDNmUIdZHcP2lsMawfCxk9NO3U9v
 VwaQ==
X-Gm-Message-State: AOAM530mInmMP9+sReFg9OLFDfDBnPzE1ODOyqd7mcQT1Hv0WX+a0Vg8
 WJq2X6qR9Wm06b8265rlMen7BwUZFxAkAQ==
X-Google-Smtp-Source: ABdhPJzXYltN6JXGyLF8lZgb0qXFlG/5FBmuw63JQ5B2U4a5JuauXm7eL6QLPQMgli2pDEiAErxCag==
X-Received: by 2002:a05:622a:1449:: with SMTP id
 v9mr56241399qtx.122.1636289327300; 
 Sun, 07 Nov 2021 04:48:47 -0800 (PST)
Received: from localhost.localdomain ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w19sm6917qkw.49.2021.11.07.04.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 04:48:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] linux-user: Always use flexible arrays for dirent d_name
Date: Sun,  7 Nov 2021 07:48:43 -0500
Message-Id: <20211107124845.1174791-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107124845.1174791-1-richard.henderson@linaro.org>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: f4bug@amsat.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently use a flexible array member for target_dirent,
but use incorrectly fixed length arrays for target_dirent64,
linux_dirent and linux_dirent64.

This requires that we adjust the definition of the VFAT READDIR
ioctls which hard-code the 256 namelen size into the ioctl constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h | 6 +++---
 linux-user/syscall.c      | 6 ++++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487dcc..98b09ee6d6 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -441,7 +441,7 @@ struct target_dirent64 {
 	int64_t		d_off;
 	unsigned short	d_reclen;
 	unsigned char	d_type;
-	char		d_name[256];
+	char		d_name[];
 };
 
 
@@ -2714,7 +2714,7 @@ struct linux_dirent {
     long            d_ino;
     unsigned long   d_off;
     unsigned short  d_reclen;
-    char            d_name[256]; /* We must not include limits.h! */
+    char            d_name[];
 };
 
 struct linux_dirent64 {
@@ -2722,7 +2722,7 @@ struct linux_dirent64 {
     int64_t         d_off;
     unsigned short  d_reclen;
     unsigned char   d_type;
-    char            d_name[256];
+    char            d_name[];
 };
 
 struct target_mq_attr {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a2f605dec4..499415ad81 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -197,8 +197,10 @@
 //#define DEBUG_ERESTARTSYS
 
 //#include <linux/msdos_fs.h>
-#define	VFAT_IOCTL_READDIR_BOTH		_IOR('r', 1, struct linux_dirent [2])
-#define	VFAT_IOCTL_READDIR_SHORT	_IOR('r', 2, struct linux_dirent [2])
+#define VFAT_IOCTL_READDIR_BOTH \
+    _IOC(_IOC_READ, 'r', 1, (sizeof(struct linux_dirent) + 256) * 2)
+#define VFAT_IOCTL_READDIR_SHORT \
+    _IOC(_IOC_READ, 'r', 2, (sizeof(struct linux_dirent) + 256) * 2)
 
 #undef _syscall0
 #undef _syscall1
-- 
2.25.1


