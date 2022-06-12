Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F98547C15
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:53:27 +0200 (CEST)
Received: from localhost ([::1]:56510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UaM-0005ri-5l
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVt-0005gV-1N
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:49 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVr-00007o-Kn
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:48 -0400
Received: by mail-io1-xd2f.google.com with SMTP id e80so4307811iof.3
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lNHilm5WC9lFwAXJIS6izFwhO+FpdiPqCamgzblazVY=;
 b=jrJ15Yar6wd88cN2Y+pk+ORrTsYz+5N/SFGhmhAqfpGSQbWUQHW/My0PIejjdIvuJK
 VWk0P+hKVZZGvrcr2bNcliA92J1YzzSc+01PMGm7bZK6noDOlkVJuEsIq2wVtTzBKVBl
 0dwgKvciEXE+6heZXEcJflJGCOMTrK/mTFZ5B9duGC4KEId9sQdeGJHaGjQ5/Vu/r7Lw
 iJBDmJsYtt8oJAHNxMiGejlzSryMw2WGvktYOzkoQ6eY9kGsOEi/tIbtK8a/jNGWOA8u
 ggGzxDYmQqsjS6q3wjnRooHKtIYcPb0ZWJXL+8IZTQbetvqai34g37WEcUpzJ+fpl0e3
 AVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lNHilm5WC9lFwAXJIS6izFwhO+FpdiPqCamgzblazVY=;
 b=5JpbDZV8F41W+2T0m7WfluSjGfWK5UAzj1Siso2MW+KmX8EOhFtFIYi6qPBHExCLXE
 VAn1tavA2xCS6rbJdsod3xp86W66gMw6rvE6QxwCMhggbT6q1xuocpWbPauIdxyAJz8q
 jommdDUUx+6m7Y/VkcOKdnsZr33pjHMQyDzpZ4JSdEHut0gXq4LX9wvQPWVO38NkcQBx
 rNlIMDhj/d//dmRldJFrQ38xfHj0ZNoaP3QW7nrSCj9Rtb6dhP29OHVPxS3GsHNawqfC
 14rfrh+gwhfstkgpA3gRK4w1XaTqH35GAvRSJTpu0eW5ZI2SrQsUqJwcfHy6eeHDdHot
 8+5A==
X-Gm-Message-State: AOAM531HWIEgIDb89tKJot3FHkWVzLCbR7ibrOwLTfAUny6xHLWRb9kZ
 E/sk5qZ7Pa6FjljSmFR0AaFSgEC5m1DqYg==
X-Google-Smtp-Source: ABdhPJw5dNs2z9TCGsAz5IuwK4pl6CozQ9zd+ufDHBW6zurcvz5U/D/4aYc8wKYVoppezbBgOZ1zQQ==
X-Received: by 2002:a05:6638:3474:b0:331:ca81:602a with SMTP id
 q52-20020a056638347400b00331ca81602amr16843237jav.88.1655066926206; 
 Sun, 12 Jun 2022 13:48:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH 08/11] bsd-user: Implement rmdir and undocumented -_getcwd
Date: Sun, 12 Jun 2022 14:48:48 -0600
Message-Id: <20220612204851.19914-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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

Implemenet rmdir and __getcwd. Declare __getcwd as extern because
there's no installed FreeBSD header that has it. It's used internally by
libc, which doesn't provide an external declaration, but does export the
symbol.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 30 ++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 38 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 35036364ad8..500d6ba78b9 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -55,6 +55,7 @@ extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
         int copy);
 extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
         int copy);
+extern int __getcwd(char *path, size_t len);
 
 int safe_open(const char *path, int flags, mode_t mode);
 int safe_openat(int fd, const char *path, int flags, mode_t mode);
@@ -461,4 +462,33 @@ static abi_long do_bsd_mkdirat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* rmdir(2) */
+static abi_long do_bsd_rmdir(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(rmdir(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* undocumented __getcwd(char *buf, size_t len)  system call */
+static abi_long do_bsd___getcwd(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_WRITE, arg1, arg2, 0);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    ret = __getcwd(p, arg2);
+    unlock_user(p, arg1, ret == 0 ? strlen(p) + 1 : 0);
+
+    return get_errno(ret);
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 9381ddb5be1..e28a566d6c3 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -341,6 +341,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_mkdirat(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_rmdir: /* rmdir(2) (XXX no rmdirat()?) */
+        ret = do_bsd_rmdir(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR___getcwd: /* undocumented __getcwd() */
+        ret = do_bsd___getcwd(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


