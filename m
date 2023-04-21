Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE886EAF61
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:43:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptr0-0005DQ-B6; Fri, 21 Apr 2023 12:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqw-0005D9-Vu
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqv-000389-2O
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f18dacd392so10945525e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095395; x=1684687395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ka+zdK02+0LJUWtfpqNCyyWfl1iAa9xQ9iZg6niusK0=;
 b=Dn/q3flXxkhxGampPz9HIugBSLPTr9eE40DWi65516vfuahOaDaeySdELn3DZIQM7P
 8VEtW3J/r0kBGS85GKQH05mqkkMqADTPBGg7rVt/14VKMykewzyLg9k0l8VtUkqpECHd
 dBwDQaAl0UGxqUG/an2pG07+884EuvpjK/PVSEmLw/TvUN5nla/LKUaJT0RdkMIM7e3t
 qaTJS30RE2EJCGQXLBvtj8Y49TopM0T4/OiNy/Z7hkz6uTl7HEatscvfR1n4nRVS3WQG
 b0l4Bdi0kR4mQg0IFH0R5b7xEEHNIQFF7DdS2n56rgH54YhCsBBEEt3Ie/EnxNu2i8TT
 NczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095395; x=1684687395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ka+zdK02+0LJUWtfpqNCyyWfl1iAa9xQ9iZg6niusK0=;
 b=hRxCYuMAB0+Um4k0P9/Cxw/0YeVWAOaG6oxygnTnhF4NNRINiRJ201/zi69bC3oz6h
 bZFxLBMEIYqTmRQTN8RDpDpzx6SM/XoJPcC2yRRd6Fpko2VeFSyEX/eutinIPRXHKP9N
 pcERLxRAmFAuo+3HS0K1qbOqJiAsoFfpEAK0oWK8BQ3QdNPSwcPm1N1bo8EUyiwFHdXY
 GMk7kKP7oCUinfBrt3Kwh9GhyTE2bgBWcOjNNqqiGgE6+VGVJASC5lLK0eiftAqTqHm6
 MWcy/V/ykJJKoG9eRsSpAtghbSe3U+kHCFCLPpqsIp9BJNk3EkT4fnuueZJ/fzzsWHxN
 TWOA==
X-Gm-Message-State: AAQBX9cXlJdXCP9+/o1fYnXPuLc+Cc/fTbi/J4uD0t17oG7hcBFABWjk
 WdwEioiFPgQZ34N6pPRyT+Mi67YoKxc=
X-Google-Smtp-Source: AKy350apqFcx06fl3XYS8j2OMzBUoi8RSDoZBrKfzhzSem1dKiHays7fq2Vs8UH77sCeoikR2CYPYw==
X-Received: by 2002:a1c:ed01:0:b0:3f1:6eaf:daa7 with SMTP id
 l1-20020a1ced01000000b003f16eafdaa7mr2358311wmh.10.1682095395381; 
 Fri, 21 Apr 2023 09:43:15 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:14 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 07/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:56 +0200
Message-Id: <20230421164200.2913-8-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x333.google.com
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


