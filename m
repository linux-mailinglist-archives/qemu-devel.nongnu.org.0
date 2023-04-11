Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC90D6DE1FE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHWT-00046S-4m; Tue, 11 Apr 2023 13:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHW1-0003s9-Mp
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:45 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVx-00065u-Jr
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:45 -0400
Received: by mail-il1-x134.google.com with SMTP id r11so3643728ilb.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D7DJp0GbQImyWyKEIUh9x2kUxgeDF3XKS/nloxc2LmU=;
 b=OKfhnhVDIu+X+faiZqow0pF0PPnMPBvwVYU9n3U1UNuj6SP28A1xcswM4jaBLAqllK
 5xH7gOopLGrM8MpIvESpeTr5HV84UJSHhIcpwRk3trfFqfkwLf76WSDvsMTyXxxF2b/l
 RRJqZ9iJ0SPCJ2ByC247hwhTz8yLq0lmmhe/2Uy40BXSHQnfHn/ccNmA7sQu2OD88sSL
 +DOd/ADkL5ajNBb0oKU9JPBHMDgWpapuYofTcDC1FVLROLgqWqWGxUdhlYp7sszYDhfS
 BOZbegra96VvhS5q9PQiS/DmQc06FWkdLVyh/KPDbSTfwWFG4c9cyFnz0Ja7DVb1iPE1
 /sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D7DJp0GbQImyWyKEIUh9x2kUxgeDF3XKS/nloxc2LmU=;
 b=tSHNILTTskZOTICw9Hb6EvXrySx/rPpxKD6zjkw8Ar4bfWaCD8W9GML8rECC1cXbhC
 ctg6QbukXpbK1wAHq4jb1AAYInaT9T8NZArpQOzjpOSfg6ckXGMLYFUWS7MqrAH3R3uF
 qz0yigrST3EkMWaFB9vvRWuvncYYm6SkU7SJXj/WfjA0hICXf7+ZROiYQhcnQ8tesfcx
 XaFsa9JFUIKMAJX3qKSaS+IJ3R1MxXLNth47P0OsnvODVuGYFMLmH6NOM+fRP26qSJ9s
 UOsCVUioZJCkm0jHvUF9kQba/MhKBOI/choR8GbcQez/WDo6wydROqLLiICNU1eZ514n
 ij1g==
X-Gm-Message-State: AAQBX9d4dhlKsUMsQuTRmF16XZWUS6aKzsahnKhyu2wi5OFh9ARM23l+
 dXNac2btuw3x9DZgdIRV/mCBTswfzdHOnJ/0nW8=
X-Google-Smtp-Source: AKy350acmP5CMIzD+gOVZ2y5VlWWVrAJ2iXg/NMWB+q3el5WL5OtQp9ajIZvuaQpyLPxD7L/E5yrvQ==
X-Received: by 2002:a92:2905:0:b0:325:eb13:1049 with SMTP id
 l5-20020a922905000000b00325eb131049mr6505717ilg.1.1681233039761; 
 Tue, 11 Apr 2023 10:10:39 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 17/20] bsd-user: Remove host-os.h
Date: Tue, 11 Apr 2023 11:09:52 -0600
Message-Id: <20230411170955.17358-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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

It only defines the default system call scheme to use. However, that
feature was removed in a941a16f6f52.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/host-os.h | 25 -------------------------
 bsd-user/main.c            |  1 -
 bsd-user/netbsd/host-os.h  | 25 -------------------------
 bsd-user/openbsd/host-os.h | 25 -------------------------
 4 files changed, 76 deletions(-)
 delete mode 100644 bsd-user/freebsd/host-os.h
 delete mode 100644 bsd-user/netbsd/host-os.h
 delete mode 100644 bsd-user/openbsd/host-os.h

diff --git a/bsd-user/freebsd/host-os.h b/bsd-user/freebsd/host-os.h
deleted file mode 100644
index 40cae72ec9a..00000000000
--- a/bsd-user/freebsd/host-os.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- *  FreeBSD host dependent code and definitions
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HOST_OS_H
-#define HOST_OS_H
-
-#define HOST_DEFAULT_BSD_TYPE target_freebsd
-
-#endif /* HOST_OS_H */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 89f225dead2..ba23b74d679 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -46,7 +46,6 @@
 #include "qemu/guest-random.h"
 #include "gdbstub/user.h"
 
-#include "host-os.h"
 #include "target_arch_cpu.h"
 
 int singlestep;
diff --git a/bsd-user/netbsd/host-os.h b/bsd-user/netbsd/host-os.h
deleted file mode 100644
index 7c14b1ea780..00000000000
--- a/bsd-user/netbsd/host-os.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- *  NetBSD host dependent code and definitions
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HOST_OS_H
-#define HOST_OS_H
-
-#define HOST_DEFAULT_BSD_TYPE target_netbsd
-
-#endif /* HOST_OS_H */
diff --git a/bsd-user/openbsd/host-os.h b/bsd-user/openbsd/host-os.h
deleted file mode 100644
index b9222335d46..00000000000
--- a/bsd-user/openbsd/host-os.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/*
- *  OpenBSD host dependent code and definitions
- *
- *  Copyright (c) 2013 Stacey D. Son
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef HOST_OS_H
-#define HOST_OS_H
-
-#define HOST_DEFAULT_BSD_TYPE target_openbsd
-
-#endif /* HOST_OS_H */
-- 
2.40.0


