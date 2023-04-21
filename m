Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D186EAFE0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:58:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu52-00011t-2T; Fri, 21 Apr 2023 12:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu50-000108-0m
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:50 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4y-0005YI-Em
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso1266573f8f.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096266; x=1684688266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADcjkaFOtQafvRvF3uyKq3JB177Jsg04HoRFehYZ+uo=;
 b=cf1wBYMcaFuOD9ZjrRbEFcqaTxRX3JMN3G96zoI21DQbJMpXE06Uf9gRTmMBiqRYMP
 ZR+lhjnf/JhDjOWkTgPo+5rGfQqnWxZ7IJDkhMcrk0icQNoIirxmtgzKRYqDahKwZbp+
 nEuOLEUzLkYcbTzux+sM7pJyG1E4zb3dy5ZQz8SBjWwusBU9NOYyqqf9+Rh3vutTZt79
 vAhzj5BxWcBMZFVYzNX2SB/1NhazZscgpGhwBMUAnkitLBDxbNasB0v/22XFlU9px541
 U8uRKQeQhSfCK8CJI9AmFZ1rJD3JRS3taybAqonxMXhm54Nbnrt3isxbwoPnPYmrwmZx
 1oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096266; x=1684688266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADcjkaFOtQafvRvF3uyKq3JB177Jsg04HoRFehYZ+uo=;
 b=hlNHDQSRRtxrR6wCRuwUESZiSFLMQ8LSqsI7kg776HjL33bj5OnYIRrckDtYRaxsEc
 MtKh9sICbWjf8k4BhEjfKrBDdZMSlUtnQS6HHXLaaw9O/oD+MK54uL9w9LFn5Xd6/zTi
 Rb90Gd5pQDLLkICEFEnluEh3hFvLOKvGUpHe6Kj7x8LmHx/0OdEDPXHIo3u26Z72i9bP
 mr2i8bfiFdyd2RorgDLW4k45tkG/Ksp4LS93aSqwwftihhBzVs00+MKcVlWvZ5W/ilNg
 cYNXvsZEjYdxEBbk38f+FoL/N/wK5L8WNHE5StX00DplLYzRuHVZZXbuW1P7OOzMnjcr
 JKOg==
X-Gm-Message-State: AAQBX9eEszqRX7YJ6yHStl4Ff0xhAY1UDmluAwlegGBisy3IEjTHTHej
 KoxdUCNcSSlrAoaw1LcURX6SZHHGYqI=
X-Google-Smtp-Source: AKy350Zok/D/z7yFTfto8gijmm4QH3XN8tBSupRtOU7NHhyvd1+uHPTdXpdz2QTTwdZxxGFstFhf1w==
X-Received: by 2002:adf:dd85:0:b0:2ee:fc1b:b7ba with SMTP id
 x5-20020adfdd85000000b002eefc1bb7bamr4209416wrl.39.1682096266164; 
 Fri, 21 Apr 2023 09:57:46 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:57:45 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 04/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:44 +0200
Message-Id: <20230421165351.3177-5-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x42b.google.com
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

Declaration of the socket conversion functions.

Add bsd-user/qemu-bsd.h, required by bsd-user/bsd-socket.h, contains
forward declarations of the socket conversion functions defined in bsd-user/bsd-socket.c.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/qemu-bsd.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 bsd-user/qemu-bsd.h

diff --git a/bsd-user/qemu-bsd.h b/bsd-user/qemu-bsd.h
new file mode 100644
index 0000000000..a052688596
--- /dev/null
+++ b/bsd-user/qemu-bsd.h
@@ -0,0 +1,36 @@
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
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <netinet/in.h>
+
+/* bsd-socket.c */
+abi_long target_to_host_sockaddr(struct sockaddr *addr, abi_ulong target_addr,
+        socklen_t len);
+abi_long host_to_target_sockaddr(abi_ulong target_addr, struct sockaddr *addr,
+        socklen_t len);
+abi_long target_to_host_ip_mreq(struct ip_mreqn *mreqn, abi_ulong target_addr,
+        socklen_t len);
+
+#endif /* QEMU_BSD_H */
-- 
2.40.0


