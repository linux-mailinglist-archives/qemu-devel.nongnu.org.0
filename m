Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E248138E090
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:59:52 +0200 (CEST)
Received: from localhost ([::1]:32930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2gy-0002Rz-0V
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cc-0002uK-3L
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:22 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cW-0003en-JB
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:21 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d16so19831667pfn.12
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+ig9QEHBa0VtdnZHEiwQpPJhF1VPhhLA5g2SBOkaAQ=;
 b=ZE2K9/2knnKnL+VF5neAFzcylin1qcdvgDsSOavAmYFSPH+P0IhwIgoCj9oHjJhYqP
 mQ7JKhc0/JHo2V7Te5c3GrxzolJjxyJMYaOyHg73RCX33d732WaNmu5PGTNaCfOVEan8
 KVwCVaRz3BDpeOuJAUS+mEa8WOjDLvqyoatrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+ig9QEHBa0VtdnZHEiwQpPJhF1VPhhLA5g2SBOkaAQ=;
 b=E4vl7Jjh8lXelAgp0HNe/BTNlqFcJbOGchX6cIZu65cBC7GpBbp0w4mVQLEzjutLqZ
 VzheX3QvbqVc/57FOySB/IFKj2RUipvBdRlMPQ4MsiKWyUK7L3bPeUonCZ+oeZBB3Qlh
 RQMYKhXlGwKN66HsqUX5THZdUUDvdJbe6rAfA1/73evPeffwPdquISxCh0jyp2kjqCBY
 10vnZYM7ScXuemiPYZZ8+b5jsusC7z1xk5vIFa3uAVU71kV4d1fNly6+d0cJzPZc7I7s
 7ChDZ9hZ6nAD65ufFNNmaGu/g5J2HLF10+DZyY6X2Ny9mwbtNCMWHlpESeNTeExLBc8a
 tCuA==
X-Gm-Message-State: AOAM5321SsaF+Snjm50LAMgyoDawLXbEpLDC+ooSQXaElq89ZkhhCMw0
 sm3KCom+DwIG2YKtAAs0wJNYC3hWszWLYA==
X-Google-Smtp-Source: ABdhPJwqm4+nZk2gKjcOTOodx86q1Rs6ZAcI8j9A/FeRXsw6T7lmWS8b4fj/rQEw2Xn4IDh8W9/QUA==
X-Received: by 2002:a65:625a:: with SMTP id q26mr4648298pgv.311.1621832115226; 
 Sun, 23 May 2021 21:55:15 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id 24sm10040142pgz.77.2021.05.23.21.55.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 May 2021 21:55:15 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 5/5] linux-user: Implement pivot_root
Date: Mon, 24 May 2021 13:54:11 +0900
Message-Id: <20210524045412.15152-6-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210524045412.15152-1-yamamoto@midokura.com>
References: <20210524045412.15152-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Used by runc.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2947e79dc0..e739921e86 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -35,6 +35,7 @@
 #include <sys/prctl.h>
 #include <sys/resource.h>
 #include <sys/swap.h>
+#include <sys/syscall.h>
 #include <linux/capability.h>
 #include <sched.h>
 #include <sys/timex.h>
@@ -8254,6 +8255,11 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
     return 0;
 }
 
+static int pivot_root(const char *new_root, const char *put_old)
+{
+    return syscall(SYS_pivot_root, new_root, put_old);
+}
+
 /* This is an internal helper for do_syscall so that it is easier
  * to have a single return point, so that actions, such as logging
  * of syscall results, can be performed.
@@ -13222,6 +13228,23 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
 #endif
 
+#if defined(TARGET_NR_pivot_root)
+    case TARGET_NR_pivot_root:
+        {
+            void *p2;
+            p = lock_user_string(arg1); /* new_root */
+            p2 = lock_user_string(arg2); /* put_old */
+            if (!p || !p2) {
+                ret = -TARGET_EFAULT;
+            } else {
+                ret = get_errno(pivot_root(p, p2));
+            }
+            unlock_user(p2, arg2, 0);
+            unlock_user(p, arg1, 0);
+        }
+        return ret;
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         return -TARGET_ENOSYS;
-- 
2.21.1 (Apple Git-122.3)


