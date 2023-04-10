Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F38D6DCAB9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:24:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8y-0002kt-SU; Mon, 10 Apr 2023 14:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8i-0002fX-NM
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:18 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8g-0000hc-UG
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:16 -0400
Received: by mail-il1-x132.google.com with SMTP id q5so20737780ilg.12
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuaGwqi8yehJHqn9QWm7paJs7txwchU6M9DMK57E1Ps=;
 b=7BBX4x/IqbBRPJ4LdT2ciWK+1eP8rtvXz4CJo4WSdM3QBpH0Yg5VQFNeR22rQXd9u4
 eHLHVEKVkJce2XI8byFujTBk6HpA7GRItvsnT4YsuhhGj8QQ45j2YnzbKbNvClJEXIBi
 XIH3PMWobWFVNp+U3euNjQ0HHZeQIIdGFLbn4Vlt1vITj3fG5lcfrmgODAry4bKogMKk
 Sz6b1LqXdwLRzCF3uRuWxbXDeGDqHPSPmmcU1onhcLn11er6AOsRJb3RM+SuF8G0QZVz
 dr6rvC/JjZc5gK3GHfF5JY7YqgAmIIKLpWoHOxAPp/1JAkKJqaTHrc5ZroRQCsJ0mzEA
 yumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuaGwqi8yehJHqn9QWm7paJs7txwchU6M9DMK57E1Ps=;
 b=5e9zXAyVa5yeeqItXWD2uvLYWpt+9vnbyHCaKEhwW3yrxYzOMvZmI6EWxMQXtvnhRr
 vARQF3DApFcOSo200e2pZ8XaILAB87QJDgM6Ose5hwyzx1hduLyRcvHxJrW+LGxGJBVe
 So3I37pzDq0ExPPIrhmFtZJvHO9V7Dk0gmZdvPDVM0sU81nzW9nvr4PRrdyZAGNMQHa6
 LD2LZa7nvJrCtTQFQivsaQjYx3cg2avX6aQZYogJ3i+bFXSOd5f/axTqtlEIWUK3EfBQ
 vL0OdxwffF038NdI8HA5TbLf6euBSFc3SfIdJZcQMldVa0tsUm660XXwcUxcnrWI9WvU
 wVwg==
X-Gm-Message-State: AAQBX9cHwi+IDMZ/XYwEARNe23k0HwFQyPUjB9cX0yViT6zSt1Gy7NqD
 ZkA/1aqbmOJu+oYdx1ciEew9LJ1rKCLCnd12gek=
X-Google-Smtp-Source: AKy350ZhXy/LAhKvWzQgmVMWZG3Cc6ulJEmw8qjeY7W798m/saPos3QqFWQim+g3liSzNrFr+/37AA==
X-Received: by 2002:a92:c692:0:b0:326:6d28:94be with SMTP id
 o18-20020a92c692000000b003266d2894bemr3908670ilg.12.1681150873359; 
 Mon, 10 Apr 2023 11:21:13 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:13 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 09/19] bsd-user: h2g_rusage
Date: Mon, 10 Apr 2023 12:20:46 -0600
Message-Id: <20230410182056.320-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


