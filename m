Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0E5522E3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:46:12 +0200 (CEST)
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LTX-0007n0-Dn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPe-00056E-8G
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:10 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPc-00081g-IR
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:09 -0400
Received: by mail-io1-xd33.google.com with SMTP id p128so11845481iof.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nW7mBBIc5zzP6+xjuSHv5mY+f3R/Ch0mpWQhcpFjbok=;
 b=xcH/Ow3oLisdUbEPW1rwwNVz++smIaDrp1uxdHKpo8FQns226LeI3uNSVRoYOwng6k
 ZZ01n0RnbYos0ecu0jqJdavUc0nVardQXRFJvh1WXEHLa5d9S8EFX7LSXsPItaLlgMCo
 0Q+zjnqauusDbM3+5t3ZP91LmJ8h1Jcgw2Ls7FtlNONADmBVb6jzjrDvcX8vxwu4D9Vp
 cypQiBJQQxFkhW9rzJEYg5XCBzdWEpfhEB+S/2U+cpMhm8qduyUV3MHfUVwCB4EgrXKe
 a1+RvK+IaWMfDgLTtQS7ucMj3GKkyJWnLNH72ugf6slJE4nPqWK57wjof3+2hrW/cv9Y
 T+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nW7mBBIc5zzP6+xjuSHv5mY+f3R/Ch0mpWQhcpFjbok=;
 b=uyPTKgqLEaFtzabK5H7q+4PXus3OEj+u3vq3RtHwzNUCiGmpHmt4U/9fOW8IcLRHtW
 rsW+RrNHFIWsaHn5ZVvQ+/dLjNYRvHO1OwTLmIfNYPRGIw/uKRmQLlkki7qW1pVf7rdt
 HVaUy5L494idPyplr26s1iREWOLb6nAoHYJsV3wwE5tI6JJur2lbTvy29qpcBaR2wNMR
 BqhsZCcVFbUNt94pAHFFBEhw9YW9t7G6WbMwQW7tmsxA4yPYRhS9SrGxAIHafzLrvtcK
 fYvC3zfrviRcyvqmJu1NHJiHPJi65LR+L/PLQPVYUsjASZqHI7JF1s9LG9mAf79thJne
 JyXQ==
X-Gm-Message-State: AJIora9vpvlo8JvVKRY99G5uLXQzs1h0fJXz8XclKKYksJuYKWguDmH0
 f4Wn6VxWv2LAYjgwvAgS3j8vr5I82Shhow==
X-Google-Smtp-Source: AGRyM1sICQGzCgwtcohYXY9pqk85zSaF7j2dqQBUeRC43XdaeP7E2sXrb8wgOHekxqbvzNrwbw1t/w==
X-Received: by 2002:a05:6638:220e:b0:335:b65b:6a7d with SMTP id
 l14-20020a056638220e00b00335b65b6a7dmr14024365jas.220.1655746927243; 
 Mon, 20 Jun 2022 10:42:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH 02/10] bsd-user: Implement symlink, symlinkat,
 readlink and readlinkat
Date: Mon, 20 Jun 2022 11:42:12 -0600
Message-Id: <20220620174220.22179-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
 bsd-user/bsd-file.h           | 75 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++
 2 files changed, 91 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 4545df3a056..e5133268546 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -601,4 +601,79 @@ static abi_long do_bsd_nmount(abi_long arg1, abi_long count,
     return ret;
 }
 
+/* symlink(2) */
+static abi_long do_bsd_symlink(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    ret = get_errno(symlink(p1, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* symlinkat(2) */
+static abi_long do_bsd_symlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg3);
+    ret = get_errno(symlinkat(p1, arg2, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg3);
+
+    return ret;
+}
+
+/* readlink(2) */
+static abi_long do_bsd_readlink(CPUArchState *env, abi_long arg1,
+        abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH(p1, arg1);
+    p2 = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+    if (p2 == NULL) {
+        UNLOCK_PATH(p1, arg1);
+        return -TARGET_EFAULT;
+    }
+#ifdef __FreeBSD__
+    if (strcmp(p1, "/proc/curproc/file") == 0) {
+        CPUState *cpu = env_cpu(env);
+        TaskState *ts = (TaskState *)cpu->opaque;
+        strncpy(p2, ts->bprm->fullpath, arg3);
+        ret = MIN((abi_long)strlen(ts->bprm->fullpath), arg3);
+    } else
+#endif
+    ret = get_errno(readlink(path(p1), p2, arg3));
+    unlock_user(p2, arg2, ret);
+    UNLOCK_PATH(p1, arg1);
+
+    return ret;
+}
+
+/* readlinkat(2) */
+static abi_long do_bsd_readlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH(p1, arg2);
+    p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
+    if (p2 == NULL) {
+        UNLOCK_PATH(p1, arg2);
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(readlinkat(arg1, p1, p2, arg4));
+    unlock_user(p2, arg3, ret);
+    UNLOCK_PATH(p1, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index bd4dfa6ddc7..80ec9dd4954 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -386,6 +386,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_nmount(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_symlink: /* symlink(2) */
+        ret = do_bsd_symlink(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_symlinkat: /* symlinkat(2) */
+        ret = do_bsd_symlinkat(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_readlink: /* readlink(2) */
+        ret = do_bsd_readlink(cpu_env, arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_readlinkat: /* readlinkat(2) */
+        ret = do_bsd_readlinkat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


