Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655FA6EA31B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:26:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjG3-0003YE-Ga; Fri, 21 Apr 2023 01:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFy-0003Xu-N1
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFx-0001gb-2H
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:24:26 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so8923205e9.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054663; x=1684646663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YH/ugZqn8d8y+RUg1s5V71LlD69QqkoEUEHtP4zYjyM=;
 b=ZDK7sV8gu/f5SohGJi0gok9cAPBWGmaf4ClVRRiilVryZ48hlzgM8NN8OBmOp3KmR5
 8wB1Gqt7ciJ51KXmd+DJDWsYpXS3j5fzRoYILOLdA5TNKLqxvy/+73PaFjUVzGkXSDqK
 GmevtxEYOolJiBniPC0aBSYJxLsOH7UaYXxH02jcATn6hBlTK8ZPhwUeo1j4Skccekb2
 lgXAUc2NXJZ8Qrq6rM84MxHkJG/iDzfHW/60C67+taPX7cmLFrfViZA5gKLcRIjUheaC
 24Q39gCQMS7VfkoDl9jQGNjJuGdIdQFdO68B1w3dq4OptF3bsAs1oo2xA+La3nPe41U0
 ku0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054663; x=1684646663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YH/ugZqn8d8y+RUg1s5V71LlD69QqkoEUEHtP4zYjyM=;
 b=K3L+hfPP4IQonEqD6JX9PP6jWK46bTGJUz2wbPskvf09/oIKa5JuauI7MYqRHVZzo1
 jjJSf5Ek9hLCYPUKEk/oMP1dkkBVu1Yo6LTBK74d8uF4INwXM7PippWpcseMvjxtFZDK
 /UDtwlI93YIV0hPnTuksdatRTnoN/lZLi/qRDPb9GRl4kS6ZZqgp61pd5RYFSNE68Xje
 2D0WOUhqmyA7TTMLJiYY91gyv3RGsZ+Fiiv5bcVdlh25j9t14TllPAx1Wm+sUf+GdKvV
 p15H0oANSThgLSCidHxivq6gqLvOceSpF6qW/MMQdXtjmwFmLpUKTcT0oGUAzXIkMDgl
 loEQ==
X-Gm-Message-State: AAQBX9e+lnyvkd4WvkVZA/qaRklhRyRzUa8gQs5TOdSAoVDEq3ZD0T9r
 PlXTEvPhMUdjwgxiMynAWXOG3sdTQEg=
X-Google-Smtp-Source: AKy350aYSauW3B96cnZiqTmAG/Mh0sJgxa09P7zhShwQXZdP5t0p/fNgfbEbCWWTKPMb9Bf+qBtWBA==
X-Received: by 2002:a7b:cb47:0:b0:3f0:7ddf:d8d8 with SMTP id
 v7-20020a7bcb47000000b003f07ddfd8d8mr809452wmj.18.1682054663386; 
 Thu, 20 Apr 2023 22:24:23 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:24:23 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 09/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 07:22:53 +0200
Message-Id: <20230421052255.5603-10-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421052255.5603-1-krm.taha@outlook.com>
References: <20230421052255.5603-1-krm.taha@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x32c.google.com
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

added the accept(2) syscall to bsd-user/bsd-socket.h.
---
 bsd-user/bsd-socket.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/bsd-user/bsd-socket.h b/bsd-user/bsd-socket.h
index f191f22d63..f748266730 100644
--- a/bsd-user/bsd-socket.h
+++ b/bsd-user/bsd-socket.h
@@ -79,4 +79,37 @@ static inline abi_long do_bsd_connect(int sockfd, abi_ulong target_addr,
     return get_errno(connect(sockfd, addr, addrlen));
 }
 
+/* accept(2) */
+static inline abi_long do_bsd_accept(int fd, abi_ulong target_addr,
+                                     abi_ulong target_addrlen_addr)
+{
+    socklen_t addrlen;
+    void *addr;
+    abi_long ret;
+
+    if (target_addr == 0) {
+        return get_errno(accept(fd, NULL, NULL));
+    }
+    /* return EINVAL if addrlen pointer is invalid */
+    if (get_user_u32(addrlen, target_addrlen_addr)) {
+        return -TARGET_EINVAL;
+    }
+    if ((int)addrlen < 0) {
+        return -TARGET_EINVAL;
+    }
+    if (!access_ok(VERIFY_WRITE, target_addr, addrlen)) {
+        return -TARGET_EINVAL;
+    }
+    addr = alloca(addrlen);
+
+    ret = get_errno(accept(fd, addr, &addrlen));
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


