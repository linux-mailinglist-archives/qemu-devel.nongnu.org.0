Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1F44F770
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 11:40:38 +0100 (CET)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmCwA-0001rl-1K
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 05:40:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCre-00041k-Ce
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:35:58 -0500
Received: from [2a00:1450:4864:20::32e] (port=46759
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCrc-0000hI-Jy
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:35:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so10034117wmb.5
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 02:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgWRpb6eD25eDJnCmvoWcYOQSpkeHkzdEszyRb0jyTc=;
 b=iuVh9ewOEFnuBGoHg6sSFSQ9Flwe1EIVXnfLvz2ebuB8sXv0YosLdSza32PUl7Et58
 hHzag+KHlCQuA3I9ddrX/hCkfZE+Ov3IDl0SLvkMMdWTMdyFByU52B72r0XE539fuaLz
 r0dqJdkAGWZ6ew0Rt4sgMTYNwje/6tmlRO7d4WcCDM7q00RNk9g0roT/DSBNe2SNtuC0
 ajgy/fbE9pOv7iu81P1Bs6jG1GEub7JfI7NscbPbCTlatGYKJEX/hfT5ZYmHhw+Qv9dJ
 v4izP4cCeMV/q9NK2Ulmkb+hWPGmg8PznLtyfGJEyNeex9mQgA6sxDW/W3u9100yOUTH
 33+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NgWRpb6eD25eDJnCmvoWcYOQSpkeHkzdEszyRb0jyTc=;
 b=h0pNn1LZr9TAZl4UpHHNJ3fHYfQJmQPKly+Pbtd5DCpeV9xglTfut9u1E9YEsgeYID
 zYoolf7BtaLEGGEoTDKg9CxXGbl9XQWfOAOhtCjBScHNCJGhl0mlgrymTHl4HOByuiiU
 4ogJmziqpYlJkgy86ea3BRs+Wfjh5bWoaq8FQPFeqb6zyAWP/Yef62+KYL4z6SzUd1lD
 +L8YUKPk4POCP1s3daKYnEnPdFRq9PD9+gML9u6TScpdCRgQg18muOBC1RPPvDuTZkAL
 XzqaRpbUUk3/MGzsVfSAYkUWQ6+z8JzUu0UmlUZSvh2pYCiI8+2rNvFvwotGFJdxJ6TU
 zE6w==
X-Gm-Message-State: AOAM531DWcyhEg8smmsx6olHHN/FGCo5G/LAxMIVfrwZfQu3Gg8MW5fo
 agUtiXkC52q8tHJQ9iwiJqg6o6UOsaiB8Z2cF2A=
X-Google-Smtp-Source: ABdhPJzOJfqGpJbnZoER2f8O1WSfXzdtK5idOFSgnuOquhwoB5YUx5w3GqMGbQG5N8ug82ayEhqlCA==
X-Received: by 2002:a7b:c756:: with SMTP id w22mr33524909wmk.34.1636886155300; 
 Sun, 14 Nov 2021 02:35:55 -0800 (PST)
Received: from localhost.localdomain (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id x1sm10638852wmc.22.2021.11.14.02.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 02:35:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] linux-user: Always use flexible arrays for dirent
 d_name
Date: Sun, 14 Nov 2021 11:35:37 +0100
Message-Id: <20211114103539.298686-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211114103539.298686-1-richard.henderson@linaro.org>
References: <20211114103539.298686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
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


