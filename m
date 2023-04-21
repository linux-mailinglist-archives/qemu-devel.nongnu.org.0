Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE41B6EAFEA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:59:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu54-00013z-Mi; Fri, 21 Apr 2023 12:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu53-000139-DZ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu51-0005Za-Lb
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3010889c6ebso1227163f8f.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096270; x=1684688270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8Ql/vEC3g+/z+QruUvVbxZ03TW0PYGQUSqXGsOmEVM=;
 b=Jj0teoDZeKBOpIgMq83gkV6c5gWo3SbtCusOmW5a9Sk+DriDOWsNkC7ldaezh/u9pL
 Qe9FxvwC6v+dyAaMKf6iA/4L24yl27xi8GcXKzbNzL1d+r7EYrFvA/GiL538z7K1T1dX
 Ae4Bn8RKErz1Fh03xhpr84Q9ouDojOmWxLAkg82qdhYQCT+hOy4cV/DcVF33A4eNWWXQ
 HzRBDfivbq/zVrfiDh7a9Xzjg9r9RabH0l0woeA8TXFgRkDZS5MUA23UFREXvjv/51tw
 YEz2+KFBv7LD1bpNBeVzW8iQArGi+Q1c53FkAkATu3waYjaK+CpFzZmaZhF/+XhJrfE3
 eHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096270; x=1684688270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8Ql/vEC3g+/z+QruUvVbxZ03TW0PYGQUSqXGsOmEVM=;
 b=HaiV7x/yMf0lj8X7AMoVglWTCf4yOYmnXS5jC6gVsA1XoatFtuiY/qMCpZNBgQJxyq
 gWb4l+rXiHHgX4I57/7pQwzFm2MBRPMIEkOeBmjYdNAbkIR4a5qNYoAw/8zOm64+43KL
 Db/TqHmJQ5cEfykXGmJ52x3LSkpfFXoGxhHMj/y0ikA0WXd/cgD6vucdLE1HrJehMqqe
 34Gikyu3nlVGq261QBTwEf+lhwOIFZ8++RSRTyP3yZGgNUwNqMJJdtZJEhHBGdxvoDTE
 Wpd54iEfSvZy9xCgRVcERazw1QihVeP3OgVoQotmdXgki1j12PJVFOBkK+u6xyhYI5vp
 gXrQ==
X-Gm-Message-State: AAQBX9fV5hPZTvfMgXIbLLWiTolH8HfpUkXVuEQ6LpqVMdnfgr2Xccog
 R1SXmIkc5rOIQrw6M4jzqsIlKVRsIcA=
X-Google-Smtp-Source: AKy350YTEdQX0dcbt6NvoZeBg/thkTX99OcwP6XM6UmdMR20XLlTx5vJ+zGkLB2BfJg8lyrgC24PBw==
X-Received: by 2002:adf:f391:0:b0:2f6:ece3:76a with SMTP id
 m17-20020adff391000000b002f6ece3076amr4169967wro.8.1682096269987; 
 Fri, 21 Apr 2023 09:57:49 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:57:49 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 05/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:45 +0200
Message-Id: <20230421165351.3177-6-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x429.google.com
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

Signed-off-by: Stacey Son <sson@FreeBSD.org>
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


