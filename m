Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D76EAFE9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:59:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu5Z-0002VA-Sw; Fri, 21 Apr 2023 12:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5R-0002IN-J6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5Q-0005fc-2x
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso1252729f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096294; x=1684688294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fymimzdBi9M59n3ZM9BR6BqfXHZcY30jttS/mKajjfM=;
 b=X+8dVlBEZroOvtk3xlur9xgpPJ19UTVsVxQAoMBkqTT9dYAlhA/SHoQzwzTwpNCKxF
 1zicVvziwGmLWXEGQKtYdZO4sS2aWKb07n9zLexMYJNW//0JstW+TprcXLaZFEy53AzE
 lMcElI9PNQN8mKppXT3SrKHagmu84WImA8aeJWhwJvFDz1dAEAaQo9DbcbHsi2kONzE8
 pgqb1ibx5jmSlk/oClNIbWmjpEwCQi1y1tkOUzuZyClR4IU7JjZ1Kq/a0frtVpRSXEoA
 5GMn5XWG5R4eetkf/Wv68jAStnnU1R14YWQS2+P9xGWdW9UCOb3lOUrqDNGLb12S95o0
 kc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096294; x=1684688294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fymimzdBi9M59n3ZM9BR6BqfXHZcY30jttS/mKajjfM=;
 b=KEMML5H005kT//nkN8UpksUcJIk69apmiLRdQVEOBRPvXegzn3DU3cUhEfNd5o9tf8
 HVkZeTw0wA41vUO8HW5/MBxFpatqzlkFJGBStM3zzHs7ozbSvmH3PPESXce0WR16a8ts
 rWDebxPPjfNAjJI/3eIyyWUhU5pCiwpdsjn7bhI0Tm/QAUyWxxbgOUxUkK4yZj0oJYvr
 X5/0te3jmYLJOINJXfivnb+5yYiW9IaMqXDbNRbmsX5fstxk3mvPl6RrzvFPcpTVg5xc
 QK0a0XW1PfCaODiRgQJHFvfIRNUr+mEgOQ8Bsk+tTW8d7Gf7ijbn3qKSOm4Ve/TdVpBP
 jGMw==
X-Gm-Message-State: AAQBX9fNZ6rX47U3S6V63qMoqWLjlX0AzTNeTjZeHY2QYFlB/wd5fMXh
 i9EEAf6YpQCziuuKxo4N1DChii8YOAU=
X-Google-Smtp-Source: AKy350ZFuH7HTusBYeXBq/HeA0yEumyVtNt7Ixmec2DFhtSzUHAu5Anmyooz20s7735cIg0X+xsdUg==
X-Received: by 2002:a5d:6591:0:b0:2fb:1a68:1d96 with SMTP id
 q17-20020a5d6591000000b002fb1a681d96mr4108926wru.15.1682096294127; 
 Fri, 21 Apr 2023 09:58:14 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:58:13 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 10/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:50 +0200
Message-Id: <20230421165351.3177-11-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x42c.google.com
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

getpeername(2) syscall.

Add the getpeername(2) syscall to bsd-user/bsd-socket.h.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
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


