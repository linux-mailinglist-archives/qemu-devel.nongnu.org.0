Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 649786EAFDF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:58:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu5B-0001DU-S7; Fri, 21 Apr 2023 12:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5A-0001AK-GC
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu58-0005VK-UB
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so1276037f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096278; x=1684688278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sVGhZKgrGX1OHfLrvfbz4p0F2qESpc+JN5HZGbSCpUg=;
 b=F6GIid8uix/6qrrhnZguaiulVa90zP42T5kMgQOY22pfXiRSIsWxlIv1yA3QgC9IIK
 ZCXBaJbL0+xNg9G0Gjk8TalnJ5FWO5jANmL9ryPF+t68LTit32PYum4km9m0Xg1pa1Yd
 7s3TCGqfwvSHk8p58T6IbQnri+qep57772+ueUlGGtTAWwjWlWZSQnwmMBDvK+Lvy1Zn
 PnEUBNdYaFPy2qpePH2PfmLf+qVe7+H9f4DgQxMvPw5olkvwgSUpDZDC66Rg2wYbN5bB
 ipVI0HhAUnxRRJ0di2qG5oA7qN2IyubvwuqNHSTJmdkksTnpJKRvZp311kT6SpbHLDYn
 EbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096278; x=1684688278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sVGhZKgrGX1OHfLrvfbz4p0F2qESpc+JN5HZGbSCpUg=;
 b=FXbk8pCs1hMUo5J+tZYjurvrNl9SNh2V8LXYY2mHj83mVgRrossNpfhKQpOqBtWD1J
 oHAFRzraR4WCikbaanIkEcxKCKHALeztN/ghia8eki+lPOmEW8B7MiVtiFfOc4VIMRHX
 UnAHulQzPDUp17e2QA36ou08QM6Dh58ekm+QaXd25vpYkaaKB/xFw+InxIi8CqgQ7I5a
 mDrtnntzirUaRZ66Yvw8Dw4Bc9QweIgnn5qLpPd0TYD5QLOKFCPix9G97zUycgznMS2h
 mUMF0BlOaEs7sSnW99M6Or/643X7RWhKLuy6ZRarpgT7huvkTB8+iPm1RXCPTD6YwFpo
 rWMA==
X-Gm-Message-State: AAQBX9fYSFM6NWnaW2Y+WZvDe+1NCmpJa3SmPRF8Xtq6QTnYUErF4YPM
 mIWBaBsd9rzRbuVDNZyb8L2ftu0wUIA=
X-Google-Smtp-Source: AKy350bK3pVMGG23FC2y4c+yV2CIbXHk4vOUNLtErktRxOBkjFdJfqOq0dFVgz1Tynyf5E+4u+CcWA==
X-Received: by 2002:adf:f209:0:b0:2d5:39d:514f with SMTP id
 p9-20020adff209000000b002d5039d514fmr4750054wro.65.1682096277921; 
 Fri, 21 Apr 2023 09:57:57 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:57:57 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 07/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:47 +0200
Message-Id: <20230421165351.3177-8-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x434.google.com
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

The implementation of bind(2) syscall and socket related syscalls.

Add bsd-user/bsd-socket.h, which contains the implementation of
bind(2), and the socket related system call shims.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/bsd-socket.h | 61 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 bsd-user/bsd-socket.h

diff --git a/bsd-user/bsd-socket.h b/bsd-user/bsd-socket.h
new file mode 100644
index 0000000000..7da4cf11a0
--- /dev/null
+++ b/bsd-user/bsd-socket.h
@@ -0,0 +1,61 @@
+/*
+ *  socket related system call shims
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
+#ifndef BSD_SOCKET_H
+#define BSD_SOCKET_H
+
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <netinet/in.h>
+
+#include "qemu-bsd.h"
+
+ssize_t safe_recvfrom(int s, void *buf, size_t len, int flags,
+    struct sockaddr *restrict from, socklen_t *restrict fromlen);
+ssize_t safe_sendto(int s, const void *buf, size_t len, int flags,
+    const struct sockaddr *to, socklen_t tolen);
+int safe_select(int nfds, fd_set *readfs, fd_set *writefds, fd_set *exceptfds,
+    struct timeval *timeout);
+int safe_pselect(int nfds, fd_set *restrict readfds,
+    fd_set *restrict writefds, fd_set *restrict exceptfds,
+    const struct timespec *restrict timeout,
+    const sigset_t *restrict newsigmask);
+
+/* bind(2) */
+static inline abi_long do_bsd_bind(int sockfd, abi_ulong target_addr,
+                                   socklen_t addrlen)
+{
+    abi_long ret;
+    void *addr;
+
+    if ((int)addrlen < 0) {
+        return -TARGET_EINVAL;
+    }
+
+    addr = alloca(addrlen + 1);
+    ret = target_to_host_sockaddr(addr, target_addr, addrlen);
+    if (is_error(ret)) {
+        return ret;
+    }
+
+    return get_errno(bind(sockfd, addr, addrlen));
+}
+
+#endif /* BSD_SOCKET_H */
-- 
2.40.0


