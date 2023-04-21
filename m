Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF9A6EA317
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:25:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFt-0003XA-Ry; Fri, 21 Apr 2023 01:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFr-0003WW-Gt
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFp-0001gC-St
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f17f31c258so13452625e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054656; x=1684646656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4m7PT4ZuPRAxKXjF/7GQHChZBQfvjxrsrwLhgY4egns=;
 b=GJtA1MKvdFZLaw1SdscRWlHtIa31O6NS/4BN2ZUzCY92Lazj8s6AyrE3QvA6T3qK2l
 vywFLZSg62hOx1S8IB6Lly7qDEy5OXp1C1K1MQK0/of4vS3lGCbZJgFJPcJrBik9a9XU
 hwpskL6yryJGMyeGLNToYj1tndA2bZCWnAUhcOZ6DfWwNQbGQqnVJrcT0YKi/vAkGMq3
 nmYAGh5Yt+++M1BGbEBRGdiR2LyGk46ImwBR0/Z3sJRslhau+Z1WWh2iILPllWFu6wi9
 OrA3iG2sLrcN33msLiM9XD1wQKSVjyxWwkCt7xu9IxjsNtcZ6PWzUZcHEgCAXS/YXewD
 xpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054656; x=1684646656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4m7PT4ZuPRAxKXjF/7GQHChZBQfvjxrsrwLhgY4egns=;
 b=d5H3kSTd880rZNEOG1v+bPvYpu/Uyr8q48wGLbERBlk6tvNbx+exSOVXWpPzvhywWV
 LOCCcT4OSvQ4EeL8zXzpfL/OPE7S9dB4K2TGSCdlcbyWyFiG4VJoAmRDhyaduo1ETsP/
 urDDeBZZLyvNonqwzKQMKNtADIyPqkxo06VIKtLyMGwezoBj0plwazUENq3oTt/g3VD6
 C3oI3SMPU3KKRRjermKvUlUcyy8uQ4fCs6OVO5hX74qJtt4JQOZ6koxbdvKVuTremDs/
 Ve68tDMa59C4DNLURgEWtK5nLIIf1GXmkRUGAIdXTpu5T8HvuZIqKDwaE8/JCxAu816c
 z9jw==
X-Gm-Message-State: AAQBX9eSkMk68Fq2IAKtHS2cOqJKEP/WahiOfyu829n9evRWo/nNtOnf
 8ZFJalKA/6hNkjCL6MovPTtOn21Rf9A=
X-Google-Smtp-Source: AKy350btqsBgBA98AUkpgM8ozsW/kU7yuQ3olk0vmSHtMEyFHOuLmNYzo1jjoOB/klI84RFwCw0y1w==
X-Received: by 2002:a7b:c5d8:0:b0:3f1:78d0:fc3f with SMTP id
 n24-20020a7bc5d8000000b003f178d0fc3fmr798246wmk.14.1682054656245; 
 Thu, 20 Apr 2023 22:24:16 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:15 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 07/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:51 +0200
Message-Id: <20230421052255.5603-8-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x330.google.com
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

added bsd-user/bsd-socket.h, which contains the implementation of the
socket related system call shims.
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


