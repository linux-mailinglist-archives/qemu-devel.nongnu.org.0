Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677136EA31C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:27:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjG7-0003Yd-0f; Fri, 21 Apr 2023 01:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjG4-0003YU-J7
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjG3-0001gq-3m
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso37096645e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054669; x=1684646669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8odjqiUmMDyKD5d4YpGgFdv+ZkkxzXOdcZ/AIVHgPew=;
 b=JCIQx6CuE+ROcACjUp9DOuqPz9IwnuukPxqB7Zt4Vum9IPC014ooG13j8rB0+2aLtX
 XWwHEieZ5uGgfk+sufmvLjK98i0Awgy1chQFHtH68Dli9WRk636YcNVVs5pM3qBBmnpj
 qatFh1ga0S9gpVdTrl8J2gWHexce/+7iVcDTdhvFYIf6rmnWLy7vHonR6KAXt4JjSm07
 NLbAHIJePCWlJI3z8SyO60BejXY4i0Oji7AXy/N4gQy7nBLuEPX8P783bRaIKx2ym5zV
 1AyAvMCU3nVDrPHUIyzGyGLUdIXcHPqDzHyd5MbyHL6tAlypwYkv4Jg1aUZfIEsurf2M
 aYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054669; x=1684646669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8odjqiUmMDyKD5d4YpGgFdv+ZkkxzXOdcZ/AIVHgPew=;
 b=BuZh0tSRS2bIZB9sI3JA1LFGAx/60wNSyzJB24PQKJ3j+yNFgKsMO0EEqGkhwiOIet
 qvAworumrg4JtorUZRFFoHj0eF/oUW8pQAB8spKGlJs6fsv2D0LJDbcOgZSjNIsyOt4a
 xCgun16+7wl9XTVx2Z/q2MSOAhmK+dJrnl5Y9Nr3YqX63MbCPYhI8VD6MhuvvLyQ4y6G
 wc68R7FMqJCypbAz9p1BmBvX2j3rdfldlEUMN4FU9N6Uh4ER4HRsqUv5IVfgCni5JF2b
 MXEv0lRlNFXjW76RfCyCNYLQfXzIct5POHafZMYoG9lHIduv4H9TtXPgL+tya364LZ73
 5MmQ==
X-Gm-Message-State: AAQBX9cAU895HrZDlot1VN0YGBt4D70MhOaucmo+J5USO6TrZyeODPB2
 cD/R5x8K3OoIrZpNnj7l1NqK+tq7DZM=
X-Google-Smtp-Source: AKy350b5oFPAOcFfRUWTh4Xe5F1uMRzlHtGaPXK8hYPg9iqzTavx7PW3M3C8+LBGxC7ZS8IpTzaBpw==
X-Received: by 2002:adf:e749:0:b0:2fa:88d3:f8b8 with SMTP id
 c9-20020adfe749000000b002fa88d3f8b8mr6384080wrn.12.1682054669397; 
 Thu, 20 Apr 2023 22:24:29 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:28 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 10/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:54 +0200
Message-Id: <20230421052255.5603-11-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x329.google.com
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

added the getpeername(2) syscall to bsd-user/bsd-socket.h.
---
 bsd-user/bsd-socket.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/bsd-user/bsd-socket.h b/bsd-user/bsd-socket.h
index f748266730..16fae3752a 100644
--- a/bsd-user/bsd-socket.h
+++ b/bsd-user/bsd-socket.h
@@ -112,4 +112,32 @@ static inline abi_long do_bsd_accept(int fd, abi_ulong target_addr,
     return ret;
 }
 
+/* getpeername(2) */
+static inline abi_long do_bsd_getpeername(int fd, abi_ulong target_addr,
+                                          abi_ulong target_addrlen_addr)
+{
+    socklen_t addrlen;
+    void *addr;
+    abi_long ret;
+
+    if (get_user_u32(addrlen, target_addrlen_addr)) {
+        return -TARGET_EFAULT;
+    }
+    if ((int)addrlen < 0) {
+        return -TARGET_EINVAL;
+    }
+    if (!access_ok(VERIFY_WRITE, target_addr, addrlen)) {
+        return -TARGET_EFAULT;
+    }
+    addr = alloca(addrlen);
+    ret = get_errno(getpeername(fd, addr, &addrlen));
+    if (!is_error(ret)) {
+        host_to_target_sockaddr(target_addr, addr, addrlen);
+        if (put_user_u32(addrlen, target_addrlen_addr)) {
+            ret = -TARGET_EFAULT;
+        }
+    }
+    return ret;
+}
+
 #endif /* BSD_SOCKET_H */
-- 
2.40.0


