Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9256409B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:05:21 +0200 (CEST)
Received: from localhost ([::1]:41718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dkO-0001xP-9L
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc7-0006en-N8
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:47 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc6-0000aO-0y
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:47 -0400
Received: by mail-il1-x12b.google.com with SMTP id h5so3037616ili.3
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oR4bwx3yE4U4DhOgFewIjs/HiUDdRZ4+xHyJ70mkD7g=;
 b=Dv3SCmOIOKM6QPbpHXTFY8Wy0h1Qfsm3dDCGgYmx/wFtM1sIJzHQNpsZAzStpMPqLv
 QWh3Zt5AzC0b/O2qe0CxEswD17oyH/XCENL50ttC96CRHQiacOwWuEyglbSKchUHnyU+
 mgagW4ZZxd5O4+0LArPTXtCdT+8kQQBX3Xc69zyqZHpF15Us2/SYNcrF9tZnW0Y+PC/5
 eUjCvKbo1P91/FFl6FEKuY/Wi4chx7+uvKV/tvwGPP/slqpm18+laHzZiZg+9ApP+Azd
 eY6s2jQ1nULpeKG482XSoQSdmzgKOhTu1ukMeP1c89w6HvoSGopdVvvZes57d6ySdn3K
 s+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oR4bwx3yE4U4DhOgFewIjs/HiUDdRZ4+xHyJ70mkD7g=;
 b=kkoV78XvSdTm6KtDqbNH4qqzbtZF3Eqc9Up8nsoqhwsyf91wiBslQH5t/ytd+H7M1Y
 /S31G2pqAvViFcM1H+6sWYZBIJGvO02MKWmxXnYm3YmqlH1dPOlauPotCX9VxK4u69za
 k7rM/esLcnrquDeSg8ptISQS4gkeWXFA5L+KEISjflFEN4NcIrMIrGxgmrBQfLdlwYHr
 N7s9/CGTlKzMFdTTLBh3TIRyzNVxt50euTD7K/HcGCp8pWo1XeXXC6ZwQhfzmYWJMesf
 RZe6a9C9irNkhBPSMaDZpDEFMxFiIRCf4b3NSG/Y4pCCUssQdO2Fo1KtWHgiDsM/+u9H
 PzkQ==
X-Gm-Message-State: AJIora8aDwZnjJI+DZQp9r5ZK3gD6V307fPkY4kWqi3xj5IbmFEujRl6
 ejY0UgDZs5AFAJOd6moqMLqojs9Y+yk0Zg==
X-Google-Smtp-Source: AGRyM1u77EqKoEKH2i1bHn0cCVyLCtCgHG3yXQ+li3/CyvNfaZbU1AB6aSzCbs9wmfndTKZteZClTA==
X-Received: by 2002:a92:d0a:0:b0:2d1:e698:5c4c with SMTP id
 10-20020a920d0a000000b002d1e6985c4cmr11003593iln.316.1656770204673; 
 Sat, 02 Jul 2022 06:56:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Michal Meloun <mmel@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 04/11] bsd-user: Implement freebsd11_mknod,
 freebsd11_mknodat and mknodat
Date: Sat,  2 Jul 2022 07:56:59 -0600
Message-Id: <20220702135706.73622-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
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

These implement both the old-pre INO64 mknod variations, as well as the
now current INO64 variant. Make direct syscall calls for these older
syscalls to avloid too many dependencies.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Michal Meloun <mmel@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


