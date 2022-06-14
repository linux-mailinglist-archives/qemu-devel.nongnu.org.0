Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA454A7FE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:25:34 +0200 (CEST)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0y7R-0002yo-6r
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2C-0003g1-Od
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:08 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2B-0001qG-6I
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:08 -0400
Received: by mail-il1-x12b.google.com with SMTP id h18so5744925ilj.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=olw8ZOCD+M4kjdGJCkv/JFL+kzJiB7ue2OVvnPf2GEI=;
 b=8BKKZoWSzcvmhB3klyS1JoIiwz2jmItK+VxS7T1bcf3Z6G6TF6A7raXt6q9GRXXljH
 lwmhS/7ZKnsnyTVdnGSNPruKmUJRyYsryr1ix6Lb4rYXbtr5Twc7JYhienHEQMJP+WnN
 I2/cTiZODnu+UjmWyZfx+MicoP7iLdw2Ch1Bz7OBIp2QSj9WwLrnFQ8CpMSbU79IMtuh
 WKzeRes59SVsqKEovL0c1WP3TOUUYW5oSFBKHp68euN2/K4DsIUkuq2agOJK1kBWn5Fs
 yHogmgnHLxNJ6uHHqtQ6ijuclZQqvuyGeZWvjaW6eHiObwzoTj+A6sN5AT30Gx0CMw9K
 vRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=olw8ZOCD+M4kjdGJCkv/JFL+kzJiB7ue2OVvnPf2GEI=;
 b=U62nIxuiIKHvi1SDJb09ff79Uedy2K8ZtCmvS5voD2NOmeQZwQxMzGYTnB8O9hv+mY
 Smp0qhZqck78pNUQTinH1AWUL+AK38pjIvAYZawkers8f8xw1OZKMRo7PEDpl0EY/GVh
 jnxyg3CG2s1hExk1rNUzoPiOFevPlAUjFVJ7YUaUvcUeEz68Au14hbcVoz8othSKXsJF
 S0kOkIsLH18dE+6WNE34QLsUkPQ77fWUc1vDzKUugQOXs4Ro/ixzxBSAXOXss/2IuFMl
 thMQVb9nnx8obF4RThksUWM13lf9heR5MfaC/klAByGAi04fjRyoBwtMZtoLfSVMNC0S
 DmfQ==
X-Gm-Message-State: AJIora+P+n53Kv5wxgN4yBB3RTATbXrf4MES/BSfAo3UrqgqCRyfBqdl
 5cg8PHpJNqc6BAgNqtxO3u8lWuf87+GtfQ==
X-Google-Smtp-Source: AGRyM1sNNPC4y6JyfFI2BL8EGSwzTbQpjqocM9T5t7dOfV5RoSTgpO4StvANh6A6rbpcGKP/zrMvfA==
X-Received: by 2002:a05:6e02:1b0c:b0:2d3:bfdf:e3c5 with SMTP id
 i12-20020a056e021b0c00b002d3bfdfe3c5mr1920473ilv.138.1655180405614; 
 Mon, 13 Jun 2022 21:20:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH v2 08/11] bsd-user: Implement rmdir and undocumented __getcwd
Date: Mon, 13 Jun 2022 22:20:07 -0600
Message-Id: <20220614042010.40327-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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

Implemenet rmdir and __getcwd. __getcwd is the undocumented
back end to getcwd(3).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 29 +++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index a4c6dd52a20..8ec53145894 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -456,4 +456,33 @@ static abi_long do_bsd_mkdirat(abi_long arg1, abi_long arg2,
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
+    ret = safe_syscall(SYS___getcwd, p, arg2);
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


