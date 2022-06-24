Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FC355A41E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 00:01:38 +0200 (CEST)
Received: from localhost ([::1]:51580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rMv-0002CL-Or
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 18:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9C-0002hG-46
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:26 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:44588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9A-0007VI-1l
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:25 -0400
Received: by mail-io1-xd33.google.com with SMTP id z7so3986119ioe.11
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGeZtblBEzDSbgJqh8FDdYvIEAG+akNqqEhJldgR+0U=;
 b=Jcc8VMq48AkVrT67rHJJypySEb21QU8a2fnUkNOoh08X5cys59ZUGl8Kz6cQtGtIIA
 idedWpxPh85zDiXyYHETddZzhxF3YtZEJcwbGt65MnmcckPn/7C8KXQVE/Vsn22h3uxf
 fZCQ8e6YIDciKFuqvIPO3NpY5mzXnia0GuB0eW4464t5zz1oSU8rfoVZjltrZLBjJmYc
 L1cUnDbYVrH4l6394g7c2qOE+OBi5+GAT3YKWdbWK1pdL1V+l0LP6GLLWBIMMSRVKNYv
 2mvYZjg0mVTzCWcq8rM/Vikl+bhQa+HbdM+U9oHVzkW4MMhEPTkrssGZozOjlWVPhpHs
 5pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGeZtblBEzDSbgJqh8FDdYvIEAG+akNqqEhJldgR+0U=;
 b=Z+go/kQhSrSf446n15to8G77I5rtq0wRk1iAV3/12hTHlIfbxjNVrlJOhdWso4PyvE
 lVkyiFOVmRAs0xENda9n9t/RSbTAHOZWIvlzJ7LF2zMC9tSEAdtsUI7KbD3Xk6iUaKrH
 Jiv5BZbEf3BMcxbwOEMjpHbz1GCHYRbLy61EiPThIoWqaTWXtBEAWvNsXtUYP4eyGMSx
 j2pCXmJDa085z0Ze8BbazfQXJYw6l9DDWeYTU5AjpTTeSO3ue2lzX+Esm8mhAZ1/0UaO
 VMpEUirp79EBxU1fOlb+utzcEHgMHOUvXKSJUd+M+NRlKurxY5l3QqecN8fg9/Xqzxnk
 W4cg==
X-Gm-Message-State: AJIora/mDC93qMRMy8h6nyqG9u5l0BD/x17cvv7nmGPD6S+Eqv+Ve4Zw
 JMAUrDoBwEE7Iycl6CaeCHCwKtVFSVZbsw==
X-Google-Smtp-Source: AGRyM1vdLlBLQBChz5Ux95ub/CVz0W6/PPPD1yAg4Or87ARLwiKmpyYsLXtH1j2OE3exvyfJqCkrIw==
X-Received: by 2002:a05:6638:4908:b0:33b:be12:df36 with SMTP id
 cx8-20020a056638490800b0033bbe12df36mr757597jab.278.1656107242594; 
 Fri, 24 Jun 2022 14:47:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Michal Meloun <mmel@FreeBSD.org>
Subject: [PATCH v2 04/11] bsd-user: Implement freebsd11_mknod,
 freebsd11_mknodat and mknodat
Date: Fri, 24 Jun 2022 15:47:35 -0600
Message-Id: <20220624214742.89229-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
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

These implement both the old-pre INO64 mknod variations, as well as the
now current INO64 variant. To implement the old stuff, we use some
linker magic to bind to the old versions of these functions.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Michal Meloun <mmel@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 47 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 13 ++++++++++
 2 files changed, 60 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 1af79866fc6..b05d3cbb717 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -721,4 +721,51 @@ static abi_long do_bsd_fchmodat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* pre-ino64 mknod(2) */
+static abi_long do_bsd_freebsd11_mknod(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(syscall(SYS_freebsd11_mknod, p, arg2, arg3));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* pre-ino64 mknodat(2) */
+static abi_long do_bsd_freebsd11_mknodat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(syscall(SYS_freebsd11_mknodat, arg1, p, arg3, arg4));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
+/* post-ino64 mknodat(2) */
+static abi_long do_bsd_mknodat(void *cpu_env, abi_long arg1,
+        abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
+        abi_long arg6)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+       /* 32-bit arch's use two 32 registers for 64 bit return value */
+    if (regpairs_aligned(cpu_env) != 0) {
+        ret = get_errno(mknodat(arg1, p, arg3, target_arg64(arg5, arg6)));
+    } else {
+        ret = get_errno(mknodat(arg1, p, arg3, target_arg64(arg4, arg5)));
+    }
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index b33d548a4b6..d3125f340f7 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -32,6 +32,7 @@
 #include "qemu/cutils.h"
 #include "qemu/path.h"
 #include <sys/syscall.h>
+#include <sys/cdefs.h>
 #include <sys/param.h>
 #include <sys/mount.h>
 #include <sys/sysctl.h>
@@ -418,6 +419,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fchmodat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_freebsd11_mknod: /* mknod(2) */
+        ret = do_bsd_freebsd11_mknod(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_freebsd11_mknodat: /* mknodat(2) */
+        ret = do_bsd_freebsd11_mknodat(arg1, arg2, arg3, arg4);
+        break;
+
+    case TARGET_FREEBSD_NR_mknodat: /* mknodat(2) */
+        ret = do_bsd_mknodat(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


