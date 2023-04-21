Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDBE6EAFE6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:59:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu5I-0001WY-Ie; Fri, 21 Apr 2023 12:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5G-0001Ns-Rj
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu5F-0005cs-8B
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:58:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so1253744f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096284; x=1684688284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hv3wAaQ1pBv567pFZuHnhxoLD1mI+RDtrgVOuJEKu/c=;
 b=anwxmKljuL074MNbh7xlE5R4rc/WW8pt1MyxFn2v8274pfBzTAESf8WV/VTC4bO0Ev
 T8TrR+dHqL5ACSO9aGg0e/1ELvhLx0vjYKCvFWUwvdCErE5mQOwCzz9rdNgJVRIovu7X
 W8largAzVBOw2h1nEwfwWmwfShhkReL6sWhGpgPHLLAa5A4YQuZNL0Cge+sisUMK94Dt
 Pg7SlccX5uQaIpRoS/PW2jL3tVPrLt9gr9r28W15IuyFtfjpAWqxL8m01XHis7LYZNTx
 XlLUeG6naT2tQ8TuvwBJ1KVknPdgczJnZNuuPG+diouUq2+JQsY+yTQV+x4qtIvYpLWg
 Z8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096284; x=1684688284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hv3wAaQ1pBv567pFZuHnhxoLD1mI+RDtrgVOuJEKu/c=;
 b=HJzzfasGrwV5ztQ3w2hJle/ch+r0h+oeX0VdUx6nDHvmCstAkk8mGNu++6H1+Epz2o
 zHJQsTIHzcjwiWzmach8WB9ivoQsN8Y+TISMFVbmDsdkbyyo1Fc4nTa8bJHOpnEMMzdo
 ABxGJbJtuQ9kDZsYPg4CtYgreDQlZ7A0i7uMcj4nN932v82ONzAJnl1DACnZzHCc6cdk
 VeQ6kx/XivpOLIAVkSIkcbMsDe8fVoWIFY4GgUykYP0W5yBYYENwE1/QAXGaRbTN8DO+
 mMzsXX8rdsZ9yplPaPnm+xc/Ev8WhyrAWkQ0TygEdPxT40OPybsu55i+6tprxKVxTdRF
 4/+A==
X-Gm-Message-State: AAQBX9fHpW4u2Yc6FEKVws18yQznyTM3/Yg2sSESzl9ecdBhWN3z0+YV
 Y6WUs2tKlNUwKodXmAyOqXiUjeULjXE=
X-Google-Smtp-Source: AKy350aF6TGsqiVxeIv3qEf2rbk77GbarXoSiz2su8iXAr2wcSYF9RmjZIzdPlmkj9u8NB+Zk3zykg==
X-Received: by 2002:adf:d4c6:0:b0:2f4:adca:6f42 with SMTP id
 w6-20020adfd4c6000000b002f4adca6f42mr4468288wrk.21.1682096283914; 
 Fri, 21 Apr 2023 09:58:03 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5305000000b002cf1c435afcsm4820581wrv.11.2023.04.21.09.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:58:03 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v4 08/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:53:48 +0200
Message-Id: <20230421165351.3177-9-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
References: <20230421165351.3177-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x435.google.com
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

connect(2) syscall.

Add the connect(2) syscall to bsd-user/bsd-socket.h.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/bsd-socket.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/bsd-socket.h b/bsd-user/bsd-socket.h
index 7da4cf11a0..f191f22d63 100644
--- a/bsd-user/bsd-socket.h
+++ b/bsd-user/bsd-socket.h
@@ -58,4 +58,25 @@ static inline abi_long do_bsd_bind(int sockfd, abi_ulong target_addr,
     return get_errno(bind(sockfd, addr, addrlen));
 }
 
+/* connect(2) */
+static inline abi_long do_bsd_connect(int sockfd, abi_ulong target_addr,
+                                      socklen_t addrlen)
+{
+    abi_long ret;
+    void *addr;
+
+    if ((int)addrlen < 0) {
+        return -TARGET_EINVAL;
+    }
+    addr = alloca(addrlen + 1);
+
+    ret = target_to_host_sockaddr(addr, target_addr, addrlen);
+
+    if (is_error(ret)) {
+        return ret;
+    }
+
+    return get_errno(connect(sockfd, addr, addrlen));
+}
+
 #endif /* BSD_SOCKET_H */
-- 
2.40.0


