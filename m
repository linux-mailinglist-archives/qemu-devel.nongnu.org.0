Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4710D4BD00B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 18:03:04 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpbz-00081K-BZ
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 12:03:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQc-0007mI-NB
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:21 -0500
Received: from [2607:f8b0:4864:20::f30] (port=42629
 helo=mail-qv1-xf30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQa-0000Ab-7Q
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:18 -0500
Received: by mail-qv1-xf30.google.com with SMTP id e22so26034578qvf.9
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NNqqtWfX+7r5Cvr34BgDX1k8to7b5IQs7giXGg/3I6o=;
 b=SiWK77BjrBLGLsNF3tZNFfHWpcqFzwPJRl5GWPbefoU9BzNE9aS+ZrzIC5zKs3jbYq
 hb5VGhYFSbekdhZ3uMTIMPm8hbXB9AY83/DEfIS4R8VznMIyd+jcefrfKY1QoW/tEVSw
 5S0sZVEQtI2NgTH4gMDium2VeS1pJdHhdjIPHGq+LSkPcp91Os0ZQKoUaloAowvoD5tE
 UMVICI9K55kBDp9VdU69oUt7chOFOFgl9jU4rp2cTrqJPvhnuuGwtVwyRyOgemtJK2Nd
 /evYLgW1FMh0XaCh/rThQcDLRndyRC5oD9iiKH6g4N6GZzjiMFyiS75GwyfoovW97ZJy
 7AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNqqtWfX+7r5Cvr34BgDX1k8to7b5IQs7giXGg/3I6o=;
 b=Dj/SSNj/uZL41t+Tu/2fIs2hUmtF2LjBEWwj0gLrQazhp9e77w8Gp6hPtRo4m9TI1J
 Yo2rCyaMCO4ZzV2StnCah7Q9wMkfnZOjeamSZX520TTYapMLxicsXoZrdwzBPEkltICk
 ew8jIMOwfXMfj/v4LfC1DHWpMzgfOJqONyS6QRAGGW73agrljNwkVbE9gAwDOtWqfD+m
 tH99FIxU56BOf9Sa8dCkLlAbLTkRDvUuLiajp/85ypSUMmpYJK7ZMcyc5F+iJuTeCfbg
 iZm0+xr0Ya3KLLUzgCP352AuAj/BzpRizwXD5B5MD42LjfMaRUufUEEIW0IuwucOu3Lk
 PLEA==
X-Gm-Message-State: AOAM531DapyrdwMtUXXnD+oJDTY+b5WeBynEIb48+jK1PokHCoJfvbIG
 eeeGJ4X6uFcftS9DVX5v5w8MooUUwC6/mA==
X-Google-Smtp-Source: ABdhPJzzoNE/vWnaeHmIRrbidNJca7mHb0db3tlsFxyADlm2tSTQL072UkSsb3M3rNvkqIABdMM8ww==
X-Received: by 2002:a05:6214:a8a:b0:430:8fbc:6be2 with SMTP id
 ev10-20020a0562140a8a00b004308fbc6be2mr13042843qvb.7.1645375872649; 
 Sun, 20 Feb 2022 08:51:12 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:12 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/11] 9p: linux: Fix a couple Linux assumptions
Date: Sun, 20 Feb 2022 11:50:46 -0500
Message-Id: <20220220165056.72289-2-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf30.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

 - Guard Linux only headers.
 - Add qemu/statfs.h header to abstract over the which
   headers are needed for struct statfs
 - Define `ENOATTR` only if not only defined
   (it's defined in system headers on Darwin).

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>

While it might at first appear that fsdev/virtfs-proxy-header.c would
need similar adjustment for darwin as file-op-9p here, a later patch in
this series disables virtfs-proxy-helper for non-Linux. Allowing
virtfs-proxy-helper on darwin could potentially be an additional
optimization later.

[Will Cohen: - Fix headers for Alpine
             - Integrate statfs.h back into file-op-9p.h
             - Remove superfluous header guards from file-opt-9p
             - Add note about virtfs-proxy-helper being disabled
               on non-Linux for this patch series]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 fsdev/file-op-9p.h   | 9 ++++++++-
 hw/9pfs/9p-local.c   | 2 ++
 hw/9pfs/9p.c         | 4 ++++
 include/qemu/xattr.h | 4 +++-
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index 8fd89f0447..4997677460 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -16,10 +16,17 @@
 
 #include <dirent.h>
 #include <utime.h>
-#include <sys/vfs.h>
 #include "qemu-fsdev-throttle.h"
 #include "p9array.h"
 
+#ifdef CONFIG_LINUX
+# include <sys/vfs.h>
+#endif
+#ifdef CONFIG_DARWIN
+# include <sys/param.h>
+# include <sys/mount.h>
+#endif
+
 #define SM_LOCAL_MODE_BITS    0600
 #define SM_LOCAL_DIR_MODE_BITS    0700
 
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 210d9e7705..1a5e3eed73 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -32,10 +32,12 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include <libgen.h>
+#ifdef CONFIG_LINUX
 #include <linux/fs.h>
 #ifdef CONFIG_LINUX_MAGIC_H
 #include <linux/magic.h>
 #endif
+#endif
 #include <sys/ioctl.h>
 
 #ifndef XFS_SUPER_MAGIC
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 15b3f4d385..9c63e14b28 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -32,7 +32,11 @@
 #include "migration/blocker.h"
 #include "qemu/xxhash.h"
 #include <math.h>
+#ifdef CONFIG_LINUX
 #include <linux/limits.h>
+#else
+#include <limits.h>
+#endif
 
 int open_fd_hw;
 int total_open_fd;
diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
index a83fe8e749..f1d0f7be74 100644
--- a/include/qemu/xattr.h
+++ b/include/qemu/xattr.h
@@ -22,7 +22,9 @@
 #ifdef CONFIG_LIBATTR
 #  include <attr/xattr.h>
 #else
-#  define ENOATTR ENODATA
+#  if !defined(ENOATTR)
+#    define ENOATTR ENODATA
+#  endif
 #  include <sys/xattr.h>
 #endif
 
-- 
2.35.1


