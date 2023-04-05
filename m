Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9486D89B9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoH-0005P0-6K; Wed, 05 Apr 2023 17:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo1-0005Ih-DF
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:38 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAnz-0005a5-BR
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:37 -0400
Received: by mail-il1-x130.google.com with SMTP id t5so8184793ilu.5
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=atGMiRwy9B/r1Cd+3QThXqU+xpU78gHAAUbSFzOWBxo=;
 b=2jxhZy66m+SND2ruguUtl3VlCjkDCEnewbRmwRmEDSwW9WXU4UVf3cTKXP5tci9//u
 e3E0GDK9n3xDmDwR7CP7Hbpcm0RHj6x4ietfAPkvVUbNq1EMBViQveWAyiYzQJaR/jKV
 TNdf38zbBYoSXQ44XauNtVBOsnuSpuk91cFUZyfHv2Ql45bT832EvugGyBH8FTGTvCx0
 G6Mso72jbGDkB3jeXSq/ftYWH22oyw1DOxDkdYG2F0y15a3bSWy7dTAOxmhex0Bxvjne
 r1qAq2COHKnAXESlm0fN5ZL4GJzQ3Mc62MjXll4O53tWXovPObmZKtWYV6IdvTtq6fFa
 KStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=atGMiRwy9B/r1Cd+3QThXqU+xpU78gHAAUbSFzOWBxo=;
 b=IXqW7X9IVp9w/CCMarJMH+2aBym0Q4zvbEdTIfe38LInN2Y4K5MANIO7+7OkBDl8hz
 r+jcAnLVUmbAv4a+QTe0uuwfSAdz8gezOMGtH6jGzmxfDr9JbwAmkTRabkiQCA6qNfOn
 WtXVQHFbqLRJSGy2X8ZuVCKaSb9lrzviYrwwhJCIou18ETfyGZbodAU8oEWIrBQoSLzO
 RMgPcFMipVjpgVOQdPd8RQoG0Tk9Y323zkVSu56L393053wO9FelQO7/CR0pyQVz6//v
 zt9i5Sp2Kgk6gklB7NDPkn8gPsC0N936Ay+P+dOUg8H8Xz2dqR0CwAE6PsM6ZDo0E4ie
 wzDA==
X-Gm-Message-State: AAQBX9ccCpLlvTaqDuG3GTtJolqOo6/YG+XZzW9I99MezT/HRJ6xkjc1
 R0N5QZ8wWlQo439ZYPAVFmLJ/gWLLAX8ClVC7+w=
X-Google-Smtp-Source: AKy350YpogAAxEPW6x29pNKZlzqZt0otmZk7D2BOkTJVY35PELwgv0CBIMw6cL144o+MbtekvTYxdQ==
X-Received: by 2002:a92:d3c7:0:b0:323:29d:6724 with SMTP id
 c7-20020a92d3c7000000b00323029d6724mr5161843ilh.31.1680730594281; 
 Wed, 05 Apr 2023 14:36:34 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 09/16] bsd-user: h2g_rusage
Date: Wed,  5 Apr 2023 15:36:05 -0600
Message-Id: <20230405213612.15942-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

Converts host's rusage to the guest's rusage.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-proc.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++
 bsd-user/meson.build |  1 +
 bsd-user/qemu-bsd.h  | 30 +++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 bsd-user/bsd-proc.c
 create mode 100644 bsd-user/qemu-bsd.h

diff --git a/bsd-user/bsd-proc.c b/bsd-user/bsd-proc.c
new file mode 100644
index 00000000000..e64eb958947
--- /dev/null
+++ b/bsd-user/bsd-proc.c
@@ -0,0 +1,48 @@
+/*
+ *  BSD process related system call helpers
+ *
+ *  Copyright (c) 2013-14 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+
+#include "qemu.h"
+#include "qemu-bsd.h"
+#include "signal-common.h"
+
+void h2g_rusage(const struct rusage *rusage,
+                struct target_freebsd_rusage *target_rusage)
+{
+    __put_user(rusage->ru_utime.tv_sec, &target_rusage->ru_utime.tv_sec);
+    __put_user(rusage->ru_utime.tv_usec, &target_rusage->ru_utime.tv_usec);
+
+    __put_user(rusage->ru_stime.tv_sec, &target_rusage->ru_stime.tv_sec);
+    __put_user(rusage->ru_stime.tv_usec, &target_rusage->ru_stime.tv_usec);
+
+    __put_user(rusage->ru_maxrss, &target_rusage->ru_maxrss);
+    __put_user(rusage->ru_idrss, &target_rusage->ru_idrss);
+    __put_user(rusage->ru_idrss, &target_rusage->ru_idrss);
+    __put_user(rusage->ru_isrss, &target_rusage->ru_isrss);
+    __put_user(rusage->ru_minflt, &target_rusage->ru_minflt);
+    __put_user(rusage->ru_majflt, &target_rusage->ru_majflt);
+    __put_user(rusage->ru_nswap, &target_rusage->ru_nswap);
+    __put_user(rusage->ru_inblock, &target_rusage->ru_inblock);
+    __put_user(rusage->ru_oublock, &target_rusage->ru_oublock);
+    __put_user(rusage->ru_msgsnd, &target_rusage->ru_msgsnd);
+    __put_user(rusage->ru_msgrcv, &target_rusage->ru_msgrcv);
+    __put_user(rusage->ru_nsignals, &target_rusage->ru_nsignals);
+    __put_user(rusage->ru_nvcsw, &target_rusage->ru_nvcsw);
+    __put_user(rusage->ru_nivcsw, &target_rusage->ru_nivcsw);
+}
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 5243122fc56..7d1b4de78b1 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -8,6 +8,7 @@ common_user_inc += include_directories('include')
 
 bsd_user_ss.add(files(
   'bsdload.c',
+  'bsd-proc.c',
   'elfload.c',
   'main.c',
   'mmap.c',
diff --git a/bsd-user/qemu-bsd.h b/bsd-user/qemu-bsd.h
new file mode 100644
index 00000000000..96e7f34b27c
--- /dev/null
+++ b/bsd-user/qemu-bsd.h
@@ -0,0 +1,30 @@
+/*
+ *  BSD conversion extern declarations
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_BSD_H
+#define QEMU_BSD_H
+
+#include <sys/types.h>
+#include <sys/resource.h>
+
+/* bsd-proc.c */
+void h2g_rusage(const struct rusage *rusage,
+        struct target_freebsd_rusage *target_rusage);
+
+#endif /* QEMU_BSD_H */
-- 
2.40.0


