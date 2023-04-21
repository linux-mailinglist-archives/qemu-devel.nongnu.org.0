Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4086EAF68
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptrA-0005jt-AT; Fri, 21 Apr 2023 12:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptr7-0005a8-UU
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptr6-0003DX-Ds
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:29 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1763ee85bso19888455e9.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095407; x=1684687407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBPVCIXYWbrgeZfGHUWLZM7K49/+jH+34j73GNoWcag=;
 b=bEnIq4v7aJ7w2S2r9mzv5eKqbPaA+rBGaeHNmdZet22qW8zYXzr4U0IBhlAtFAT06u
 od7osAXuKRPM927iYuXolOYrryKFFBe2xSGyq1F7d2b5p949dJ3zVDTTcaSXsI6QfCeU
 8D5IbuDE5dEZ3cIMEc2/phLJNA1+n4bEFQwwSHmPe9KRKjsrJitH3tkcVy9SWiTtOx8b
 Mk3w2TOdLqOAVtTleiTVLiTjmxfTM96PBgpUJkD8OQlcnFpHLQ/iVWqAC/qxJPKvy6Af
 i4Mo9VGlmt0VAquIo2RysyXEMyv9zacjhH/yolYf+ZGLfJDRfF8b79Cgh39pchGF6MWF
 +ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095407; x=1684687407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CBPVCIXYWbrgeZfGHUWLZM7K49/+jH+34j73GNoWcag=;
 b=C+xLy8FTIBllY2LeuiB8ZVdQqBPF400N2UbS9X4mziztpgrP5uL3vSA5tF1ovNuF+6
 acL14NvVMfAN8lg+a81emWErm8kqOOpR7P1ol2+c3jpX1Hh12LIDmLhsumUHcTA1pn4h
 +hC5XUprrzOcynz6l8MziKbTukOut6IzQis0CV2dX5geZSvrEorix7er7HT3vznCfzXI
 iWVAyscPx8rwZRpQ/c+HNcS/98Tn3gGMS3q1ytlYm3j3LBzAEjToGYQqc065y5V4j78X
 sBuHR8iYbtdm6DOjlJmGvVlOLxugmnJo7kk5tEGO9AeJ0t5v/PgEb2NpCyvzkrxcHQp0
 9IvA==
X-Gm-Message-State: AAQBX9fsGjaUERtu3ssS4hiUZn7NLrNZ7/wKLcvUAc3pWbx68+ZACMeW
 9EqH1EKvAIMJPOVyLjZttqX5uZM6YCk=
X-Google-Smtp-Source: AKy350bn99doHB4gYr99CmYzLAx1jMah/DSQpKd9/T8nwQN1paq29WaPHwaVg0EJWw/mFY8UHonrPg==
X-Received: by 2002:a05:600c:2297:b0:3f1:72ee:97b7 with SMTP id
 23-20020a05600c229700b003f172ee97b7mr2820846wmf.15.1682095406603; 
 Fri, 21 Apr 2023 09:43:26 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:26 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 10/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:59 +0200
Message-Id: <20230421164200.2913-11-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x332.google.com
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


