Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E76EAFDD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:58:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu5P-0002A5-JM; Fri, 21 Apr 2023 12:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5M-00023k-A5
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5K-0005fL-Fu
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso13829865e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096288; x=1684688288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dnSBdinBNPeWEkWpdk8xI9fC4IlUhm4yibKAa6mite8=;
 b=fk2ux6Rnm5QJSPNQg0o+HZc/EyFiEg0N8xMQy/km6vzIqzNwL+mLad9yPbNsPcbBDV
 Ev7hE3ObQKm4xd9m7xSDRoW4YRyDCZoFZ+y7lud8HprkvlfiPLIrTOrU6p+ASmLNUvln
 ks+ksEN3Pie8yqIm5qKyX95zyywkGM/TJLQeaZn8gz6Bed9M0D4IRlZCqXh9bmRmhcrA
 BMOMuuKc1rQV/g9uPBwqhB8IFmONkPBWZB4XMG8xbf3oGQpYgNQ7Ud/gDqLfhswbXS53
 RXyll3twkLhD0djiDtyZmOZRZOvSUMrpm701S4SooUdx3oDBdRrhGTfKDenIFCQQrvxx
 z+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096288; x=1684688288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dnSBdinBNPeWEkWpdk8xI9fC4IlUhm4yibKAa6mite8=;
 b=KXdWi4gvPtIi4f6FgFxdk8REDMdDK785g7Bw9DO0E8CGE6Aw43dNZLij6L0uslo/y+
 CzOs0TT+l/0SXSWxR/pgaOaSYKRyG0cw5kp4sLlVqdiJo8k1hae4ZBGDaxUh8+R+tiPL
 IQSKq8LqpfMO75YLLS1GAePAMi5MH2tewGbQ/Jrhl/YnBNHjgvr8o6/bdtLaCzXZZeRh
 qf0RhcwVIGFHodhVlwN1SeIGXQQTP7hCwrcssaUioWh+UM0IXS/ME0K1d8sCUmCbjPR3
 M60qqZQplu6iW1i0Jr44tq9qGg7FA7uD2hyOSVZqtMwpOnQwpcddtQs7dOVjm49vag3p
 CCXw==
X-Gm-Message-State: AAQBX9c1aXXHomGrB+Xb1MxlaHv49SJWhRLnuOs/79cXjpqoYy/SE9+6
 dRK9+sFB5BSXuTsnixUmWganI4jkpgw=
X-Google-Smtp-Source: AKy350Z+nOpot13Z8mVBK/4aWUhrpj3ekywLeoEgS11vEl2pzVLOutRgMEhw76Bv8q6hoX0gP+XtlQ==
X-Received: by 2002:a7b:cb47:0:b0:3f0:7ddf:d8d8 with SMTP id
 v7-20020a7bcb47000000b003f07ddfd8d8mr2452764wmj.18.1682096288477; 
 Fri, 21 Apr 2023 09:58:08 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:58:08 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 09/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:49 +0200
Message-Id: <20230421165351.3177-10-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
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

accept(2) syscall.

Add the accept(2) syscall to bsd-user/bsd-socket.h.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
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


