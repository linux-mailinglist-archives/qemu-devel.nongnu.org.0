Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1C4A5B38
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:32:45 +0100 (CET)
Received: from localhost ([::1]:53732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErOr-0003dl-5h
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:32:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7r-0005BY-Vq
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:11 -0500
Received: from [2607:f8b0:4864:20::d31] (port=42851
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7n-0003Zm-FH
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:07 -0500
Received: by mail-io1-xd31.google.com with SMTP id r144so20673053iod.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=014KLrrmpCxLSaIFhafJ91o/j0d6EMkAjz6oEw/jXuM=;
 b=Inpwt/xsqB72GDfJqD4MfEvw/cZe6TPf4GBsjTNkicm6pQJ/M0tAwKRcKZLOtomckA
 095I4nZQpRRwGlvJ1QBEy3+K0pcUBgvmZu7VfF8C3M+xAGvLH70n4kTWmtC4x30Ql/BO
 q+fv0dyzL8fcp4ayNF7WrOuxT92lJATczl+jPJuYy81S5rVjMPfHxM9a6EU8f4pNI55y
 D4Q6smjvc7MLVhM7c5F1RYUI+yc4m385cqC7+rCHnVRqvdGxJUdt5rcRx1zXq+ZIBE1w
 QjaghgNjb5YKb6o3rcTofw2nmcaDAyNqUJcvS0W2oSvVcyqiWZ2WNowHZ5A1BfCTubMX
 f6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=014KLrrmpCxLSaIFhafJ91o/j0d6EMkAjz6oEw/jXuM=;
 b=BKGfN8OuQfj/xMO54pRaZXlhElzsPqA465nLJRvjXJyduw3MfJHdlLoNBu6orI5Deq
 cMAwtYW4tnbURM+3x+SL0Ab5dEbrHYWfcV0dwipzTKDDtSD3zcjk8lwtjVzCPhPvjofj
 Ww7tkNxxY6IIw0KMjsZnTD+xy3QSDzB5AMMeDFS/8bcyneDaMyKn/hD41caeQsFJwg3O
 xsotOkwOmLxeYVPb1mBWaZAMUK9XrhVfBqpd2MW8zQd4KpxzM0EOIxIU2SYW+57T/63Y
 iIZYbIE06ZtQfxy0vtobP86kayP+yrEGEWP3DlY74Peu9D587ArTZqP8vev0NzJja0Jj
 MIpg==
X-Gm-Message-State: AOAM532p7Tm1cpexDkubKMGWhFyrPM5+7n2vgZoVrNXNzSY3YJrTpm5p
 B3Cpc5df4DvGkGi237pxd1BSQMFqrabq6w==
X-Google-Smtp-Source: ABdhPJz/CS4NVU8FB2xXLkthW8T4rdTnBi9Hlo96TkQr+Z1M3pPdDON09BZY5Ewfj66Rfpr7I0qyrg==
X-Received: by 2002:a05:6638:250a:: with SMTP id
 v10mr8733006jat.56.1643714102191; 
 Tue, 01 Feb 2022 03:15:02 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/22] bsd-user/freebsd/os-syscall.c: lock_iovec
Date: Tue,  1 Feb 2022 04:14:47 -0700
Message-Id: <20220201111455.52511-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

lock_iovec will lock an I/O vec and the memory to which it referrs and
create a iovec in the host space that referrs to it, with full error
unwinding.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 92 +++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 060134a9ecd..c21759ae7ce 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -75,6 +75,98 @@ bool is_error(abi_long ret)
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
 
+struct iovec *lock_iovec(int type, abi_ulong target_addr,
+        int count, int copy)
+{
+    struct target_iovec *target_vec;
+    struct iovec *vec;
+    abi_ulong total_len, max_len;
+    int i;
+    int err = 0;
+    bool bad_address = false;
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
+    vec = calloc(count, sizeof(struct iovec));
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
+    /*
+     * ??? If host page size > target page size, this will result in a value
+     * larger than what we can actually support.
+     */
+    max_len = 0x7fffffff & TARGET_PAGE_MASK;
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
+            /* Zero length pointer is ignored.  */
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
+                    bad_address = true;
+                }
+            }
+            if (bad_address) {
+                len = 0;
+            }
+            if (len > max_len - total_len) {
+                len = max_len - total_len;
+            }
+        }
+        vec[i].iov_len = len;
+        total_len += len;
+    }
+
+    unlock_user(target_vec, target_addr, 0);
+    return vec;
+
+ fail:
+    while (--i >= 0) {
+        if (tswapal(target_vec[i].iov_len) > 0) {
+            unlock_user(vec[i].iov_base, tswapal(target_vec[i].iov_base), 0);
+        }
+    }
+    unlock_user(target_vec, target_addr, 0);
+ fail2:
+    free(vec);
+    errno = err;
+    return NULL;
+}
+
 /*
  * do_syscall() should always have a single exit point at the end so that
  * actions, such as logging of syscall results, can be performed.  All errnos
-- 
2.33.1


