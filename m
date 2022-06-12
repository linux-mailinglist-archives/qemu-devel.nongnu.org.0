Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F62547C13
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:51:31 +0200 (CEST)
Received: from localhost ([::1]:47916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UYT-0008Ph-Ef
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVq-0005aJ-9W
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:46 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:39896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVo-000079-Ps
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:46 -0400
Received: by mail-io1-xd30.google.com with SMTP id i16so4295592ioa.6
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lL3H0FhitZl1pzcsae3oiTSrw/TIWnwbTRy00a3rTXc=;
 b=5/W29+lINyWQZJgRN2WXyL7EDP2ABDape93pXtsmKT6/FAmljnHbi3YPRifHr5asL7
 9eiFoq7iYnHLIORAlrC8JlCXVuqoRJZOkD6vmuUL8nApJ9Iafyge1YK+QmGzjaf7vcGv
 agDXr3SUgmhMWnxFAUw+xUq0FbgEnNgHXxDZ6Jp5FvUNp6JNUFWFb4nbCydrXSvuSRO+
 Our8sMmQQDrKzpUaazDfSpO5BIE6irQf+G2zgKecESwYvW5qoipakeWZNV0osQwKBFL/
 F6m3w3MY2zDnyuZUEBc3czk2GoYWKOxtiZvUc5kEbL0PpvDFMT9nps35tM5qZT6VvB83
 HKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lL3H0FhitZl1pzcsae3oiTSrw/TIWnwbTRy00a3rTXc=;
 b=HD4m9DC5ypOWXC1hYUOlqWT4qYzl1wAJ3XB1mxCvXwnfz+MFSQuBctOxsUvOYzuIVs
 KooIevAcvf9JlgP4d/1Yg8rebt0qfjt3RB5MghflGvD6Yp6eOn/yrA+kja8dg5xVZWE7
 pzZtLwtQTZfot+RBJjZPRqh71vsf/fjNTYK3kVxO4E17Eb538Ovw0YVGROzQv4FM6ccD
 8HsnOD3k3i2EWZLepfVTFLIB+0VZQvm4q9+NAXt9xFR1MoeK6KL5+9jiXPOU8omY9kvo
 1pXQ1vanj+TIE/9pma9U/RaoFExTIe91qEotSIvfka9IliVkYnn01128HlyS2wefU1SE
 6SDQ==
X-Gm-Message-State: AOAM5334co/6eRviLgOf2CJmOMMbj16w2vsl1ipeewFTRh0aw4NK5Hgb
 fhHWixR2c9I6vANq7aNRN5/ft7km1eKabg==
X-Google-Smtp-Source: ABdhPJw8EQKEYTUvi7B/h5U0vp5rm8Lhqei+tHjGe2aPiPwFSXTauzIaw/PhtZYKDREc0GN2dKgRAg==
X-Received: by 2002:a5e:8a0d:0:b0:669:cf13:d643 with SMTP id
 d13-20020a5e8a0d000000b00669cf13d643mr3965654iok.58.1655066923495; 
 Sun, 12 Jun 2022 13:48:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH 05/11] bsd-user: Implement rename and renameat
Date: Sun, 12 Jun 2022 14:48:45 -0600
Message-Id: <20220612204851.19914-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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

Plus the helper LOCK_PATH2 and UNLOCK_PATH2 macros.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 45 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 +++++++
 2 files changed, 53 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 8e5d302972c..d75883ce95f 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -32,6 +32,24 @@ do {                                        \
 
 #define UNLOCK_PATH(p, arg)     unlock_user(p, arg, 0)
 
+#define LOCK_PATH2(p1, arg1, p2, arg2)      \
+do {                                        \
+    (p1) = lock_user_string(arg1);          \
+    if ((p1) == NULL) {                     \
+        return -TARGET_EFAULT;              \
+    }                                       \
+    (p2) = lock_user_string(arg2);          \
+    if ((p2) == NULL) {                     \
+        unlock_user(p1, arg1, 0);           \
+        return -TARGET_EFAULT;              \
+    }                                       \
+} while (0)
+
+#define UNLOCK_PATH2(p1, arg1, p2, arg2)    \
+do {                                        \
+    unlock_user(p2, arg2, 0);               \
+    unlock_user(p1, arg1, 0);               \
+} while (0)
 
 extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
         int copy);
@@ -335,4 +353,31 @@ static abi_long do_bsd_fchdir(abi_long arg1)
     return get_errno(fchdir(arg1));
 }
 
+/* rename(2) */
+static abi_long do_bsd_rename(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    ret = get_errno(rename(p1, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* renameat(2) */
+static abi_long do_bsd_renameat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg2, p2, arg4);
+    ret = get_errno(renameat(arg1, p1, arg3, p2));
+    UNLOCK_PATH2(p1, arg2, p2, arg4);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 8698db358c1..2d62a546328 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -309,6 +309,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fchdir(arg1);
         break;
 
+    case TARGET_FREEBSD_NR_rename: /* rename(2) */
+        ret = do_bsd_rename(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_renameat: /* renameat(2) */
+        ret = do_bsd_renameat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


