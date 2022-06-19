Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFED550C79
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:12:36 +0200 (CEST)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zPX-0004Je-Ph
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIX-0000vZ-QK
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:22 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:46822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIW-0001LO-Ai
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:21 -0400
Received: by mail-il1-x132.google.com with SMTP id y16so6064399ili.13
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S40P6qQAunc27gypcFnqBEY9H0MtkqO3VN60QRRCW2w=;
 b=g867M0jEImjZr6XwLkBEvlZRSG2m6jVSxg1oGfxZeFWM2CKlLSoaEiuDOBYFysjpdm
 9h5uS+rHtHZ8vascNhIPhBi8Piy6b9i1nQg6h8jcSOKodxxsMFZFarGpNl7bQeGtonsL
 m9VFMqa+w9PDffNUjkR3kZriOC44bT4fmhoGJJgOF/n2ijHQwA1R4PZMRpdmI9Umo+ug
 DcU0siU4YsUDE2mwWYOuNNw3RS90stHkuncEvV0vPGDx3dnoxfEk3LVlX9XyUULq9YuB
 ElpPawwI3fU0XegfYRgJxcqn6BxtMUD3rCvAf6wkkjnpA3/4M+X5wYv1p2g4bKKgaEZM
 uw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S40P6qQAunc27gypcFnqBEY9H0MtkqO3VN60QRRCW2w=;
 b=BMesQrCQk664i0KZe6+qmWrcUT7+oH4ul52tV72xJwIVQXKInJg5rFgf+1h/DHfbZ6
 tQw+lHAOWCJGElaQL20xZfeBC4Ql03kQw5FVaXRrDZTq/S0lf32zYpbH2zgPLV8j/h/S
 b7zyFls+dBvdtE1Pc+WeB/3hTGfSRNy4G7oa8yzOIgvQL2qNR5Cm5KS73qsrmDEyWxpp
 w6SrJiRbALZDLxFIOOXMJdeJpHFcUavnF61NlzOvh7ihRkEwfno6LyBHIZk9tNVSVMsn
 C6a3UXQKPnIZOjbe2YLuu37g7Ez/4VS0mrG2mTdZ3SeQ52V2sAUnCiUUmsnqntBxptcY
 7gQg==
X-Gm-Message-State: AJIora8msvhw8Lqktrn/k89l2Imy9+S2FcxbzkvbrkV1gFvd8H3RLOKC
 nDOgaTZgT+VOlZ8IMrpPHwHhk/JwYy7mLg==
X-Google-Smtp-Source: AGRyM1tPIJp7viw2HNFp9yPdiNdAwiCzlnvwQsECXTqkWuRJsHdObPv52v274gAC9VU7hIetOjHNTA==
X-Received: by 2002:a05:6e02:1905:b0:2d3:d327:6c7b with SMTP id
 w5-20020a056e02190500b002d3d3276c7bmr11509241ilu.101.1655661918895; 
 Sun, 19 Jun 2022 11:05:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PULL 05/11] bsd-user: Implement rename and renameat
Date: Sun, 19 Jun 2022 12:05:25 -0600
Message-Id: <20220619180531.9161-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 45 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 +++++++
 2 files changed, 53 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index bc0a0c08d55..fd8aba96180 100644
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
@@ -330,4 +348,31 @@ static abi_long do_bsd_fchdir(abi_long arg1)
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


