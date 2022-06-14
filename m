Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE054A828
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:29:25 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yBA-0007gU-Af
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y29-0003XG-FW
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:05 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y27-0001eO-Mc
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:05 -0400
Received: by mail-io1-xd36.google.com with SMTP id 19so8209079iou.12
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S40P6qQAunc27gypcFnqBEY9H0MtkqO3VN60QRRCW2w=;
 b=Od3N1XbEHDzMeWSg5bvzwwtVu/yBVPGq88F+/vplNUh1xuOtzAE7wcMReLpBLFg7c/
 1W2zY/TOqLeNS74HuUcON86Js2aAY5cTkyN0JoQjIjDGChdkmRzImSQMyB1gQ1EYaJBx
 GdEYW5RIpuVAtl7QEfK8McSgY8f+SP2LT+WhoQhzB/QFh0YO7uZ8J5xdN6LJYGpIK8Q1
 tDORrk23BeoEkD5fIrkUhsGwy9s3cvHYKgscr5bpYww4ZwfbVzFXbPWvFVf4uoRANqhz
 e6s7qWmlWZYS2YAtjA85su7sRusRfOd6aC0KJ87F1iLeIr9C28qK1u4a6bCtQ6OHcO3d
 KkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S40P6qQAunc27gypcFnqBEY9H0MtkqO3VN60QRRCW2w=;
 b=1GFheJ94503V3RedsbqLr/kqiSvAFOUx+YodW1c3SWh1Atm83xug1Ifscw9YCD61ZK
 8bn+Vlt8sVNC84JxL+eYstx1qIFbJVZSqSVAtjrBP8HANeiAt8TglnvTQRvfu8qbUk3t
 kUJVoYt+bByw3EZslmvSvNMlNbAVkEIpCOixUc9ObRGmF8dVNSeNxIpqENLUIj0W4/j6
 AYlWWWlsU63wworx1howD3bA8QoOJtz3ryaYdpLYPl0LuVVudSxyzzz8v9twRMLoAP15
 lhGnZlKUwDIllFBdsVHDmoA81+WcwkBnMYlFi0pgK5NUWylh1FRDy0gjTv9G/XApP/V8
 pGew==
X-Gm-Message-State: AOAM533b9G7EXceSUHAPL5X3oq9azVM3yKV0aeAdMpO+GLcMJbuG5S4D
 it20AtQWe/rnPmMTRJn9OE5qRidez1AHmA==
X-Google-Smtp-Source: ABdhPJzXJwffNz5cx+kLtcLgYj5P/kxhMTKihihQMKPBGfGzQ81ymPTL32YbvqU7I7OUTCRCccoaQQ==
X-Received: by 2002:a05:6638:2692:b0:331:fcfd:adf5 with SMTP id
 o18-20020a056638269200b00331fcfdadf5mr1799656jat.166.1655180402154; 
 Mon, 13 Jun 2022 21:20:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH v2 05/11] bsd-user: Implement rename and renameat
Date: Mon, 13 Jun 2022 22:20:04 -0600
Message-Id: <20220614042010.40327-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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


