Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC06EAF67
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptr6-0005KY-6J; Fri, 21 Apr 2023 12:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptr4-0005EX-CH
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:26 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptr2-0003BL-P2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so5496855e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095403; x=1684687403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjrkwxvVPTvNWYJuB2LG+yltGr38S+xqYHTbaTmByUQ=;
 b=rBNpGf+ZtceNGHWotPCJhKFGOr82yIj2PD9jFGeaKb++Jo/JVnwh/ih0N1aKQMK05H
 5mqHICGINwocY5ahKfO70SNEP6LDntzsLBXH+Zx50ED/ya+70FGbnytgtWAZlHjn1pgq
 OLwrfYUBTb+DJX1vRLU34ITTgjNSpd6JPphN4/pS+AhizrLdtJh8FO4q2cW9jwWz2vTX
 YNvWgcbgIjMGhZWP9HXhTKSvls2KPcwt2NAv3uJj6eSKdhG5ft+PzB/OMlo4ZXaYBbi0
 yzzOWJlAn/JT8a/kXqpX0ceGrpRyYPiTuNcT+0Hl2pcDts9oMhvuPfh5rquu5ht+s3l5
 lhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095403; x=1684687403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjrkwxvVPTvNWYJuB2LG+yltGr38S+xqYHTbaTmByUQ=;
 b=fEIZvMFqD1WeQjw/f3tVfhDFUpNudGoEjfg86CQobGHDZvzJlqz03860Xerxw5J5cu
 /Bw4/J3sEoEoyfThpjQMYqcrxeLPuXWyqoWz92iosXF9FaOSzNZZE64ZCkzMfoY/fMUO
 GPysF8iIvn16KXwh4ermme99EgfUAAJ2adJBmw0mNTUsK426MQ9BEl1HfkxmDzoMNONM
 pEwqqkJxmDvbZvnUtst0Fc94UKsj+GJVGmga+jxJk2kWQrX+PXaOMavzP1KLX1aiGfIj
 m+9jnNE5Nqtn4VHOWunOq/rErAnX2efjrWI8znnDLs/iAxHQQo3ETo2u/mQ4aouuYcDV
 b4Tw==
X-Gm-Message-State: AAQBX9cjWBa8NpgRTA7qN8NgNFmDD8T2gq37REUCdP2VQ4EO1QBkzL6N
 B3V3p8eXzd+5Lk8E35VO8UoHGo+ePB8=
X-Google-Smtp-Source: AKy350Y7xs70qiQ5ZQjG+VN6vAvILEo8veKVUNvKUY7UCtppLVne4/9riqJzrMQ8UC1TRWZxsbFEyA==
X-Received: by 2002:adf:e886:0:b0:2f9:94ae:99f8 with SMTP id
 d6-20020adfe886000000b002f994ae99f8mr4976100wrm.14.1682095402837; 
 Fri, 21 Apr 2023 09:43:22 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:22 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 09/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:58 +0200
Message-Id: <20230421164200.2913-10-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x32f.google.com
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


