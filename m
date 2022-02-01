Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5944A5B9E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:55:32 +0100 (CET)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErkx-0008FI-FU
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:55:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7r-00059v-H9
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:07 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=41677
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7l-0003Xv-ET
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:07 -0500
Received: by mail-io1-xd2e.google.com with SMTP id q204so20678189iod.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LlbdUA9gTxN/MXoEG3GmVMJfP/uIx9CCTaunXLE0kqQ=;
 b=sXWp4FrhXqvqiMLHtv9dSI5yIDjv/rmDbht4ZlzFijrMeh582FjiOP/wdJHib2wSNa
 djH3j1MsHIbyq2nmDjHlkWJil3ScWELiIvB4/RchHSo8g2zu/UXnsqJNaLoj3qVkgbUi
 zinmmYrpiZH7ZvJwki1XoVDPkj++9yHtUUrbq5FimI5CDX1XhAYvk1GCrmjVA9hsfe56
 +kYuoTizFc7wqfDxFCWoi9ZM/LZePjwhOkRLjSo+DsY0ZdIXE5QwFhdmRKE+gdRfTF/D
 MP/WgQQiNYt++UNIXWhbkTYZhR2eztzwXhAi6a3aPqDdh38ZNVdq79r6TJfeBGjuKhXJ
 1S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LlbdUA9gTxN/MXoEG3GmVMJfP/uIx9CCTaunXLE0kqQ=;
 b=kiA8t5hwCfAsxTP1NLFMZSLFkhHG163OsF7IfK19smDL1FFZGqY3Xt3qM7+qe7iXll
 yp9DJGTBagCYW46iZA9YyH5kI/aqBHVTOk33Eu0bWDwimcuoS173E9MNS7RrYPot9RPs
 bVd8vRxouoLSlANemDYVpQK0v5KHazhVD2L1y6vt4snCjbUVDSySKz0+tSBCsVboywJY
 p7+elq6GxO7uQ3vMFMnDn6TyBLKiyD7lh7Tllyy0EsDe+q4td+aqfbJURjpGFDpvy8CF
 WvEWrD/wxnw2Awwp1MbqAzTaWU1yRAjFXtWPbEOy5Herphd+HitzWkiaxbkUinfHzUna
 cvUA==
X-Gm-Message-State: AOAM530mvGZe+eZmA24QYVWRVDlx9HkafIq91BOOw4lJHwJN2YPRz1JS
 SNgNcx4xk6hhRIXAf02e6s2vKnMaNGnj/A==
X-Google-Smtp-Source: ABdhPJx9sK8oljhKvucqBvEqze1WnqWI8sox7T221+cYtIY59XQyaUk+RoEF/TW2vsIq6e0Bpb3vZQ==
X-Received: by 2002:a05:6602:29d3:: with SMTP id
 z19mr12835208ioq.116.1643714100078; 
 Tue, 01 Feb 2022 03:15:00 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/22] bsd-user/freebsd/os-syscall.c: Add get_errno and
 host_to_target_errno
Date: Tue,  1 Feb 2022 04:14:45 -0700
Message-Id: <20220201111455.52511-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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

Add the helper functions get_errno and host_to_target_errno. get_errno
returns either the system call results, or the -errno when system call
indicates failure by returning -1. Host_to_target_errno returns errno
(since on FreeBSD they are the same on all architectures) along with a
comment about why it's the identity.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 23 +++++++++++++++++++++++
 bsd-user/qemu.h               |  3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 7e2bedb918d..2e84cf350b1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -44,6 +44,29 @@ void target_set_brk(abi_ulong new_brk)
 {
 }
 
+/*
+ * errno conversion.
+ */
+abi_long get_errno(abi_long ret)
+{
+
+    if (ret == -1) {
+        return -host_to_target_errno(errno);
+    } else {
+        return ret;
+    }
+}
+
+int host_to_target_errno(int err)
+{
+    /*
+     * All the BSDs have the property that the error numbers are uniform across
+     * all architectures for a given BSD, though they may vary between different
+     * BSDs.
+     */
+    return err;
+}
+
 bool is_error(abi_long ret)
 {
 
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e5742bd6c03..56042ddbc5d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -246,9 +246,10 @@ extern unsigned long target_dflssiz;
 extern unsigned long target_maxssiz;
 extern unsigned long target_sgrowsiz;
 
-/* syscall.c */
+/* os-syscall.c */
 abi_long get_errno(abi_long ret);
 bool is_error(abi_long ret);
+int host_to_target_errno(int err);
 
 /* os-sys.c */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
-- 
2.33.1


