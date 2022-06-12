Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F60B547C16
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:53:27 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UaM-0005qr-IO
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVr-0005bv-56
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:47 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVp-00007P-Nb
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:46 -0400
Received: by mail-io1-xd29.google.com with SMTP id n11so4305718iod.4
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+PVHLGwzbvZV2Xe3SKiH6sY/CBeQbx+afyzqGinzLA=;
 b=SUxgaVRojcebj3W6fuRM8MP5UdbXaP5wixd6PKlZGBnzpJwhnk+EvjypVbzUcIDMY0
 U9sMyhoZTyWeo/mX3G3BJUfuZ12qP2RIPg87no2zc1DK129a+u1wNNUKWrbBE1a99inE
 HGM9OngSQIEbJfX57Kh2iG37s8uxO5fuRr3S0x9zfaiU9FyXret7x31wPBeokHrm6kGA
 YWd4H9KvUxz4sAI+fI+vDXVnStc76h/DaKRFzmhBRuBlOBaRqk1TiJf+sexKHII9Nv0R
 GyrqBMG9S7WZhwatalL9dvcespYNyJl+wT9a+JbVAyK/2OAE539aHKtUViOKZNs+0c0L
 G03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L+PVHLGwzbvZV2Xe3SKiH6sY/CBeQbx+afyzqGinzLA=;
 b=Hq/KnSrQWw0BCSSkx9SjgNOceoqptBrRxzOBb0wns2iyIzfLnPQ+sbtc2jFfleBBlC
 PfpO7Ii0nxlRXl3HGM2P+LXm+ad58SBfdWqIycbOPxrqVYnZIAq22S0UMvXjRT0eXzxX
 xfqbjbsVCoDLQY5YMViTNyQCVP0FIajhzcqvfSJ29NQBBuwHq8S/OWLZr/BvySqydb+d
 SQhs5ktJM8qiWXlIo0GDASar5yY/6pHzEC5Xxk5dRN5JrpG6mQvSz1zfOPZrVoTZQzwF
 anurJvZLWWAHYIvBuNGRXvx6pX3Hz+aD8lmsmHwuZ0ORgB/7OjMtn7FPFPsLQ7X1Gso1
 JxHA==
X-Gm-Message-State: AOAM530hKi5U3E+D4iKWW63YOf5PxSsaVhs3pIe0A+C7Oma7AbhZCC8U
 ebOK3yIJxvnxC+7sDrOnmpIFEAJCd6ZeAQ==
X-Google-Smtp-Source: ABdhPJwGgAGwqxFMgwknj8+fb6gMUgGOBA4OLXD5nlsf/byCuY4laJnter/6YOKpdQqkRCavDVsEOQ==
X-Received: by 2002:a05:6638:60b:b0:331:86e2:1f21 with SMTP id
 g11-20020a056638060b00b0033186e21f21mr24714392jar.116.1655066924466; 
 Sun, 12 Jun 2022 13:48:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH 06/11] bsd-user: Implement link, linkat, unlink and unlinkat
Date: Sun, 12 Jun 2022 14:48:46 -0600
Message-Id: <20220612204851.19914-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 54 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 +++++++++++
 2 files changed, 70 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index d75883ce95f..08b1d3a53a9 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -380,4 +380,58 @@ static abi_long do_bsd_renameat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* link(2) */
+static abi_long do_bsd_link(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    ret = get_errno(link(p1, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* linkat(2) */
+static abi_long do_bsd_linkat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg2, p2, arg4);
+    ret = get_errno(linkat(arg1, p1, arg3, p2, arg5));
+    UNLOCK_PATH2(p1, arg2, p2, arg4);
+
+    return ret;
+}
+
+/* unlink(2) */
+static abi_long do_bsd_unlink(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(unlink(p)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* unlinkat(2) */
+static abi_long do_bsd_unlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(unlinkat(arg1, p, arg3)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 2d62a546328..c847e4d20c6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -317,6 +317,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_renameat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_link: /* link(2) */
+        ret = do_bsd_link(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_linkat: /* linkat(2) */
+        ret = do_bsd_linkat(arg1, arg2, arg3, arg4, arg5);
+        break;
+
+    case TARGET_FREEBSD_NR_unlink: /* unlink(2) */
+        ret = do_bsd_unlink(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_unlinkat: /* unlinkat(2) */
+        ret = do_bsd_unlinkat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


