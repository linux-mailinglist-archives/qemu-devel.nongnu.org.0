Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B446EAF6C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptrG-0005vo-0R; Fri, 21 Apr 2023 12:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptrB-0005oJ-RG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqy-00038H-QS
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso13361655e9.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095398; x=1684687398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvz6pathaKo/xWUwUfShy8GpfzHorlNtVrON5T3eHBA=;
 b=gnsag7hHD5wWrs6w+MOqPOlSc818obux+TgWKGAVZhHqJ9K35ElBjcBeHW2YRLUANa
 1p0SlBDiRLWWEWi/QD2Qp5fXnDdOp59mFy5WG3ZfDyhUWCEFHKTpKQUZO53Ef0jSLfIw
 WmGNukVu+NoCMDz0XgHh6Ea9Dcv9iSVn3nRiPhaxbK66Ah8CCm6+PutPGo/MbOzlKDAT
 HTebYKYVirFrdzp0Gx6W8syskqM1EF3T2LPu1b1rwPEc1Kfo1lyVx06FZ/gqRdRkvrKm
 RwMKns3mC7eIRZYBqKom5l1EgsXGkSUO/gd5lW0puKD6RvsG5vByFllnssklk1W/rVjg
 z6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095398; x=1684687398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvz6pathaKo/xWUwUfShy8GpfzHorlNtVrON5T3eHBA=;
 b=Jgh3XSSCUoM5gn9WRQgGMf3auWTPxJ0e9Uww143cvM4wll057FULkE9xAuKiB2FQni
 LHD1AQwfEIpKCc4GZ0KiP4YkM+yvWVvdtkGxTAnh80DKG4kswDcVx4+U1ntOMubLHD2T
 yLJpeMwlcRK83e1JCTOasnYtqtTDXkUNXdiGTM842gmTAGc9ygGfZUjLQ1S4OzaPE1/Y
 zvv1zpiQJ4173GFy235+19J/kTYqLQ2YS2js4nO57qBFralEtIbiBbz0QTn5Wp0r+zCY
 OMeP2VMoe7gE/76Coo7uzxLGcffueElWy2uB5IAkZjjIg6EureASJpJOrzIAcTSH+bFP
 6iiw==
X-Gm-Message-State: AAQBX9dHV4RcqXM3F04sh3yKGO19Eyb2pJJ4rqfU85RbYki6QbcChg7h
 UrdqTbMIGRrYl1SfbaW4Q+Rxns62Q24=
X-Google-Smtp-Source: AKy350YN67duDuvrSt9RsefdcCCXUDViapsMLxEAKXyAh2WPSZz8BuZQ/UBCu0X+bFMLE8eWv+zzQQ==
X-Received: by 2002:a1c:6a13:0:b0:3f1:6f44:ff3a with SMTP id
 f19-20020a1c6a13000000b003f16f44ff3amr2562378wmc.13.1682095398130; 
 Fri, 21 Apr 2023 09:43:18 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:17 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com, Stacey Son <sson@FreeBSD.org>,
 Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 08/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:57 +0200
Message-Id: <20230421164200.2913-9-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


