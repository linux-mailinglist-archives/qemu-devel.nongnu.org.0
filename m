Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B76EAF6F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptqs-0005C5-Et; Fri, 21 Apr 2023 12:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqr-0005Bs-DK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:13 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqo-00037O-KK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f191c1a8a7so6511295e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095389; x=1684687389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ygsSYmAgHgY0D/4bVUo73Ymnd1PXTOqmTYyxkwj2FwY=;
 b=j2nnpG8RBudCNn8BVtT9x8w5F2sR3Igo60aN5ZMkhX/ObybjVg/SZsSnjHRpuyTUWI
 jjw66IBxLr25v4cM3jYI7kyqKiFJKPLXA4PVaMgI0WeYkHCzoA/vbySn678VBhuueaFX
 Fd9kuc1lDJgpouXFYkzxLIVEwmXiVsZxzHusen4QxaZ5n3I2YseihMaCnBbAc8UrYpgH
 swCeTw2pm4gWtFybj4ZMzLYzTzxoF2KHyu5gfH3MjI3nKFFFgc2aLnKuHynmiOLi/FPN
 4GZqDSp0U0nxEUthe+vS/I2nltkdVODfDDBs9oDq2ZH6XECDWGbvTuGZy9Lx7wqgOIWV
 R8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095389; x=1684687389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ygsSYmAgHgY0D/4bVUo73Ymnd1PXTOqmTYyxkwj2FwY=;
 b=Pymf9salD8PeCYJPcyPyJ+C3r+Zu4jMPP1zzzHsLIY61qPZzzaxx1u1r48fOJEaQ83
 zLZpNjRThH8BapkT4PIOffWDOScQjpO0WPHF6fN3E08rHsmTv79OwbFiQw6YrAUo/62w
 5rYNoFjD6ulBX4KVsxuGxg+Y3oeqBN3vEUxy2JGuGYehFogzUCZTYtPnr99pys5tBnxA
 gJjDETsMovMF/lS0EViQurDvwh526LPFV8yXTdTK7xOh0BRQ92H1jOe0l/cITeuU961w
 XI5EpH/Y41VKsTZNddIcIXExvor13oL5/KMGgajNuRGz1WMq+Esnm3jl97pdqLSpZYm4
 Tcrw==
X-Gm-Message-State: AAQBX9f9TIDI76U1pWnm2Ze+MX5sS58qZ+FrqvzzYz/VqQh7zvsIEhtm
 qx6LOgO0faAn3gAd1jGziutLXi2NAs8=
X-Google-Smtp-Source: AKy350Y5v8TUJk0Uhttmy95dIk/9UnpK2+cjb2g3gnf+8yz5GQr4jCdIOX3ivACdOz+vhqSGjT0dnw==
X-Received: by 2002:a1c:f703:0:b0:3ef:6b97:f0c3 with SMTP id
 v3-20020a1cf703000000b003ef6b97f0c3mr2650829wmh.15.1682095388845; 
 Fri, 21 Apr 2023 09:43:08 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:08 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 05/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:54 +0200
Message-Id: <20230421164200.2913-6-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

Definitions of the socket conversion functions.

Add bsd-user/bsd-socket.c, which contains the actual definitions of the
socket conversion functions.

Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/bsd-socket.c | 108 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 bsd-user/bsd-socket.c

diff --git a/bsd-user/bsd-socket.c b/bsd-user/bsd-socket.c
new file mode 100644
index 0000000000..8a5e44444d
--- /dev/null
+++ b/bsd-user/bsd-socket.c
@@ -0,0 +1,108 @@
+/*
+ *  BSD socket system call related helpers
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
+#include "qemu/osdep.h"
+
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <netinet/in.h>
+
+#include "qemu.h"
+#include "qemu-bsd.h"
+
+/*
+ * socket conversion
+ */
+abi_long target_to_host_sockaddr(struct sockaddr *addr, abi_ulong target_addr,
+                                 socklen_t len)
+{
+    const socklen_t unix_maxlen = sizeof(struct sockaddr_un);
+    sa_family_t sa_family;
+    struct target_sockaddr *target_saddr;
+
+    target_saddr = lock_user(VERIFY_READ, target_addr, len, 1);
+    if (target_saddr == 0) {
+        return -TARGET_EFAULT;
+    }
+
+    sa_family = target_saddr->sa_family;
+
+    /*
+     * Oops. The caller might send a incomplete sun_path; sun_path
+     * must be terminated by \0 (see the manual page), but unfortunately
+     * it is quite common to specify sockaddr_un length as
+     * "strlen(x->sun_path)" while it should be "strlen(...) + 1". We will
+     * fix that here if needed.
+     */
+    if (target_saddr->sa_family == AF_UNIX) {
+        if (len < unix_maxlen && len > 0) {
+            char *cp = (char *)target_saddr;
+
+            if (cp[len - 1] && !cp[len]) {
+                len++;
+            }
+        }
+        if (len > unix_maxlen) {
+            len = unix_maxlen;
+        }
+    }
+
+    memcpy(addr, target_saddr, len);
+    addr->sa_family = sa_family;        /* type uint8_t */
+    addr->sa_len = target_saddr->sa_len;    /* type uint8_t */
+    unlock_user(target_saddr, target_addr, 0);
+
+    return 0;
+}
+
+abi_long host_to_target_sockaddr(abi_ulong target_addr, struct sockaddr *addr,
+                                 socklen_t len)
+{
+    struct target_sockaddr *target_saddr;
+
+    target_saddr = lock_user(VERIFY_WRITE, target_addr, len, 0);
+    if (target_saddr == 0) {
+        return -TARGET_EFAULT;
+    }
+    memcpy(target_saddr, addr, len);
+    target_saddr->sa_family = addr->sa_family;  /* type uint8_t */
+    target_saddr->sa_len = addr->sa_len;        /* type uint8_t */
+    unlock_user(target_saddr, target_addr, len);
+
+    return 0;
+}
+
+abi_long target_to_host_ip_mreq(struct ip_mreqn *mreqn, abi_ulong target_addr,
+                                socklen_t len)
+{
+    struct target_ip_mreqn *target_smreqn;
+
+    target_smreqn = lock_user(VERIFY_READ, target_addr, len, 1);
+    if (target_smreqn == 0) {
+        return -TARGET_EFAULT;
+    }
+    mreqn->imr_multiaddr.s_addr = target_smreqn->imr_multiaddr.s_addr;
+    mreqn->imr_address.s_addr = target_smreqn->imr_address.s_addr;
+    if (len == sizeof(struct target_ip_mreqn)) {
+        mreqn->imr_ifindex = tswapal(target_smreqn->imr_ifindex);
+    }
+    unlock_user(target_smreqn, target_addr, 0);
+
+    return 0;
+}
-- 
2.40.0


