Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF49547527
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 16:02:13 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o01gq-0006ec-M2
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 10:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01a0-0006ey-3D
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:08 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o01Zw-0003ch-SU
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 09:55:06 -0400
Received: by mail-io1-xd2b.google.com with SMTP id p69so1736218iod.0
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UU9aKWHmya49MhhlUASZM5Nfo6AfFU5F7b0DJrVDkxg=;
 b=jeTjFfVKQ7Z1YFM/IBhvxYXSRj4QExYiN8gpQHVf16BU0ViXwCbCyNyTWFnooze2uQ
 etpQlbrtva16ORwl2ZGOKy7hsk+7UAcK9LS39FNAyg7SYsTsXR1aEy0N0lCTOD2E7+93
 ikOUOsNZ4jeGlpvlzozNh7Uny3Lci8wLdUWgiKdGsUzP+sgv3rg1zM31JyJUDC/NSbUk
 iqGkiMDjiNjFylIJSvZUlG0/T25g0H/ZQ8R3/uN9Rag6ZmHg2iIV1vcGxVG5Kh3ccYJZ
 OKV0FleFDeBJldzL2AvgCC6ife+MzE3Hd3Mp3gtO9pT/G/LsBpHMGDEfWT88+NvKCl7v
 634A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UU9aKWHmya49MhhlUASZM5Nfo6AfFU5F7b0DJrVDkxg=;
 b=VI8G5A1LSZpdpW1wFli3jlsjXSxtPCHGv/Kfro9ueBD65oItStie880sdWzevc2STQ
 DD4PqgrtMX0M9BHFSoaMAzDfwgz58PnQAJMrtRsvN6G9y5AHL1vuiOk2Eyq2OJ4Y0Ix6
 1b0ca3UDCWrEZJtdIi3cupbrhfnv5uZ/g+7PxF9rynxSoqk1I5dLS0AAOiXmghTy90dY
 Rf1HVPv9xsi4tJ9fKHpn3vJ+nGsKkAu0LVAHm5wF7hUVBQ2ZtBg1z7uvD2eqqyNquV93
 A2QidscDDdEXBqciaWfR2Ip8dw/89MQXnku44d9cxJ7sJ+Tg2k1HrsmMapROkdoJ3EbL
 73nA==
X-Gm-Message-State: AOAM532lzo2iBUY3XGxo4asX275dV/XIG6FrUUB/D4Gwycf1kNmuo/Tf
 rADVduuUjs7RYLolGDFIOo4hDQP/20LTRQ==
X-Google-Smtp-Source: ABdhPJyTKAEAMZA9bBCQksaNPSR3VJovv0gBF1Qv15LZ66Sj5nGMk8sZVcy3XLpEJK1/i5e16C8BjQ==
X-Received: by 2002:a05:6638:389f:b0:331:b463:fbee with SMTP id
 b31-20020a056638389f00b00331b463fbeemr16994839jav.145.1654955702769; 
 Sat, 11 Jun 2022 06:55:02 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 13-20020a056e0211ad00b002d781cc0875sm1023578ilj.29.2022.06.11.06.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 06:55:02 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: def@freebsd.org, arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, jrtc27@FreeBSD.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/6] bsd-user/freebsd/os-syscall.c: lock_iovec
Date: Sat, 11 Jun 2022 07:55:09 -0600
Message-Id: <20220611135514.92882-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220611135514.92882-1-imp@bsdimp.com>
References: <20220611135514.92882-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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

lock_iovec will lock an I/O vec and the memory to which it refers and
create a iovec in the host space that refers to it, with full error
unwinding. Add helper_iovec_unlock to unlock the partially locked iovec
in case there's an error. The code will be used in iovec_unlock when
that is committed.

Note: memory handling likely could be rewritten to use q_autofree. That
will be explored in the future since what we have now works well enough.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 102 ++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d272478e7b0..67851937a8f 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -73,6 +73,108 @@ bool is_error(abi_long ret)
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
 
+/*
+ * Unlocks a iovec. Unlike unlock_iovec, it assumes the tvec array itself is
+ * already locked from target_addr. It will be unlocked as well as all the iovec
+ * elements.
+ */
+static void helper_unlock_iovec(struct target_iovec *target_vec,
+                                abi_ulong target_addr, struct iovec *vec,
+                                int count, int copy)
+{
+    for (int i = 0; i < count; i++) {
+        abi_ulong base = tswapal(target_vec[i].iov_base);
+
+        if (vec[i].iov_base) {
+            unlock_user(vec[i].iov_base, base, copy ? vec[i].iov_len : 0);
+        }
+    }
+    unlock_user(target_vec, target_addr, 0);
+}
+
+struct iovec *lock_iovec(int type, abi_ulong target_addr,
+        int count, int copy)
+{
+    struct target_iovec *target_vec;
+    struct iovec *vec;
+    abi_ulong total_len, max_len;
+    int i;
+    int err = 0;
+
+    if (count == 0) {
+        errno = 0;
+        return NULL;
+    }
+    if (count < 0 || count > IOV_MAX) {
+        errno = EINVAL;
+        return NULL;
+    }
+
+    vec = g_try_new0(struct iovec, count);
+    if (vec == NULL) {
+        errno = ENOMEM;
+        return NULL;
+    }
+
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
+    if (target_vec == NULL) {
+        err = EFAULT;
+        goto fail2;
+    }
+
+    max_len = 0x7fffffff & MIN(TARGET_PAGE_MASK, PAGE_MASK);
+    total_len = 0;
+
+    for (i = 0; i < count; i++) {
+        abi_ulong base = tswapal(target_vec[i].iov_base);
+        abi_long len = tswapal(target_vec[i].iov_len);
+
+        if (len < 0) {
+            err = EINVAL;
+            goto fail;
+        } else if (len == 0) {
+            /* Zero length pointer is ignored. */
+            vec[i].iov_base = 0;
+        } else {
+            vec[i].iov_base = lock_user(type, base, len, copy);
+            /*
+             * If the first buffer pointer is bad, this is a fault.  But
+             * subsequent bad buffers will result in a partial write; this is
+             * realized by filling the vector with null pointers and zero
+             * lengths.
+             */
+            if (!vec[i].iov_base) {
+                if (i == 0) {
+                    err = EFAULT;
+                    goto fail;
+                } else {
+                    /*
+                     * Fail all the subsequent addresses, they are already
+                     * zero'd.
+                     */
+                    goto out;
+                }
+            }
+            if (len > max_len - total_len) {
+                len = max_len - total_len;
+            }
+        }
+        vec[i].iov_len = len;
+        total_len += len;
+    }
+out:
+    unlock_user(target_vec, target_addr, 0);
+    return vec;
+
+fail:
+    helper_unlock_iovec(target_vec, target_addr, vec, i, copy);
+fail2:
+    g_free(vec);
+    errno = err;
+    return NULL;
+}
+
 /*
  * do_syscall() should always have a single exit point at the end so that
  * actions, such as logging of syscall results, can be performed.  All errnos
-- 
2.33.1


