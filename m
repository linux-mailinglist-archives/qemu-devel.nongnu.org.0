Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92139552307
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:51:32 +0200 (CEST)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LYh-0001g0-Lc
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPo-0005TN-8J
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:20 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPm-00082q-Hz
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:19 -0400
Received: by mail-il1-x133.google.com with SMTP id p14so890770ile.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+6fkV3rZQcNrC50APHdA91tW/kmRuFqbo7K+AeZTYAo=;
 b=xlZF0qA4v58cB+sErw+VT4Um81NxOWXlLh/I+OWoyWGVY+zzTb7LFwYGSKZ/sFMFuQ
 n7d8iihd4fdleA/jdiFEQiIv6dHX6DJL8gS1ZasMCBv/CrLEhV6o8AYQMyizTCDuhC0J
 A1O9lpNeeyWhffdv3brEytbYZoRl8amuyVMfJi5Z8SDwiM8EIEth7XWAmLSw6lZoIJUZ
 OcVc6qIpdujBMhu92yrhvjbPOw8u+SSKMvHenScL9S09dEigXgsJmy19VPj1sL2PFMNt
 dvBVTIMmegiePR8jZh7wB/YNjbG4G4AENdUzyRrizMAHNhFtFlmNcC4YEf4YoDQMSS8W
 Zl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+6fkV3rZQcNrC50APHdA91tW/kmRuFqbo7K+AeZTYAo=;
 b=ZdxpslRr0kXv4bDLIvYOuJrqzpYfF+xjDwfXO6u++qDX+BB1T1cACanUtLvh/RvR2L
 FrTg3A5iUfEY3NDXbs/AhvCCuITDS4/mR+eTtAno4FBLjkcy4LlWP4J95M2TQofItGvK
 JusIm36znAGFIT9UnQqBdyO0NY3RL1kMkEKU3PLMtC36Xic0Dxz5I2NfKJpdWhdxtaOK
 kDuvqXBra3CR8/0wCWSvt916/zkYIy4tAmscqxaGtNP4ZujOt5mEagrD84koAM2817ih
 alxj3tyTgq8COw7e+i2EBdJ445B7w95TL6ha0t+A1FP6ToECA+ldY2U8nq7Llppt2wnW
 ujkA==
X-Gm-Message-State: AJIora/fxXEgwF9SbaTpP7LgXS27/TBhF5QPqYPx8rjh4GTrk9g0A8JR
 AbXSg1KZrXtvyfEntU0Cb9TB0mvozspugQ==
X-Google-Smtp-Source: AGRyM1s3oUEt77TsqVn8MXw9OetxlejhNxpBtXHSQVJSALdqZlXPgmtgTblOoNW4BvfnaGpJoNR/6w==
X-Received: by 2002:a92:c24c:0:b0:2d1:cdd0:1959 with SMTP id
 k12-20020a92c24c000000b002d1cdd01959mr13579607ilo.39.1655746937020; 
 Mon, 20 Jun 2022 10:42:17 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 08/10] bsd-user: Implement mkfifo and mkfifoat
Date: Mon, 20 Jun 2022 11:42:18 -0600
Message-Id: <20220620174220.22179-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 27 +++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index f11369655a0..0b4b89c8d5c 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -880,4 +880,31 @@ static abi_long do_bsd_flock(abi_long arg1, abi_long arg2)
     return get_errno(flock(arg1, arg2));
 }
 
+/* mkfifo(2) */
+static abi_long do_bsd_mkfifo(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(mkfifo(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* mkfifoat(2) */
+static abi_long do_bsd_mkfifoat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(mkfifoat(arg1, p, arg3));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index f3fb585b7ec..ff3893b9197 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -469,6 +469,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_flock(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_mkfifo: /* mkfifo(2) */
+        ret = do_bsd_mkfifo(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_mkfifoat: /* mkfifoat(2) */
+        ret = do_bsd_mkfifoat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


