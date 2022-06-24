Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434455A414
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:58:54 +0200 (CEST)
Received: from localhost ([::1]:47214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rKH-0007gF-5k
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9F-0002kH-4F
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:38485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9C-0007Vf-Tq
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:28 -0400
Received: by mail-il1-x129.google.com with SMTP id 9so2333679ill.5
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kzAzIpUIXo+c189sqZVTv1xr+Ava31F6GIsxzJh2kq4=;
 b=7VmOcledEHEhWLsTlgR4kMF4pdAwRyo02VUrx3lkGEaTMuPCvL84+xsONblD9C2Dog
 ci2q1JpQxU2+E1rGDTQseZtJ2t+tqwFlc0zdTpHJB9ZFAqZIKkr89BmggTX6rwqphDR6
 M/ZHr/uKZBvfG6NafgqiwbKBOQBrGuYLeVxljh4EnlzqIYFTW3edLiQaz2HR2hSy/8t1
 8kP9r1h3ZX98dFHGtPKF9r/ro96nE1X1Zn/X4Za0fuxGMGA/1mGclcN6k6MrqS+qbbtt
 kGy4WW+cCBOmx4LmvxOtoqXpequW6RhF8rdHruecdDK8A28y6kjniBZP74ajIqu7sz5O
 Q/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kzAzIpUIXo+c189sqZVTv1xr+Ava31F6GIsxzJh2kq4=;
 b=w3y4UF50ZjpoR7Lhwq0LLmu6jidJkGxmwGySBoGymKg96s08oxPa2eo0hCdWlfytE7
 OALYfF/40bmoISz9RUnNATP3klNg7hoX886FkZ0tOqnfb/fPn3qbK3Ku7+alFpXG77Xh
 cBSAfiyAaHoML6j03/LxpNlzhWsjV/cI9ESjntVNHqOIERrXauHsroLNlNdWc7zXV4ve
 gVbUxODkz6yJ8cs83S3rZSe4hPVuBKYOINS/cz/Vr3sKXt17er9W198DRCibE2s3Itoz
 JhlABlbDsoEbvzbbQftYWsmzfyJtb7jI4zTzZgrisZ7WClASpnOMoN4vXXW6Ax+nWGG3
 pFdQ==
X-Gm-Message-State: AJIora/znmJl9IRdH5YwrId0zrpXlIe8Rytpyp+em8Linb83PThuZ/9p
 thndHzjEV2Q02vE8EPGUOSr2GgbdsPr1Sw==
X-Google-Smtp-Source: AGRyM1txP0Gwk6IgQfsQoa+L7fmpEAIM+aaRnmR09fZMLg5Q+k761zhYsVEVUtLXzLqaoYTenFsDGg==
X-Received: by 2002:a05:6e02:15c4:b0:2d7:aa1e:5b55 with SMTP id
 q4-20020a056e0215c400b002d7aa1e5b55mr616261ilu.120.1656107243555; 
 Fri, 24 Jun 2022 14:47:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/11] bsd-user: Implement chown, fchown,
 lchown and fchownat
Date: Fri, 24 Jun 2022 15:47:36 -0600
Message-Id: <20220624214742.89229-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 48 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index b05d3cbb717..ac171c409ca 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -768,4 +768,52 @@ static abi_long do_bsd_mknodat(void *cpu_env, abi_long arg1,
     return ret;
 }
 
+/* chown(2) */
+static abi_long do_bsd_chown(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chown(p, arg2, arg3)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchown(2) */
+static abi_long do_bsd_fchown(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    return get_errno(fchown(arg1, arg2, arg3));
+}
+
+/* lchown(2) */
+static abi_long do_bsd_lchown(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lchown(p, arg2, arg3)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchownat(2) */
+static abi_long do_bsd_fchownat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(fchownat(arg1, p, arg3, arg4, arg5)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d3125f340f7..8090666b0d9 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -431,6 +431,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_mknodat(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
         break;
 
+    case TARGET_FREEBSD_NR_chown: /* chown(2) */
+        ret = do_bsd_chown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_fchown: /* fchown(2) */
+        ret = do_bsd_fchown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_lchown: /* lchown(2) */
+        ret = do_bsd_lchown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_fchownat: /* fchownat(2) */
+        ret = do_bsd_fchownat(arg1, arg2, arg3, arg4, arg5);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


