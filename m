Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F3692B16
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:24:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcj6-0007A1-4F; Fri, 10 Feb 2023 18:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj4-000797-H3
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:42 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj1-00052I-Ry
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:42 -0500
Received: by mail-io1-xd34.google.com with SMTP id j4so2541820iog.8
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o/PfMiTwVI7mqWAuo+VTzIgWf7FM21PP6lXlcH7i8/I=;
 b=4nN5IOvtORrsYV4RpL9QVXQzKYoK0s6ydF4KQ+cNibas2rUQvgaf2nTZwQid4I9QES
 IAKLAahy14LsIGkSV5k+tTX7OSJkpnm9EY0fx0/Sylk7gU6SG96kSXSQ97Yc3oSJWMRm
 ug3TWoVb+2w3wsU0Yz0ZH4CIbpkfG/S7kFitRgQNDl8rU7RT12dx6qEotQOL6bv4l8Wy
 RkwBmkzCaUs/DTeJk8JqZfQO+YLBIRzPDPU643FCcJps6+5w0cAVjkMLD5ZJbu0Pqktb
 zlfWV2/scsS1mvod0RZCeGAnZbw9Vy4z+P9uC68ZoWnyv0FwP4p3MtHyHBUAJHBN+LJr
 WxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o/PfMiTwVI7mqWAuo+VTzIgWf7FM21PP6lXlcH7i8/I=;
 b=N5AjN3P27tceSSuYlCkXOMLX64FEMYnyOtW7NIm9PHG1bxzdfqkBmnfClLKZlIanoK
 r2hOjP9InEKWRUitr7XTwZ/lF4fQrjcNh1016iLLIh0WYBHmGeMIAD1PDjzCpuhADtfr
 prZ8kJ2vFAsHUyZuMgL+drbJiwoUQ4dBUzo4UhR8lNb/SfXR64TrvF3x7kJzq7RzeBf8
 HGc+dwN8dljOuIzfXA+16cf7uoamwScLcShZbRzNkJcKb5mHAiwRNE9y3gmxYu05xAtO
 pD5gYzVC28G9gD4OENYQ1p+h7BYc1qKb7ls3+k+iY0X3mS9dqRJsQuHxzS4zIsdWAmmp
 qCsA==
X-Gm-Message-State: AO0yUKWTaugESAKu/IcEuGFiyilQZjkv3ZONj+bqpPeT4nqAQ+Pesghn
 09zxq73DHZ+TnLiJgHI//J01OS69Zhzh7As4
X-Google-Smtp-Source: AK7set/RtXkgflYJ7HvQPbcBVfV7FhSbSwRHqIhbEe8C1Nkka73xyW9znfpBzlJDA6TBiXsyTf5vag==
X-Received: by 2002:a05:6602:3404:b0:719:99e7:4623 with SMTP id
 n4-20020a056602340400b0071999e74623mr18995780ioz.18.1676071358064; 
 Fri, 10 Feb 2023 15:22:38 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:37 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stacey Son <sson@FreeBSD.org>,
 Sean Bruno <sbruno@FreeBSD.org>, Juergen Lock <nox@jelal.kn-bremen.de>,
 Raphael Kubo da Costa <rakuco@FreeBSD.org>
Subject: [PATCH 4/9] bsd-user: Two helper routines oidfmt and sysctl_oldcvt
Date: Fri, 10 Feb 2023 16:18:24 -0700
Message-Id: <20230210231829.39476-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

oidfmt uses undocumented system call to get the type of the sysctl.
sysctl_oldcvt does the byte swapping in the data to return it to the
target.

Co-Authored-by: Sean Bruno <sbruno@FreeBSD.org>
Signed-off-by: Sean Bruno <sbruno@FreeBSD.org>
Co-Authored-by: Juergen Lock <nox@jelal.kn-bremen.de>
Signed-off-by: Juergen Lock <nox@jelal.kn-bremen.de>
Co-Authored-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 94 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 1676ec10f83..e3b9f168a2b 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -21,6 +21,100 @@
 #include "qemu.h"
 #include "target_arch_sysarch.h"
 
+#include <sys/sysctl.h>
+
+/*
+ * This uses the undocumented oidfmt interface to find the kind of a requested
+ * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
+ * src/sbin/sysctl/sysctl.c)
+ */
+static int oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
+{
+    int qoid[CTL_MAXNAME + 2];
+    uint8_t buf[BUFSIZ];
+    int i;
+    size_t j;
+
+    qoid[0] = 0;
+    qoid[1] = 4;
+    memcpy(qoid + 2, oid, len * sizeof(int));
+
+    j = sizeof(buf);
+    i = sysctl(qoid, len + 2, buf, &j, 0, 0);
+    if (i) {
+        return i;
+    }
+
+    if (kind) {
+        *kind = *(uint32_t *)buf;
+    }
+
+    if (fmt) {
+        strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
+    }
+    return 0;
+}
+
+/*
+ * try and convert sysctl return data for the target.
+ * Note: doesn't handle CTLTYPE_OPAQUE and CTLTYPE_STRUCT.
+ */
+static int sysctl_oldcvt(void *holdp, size_t *holdlen, uint32_t kind)
+{
+    switch (kind & CTLTYPE) {
+    case CTLTYPE_INT:
+    case CTLTYPE_UINT:
+        *(uint32_t *)holdp = tswap32(*(uint32_t *)holdp);
+        break;
+
+#ifdef TARGET_ABI32
+    case CTLTYPE_LONG:
+    case CTLTYPE_ULONG:
+        /*
+         * If the sysctl has a type of long/ulong but seems to be bigger than
+         * these data types, its probably an array.  Double check that its
+         * evenly divisible by the size of long and convert holdp to a series of
+         * 32bit elements instead, adjusting holdlen to the new size.
+         */
+        if ((*holdlen > sizeof(abi_ulong)) &&
+            ((*holdlen % sizeof(abi_ulong)) == 0)) {
+            int array_size = *holdlen / sizeof(long);
+            int i;
+            if (holdp) {
+                for (i = 0; i < array_size; i++) {
+                    ((uint32_t *)holdp)[i] = tswap32(((long *)holdp)[i]);
+                }
+                *holdlen = array_size * sizeof(abi_ulong);
+            } else {
+                *holdlen = sizeof(abi_ulong);
+            }
+        } else {
+            *(uint32_t *)holdp = tswap32(*(long *)holdp);
+            *holdlen = sizeof(uint32_t);
+        }
+        break;
+#else
+    case CTLTYPE_LONG:
+        *(uint64_t *)holdp = tswap64(*(long *)holdp);
+        break;
+    case CTLTYPE_ULONG:
+        *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
+        break;
+#endif
+    case CTLTYPE_U64:
+    case CTLTYPE_S64:
+        *(uint64_t *)holdp = tswap64(*(uint64_t *)holdp);
+        break;
+
+    case CTLTYPE_STRING:
+        break;
+
+    default:
+        return -1;
+    }
+    return 0;
+}
+
 /* sysarch() is architecture dependent. */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
 {
-- 
2.39.1


